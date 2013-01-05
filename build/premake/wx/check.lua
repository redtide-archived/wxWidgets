-- ============================================================================
-- Name:        check.lua
-- Purpose:     Checks which libraries are available for use as other features
-- Author:      Jefferson González
-- Modified by:
-- Created:     2013/01/04
-- RCS-ID:      $Id$
-- Copyright:   (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

-----------------------------------------------------------------------------
-- Checks for unix based systems
-----------------------------------------------------------------------------
if os.is("bsd") or os.is("linux") or os.is("macosx") or os.is("solaris") then
    
    -- Check for zlib
    wx.unix.configurelib("zlib", "zlib.h", "z")
    
    -- Check for png
    wx.unix.configurelib("libpng", "png.h", "png", {"zlib"})
    
    -- Check for jpeg
    wx.unix.configurelib("libjpeg", "jpeglib.h", "jpeg")
    
    -- Check for tiff
    wx.unix.configurelib("libtiff", "tiff.h", "tiff", {"zlib", "libjpeg"})
    
    -- Check for expat
    wx.unix.configurelib("expat", "expat.h", "expat")
    
    -- Check for regex
    wx.unix.configurelib("regex", "regex.h", "regex")
end
