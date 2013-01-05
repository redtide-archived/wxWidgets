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
    require "wx.univ.setup"
end

if wx.zlib == "builtin" then
    require "wx.libs.zlib"
end

if wx.gui and wx.libpng == "builtin" then
    require "wx.libs.png"
end

if wx.gui and wx.libjpeg == "builtin" then
    require "wx.libs.jpeg"
end

if wx.gui and wx.libtiff == "builtin" then
    require "wx.libs.tiff"
end
