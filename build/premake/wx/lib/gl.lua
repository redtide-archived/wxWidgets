-- ============================================================================
-- Name:        wx/lib/gl.lua
-- Purpose:     wxGL library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/09
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "gl"
    kind( wx.getprojectkind() )
-- ============================================================================
--                                  Common
-- ============================================================================
    files
    {
        wx.includedir .. "wx/glcanvas.h",
        wx.srcdir     .. "common/glcmn.cpp"
    }
-- ============================================================================
--                                  GTK
-- ============================================================================
    if wx.gtk then
        files
        {
            wx.includedir .. "wx/unix/glx11.h",
            wx.srcdir     .. "unix/glx11.cpp"
        }

        if wx.gtk > 1 then files
        {
            wx.includedir .. "wx/gtk/glcanvas.h",
            wx.srcdir     .. "gtk/glcanvas.cpp"

        }
        else files -- wx.gtk == 1
        {
            wx.includedir .. "wx/gtk1/glcanvas.h",
            wx.srcdir     .. "gtk1/glcanvas.cpp"
        }
        end
-- ============================================================================
--                                  OS2 (Currently not supported)
-- ============================================================================
--[[
    elseif wx.os2 then files
    {
        wx.srcdir .. "os2/glcanvas.cpp",
    }
--]]
-- ============================================================================
--                                  OSX / Old Cocoa
-- ============================================================================
    elseif wx.osx then
        files
        {
            wx.includedir .. "wx/osx/glcanvas.h",
            wx.srcdir     .. "osx/glcanvas_osx.cpp"
        }

        if wx.carbon then files
        {
            wx.srcdir .. "osx/carbon/glcanvas.cpp"
        }
        end

        if wx.cocoa then files
        {
            wx.srcdir .. "osx/cocoa/glcanvas.mm"
        }
        end

        if wx.iphone then files
        {
            wx.srcdir .. "osx/iphone/glcanvas.mm"
        }
        end
    }
    elseif wx.old_cocoa then files
    {
        wx.includedir .. "wx/cocoa/glcanvas.h",
        wx.srcdir     .. "cocoa/glcanvas.mm"
    }
-- ============================================================================
--                                  Motif / X11
-- ============================================================================
    elseif wx.motif or wx.x11 then files
    {
        wx.includedir .. "wx/x11/glcanvas.h",
        wx.includedir .. "wx/unix/glx11.h",
        wx.srcdir     .. "x11/glcanvas.cpp",
        wx.srcdir     .. "unix/glx11.cpp"
    }
-- ============================================================================
--                                  Windows
-- ============================================================================
    elseif wx.msw or wx.wince then files
    {
        wx.includedir .. "wx/msw/glcanvas.h",
        wx.srcdir     .. "msw/glcanvas.cpp"
    }
    end
