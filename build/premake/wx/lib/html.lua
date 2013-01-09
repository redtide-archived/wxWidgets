-- ============================================================================
-- Name:        wx/lib/html.lua
-- Purpose:     wxHTML library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/09
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "html"
    kind( wx.getprojectkind() )
-- ============================================================================
--                                  Common
-- ============================================================================
    files
    {
        wx.includedir .. "wx/html/helpctrl.h",
        wx.includedir .. "wx/html/helpdata.h",
        wx.includedir .. "wx/html/helpdlg.h",
        wx.includedir .. "wx/html/helpfrm.h",
        wx.includedir .. "wx/html/helpwnd.h",
        wx.includedir .. "wx/html/htmlcell.h",
        wx.includedir .. "wx/html/htmldefs.h",
        wx.includedir .. "wx/html/htmlfilt.h",
        wx.includedir .. "wx/html/htmlpars.h",
        wx.includedir .. "wx/html/htmlproc.h",
        wx.includedir .. "wx/html/htmltag.h",
        wx.includedir .. "wx/html/htmlwin.h",
        wx.includedir .. "wx/html/htmprint.h",
        wx.includedir .. "wx/html/m_templ.h",
        wx.includedir .. "wx/html/styleparams.h",
        wx.includedir .. "wx/html/winpars.h",
        wx.includedir .. "wx/wxhtml.h",
        wx.includedir .. "wx/htmllbox.h",

        wx.srcdir .. "html/helpctrl.cpp",
        wx.srcdir .. "html/helpdata.cpp",
        wx.srcdir .. "html/helpdlg.cpp",
        wx.srcdir .. "html/helpfrm.cpp",
        wx.srcdir .. "html/helpwnd.cpp",
        wx.srcdir .. "html/htmlcell.cpp",
        wx.srcdir .. "html/htmlfilt.cpp",
        wx.srcdir .. "html/htmlpars.cpp",
        wx.srcdir .. "html/htmltag.cpp",
        wx.srcdir .. "html/htmlwin.cpp",
        wx.srcdir .. "html/htmprint.cpp",
        wx.srcdir .. "html/m_dflist.cpp",
        wx.srcdir .. "html/m_fonts.cpp",
        wx.srcdir .. "html/m_hline.cpp",
        wx.srcdir .. "html/m_image.cpp",
        wx.srcdir .. "html/m_layout.cpp",
        wx.srcdir .. "html/m_links.cpp",
        wx.srcdir .. "html/m_list.cpp",
        wx.srcdir .. "html/m_pre.cpp",
        wx.srcdir .. "html/m_span.cpp",
        wx.srcdir .. "html/m_style.cpp",
        wx.srcdir .. "html/m_tables.cpp",
        wx.srcdir .. "html/styleparams.cpp",
        wx.srcdir .. "html/winpars.cpp",
        wx.srcdir .. "generic/htmllbox.cpp"
    }
-- ============================================================================
--                                  Windows
-- ============================================================================
    if wx.msw then files
    {
        wx.includedir .. "wx/msw/helpbest.h",
        wx.srcdir     .. "msw/helpbest.cpp"
    }
-- ============================================================================
--                                  UNIX
-- ============================================================================
    else files
    {
        wx.srcdir .. "html/chm.cpp"
    }
    end
