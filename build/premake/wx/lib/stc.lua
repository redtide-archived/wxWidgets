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
-- ============================================================================
--                                  Common
-- ============================================================================
    files
    {
        wx.includedir .. "wx/stc/stc.h",

        wx.srcdir     .. "stc/stc.cpp",
        wx.srcdir     .. "stc/PlatWX.cpp",
        wx.srcdir     .. "stc/ScintillaWX.cpp"
    }
