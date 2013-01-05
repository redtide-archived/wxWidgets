-- ============================================================================
-- Name:        wx/libs/ribbon.lua
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

    includedirs
    {
        "../../include"
    }

    files
    {
        -- Headers
        "../../include/wx/ribbon/art.h",
        "../../include/wx/ribbon/art_internal.h",
        "../../include/wx/ribbon/bar.h",
        "../../include/wx/ribbon/buttonbar.h",
        "../../include/wx/ribbon/control.h",
        "../../include/wx/ribbon/gallery.h",
        "../../include/wx/ribbon/page.h",
        "../../include/wx/ribbon/panel.h",
        "../../include/wx/ribbon/toolbar.h",
        "../../include/wx/xrc/xh_ribbon.h",

        -- Sources
        "../../src/ribbon/art_internal.cpp",
        "../../src/ribbon/art_msw.cpp",
        "../../src/ribbon/art_aui.cpp",
        "../../src/ribbon/bar.cpp",
        "../../src/ribbon/buttonbar.cpp",
        "../../src/ribbon/control.cpp",
        "../../src/ribbon/gallery.cpp",
        "../../src/ribbon/page.cpp",
        "../../src/ribbon/panel.cpp",
        "../../src/ribbon/toolbar.cpp",
        "../../src/xrc/xh_ribbon.cpp"
    }
