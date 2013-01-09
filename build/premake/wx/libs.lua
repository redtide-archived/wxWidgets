-- ============================================================================
-- Name:        wx/libs.lua
-- Purpose:     Load wxWidgets optional libraries
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/02
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

require "wx.lib.base"

if wx.debugreport then   require "wx.lib.qa" end

if wx.gui then           require "wx.lib.core"
--  if     wx.gtk   then require "wx.lib.gtk"
--  elseif wx.msdos then require "wx.lib.msdos"
--  elseif wx.msw   then require "wx.lib.msw"
--  elseif wx.os2   then require "wx.lib.os2"
--  elseif wx.osx   then require "wx.lib.osx"
--  elseif wx.univ  then require "wx.lib.univ"
--  elseif wx.x11   then require "wx.lib.x11"
--  end
end

if wx.zlib  == "builtin" then require "wx.lib.zlib"  end
if wx.expat == "builtin" then require "wx.lib.expat" end
if wx.regex == "builtin" then require "wx.lib.regex" end

if wx.gui and wx.image then
    if wx.libpng  == "builtin" then require "wx.lib.png"  end
    if wx.libjpeg == "builtin" then require "wx.lib.jpeg" end
    if wx.libtiff == "builtin" then require "wx.lib.tiff" end
end

if wx.aui      then require "wx.lib.aui"      end
if wx.media    then require "wx.lib.media"    end
if wx.propgrid then require "wx.lib.propgrid" end
if wx.ribbon   then require "wx.lib.ribbon"   end
if wx.stc      then require "wx.lib.stc"      end
