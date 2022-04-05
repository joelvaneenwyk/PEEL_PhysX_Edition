#!/usr/bin/env python
# pylint: disable=invalid-name,line-too-long,consider-using-f-string
"""
Manages the conversion of data assets (e.g. PNG images) into C++ source files
that can then be included in libraries and executables so that they don't have to
be loaded at runtime.
"""

import binascii  # Converts bytes to hex e.g., '1f'
import inspect
import logging
import os
import sys
from itertools import islice

import PIL.Image  # Pillow library used to read, scale, and write out images
import six

SCRIPT_DIR = os.path.abspath(os.path.dirname(inspect.getfile(inspect.currentframe())))
PEEL_ROOT = os.path.normpath(os.path.join(SCRIPT_DIR, os.pardir, os.pardir))

LOGGER = logging.getLogger("peel")


def _header():
    return """
///////////////////////////////////////////////////////////////////////////////
/*
 *	PEEL - Physics Engine Evaluation Lab
 *	Copyright (C) 2012 Pierre Terdiman
 *	Homepage: https://www.codercorner.com/blog.htm
 */
///////////////////////////////////////////////////////////////////////////////

""".lstrip()


def _get_header(src, dest, base_name=None):
    """
    Counterpart to getSource but only returns what is needed in a header file.
    """
    base_name = base_name or os.path.splitext(os.path.basename(dest))[0]
    out_text = _header()
    out_text += "// Source filename: %s\n" % src.replace(PEEL_ROOT, "").replace(
        "\\", "/"
    ).strip("/")
    out_text += "extern const unsigned int %s_Size;\n" % base_name
    out_text += "extern udword %s_Data[];" % base_name
    return out_text


def _get_hex_data(raw_data, extra_space=""):
    """
    Converts raw binary data into 2-byte hex strings that are separated by
    commas and newlines every n'th string.
    """
    out_text = "{\n"

    hex_data = six.ensure_str(binascii.hexlify(raw_data))

    n = 2
    hex_data = [hex_data[i : i + n] for i in range(0, len(hex_data), n)]

    # This takes it from '1f' -> '0x1f'
    hex_string_data = [
        "0x%s%s%s%s" % (a, b, c, d)
        for (a, b, c, d) in six.moves.zip(
            islice(hex_data, 0, None, 4),
            islice(hex_data, 1, None, 4),
            islice(hex_data, 2, None, 4),
            islice(hex_data, 3, None, 4),
        )
    ]

    def _chunks(source_list, chunk_size):
        """
        Yield successive n-sized chunks from ``sourceList``.
        """
        for chunkIndex in range(0, len(source_list), chunk_size):
            yield source_list[chunkIndex : chunkIndex + chunk_size]

    # This groups it into array chunks: [['0x0f', '0x1f'], ['0x2f', '0x1a'], ...]
    _hex_chunks = list(_chunks(hex_string_data, 6))

    # This adds commas to each and combines into one string per line: ['0x0f, 0x1f'], ['0x2f, 0x1a'], ...
    hex_chunks_per_line = [", ".join(x) for x in _hex_chunks]

    # Combines each line with newlines and a trailing comma
    out_text += ",\n".join(["\t%s%s" % (extra_space, x) for x in hex_chunks_per_line])

    return (
        """%s
};
"""
        % out_text
    )


def _get_source(src, dest, header, base_name=None, extra_space=""):
    """
    Reads from the source file and generates a C++ source file that contains
    all the data.
    """

    if os.path.exists(src):
        with PIL.Image.open(src) as sourceImage:
            output_image = sourceImage.resize(
                (400, 195), resample=PIL.Image.LANCZOS
            ).convert("RGBA")
            r, g, b, a = output_image.split()
            output_image = PIL.Image.merge("RGBA", (a, b, g, r))
            raw_data = output_image.tobytes()

        base_name = base_name or os.path.splitext(os.path.basename(dest))[0]

        out_text = _header()
        out_text += '#include "%s"\n\n' % header
        out_text += "// Source filename: %s\n" % src.replace(PEEL_ROOT, "").replace(
            "\\", "/"
        ).strip("/")
        out_text += "extern const unsigned int %s_Size = %s;\n" % (
            base_name,
            str(len(raw_data)),
        )
        out_text += "udword %s_Data[] = %s" % (
            base_name,
            _get_hex_data(raw_data, extra_space),
        )
    else:
        out_text = None

    return out_text


def _add_file(filename, data):
    """
    Reads the text in the filename passed in and adds it to the outFiles dictionary
    if the data is different from what is already on disk.
    """

    output_files = {}

    if os.path.exists(filename):
        src_data = open(filename, "r", encoding="utf-8").read()
    else:
        src_data = None

    if data is not None and data != src_data:
        output_files[filename] = data

    return output_files


def _save_files(output_files):
    """
    Given a dictionary of output files where it maps destination filename to
    text data, it will make sure the needed files are opened on Perforce and
    then saves them out.
    """

    for dest, value in six.iteritems(output_files):
        directory = os.path.dirname(dest)
        if not os.path.exists(directory):
            os.makedirs(directory)
        with open(dest, "w", encoding="utf-8") as output_data:
            output_data.write(value)
        LOGGER.info("Updated %s", dest.replace(PEEL_ROOT, ""))

    return output_files


def _convert_graphics_resources():
    """
    Converts images needed by PEEL.
    """
    mapping = {"peel.png": "TitleData.cpp"}

    includes = ""

    output_file_mapping = {}

    for src, dest in six.iteritems(mapping):
        LOGGER.info("Processing %s", src.replace(PEEL_ROOT, ""))

        src = os.path.join(PEEL_ROOT, "Media", src)
        dest = os.path.join(PEEL_ROOT, "Src", dest)
        output_file_mapping.update(
            _add_file(
                dest, _get_source(src, dest, "stdafx.h", base_name="gPictureData")
            )
        )

        includes += "%s\n\n" % _get_header(src, dest, base_name="gPictureData")

    includes = includes.rstrip() + "\n"  # Normalize trailing whitespace

    output_file_mapping.update(
        _add_file(os.path.join(PEEL_ROOT, "Src", "Resources.h"), includes)
    )

    _save_files(output_file_mapping)

    return len(output_file_mapping)


def main():
    """
    Main entry point for the script.
    """

    logging.basicConfig(level=logging.INFO)
    processed_files = 0
    processed_files += _convert_graphics_resources()

    LOGGER.info(
        "'%s' Done. Processed '%d' files.",
        sys.argv[0].replace(PEEL_ROOT, ""),
        processed_files,
    )

    return 0


if __name__ == "__main__":
    sys.exit(main())
