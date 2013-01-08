-- ============================================================================
-- Name:        wx/libs/aui.lua
-- Purpose:     wxAui library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/31
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "aui"
    kind( wx.getprojectkind() )

    files
    {
        wx.includedir .. "wx/aui/framemanager.h",
        wx.includedir .. "wx/aui/dockart.h",
        wx.includedir .. "wx/aui/floatpane.h",
        wx.includedir .. "wx/aui/auibook.h",
        wx.includedir .. "wx/aui/auibar.h",
        wx.includedir .. "wx/aui/tabmdi.h",
        wx.includedir .. "wx/aui/aui.h",
        wx.includedir .. "wx/aui/tabart.h",
        wx.includedir .. "wx/xrc/xh_auinotbk.h",

        wx.srcdir .. "aui/framemanager.cpp",
        wx.srcdir .. "aui/dockart.cpp",
        wx.srcdir .. "aui/floatpane.cpp",
        wx.srcdir .. "aui/auibook.cpp",
        wx.srcdir .. "aui/auibar.cpp",
        wx.srcdir .. "aui/tabmdi.cpp",
        wx.srcdir .. "aui/tabart.cpp",
        wx.srcdir .. "xrc/xh_auinotbk.cpp"
    }
