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

require "wx.libs.base"

if wx.debugreport then   require "wx.libs.qa" end

if wx.gui then           require "wx.libs.core"
--  if     wx.gtk   then require "wx.libs.gtk"
--  elseif wx.msdos then require "wx.libs.msdos"
--  elseif wx.msw   then require "wx.libs.msw"
--  elseif wx.os2   then require "wx.libs.os2"
--  elseif wx.osx   then require "wx.libs.osx"
--  elseif wx.univ  then require "wx.libs.univ"
--  elseif wx.x11   then require "wx.libs.x11"
--  end
end

if wx.zlib  == "builtin" then require "wx.libs.zlib"  end
if wx.expat == "builtin" then require "wx.libs.expat" end
if wx.regex == "builtin" then require "wx.libs.regex" end

if wx.gui and wx.image then
    if wx.libpng  == "builtin" then require "wx.libs.png"  end
    if wx.libjpeg == "builtin" then require "wx.libs.jpeg" end
    if wx.libtiff == "builtin" then require "wx.libs.tiff" end
end

if wx.aui      then require "wx.libs.aui"      end
if wx.propgrid then require "wx.libs.propgrid" end
if wx.ribbon   then require "wx.libs.ribbon"   end
if wx.stc      then require "wx.libs.stc"      end
