-- ============================================================================
-- Name:        libs.lua
-- Purpose:     Load wxWidgets optional libraries
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/02
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <widgets.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

if wx.aui then
    require "wx.libs.aui"
end

if wx.propgrid then
    require "wx.libs.propgrid"
end

if wx.ribbon then
    require "wx.libs.ribbon"
end

if wx.stc then
    require "wx.libs.stc"
end

if wx.universal then
    require "wx.ports.universal"
end
