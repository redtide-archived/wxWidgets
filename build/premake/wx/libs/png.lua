-- ============================================================================
-- Name:        png.lua
-- Purpose:     wxWidgets builtin png library project
-- Author:      Jefferson González
-- Modified by:
-- Created:     2013/01/04
-- RCS-ID:      $Id$
-- Copyright:   (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "png"
    kind "StaticLib"
    
    targetname "wxpng"
    
    includedirs
    {
        "../../src/png"
    }
    
    files
    {
        -- Headers
        "../../src/png/pngconf.h",
        "../../src/png/pngdebug.h",
        "../../src/png/png.h",
        "../../src/png/pnginfo.h",
        "../../src/png/pnglibconf.h",
        "../../src/png/pngpriv.h",
        "../../src/png/pngstruct.h",

        -- Sources
        "../../src/png/png.c",
        "../../src/png/pngerror.c",
        "../../src/png/pngget.c",
        "../../src/png/pngmem.c",
        "../../src/png/pngpread.c",
        "../../src/png/pngread.c",
        "../../src/png/pngrio.c",
        "../../src/png/pngrtran.c",
        "../../src/png/pngrutil.c",
        "../../src/png/pngset.c",
        "../../src/png/pngtrans.c",
        "../../src/png/pngwio.c",
        "../../src/png/pngwrite.c",
        "../../src/png/pngwtran.c",
        "../../src/png/pngwutil.c"
    }
