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
    if not _OPTIONS["with-zlib"] or _OPTIONS["with-zlib"] ~= "no" then
        local header = wx.unix.findheader("zlib.h")
        local libdir = wx.unix.findlib("z")
        
        -- Forced builtin or not found
        if _OPTIONS["with-zlib"] == "builtin" or not header then
            _OPTIONS["with-zlib"] = "builtin"
        -- Non standard path found
        elseif header and header ~= "standard" then
            _OPTIONS["with-zlib"] = "yes"
            wx.includes.zlib = header
            
            if libdir.static and libdir.static ~= "standard" then
                wx.libdirs.zlib = libdir.static
            elseif libdir.shared and libdir.shared ~= "standard" then
                wx.libdirs.zlib = libdir.shared
            end
        -- Standard path found
        elseif header then
            _OPTIONS["with-zlib"] = "yes"
        end
    end
    
    -- Check for png
    if _OPTIONS["with-zlib"] then
        if not _OPTIONS["with-libpng"] or _OPTIONS["with-libpng"] ~= "no" then
            local header = wx.unix.findheader("png.h")
            local libdir = wx.unix.findlib("png")
            
            -- Forced builtin or not found
            if _OPTIONS["with-libpng"] == "builtin" or not header then
                _OPTIONS["with-libpng"] = "builtin"
            -- Non standard path found
            elseif header and header ~= "standard" then
                _OPTIONS["with-libpng"] = "yes"
                wx.includes.libpng = header
                
                if libdir.static and libdir.static ~= "standard" then
                    wx.libdirs.libpng = libdir.static
                elseif libdir.shared and libdir.shared ~= "standard" then
                    wx.libdirs.libpng = libdir.shared
                end
            -- Standard path found
            elseif header then
                _OPTIONS["with-libpng"] = "yes"
            end
        end
    end
    
    -- Check for jpeg
    if not _OPTIONS["with-libjpeg"] or _OPTIONS["with-libjpeg"] ~= "no" then
        local header = wx.unix.findheader("jpeglib.h")
        local libdir = wx.unix.findlib("jpeg")
        
        -- Forced builtin or not found
        if _OPTIONS["with-libjpeg"] == "builtin" or not header then
            _OPTIONS["with-libjpeg"] = "builtin"
        -- Non standard path found
        elseif header and header ~= "standard" then
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
        end
    end
    
    -- Check for tiff
    if _OPTIONS["with-zlib"] and _OPTIONS["with-libjpeg"] then
        if not _OPTIONS["with-libtiff"] or _OPTIONS["with-libtiff"] ~= "no" then
            local header = wx.unix.findheader("tiff.h")
            local libdir = wx.unix.findlib("tiff")
            
            -- Forced builtin or not found
            if _OPTIONS["with-libtiff"] == "builtin" or not header then
                _OPTIONS["with-libtiff"] = "builtin"
            -- Non standard path found
            elseif header and header ~= "standard" then
                _OPTIONS["with-libtiff"] = "yes"
                wx.includes.libtiff = header
                
                if libdir.static and libdir.static ~= "standard" then
                    wx.libdirs.libtiff = libdir.static
                elseif libdir.shared and libdir.shared ~= "standard" then
                    wx.libdirs.libtiff = libdir.shared
                end
            -- Standard path found
            elseif header then
                _OPTIONS["with-libtiff"] = "yes"
            end
        end
    end
end
