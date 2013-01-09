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
wx.osx                          = true
wx.osx_carbon                   = false
wx.osx_cocoa                    = true
wx.old_cocoa                    = false
wx.osx_iphone                   = false
wx.carbon                       = wx.osx_carbon
wx.cocoa                        = wx.osx_cocoa
wx.iphone                       = wx.osx_iphone
wx.mac                          = wx.osx
-- ----------------------------------------------------------------------------
-- Global compile options
-- ----------------------------------------------------------------------------
wx.universal_binary             = false
wx.macosx_arch                  = ""
wx.macosx_sdk                   = ""
wx.macosx_version_min           = ""
