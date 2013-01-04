-- ============================================================================
-- Name:        expat.lua
-- Purpose:     wxWidgets builtin expat library project
-- Author:      Jefferson González
-- Modified by:
-- Created:     2013/01/04
-- RCS-ID:      $Id$
-- Copyright:   (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "expat"
    kind "StaticLib"
    
    targetname "wxexpat"
    
    includedirs
    {
        "../../src/expat/lib"
    }
    
    configuration {"vs*", "windows"}
        defines { "COMPILED_FROM_DSP" }
    
    files
    {
        -- Headers
        "../../src/expat/lib/ascii.h",
        "../../src/expat/lib/expat.h",
        "../../src/expat/lib/latin1tab.h",
        "../../src/expat/lib/os2config.h",
        "../../src/expat/lib/xmlrole.h",
        "../../src/expat/lib/asciitab.h",
        "../../src/expat/lib/iasciitab.h",
        "../../src/expat/lib/macconfig.h",
        "../../src/expat/lib/utf8tab.h",
        "../../src/expat/lib/xmltok.h",
        "../../src/expat/lib/dosconfig.h",
        "../../src/expat/lib/internal.h",
        "../../src/expat/lib/nametab.h",
        "../../src/expat/lib/winconfig.h",
        "../../src/expat/lib/xmltok_impl.h",
        
        -- Sources
        "../../src/expat/lib/xmlparse.c",
        "../../src/expat/lib/xmlrole.c",
        "../../src/expat/lib/xmltok.c"
    }
