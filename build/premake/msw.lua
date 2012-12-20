-- ============================================================================
-- Name:        msw.lua
-- Purpose:     wxMSW setup
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/19
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <widgets.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
wx.msw                          = 0
-- ----------------------------------------------------------------------------
-- Global compile options
-- ----------------------------------------------------------------------------
wx.mslu                         = false
-- ----------------------------------------------------------------------------
-- Optional non GUI features
-- ----------------------------------------------------------------------------
wx.ole                          = false

wx.iniconf                      = false
wx.regkey                       = false
-- ----------------------------------------------------------------------------
-- Optional "big" GUI features
-- ----------------------------------------------------------------------------
wx.mshtmlhelp                   = false
-- ----------------------------------------------------------------------------
-- wxMSW-only options
-- ----------------------------------------------------------------------------
wx.dccache                      = false
wx.ps-in-msw                    = false
wx.ownerdrawn                   = false
wx.uxtheme                      = false
wx.wxdib                        = false
wx.webviewie                    = false
