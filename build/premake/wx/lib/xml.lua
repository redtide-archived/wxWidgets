-- ============================================================================
-- Name:        wx/lib/xml.lua
-- Purpose:     wxXML library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/09
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "xml"
    kind( wx.getprojectkind() )
-- ============================================================================
--                                  Common
-- ============================================================================
    files
    {
        wx.includedir .. "wx/xml/xml.h",
        wx.includedir .. "wx/xtixml.h" -- FIXME - temporary solution

        wx.srcdir .. "xml/xml.cpp",
        wx.srcdir .. "common/xtixml.cpp" -- FIXME - temporary solution
    }
