-- ============================================================================
-- Name:        wx/lib/adv.lua
-- Purpose:     wxAdv (wxAdvanced) library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/08
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "adv"
    kind( wx.getprojectkind() )
-- ============================================================================
--                                  Common
-- ============================================================================
    files
    {
        wx.includedir .. "wx/aboutdlg.h",
        wx.includedir .. "wx/animate.h",
        wx.includedir .. "wx/bannerwindow.h",
        wx.includedir .. "wx/bmpcbox.h",
        wx.includedir .. "wx/calctrl.h",
        wx.includedir .. "wx/commandlinkbutton.h",
        wx.includedir .. "wx/dataview.h",
        wx.includedir .. "wx/datectrl.h",
        wx.includedir .. "wx/dateevt.h",
        wx.includedir .. "wx/datetimectrl.h",
        wx.includedir .. "wx/dcbuffer.h",
        wx.includedir .. "wx/dvrenderers.h",
        wx.includedir .. "wx/editlbox.h",
        wx.includedir .. "wx/generic/aboutdlgg.h",
        wx.includedir .. "wx/generic/bmpcbox.h",
        wx.includedir .. "wx/generic/calctrlg.h",
        wx.includedir .. "wx/generic/datectrl.h",
        wx.includedir .. "wx/generic/dataview.h",
        wx.includedir .. "wx/generic/dvrenderer.h",
        wx.includedir .. "wx/generic/dvrenderers.h",
        wx.includedir .. "wx/generic/grid.h",
        wx.includedir .. "wx/generic/gridctrl.h",
        wx.includedir .. "wx/generic/grideditors.h",
        wx.includedir .. "wx/generic/gridsel.h",
        wx.includedir .. "wx/generic/helpext.h",
        wx.includedir .. "wx/generic/hyperlink.h",
        wx.includedir .. "wx/generic/laywin.h",
        wx.includedir .. "wx/generic/notifmsg.h",
        wx.includedir .. "wx/generic/propdlg.h",
        wx.includedir .. "wx/generic/sashwin.h",
        wx.includedir .. "wx/generic/splash.h",
        wx.includedir .. "wx/generic/timectrl.h",
        wx.includedir .. "wx/generic/wizard.h",
        wx.includedir .. "wx/grid.h",
        wx.includedir .. "wx/hyperlink.h",
        wx.includedir .. "wx/joystick.h",
        wx.includedir .. "wx/laywin.h",
        wx.includedir .. "wx/notifmsg.h",
        wx.includedir .. "wx/odcombo.h",
        wx.includedir .. "wx/propdlg.h",
        wx.includedir .. "wx/richtooltip.h",
        wx.includedir .. "wx/sashwin.h",
        wx.includedir .. "wx/sound.h",
        wx.includedir .. "wx/splash.h",
        wx.includedir .. "wx/taskbar.h",
        wx.includedir .. "wx/timectrl.h",
        wx.includedir .. "wx/tipdlg.h",
        wx.includedir .. "wx/treelist.h",
        wx.includedir .. "wx/wizard.h",

        wx.srcdir .. "common/animatecmn.cpp",
        wx.srcdir .. "common/bmpcboxcmn.cpp",
        wx.srcdir .. "common/calctrlcmn.cpp",
        wx.srcdir .. "common/datavcmn.cpp",
        wx.srcdir .. "common/gridcmn.cpp",
        wx.srcdir .. "common/hyperlnkcmn.cpp",
        wx.srcdir .. "common/odcombocmn.cpp",
        wx.srcdir .. "common/richtooltipcmn.cpp",
        wx.srcdir .. "generic/aboutdlgg.cpp",
        wx.srcdir .. "generic/bannerwindow.cpp",
        wx.srcdir .. "generic/bmpcboxg.cpp",
        wx.srcdir .. "generic/calctrlg.cpp",
        wx.srcdir .. "generic/commandlinkbuttong.cpp",
        wx.srcdir .. "generic/datavgen.cpp",
        wx.srcdir .. "generic/datectlg.cpp",
        wx.srcdir .. "generic/editlbox.cpp",
        wx.srcdir .. "generic/grid.cpp",
        wx.srcdir .. "generic/gridctrl.cpp",
        wx.srcdir .. "generic/grideditors.cpp",
        wx.srcdir .. "generic/gridsel.cpp",
        wx.srcdir .. "generic/helpext.cpp",
        wx.srcdir .. "generic/hyperlinkg.cpp",
        wx.srcdir .. "generic/laywin.cpp",
        wx.srcdir .. "generic/notifmsgg.cpp",
        wx.srcdir .. "generic/odcombo.cpp",
        wx.srcdir .. "generic/propdlg.cpp",
        wx.srcdir .. "generic/richtooltipg.cpp",
        wx.srcdir .. "generic/sashwin.cpp",
        wx.srcdir .. "generic/splash.cpp",
        wx.srcdir .. "generic/timectrlg.cpp",
        wx.srcdir .. "generic/tipdlg.cpp",
        wx.srcdir .. "generic/treelist.cpp",
        wx.srcdir .. "generic/wizard.cpp"
    }

