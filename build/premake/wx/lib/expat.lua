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
        wx.srcdir .. "expat/lib"
    }
    
    files
    {
        -- Headers
        wx.srcdir .. "expat/lib/ascii.h",
        wx.srcdir .. "expat/lib/expat.h",
        wx.srcdir .. "expat/lib/latin1tab.h",
        wx.srcdir .. "expat/lib/os2config.h",
        wx.srcdir .. "expat/lib/xmlrole.h",
        wx.srcdir .. "expat/lib/asciitab.h",
        wx.srcdir .. "expat/lib/iasciitab.h",
        wx.srcdir .. "expat/lib/macconfig.h",
        wx.srcdir .. "expat/lib/utf8tab.h",
        wx.srcdir .. "expat/lib/xmltok.h",
        wx.srcdir .. "expat/lib/dosconfig.h",
        wx.srcdir .. "expat/lib/internal.h",
        wx.srcdir .. "expat/lib/nametab.h",
        wx.srcdir .. "expat/lib/winconfig.h",
        wx.srcdir .. "expat/lib/xmltok_impl.h",
        
        -- Sources
        wx.srcdir .. "expat/lib/xmlparse.c",
        wx.srcdir .. "expat/lib/xmlrole.c",
        wx.srcdir .. "expat/lib/xmltok.c"
    }
    
    configuration {"vs*", "windows"}
        defines { "COMPILED_FROM_DSP" }
