-- ============================================================================
-- Name:        aui.lua
-- Purpose:     wxAui project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/31
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
project "aui"
    kind ( wx.GetProjectKind() )
    files
    {
        "../../../../include/wx/aui/framemanager.h",
        "../../../../include/wx/aui/dockart.h",
        "../../../../include/wx/aui/floatpane.h",
        "../../../../include/wx/aui/auibook.h",
        "../../../../include/wx/aui/auibar.h",
        "../../../../include/wx/aui/tabmdi.h",
        "../../../../include/wx/aui/aui.h",
        "../../../../include/wx/aui/tabart.h",
        "../../../../include/wx/xrc/xh_auinotbk.h",
        "../../../../src/aui/framemanager.cpp",
        "../../../../src/aui/dockart.cpp",
        "../../../../src/aui/floatpane.cpp",
        "../../../../src/aui/auibook.cpp",
        "../../../../src/aui/auibar.cpp",
        "../../../../src/aui/tabmdi.cpp",
        "../../../../src/aui/tabart.cpp",
        "../../../../src/xrc/xh_auinotbk.cpp"
    }
    includedirs
    {
        "../../../../include"
    }
