-- ============================================================================
-- Name:        wx/lib/ribbon.lua
-- Purpose:     wxRibbon library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/02
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "ribbon"
    kind( wx.getprojectkind() )
-- ============================================================================
--                                  Common
-- ============================================================================
    files
    {
        wx.includedir .. "wx/ribbon/art.h",
        wx.includedir .. "wx/ribbon/art_internal.h",
        wx.includedir .. "wx/ribbon/bar.h",
        wx.includedir .. "wx/ribbon/buttonbar.h",
        wx.includedir .. "wx/ribbon/control.h",
        wx.includedir .. "wx/ribbon/gallery.h",
        wx.includedir .. "wx/ribbon/page.h",
        wx.includedir .. "wx/ribbon/panel.h",
        wx.includedir .. "wx/ribbon/toolbar.h",
        wx.includedir .. "wx/xrc/xh_ribbon.h",

        wx.srcdir .. "ribbon/art_internal.cpp",
        wx.srcdir .. "ribbon/art_msw.cpp",
        wx.srcdir .. "ribbon/art_aui.cpp",
        wx.srcdir .. "ribbon/bar.cpp",
        wx.srcdir .. "ribbon/buttonbar.cpp",
        wx.srcdir .. "ribbon/control.cpp",
        wx.srcdir .. "ribbon/gallery.cpp",
        wx.srcdir .. "ribbon/page.cpp",
        wx.srcdir .. "ribbon/panel.cpp",
        wx.srcdir .. "ribbon/toolbar.cpp",
        wx.srcdir .. "xrc/xh_ribbon.cpp"
    }
