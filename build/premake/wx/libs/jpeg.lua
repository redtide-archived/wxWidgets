-- ============================================================================
-- Name:        jpeg.lua
-- Purpose:     wxWidgets builtin jpeg project
-- Author:      Jefferson González
-- Modified by:
-- Created:     2013/01/04
-- RCS-ID:      $Id$
-- Copyright:   (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "jpeg"
    kind( wx.getprojectkind() )
    
    targetname("wxjpeg")
    
    includedirs
    {
        "../../src/jpeg"
    }
    
    files
    {
        -- Headers
        "../../src/jpeg/jchuff.h",
        "../../src/jpeg/jconfig.h",
        "../../src/jpeg/jdct.h",
        "../../src/jpeg/jdhuff.h",
        "../../src/jpeg/jerror.h",
        "../../src/jpeg/jinclude.h",
        "../../src/jpeg/jmemsys.h",
        "../../src/jpeg/jmorecfg.h",
        "../../src/jpeg/jpeg_CW_Prefix.h",
        "../../src/jpeg/jpegint.h",
        "../../src/jpeg/jpeglib.h",
        "../../src/jpeg/jversion.h",
        
        -- Sources
        "../../src/jpeg/jcomapi.c",
        "../../src/jpeg/jutils.c",
        "../../src/jpeg/jerror.c",
        "../../src/jpeg/jmemmgr.c",
        "../../src/jpeg/jmemnobs.c",
        "../../src/jpeg/jcapimin.c",
        "../../src/jpeg/jcapistd.c",
        "../../src/jpeg/jctrans.c",
        "../../src/jpeg/jcparam.c",
        "../../src/jpeg/jdatadst.c",
        "../../src/jpeg/jcinit.c",
        "../../src/jpeg/jcmaster.c",
        "../../src/jpeg/jcmarker.c",
        "../../src/jpeg/jcmainct.c",
        "../../src/jpeg/jcprepct.c",
        "../../src/jpeg/jccoefct.c",
        "../../src/jpeg/jccolor.c",
        "../../src/jpeg/jcsample.c",
        "../../src/jpeg/jchuff.c",
        "../../src/jpeg/jcphuff.c",
        "../../src/jpeg/jcdctmgr.c",
        "../../src/jpeg/jfdctfst.c",
        "../../src/jpeg/jfdctflt.c",
        "../../src/jpeg/jfdctint.c",
        "../../src/jpeg/jdapimin.c",
        "../../src/jpeg/jdapistd.c",
        "../../src/jpeg/jdtrans.c",
        "../../src/jpeg/jdatasrc.c",
        "../../src/jpeg/jdmaster.c",
        "../../src/jpeg/jdinput.c",
        "../../src/jpeg/jdmarker.c",
        "../../src/jpeg/jdhuff.c",
        "../../src/jpeg/jdphuff.c",
        "../../src/jpeg/jdmainct.c",
        "../../src/jpeg/jdcoefct.c",
        "../../src/jpeg/jdpostct.c",
        "../../src/jpeg/jddctmgr.c",
        "../../src/jpeg/jidctfst.c",
        "../../src/jpeg/jidctflt.c",
        "../../src/jpeg/jidctint.c",
        "../../src/jpeg/jidctred.c",
        "../../src/jpeg/jdsample.c",
        "../../src/jpeg/jdcolor.c",
        "../../src/jpeg/jquant1.c",
        "../../src/jpeg/jquant2.c",
        "../../src/jpeg/jdmerge.c"
    }
