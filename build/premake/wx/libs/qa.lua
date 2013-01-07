-- ============================================================================
-- Name:        wx/libs/qa.lua
-- Purpose:     wxQA library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/06
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
project "qa"
    kind( wx.getprojectkind() )

    files
    {
        wx.includedir .. "wx/debugrpt.h",
        wx.srcdir     .. "common/debugrpt.cpp",
        wx.srcdir     .. "generic/dbgrptg.cpp"
    }
