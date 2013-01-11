-- ============================================================================
-- Name:        wx/osx/setup.lua
-- Purpose:     wxOSX setup
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/19
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
if os.is("macosx") then
    wx.osx                = true
    wx.carbon             = false
    wx.cocoa              = false
    wx.iphone             = false
    wx.old_cocoa          = false
-- ----------------------------------------------------------------------------
-- Global compile options
-- ----------------------------------------------------------------------------
    wx.universal_binary   = ""
    wx.macosx_arch        = ""
    wx.macosx_sdk         = ""
    wx.macosx_version_min = ""
end
