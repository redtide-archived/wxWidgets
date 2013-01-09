-- ============================================================================
-- Name:        wx/lib/webview.lua
-- Purpose:     wxWebView library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/09
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "webview"
    kind( wx.getprojectkind() )
-- ============================================================================
--                                  Common
-- ============================================================================
    files
    {
        wx.includedir .. "wx/webview.h",
        wx.includedir .. "wx/webviewarchivehandler.h",
        wx.includedir .. "wx/webviewfshandler.h",

        wx.srcdir .. "common/webview.cpp",
        wx.srcdir .. "common/webviewarchivehandler.cpp",
        wx.srcdir .. "common/webviewfshandler.cpp"
    }
-- ============================================================================
--                                  GTK
-- ============================================================================
    if wx.gtk then files
    {
        wx.includedir .. "wx/gtk/webviewhistoryitem_webkit.h",
        wx.includedir .. "wx/gtk/webview_webkit.h",

        wx.srcdir .. "gtk/webview_webkit.cpp"
    }
-- ============================================================================
--                                  OSX
-- ============================================================================
    elseif wx.osx then files
    {
        wx.includedir .. "wx/osx/webviewhistoryitem_webkit.h",
        wx.includedir .. "wx/osx/webview_webkit.h",

        wx.srcdir .. "osx/webview_webkit.mm"
    }
-- ============================================================================
--                                  Windows
-- ============================================================================
    elseif wx.msw then files
    {
        wx.includedir .. "wx/msw/webviewhistoryitem_ie.h",
        wx.includedir .. "wx/msw/webview_ie.h",
        wx.includedir .. "wx/msw/webview_missing.h",

        wx.srcdir .. "msw/webview_ie.cpp"
    }
    end
