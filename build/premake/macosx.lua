-- ============================================================================
-- Name:        macosx.lua
-- Purpose:     wxOSX setup
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/19
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <widgets.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
wx.osx                          = 0
wx.osx_carbon                   = 0
wx.osx_cocoa                    = 0
wx.old_cocoa                    = 0
wx.osx_iphone                   = 0
wx.carbon                       = wx.osx_carbon
wx.cocoa                        = wx.osx_cocoa
wx.iphone                       = wx.osx_iphone
wx.mac                          = wx.osx
-- ----------------------------------------------------------------------------
-- Global compile options
-- ----------------------------------------------------------------------------
wx.universal_binary             = false
wx.macosx_arch                  = ""
wx.macosx-sdk                   = ""
wx.macosx-version-min           = ""
