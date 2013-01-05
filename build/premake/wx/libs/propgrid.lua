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

    includedirs
    {
        "../../include"
    }

    files
    {
        -- Headers
        "../../include/wx/propgrid/advprops.h",
        "../../include/wx/propgrid/editors.h",
        "../../include/wx/propgrid/manager.h",
        "../../include/wx/propgrid/property.h",
        "../../include/wx/propgrid/propgrid.h",
        "../../include/wx/propgrid/propgriddefs.h",
        "../../include/wx/propgrid/propgridiface.h",
        "../../include/wx/propgrid/propgridpagestate.h",
        "../../include/wx/propgrid/props.h",

        -- Sources
        "../../src/propgrid/advprops.cpp",
        "../../src/propgrid/editors.cpp",
        "../../src/propgrid/manager.cpp",
        "../../src/propgrid/property.cpp",
        "../../src/propgrid/propgrid.cpp",
        "../../src/propgrid/propgridiface.cpp",
        "../../src/propgrid/propgridpagestate.cpp",
        "../../src/propgrid/props.cpp"
    }
