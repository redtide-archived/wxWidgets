-- ============================================================================
-- Name:        regex.lua
-- Purpose:     wxWidgets builtin regex library project
-- Author:      Jefferson González
-- Modified by:
-- Created:     2013/01/04
-- RCS-ID:      $Id$
-- Copyright:   (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "regex"
    kind "StaticLib"
    
    targetname "wxregex"
    
    includedirs
    {
        "../../src/regex"
    }
    
    files
    {
        -- Headers
        "../../src/regex/regcustom.h",
        "../../src/regex/regerrs.h",
        "../../src/regex/regex.h",
        "../../src/regex/regguts.h",
        
        -- Sources
        "../../src/regex/regcomp.c",
        "../../src/regex/regexec.c",
        "../../src/regex/regerror.c",
        "../../src/regex/regfree.c"
    }
