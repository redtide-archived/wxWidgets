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
    
    -- Check for jpeg
    if not _OPTIONS["with-libjpeg"] or _OPTIONS["with-libjpeg"] ~= "no" then
        local header = wx.unix.findheader("jpeglib.h")
        local libdir = wx.unix.findlib("jpeg")
        
        -- Non standard path found
        if header and header ~= "standard" then
            _OPTIONS["with-libjpeg"] = "yes"
            wx.includes.libjpeg = header
            
            if libdir.static and libdir.static ~= "standard" then
                wx.libdirs.libjpeg = libdir.static
            elseif libdir.shared and libdir.shared ~= "standard" then
                wx.libdirs.libjpeg = libdir.shared
            end
        -- Standard path found
        elseif header then
            _OPTIONS["with-libjpeg"] = "yes"
        -- Non found use builtin
        else
            _OPTIONS["with-libjpeg"] = "builtin"
        end
    end
end
