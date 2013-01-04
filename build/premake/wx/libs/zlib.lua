-- ============================================================================
-- Name:        jpeg.lua
-- Purpose:     wxWidgets builtin jpeg project
-- Author:      Jefferson González
-- Modified by:
-- Created:     2013/01/04
-- RCS-ID:      $Id$
-- Copyright:   (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "zlib"
    kind( wx.getprojectkind() )
    
    targetname("wxzlib")
    
    includedirs
    {
        "../../src/zlib"
    }
    
    files
    {
        -- Headers
        "../../src/zlib/crc32.h",
        "../../src/zlib/inffast.h",
        "../../src/zlib/inflate.h",
        "../../src/zlib/trees.h",
        "../../src/zlib/zlib.h",
        "../../src/zlib/deflate.h",
        "../../src/zlib/inffixed.h",
        "../../src/zlib/inftrees.h",
        "../../src/zlib/zconf.h",
        "../../src/zlib/zutil.h",

        -- Sources
        "../../src/zlib/adler32.c",
        "../../src/zlib/compress.c",
        "../../src/zlib/crc32.c",
        "../../src/zlib/gzio.c",
        "../../src/zlib/uncompr.c",
        "../../src/zlib/deflate.c",
        "../../src/zlib/trees.c",
        "../../src/zlib/zutil.c",
        "../../src/zlib/inflate.c",
        "../../src/zlib/infback.c",
        "../../src/zlib/inftrees.c",
        "../../src/zlib/inffast.c"
    }
