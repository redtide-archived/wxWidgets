-- ============================================================================
-- Name:        wx/msw/setup.lua
-- Purpose:     wxMSW setup
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/19
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
if os.is("windows") then
    wx.msw            = true
    wx.wince          = false
-- ----------------------------------------------------------------------------
-- Global compile options
-- ----------------------------------------------------------------------------
    wx.mslu           = false
-- ----------------------------------------------------------------------------
-- Global build options
-- ----------------------------------------------------------------------------
    wx.official_build = false
    wx.vendor         = "custom"
-- ----------------------------------------------------------------------------
-- Optional non GUI features
-- ----------------------------------------------------------------------------
    wx.ole            = false
    wx.iniconf        = false
    wx.regkey         = false
-- ----------------------------------------------------------------------------
-- Optional "big" GUI features
-- ----------------------------------------------------------------------------
    wx.mshtmlhelp     = false
-- ----------------------------------------------------------------------------
-- wxMSW-only options
-- ----------------------------------------------------------------------------
    wx.dccache        = false
    wx.ps_in_msw      = false
    wx.ownerdrawn     = false
    wx.uxtheme        = false
    wx.wxdib          = false
    wx.webviewie      = false
end
