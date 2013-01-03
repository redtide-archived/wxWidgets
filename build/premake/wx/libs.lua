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
    dofile( PremakeDir .. "/wx/libs/aui.lua" )
end

if wx.propgrid then
    dofile( PremakeDir .. "/wx/libs/propgrid.lua" )
end

if wx.ribbon then
    dofile( PremakeDir .. "/wx/libs/ribbon.lua" )
end

if wx.stc then
    dofile( PremakeDir .. "/wx/libs/stc.lua" )
end

if wx.universal then
    dofile( PremakeDir .. "/wx/ports/universal.lua" )
end