-- ============================================================================
--                                  UNIX
-- ============================================================================
    if wx.gtk == 1 or wx.motif or wx.x11 or wx.osx then files
    {
        wx.includedir .. "wx/unix/joystick.h",
        wx.includedir .. "wx/unix/sound.h",
        wx.includedir .. "wx/unix/taskbarx11.h",

        wx.srcdir .. "common/taskbarcmn.cpp",
        wx.srcdir .. "unix/joystick.cpp",
        wx.srcdir .. "unix/sound.cpp",
        wx.srcdir .. "unix/taskbarx11.cpp"

        if not wx.x11 then files
        {
            wx.includedir .. "wx/generic/animate.h",
            wx.srcdir     .. "generic/animateg.cpp"
        }
        end
    }
    end -- wx.unix_common
-- ============================================================================
--                                  GTK
-- ============================================================================
    if wx.gtk == 1 then files
    {
        wx.srcdir .. "gtk1/eggtrayicon.c",
        wx.srcdir .. "gtk1/taskbar.cpp"
    }
    elseif wx.gtk > 1 then files
    {
        wx.includedir .. "wx/gtk/animate.h",
        wx.includedir .. "wx/gtk/bmpcbox.h",
        wx.includedir .. "wx/gtk/calctrl.h",
        wx.includedir .. "wx/gtk/dataview.h",
        wx.includedir .. "wx/gtk/dvrenderer.h",
        wx.includedir .. "wx/gtk/dvrenderers.h",
        wx.includedir .. "wx/gtk/hyperlink.h",
        wx.includedir .. "wx/gtk/notifmsg.h",
        wx.includedir .. "wx/gtk/taskbar.h",

        wx.srcdir .. "gtk/aboutdlg.cpp",
        wx.srcdir .. "gtk/animate.cpp",
        wx.srcdir .. "gtk/bmpcbox.cpp",
        wx.srcdir .. "gtk/calctrl.cpp",
        wx.srcdir .. "gtk/dataview.cpp",
        wx.srcdir .. "gtk/hyperlink.cpp",
        wx.srcdir .. "gtk/notifmsg.cpp",
        wx.srcdir .. "gtk/taskbar.cpp"

        if wx.gtk == 2 then files
        {
            wx.includedir .. "wx/gtk/hildon/notifmsg.h",

            wx.srcdir .. "gtk/eggtrayicon.c",
            wx.srcdir .. "gtk/hildon/notifmsg.cpp"
        }
        end
    }
    end
