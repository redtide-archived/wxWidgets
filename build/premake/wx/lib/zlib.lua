-- ============================================================================
-- Name:        zlib.lua
-- Purpose:     wxWidgets builtin zlib library project
-- Author:      Jefferson González
-- Modified by:
-- Created:     2013/01/04
-- RCS-ID:      $Id$
-- Copyright:   (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "zlib"
    kind "StaticLib"
    
    targetname "wxzlib"
    
    includedirs
    {
        wx.srcdir .. "zlib"
    }
    
    files
    {
        -- Headers
        wx.srcdir .. "zlib/crc32.h",
        wx.srcdir .. "zlib/inffast.h",
        wx.srcdir .. "zlib/inflate.h",
        wx.srcdir .. "zlib/trees.h",
        wx.srcdir .. "zlib/zlib.h",
        wx.srcdir .. "zlib/deflate.h",
        wx.srcdir .. "zlib/inffixed.h",
        wx.srcdir .. "zlib/inftrees.h",
        wx.srcdir .. "zlib/zconf.h",
        wx.srcdir .. "zlib/zutil.h",

        -- Sources
        wx.srcdir .. "zlib/adler32.c",
        wx.srcdir .. "zlib/compress.c",
        wx.srcdir .. "zlib/crc32.c",
        wx.srcdir .. "zlib/gzio.c",
        wx.srcdir .. "zlib/uncompr.c",
        wx.srcdir .. "zlib/deflate.c",
        wx.srcdir .. "zlib/trees.c",
        wx.srcdir .. "zlib/zutil.c",
        wx.srcdir .. "zlib/inflate.c",
        wx.srcdir .. "zlib/infback.c",
        wx.srcdir .. "zlib/inftrees.c",
        wx.srcdir .. "zlib/inffast.c"
    }
