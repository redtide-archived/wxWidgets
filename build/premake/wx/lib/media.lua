-- ============================================================================
-- Name:        wx/lib/media.lua
-- Purpose:     wxMedia library project (currently including only wxMediaCtrl)
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/09
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "media"
    kind( wx.getprojectkind() )
-- ============================================================================
--                                  Common
-- ============================================================================
    files
    {
        wx.includedir .. "wx/mediactrl.h",
        wx.srcdir     .. "common/mediactrlcmn.cpp"
    }
-- ============================================================================
--                                  Windows
-- ============================================================================
    if wx.msw then files
    {
        wx.srcdir .. "msw/mediactrl_am.cpp",
        wx.srcdir .. "msw/mediactrl_wmp10.cpp",
        wx.srcdir .. "msw/mediactrl_qt.cpp"
    }
-- ============================================================================
--                                  OSX
-- ============================================================================
    elseif wx.osx then
        if wx.carbon then files
        {
            wx.srcdir .. "osx/carbon/mediactrl.cpp"
        }
        end

        if wx.cocoa then files
        {
            wx.srcdir .. "osx/cocoa/mediactrl.mm"
        }
        end
-- ============================================================================
--                                  Old COCOA
-- ============================================================================
    elseif wx.old_cocoa then files
    {
        wx.srcdir .. "cocoa/mediactrl.mm"
    }
-- ============================================================================
--                                  UNIX
-- ============================================================================
    else files
    {
        wx.srcdir .. "unix/mediactrl.cpp"
    }
    end