-- ============================================================================
--                                  OSX / Old Cocoa
-- ============================================================================
    if wx.osx then
        files
        {
            wx.includedir .. "wx/osx/sound.h",
            wx.srcdir     .. "osx/sound_osx.cpp",
        }

        if wx.carbon then files
        {
            wx.includedir .. "wx/osx/dataview.h",
            wx.includedir .. "wx/osx/dvrenderer.h",
            wx.includedir .. "wx/osx/dvrenderers.h",
            wx.includedir .. "wx/osx/joystick.h",
            wx.includedir .. "wx/osx/taskbarosx.h",
            wx.includedir .. "wx/osx/carbon/drawer.h",
            wx.includedir .. "wx/osx/carbon/dataview.h",
            wx.includedir .. "wx/osx/core/joystick.h",

            wx.srcdir .. "common/taskbarcmn.cpp",
            wx.srcdir .. "osx/carbon/aboutdlg.cpp",
            wx.srcdir .. "osx/carbon/drawer.cpp",
            wx.srcdir .. "osx/dataview_osx.cpp",
            wx.srcdir .. "osx/carbon/dataview.cpp",
            wx.srcdir .. "osx/carbon/sound.cpp",
            wx.srcdir .. "osx/carbon/taskbar.cpp",
            wx.srcdir .. "osx/core/hidjoystick.cpp"
        }
        end -- wx.carbon

        if wx.cocoa then files
        {
            wx.includedir .. "wx/osx/dataview.h",
            wx.includedir .. "wx/osx/datectrl.h",
            wx.includedir .. "wx/osx/datetimectrl.h",
            wx.includedir .. "wx/osx/dvrenderer.h",
            wx.includedir .. "wx/osx/dvrenderers.h",
            wx.includedir .. "wx/osx/joystick.h",
            wx.includedir .. "wx/osx/taskbarosx.h",
            wx.includedir .. "wx/osx/timectrl.h",
            wx.includedir .. "wx/osx/core/joystick.h",
            wx.includedir .. "wx/osx/cocoa/dataview.h",

            wx.srcdir .. "common/taskbarcmn.cpp",
            wx.srcdir .. "osx/datetimectrl_osx.cpp",
            wx.srcdir .. "osx/datectrl_osx.cpp",
            wx.srcdir .. "osx/timectrl_osx.cpp",
            wx.srcdir .. "osx/carbon/sound.cpp",
            wx.srcdir .. "osx/core/sound.cpp",
            wx.srcdir .. "osx/cocoa/aboutdlg.mm",
            wx.srcdir .. "osx/dataview_osx.cpp",
            wx.srcdir .. "osx/cocoa/dataview.mm",
            wx.srcdir .. "osx/cocoa/datetimectrl.mm",
            wx.srcdir .. "osx/cocoa/taskbar.mm",
            wx.srcdir .. "osx/core/hidjoystick.cpp",
        }
        end -- wx.cocoa

        if wx.iphone then files
        {
            wx.srcdir .. "osx/core/sound.cpp"
        }
        end
    else if wx.old_cocoa then files
    {
        wx.includedir .. "wx/cocoa/taskbar.h",
        wx.includedir .. "wx/generic/animate.h",
        wx.includedir .. "wx/osx/core/joystick.h",

        wx.srcdir .. "cocoa/taskbar.mm",
        wx.srcdir .. "common/taskbarcmn.cpp",
        wx.srcdir .. "generic/animateg.cpp",
        wx.srcdir .. "osx/core/hidjoystick.cpp"
    {
    end
-- ============================================================================
--                                  Universal
-- ============================================================================
    if wx.univ then
        files
        {
            wx.includedir .. "wx/generic/animate.h"
        }
--[[
    Don't include wx.srcdir .. "generic/animateg.cpp", many times in wx.univ.
    This file is already included in:

        wx.carbon, wx.cocoa, wx.iphone, COCOA(???),
        wx.os2, wx.motif and wx.gtk == 1.
--]]
        if wx.gtk == 2 or wx.msw then files
        {
            wx.srcdir .. "generic/animateg.cpp"
        }
        end
    }
    end
-- ============================================================================
--                                  Windows
-- ============================================================================
    if wx.msw then
        files
        {
            wx.includedir .. "wx/msw/notifmsg.h",
            wx.includedir .. "wx/msw/sound.h",
            wx.includedir .. "wx/msw/taskbar.h",

            wx.srcdir .. "common/taskbarcmn.cpp",
            wx.srcdir .. "msw/aboutdlg.cpp",
            wx.srcdir .. "msw/notifmsg.cpp",
            wx.srcdir .. "msw/richtooltip.cpp",
            wx.srcdir .. "msw/sound.cpp",
            wx.srcdir .. "msw/taskbar.cpp"
        }

        -- not used with wxUniv
        if not wx.univ then files
        {
            wx.includedir .. "wx/generic/animate.h",
            wx.includedir .. "wx/msw/bmpcbox.h",
            wx.includedir .. "wx/msw/commandlinkbutton.h",
            wx.includedir .. "wx/msw/calctrl.h",
            wx.includedir .. "wx/msw/datectrl.h",
            wx.includedir .. "wx/msw/datetimectrl.h",
            wx.includedir .. "wx/msw/hyperlink.h",
            wx.includedir .. "wx/msw/timectrl.h",

            wx.srcdir .. "generic/animateg.cpp",
            wx.srcdir .. "msw/bmpcbox.cpp",
            wx.srcdir .. "msw/calctrl.cpp",
            wx.srcdir .. "msw/commandlinkbutton.cpp",
            wx.srcdir .. "msw/datecontrols.cpp",
            wx.srcdir .. "msw/datectrl.cpp",
            wx.srcdir .. "msw/datetimectrl.cpp",
            wx.srcdir .. "msw/hyperlink.cpp",
            wx.srcdir .. "msw/timectrl.cpp"
        }
        end -- not wx.univ

        -- not built on WindowsCE:
        if not wx.wince then files
        {
            wx.includedir .. "wx/msw/joystick.h",
            wx.srcdir     .. "msw/joystick.cpp"
        } -- not wx.wince
    end -- wx.msw
-- ============================================================================
--                                  OS2 (Currently not supported)
-- ============================================================================
--[[
    if wx.os2 then files
    {
        wx.includedir .. "wx/generic/animate.h",
        wx.includedir .. "wx/os2/joystick.h",
        wx.includedir .. "wx/os2/sound.h",

        wx.srcdir .. "generic/animateg.cpp",
        wx.srcdir .. "os2/joystick.cpp",
        wx.srcdir .. "os2/sound.cpp"
    }
    end
--]]
