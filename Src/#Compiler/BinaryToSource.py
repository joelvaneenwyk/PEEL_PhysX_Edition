#!/usr/bin/env python
"""
Manages the conversion of data assets (e.g. PNG images) into C++ source files
that can then be included in libraries and executables so that they don't have to
be loaded at runtime.
"""

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


def _get_header(src, dest, baseName=None):
    """
    Counterpart to getSource but only returns what is needed in a header file.
    """
    baseName = baseName or os.path.splitext(os.path.basename(dest))[0]
    outText = _header()
    outText += "// Source filename: %s\n" % src.replace(PEEL_ROOT, '').replace('\\', '/').strip('/')
    outText += "extern const unsigned int %s_Size;\n" % baseName
    outText += "extern udword %s_Data[];" % baseName
    return outText


def _get_hex_data(rawData, extraSpace=''):
    """
    Converts raw binary data into 2-byte hex strings that are separated by
    commas and newlines every n'th string.
    """
    outText = "{\n"

    # Converts bytes to hex (e.g. '1f')
    import binascii
    hexData = six.ensure_str(binascii.hexlify(rawData))

    n = 2
    hexData = [hexData[i:i + n] for i in range(0, len(hexData), n)]

    # This takes it from '1f' -> '0x1f'
    hexStringData = [
        "0x%s%s%s%s" % (a, b, c, d)
        for (a, b, c, d) in six.moves.zip(
            islice(hexData, 0, None, 4),
            islice(hexData, 1, None, 4),
            islice(hexData, 2, None, 4),
            islice(hexData, 3, None, 4)
        )
    ]

    def chunks(sourceList, chunkSize):
        """
        Yield successive n-sized chunks from ``sourceList``.
        """
        for chunkIndex in range(0, len(sourceList), chunkSize):
            yield sourceList[chunkIndex:chunkIndex + chunkSize]

    # This groups it into array chunks: [['0x0f', '0x1f'], ['0x2f', '0x1a'], ...]
    hexChunks = list(chunks(hexStringData, 6))

    # This adds commas to each and combines into one string per line: ['0x0f, 0x1f'], ['0x2f, 0x1a'], ...
    hexPerLine = [", ".join(x) for x in hexChunks]

    # Combines each line with newlines and a trailing comma
    outText += ",\n".join(["\t%s%s" % (extraSpace, x) for x in hexPerLine])

    return """%s
};
""" % outText


def _get_source(src, dest, header, baseName=None, extraSpace=''):
    """
    Reads from the source file and generates a C++ source file that contains
    all the data.
    """

    if os.path.exists(src):
        with PIL.Image.open(src) as sourceImage:
            outputImage = sourceImage.resize((400, 195), resample=PIL.Image.Resampling.LANCZOS).convert('RGBA')
            r, g, b, a = outputImage.split()
            outputImage = PIL.Image.merge("RGBA", (a, b, g, r))
            rawData = outputImage.tobytes()

        baseName = baseName or os.path.splitext(os.path.basename(dest))[0]

        outText = _header()
        outText += "#include \"%s\"\n\n" % header
        outText += "// Source filename: %s\n" % src.replace(PEEL_ROOT, '').replace('\\', '/').strip('/')
        outText += "extern const unsigned int %s_Size = %s;\n" % (baseName, str(len(rawData)))
        outText += "udword %s_Data[] = %s" % (baseName, _get_hex_data(rawData, extraSpace))
    else:
        outText = None

    return outText


def _add_file(filename, data):
    """
    Reads the text in the filename passed in and adds it to the outFiles dictionary
    if the data is different from what is already on disk.
    """

    outFiles = {}

    if os.path.exists(filename):
        srcData = open(filename, "r").read()
    else:
        srcData = None

    if data is not None and data != srcData:
        outFiles[filename] = data

    return outFiles


def _save_files(outFiles):
    """
    Given a dictionary of output files where it maps destination filename to
    text data, it will make sure the needed files are opened on Perforce and
    then saves them out.
    """

    for dest, value in six.iteritems(outFiles):
        directory = os.path.dirname(dest)
        if not os.path.exists(directory):
            os.makedirs(directory)
        with open(dest, 'w') as outData:
            outData.write(value)
        LOGGER.info("Updated %s", dest.replace(PEEL_ROOT, ''))

    return outFiles


def _convert_graphics_resources():
    """
    Converts images needed by PEEL.
    """
    mapping = {
        "peel.png": "TitleData.cpp"
    }

    includes = ""

    outFiles = {}

    for src, dest in six.iteritems(mapping):
        LOGGER.info("Processing %s", src.replace(PEEL_ROOT, ''))

        src = os.path.join(PEEL_ROOT, 'Media', src)
        dest = os.path.join(PEEL_ROOT, 'Src', dest)
        outFiles.update(_add_file(dest, _get_source(src, dest, "stdafx.h", baseName="gPictureData")))

        includes += "%s\n\n" % _get_header(src, dest, baseName="gPictureData")

    includes = includes.rstrip() + '\n'  # Normalize trailing whitespace

    outFiles.update(_add_file(os.path.join(PEEL_ROOT, 'Src', 'Resources.h'), includes))

    _save_files(outFiles)

    return len(outFiles)


def main():
    """
    Main entry point for the script.
    """

    logging.basicConfig(level=logging.DEBUG)
    processedFiles = 0
    processedFiles += _convert_graphics_resources()

    LOGGER.info(
        "'%s' Done. Processed '%d' files.",
        sys.argv[0].replace(PEEL_ROOT, ""), processedFiles)

    return 0


if __name__ == "__main__":
    sys.exit(main())
