-- ============================================================================
-- Name:        wx/lib/richtext.lua
-- Purpose:     wxRichTextCtrl library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/09
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "richtext"
    kind( wx.getprojectkind() )
-- ============================================================================
--                                  Common
-- ============================================================================
    files
    {
        wx.includedir .. "wx/richtext/richtextbackgroundpage.h",
        wx.includedir .. "wx/richtext/richtextborderspage.h",
        wx.includedir .. "wx/richtext/richtextbuffer.h",
        wx.includedir .. "wx/richtext/richtextbulletspage.h",
        wx.includedir .. "wx/richtext/richtextctrl.h",
        wx.includedir .. "wx/richtext/richtextdialogpage.h",
        wx.includedir .. "wx/richtext/richtextfontpage.h",
        wx.includedir .. "wx/richtext/richtextformatdlg.h",
        wx.includedir .. "wx/richtext/richtexthtml.h",
        wx.includedir .. "wx/richtext/richtextimagedlg.h",
        wx.includedir .. "wx/richtext/richtextindentspage.h",
        wx.includedir .. "wx/richtext/richtextliststylepage.h",
        wx.includedir .. "wx/richtext/richtextmarginspage.h",
        wx.includedir .. "wx/richtext/richtextprint.h",
        wx.includedir .. "wx/richtext/richtextsizepage.h",
        wx.includedir .. "wx/richtext/richtextstyledlg.h",
        wx.includedir .. "wx/richtext/richtextstylepage.h",
        wx.includedir .. "wx/richtext/richtextstyles.h",
        wx.includedir .. "wx/richtext/richtextsymboldlg.h",
        wx.includedir .. "wx/richtext/richtexttabspage.h",
        wx.includedir .. "wx/richtext/richtextuicustomization.h",
        wx.includedir .. "wx/richtext/richtextxml.h",
        wx.includedir .. "wx/xrc/xh_richtext.h",

        wx.srcdir .. "richtext/richtextbuffer.cpp",
        wx.srcdir .. "richtext/richtextctrl.cpp",
        wx.srcdir .. "richtext/richtextformatdlg.cpp",
        wx.srcdir .. "richtext/richtexthtml.cpp",
        wx.srcdir .. "richtext/richtextimagedlg.cpp",
        wx.srcdir .. "richtext/richtextprint.cpp",
        wx.srcdir .. "richtext/richtextstyledlg.cpp",
        wx.srcdir .. "richtext/richtextstyles.cpp",
        wx.srcdir .. "richtext/richtextsymboldlg.cpp",
        wx.srcdir .. "richtext/richtextxml.cpp",
        wx.srcdir .. "xrc/xh_richtext.cpp"
    }
