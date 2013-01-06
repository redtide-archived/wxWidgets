-- ============================================================================
-- Name:        tiff.lua
-- Purpose:     wxWidgets builtin tiff library project
-- Author:      Jefferson González
-- Modified by:
-- Created:     2013/01/04
-- RCS-ID:      $Id$
-- Copyright:   (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "tiff"
    kind "StaticLib"
    
    targetname "wxtiff"
    
    local withoptions = ""
    
    if wx.zlib == "builtin" then
        links { "wxzlib" }
        includedirs { wx.srcdir .. "zlib" }
        withoptions = "--with-zlib-include-dir=" .. "../../../src/zlib "
    else
        links { "z" }
    end
    
    if wx.libjpeg == "builtin" then
        links { "wxjpeg" }
        includedirs { wx.srcdir .. "jpeg" }
        withoptions = withoptions .. "--with-jpeg-include-dir=DIR=" .. "../../../src/jpeg "
    else
        links { "jpeg" }
    end
    
    files
    {
        wx.srcdir .. "tiff/libtiff/tif_aux.c",
        wx.srcdir .. "tiff/libtiff/tif_close.c",
        wx.srcdir .. "tiff/libtiff/tif_codec.c",
        wx.srcdir .. "tiff/libtiff/tif_color.c",
        wx.srcdir .. "tiff/libtiff/tif_compress.c",
        wx.srcdir .. "tiff/libtiff/tif_dir.c",
        wx.srcdir .. "tiff/libtiff/tif_dirinfo.c",
        wx.srcdir .. "tiff/libtiff/tif_dirread.c",
        wx.srcdir .. "tiff/libtiff/tif_dirwrite.c",
        wx.srcdir .. "tiff/libtiff/tif_dumpmode.c",
        wx.srcdir .. "tiff/libtiff/tif_error.c",
        wx.srcdir .. "tiff/libtiff/tif_extension.c",
        wx.srcdir .. "tiff/libtiff/tif_fax3.c",
        wx.srcdir .. "tiff/libtiff/tif_fax3sm.c",
        wx.srcdir .. "tiff/libtiff/tif_flush.c",
        wx.srcdir .. "tiff/libtiff/tif_getimage.c",
        wx.srcdir .. "tiff/libtiff/tif_jbig.c",
        wx.srcdir .. "tiff/libtiff/tif_jpeg.c",
        wx.srcdir .. "tiff/libtiff/tif_jpeg_12.c",
        wx.srcdir .. "tiff/libtiff/tif_luv.c",
        wx.srcdir .. "tiff/libtiff/tif_lzma.c",
        wx.srcdir .. "tiff/libtiff/tif_lzw.c",
        wx.srcdir .. "tiff/libtiff/tif_next.c",
        wx.srcdir .. "tiff/libtiff/tif_ojpeg.c",
        wx.srcdir .. "tiff/libtiff/tif_open.c",
        wx.srcdir .. "tiff/libtiff/tif_packbits.c",
        wx.srcdir .. "tiff/libtiff/tif_pixarlog.c",
        wx.srcdir .. "tiff/libtiff/tif_predict.c",
        wx.srcdir .. "tiff/libtiff/tif_print.c",
        wx.srcdir .. "tiff/libtiff/tif_read.c",
        wx.srcdir .. "tiff/libtiff/tif_strip.c",
        wx.srcdir .. "tiff/libtiff/tif_swab.c",
        wx.srcdir .. "tiff/libtiff/tif_thunder.c",
        wx.srcdir .. "tiff/libtiff/tif_tile.c",
        wx.srcdir .. "tiff/libtiff/tif_version.c",
        wx.srcdir .. "tiff/libtiff/tif_warning.c",
        wx.srcdir .. "tiff/libtiff/tif_write.c",
        wx.srcdir .. "tiff/libtiff/tif_zip.c"
    }
        
    --[[
        define this to get rid of a warning about using POSIX lfind():
        confusingly enough, we do define lfind as _lfind for MSVC but
        doing this results in a just more confusing warning, see:
        http://connect.microsoft.com/VisualStudio/feedback/ViewFeedback.aspx?FeedbackID=101278--
      ]]--
    configuration "vs*"
        defines { "_CRT_NONSTDC_NO_WARNINGS" }
        
    configuration "not windows"
        includedirs
        {
            "../../build/" .. _ACTION .. "/tiff"
        }
    
        files { wx.srcdir .. "tiff/libtiff/tif_unix.c" }
        
        wx.print("Configuring libtiff... ")
        
        local currentpath = os.getcwd()
        
        os.execute("cp -r ../../src/tiff " .. "../../build/" .. _ACTION .. "/tifftemp")
        
        os.chdir("../../build/" .. _ACTION .. "/tifftemp")
        
        os.execute("./configure " .. withoptions .. "> /dev/null 2>&1")
        
        os.chdir(currentpath)
        
        os.mkdir("../../build/" .. _ACTION .. "/tiff")
        
        os.execute("cp ../../build/" .. _ACTION .. "/tifftemp/libtiff/*.h ../../build/" .. _ACTION .. "/tiff")
        
        os.execute("rm -rf ../../build/" .. _ACTION .. "/tifftemp")
        
        print("done")
    
    configuration "windows"
        files { wx.srcdir .. "tiff/libtiff/tif_win32.c" }
