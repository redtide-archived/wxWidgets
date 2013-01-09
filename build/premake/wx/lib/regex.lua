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
        wx.srcdir .. "regex"
    }
    
    files
    {
        -- Headers
        wx.srcdir .. "regex/regcustom.h",
        wx.srcdir .. "regex/regerrs.h",
        wx.srcdir .. "regex/regex.h",
        wx.srcdir .. "regex/regguts.h",
        
        -- Sources
        wx.srcdir .. "regex/regcomp.c",
        wx.srcdir .. "regex/regexec.c",
        wx.srcdir .. "regex/regerror.c",
        wx.srcdir .. "regex/regfree.c"
    }
