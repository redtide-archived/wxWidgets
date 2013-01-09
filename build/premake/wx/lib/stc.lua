-- ============================================================================
-- Name:        wx/lib/stc.lua
-- Purpose:     wxSTC (wxStyledTextCtrl) library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/08
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "stc"
    kind( wx.getprojectkind() )

    files
    {
        wx.includedir .. "wx/stc/stc.h",

        wx.srcdir     .. "src/stc/stc.cpp",
        wx.srcdir     .. "src/stc/PlatWX.cpp",
        wx.srcdir     .. "src/stc/ScintillaWX.cpp"
    }
