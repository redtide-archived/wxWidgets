-- ============================================================================
-- Name:        jpeg.lua
-- Purpose:     wxWidgets builtin jpeg library project
-- Author:      Jefferson González
-- Modified by:
-- Created:     2013/01/04
-- RCS-ID:      $Id$
-- Copyright:   (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "jpeg"
    kind "StaticLib"
    
    targetname "wxjpeg"
    
    includedirs
    {
        wx.srcdir .. "jpeg"
    }
    
    files
    {
        -- Headers
        wx.srcdir .. "jpeg/jchuff.h",
        wx.srcdir .. "jpeg/jconfig.h",
        wx.srcdir .. "jpeg/jdct.h",
        wx.srcdir .. "jpeg/jdhuff.h",
        wx.srcdir .. "jpeg/jerror.h",
        wx.srcdir .. "jpeg/jinclude.h",
        wx.srcdir .. "jpeg/jmemsys.h",
        wx.srcdir .. "jpeg/jmorecfg.h",
        wx.srcdir .. "jpeg/jpeg_CW_Prefix.h",
        wx.srcdir .. "jpeg/jpegint.h",
        wx.srcdir .. "jpeg/jpeglib.h",
        wx.srcdir .. "jpeg/jversion.h",
        
        -- Sources
        wx.srcdir .. "jpeg/jcomapi.c",
        wx.srcdir .. "jpeg/jutils.c",
        wx.srcdir .. "jpeg/jerror.c",
        wx.srcdir .. "jpeg/jmemmgr.c",
        wx.srcdir .. "jpeg/jmemnobs.c",
        wx.srcdir .. "jpeg/jcapimin.c",
        wx.srcdir .. "jpeg/jcapistd.c",
        wx.srcdir .. "jpeg/jctrans.c",
        wx.srcdir .. "jpeg/jcparam.c",
        wx.srcdir .. "jpeg/jdatadst.c",
        wx.srcdir .. "jpeg/jcinit.c",
        wx.srcdir .. "jpeg/jcmaster.c",
        wx.srcdir .. "jpeg/jcmarker.c",
        wx.srcdir .. "jpeg/jcmainct.c",
        wx.srcdir .. "jpeg/jcprepct.c",
        wx.srcdir .. "jpeg/jccoefct.c",
        wx.srcdir .. "jpeg/jccolor.c",
        wx.srcdir .. "jpeg/jcsample.c",
        wx.srcdir .. "jpeg/jchuff.c",
        wx.srcdir .. "jpeg/jcphuff.c",
        wx.srcdir .. "jpeg/jcdctmgr.c",
        wx.srcdir .. "jpeg/jfdctfst.c",
        wx.srcdir .. "jpeg/jfdctflt.c",
        wx.srcdir .. "jpeg/jfdctint.c",
        wx.srcdir .. "jpeg/jdapimin.c",
        wx.srcdir .. "jpeg/jdapistd.c",
        wx.srcdir .. "jpeg/jdtrans.c",
        wx.srcdir .. "jpeg/jdatasrc.c",
        wx.srcdir .. "jpeg/jdmaster.c",
        wx.srcdir .. "jpeg/jdinput.c",
        wx.srcdir .. "jpeg/jdmarker.c",
        wx.srcdir .. "jpeg/jdhuff.c",
        wx.srcdir .. "jpeg/jdphuff.c",
        wx.srcdir .. "jpeg/jdmainct.c",
        wx.srcdir .. "jpeg/jdcoefct.c",
        wx.srcdir .. "jpeg/jdpostct.c",
        wx.srcdir .. "jpeg/jddctmgr.c",
        wx.srcdir .. "jpeg/jidctfst.c",
        wx.srcdir .. "jpeg/jidctflt.c",
        wx.srcdir .. "jpeg/jidctint.c",
        wx.srcdir .. "jpeg/jidctred.c",
        wx.srcdir .. "jpeg/jdsample.c",
        wx.srcdir .. "jpeg/jdcolor.c",
        wx.srcdir .. "jpeg/jquant1.c",
        wx.srcdir .. "jpeg/jquant2.c",
        wx.srcdir .. "jpeg/jdmerge.c"
    }
