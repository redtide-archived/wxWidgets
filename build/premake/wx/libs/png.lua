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
    
    if wx.zlib == "builtin" then
        links { "wxzlib" }
        includedirs { wx.srcdir .. "zlib" }
    else
        links { "z" }
    end
    
    includedirs
    {
        wx.srcdir .. "png"
    }
    
    files
    {
        -- Headers
        wx.srcdir .. "png/pngconf.h",
        wx.srcdir .. "png/pngdebug.h",
        wx.srcdir .. "png/png.h",
        wx.srcdir .. "png/pnginfo.h",
        wx.srcdir .. "png/pnglibconf.h",
        wx.srcdir .. "png/pngpriv.h",
        wx.srcdir .. "png/pngstruct.h",

        -- Sources
        wx.srcdir .. "png/png.c",
        wx.srcdir .. "png/pngerror.c",
        wx.srcdir .. "png/pngget.c",
        wx.srcdir .. "png/pngmem.c",
        wx.srcdir .. "png/pngpread.c",
        wx.srcdir .. "png/pngread.c",
        wx.srcdir .. "png/pngrio.c",
        wx.srcdir .. "png/pngrtran.c",
        wx.srcdir .. "png/pngrutil.c",
        wx.srcdir .. "png/pngset.c",
        wx.srcdir .. "png/pngtrans.c",
        wx.srcdir .. "png/pngwio.c",
        wx.srcdir .. "png/pngwrite.c",
        wx.srcdir .. "png/pngwtran.c",
        wx.srcdir .. "png/pngwutil.c"
    }
