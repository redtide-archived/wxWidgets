-- ============================================================================
-- Name:        wx/libs/propgrid.lua
-- Purpose:     wxPropertyGrid library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/02
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
project "propgrid"
    kind( wx.getprojectkind() )

    files
    {
        -- Headers
        wx.includedir .. "wx/propgrid/advprops.h",
        wx.includedir .. "wx/propgrid/editors.h",
        wx.includedir .. "wx/propgrid/manager.h",
        wx.includedir .. "wx/propgrid/property.h",
        wx.includedir .. "wx/propgrid/propgrid.h",
        wx.includedir .. "wx/propgrid/propgriddefs.h",
        wx.includedir .. "wx/propgrid/propgridiface.h",
        wx.includedir .. "wx/propgrid/propgridpagestate.h",
        wx.includedir .. "wx/propgrid/props.h",

        -- Sources
        wx.srcdir .. "propgrid/advprops.cpp",
        wx.srcdir .. "propgrid/editors.cpp",
        wx.srcdir .. "propgrid/manager.cpp",
        wx.srcdir .. "propgrid/property.cpp",
        wx.srcdir .. "propgrid/propgrid.cpp",
        wx.srcdir .. "propgrid/propgridiface.cpp",
        wx.srcdir .. "propgrid/propgridpagestate.cpp",
        wx.srcdir .. "propgrid/props.cpp"
    }
