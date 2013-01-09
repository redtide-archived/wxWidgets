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
    if wx.gtk or wx.motif or wx.x11 then files
    {
        wx/unix/joystick.h
        wx/unix/sound.h
        wx/unix/taskbarx11.h

        src/common/taskbarcmn.cpp
        src/unix/joystick.cpp
        src/unix/sound.cpp
        src/unix/taskbarx11.cpp
    }
    end -- wx.unix_common
-- ============================================================================
--                                  OSX
-- ============================================================================
    if wx.cocoa then files
    {
        wx/generic/animate.h
        wx/osx/dataview.h
        wx/osx/datectrl.h
        wx/osx/datetimectrl.h
        wx/osx/dvrenderer.h
        wx/osx/dvrenderers.h
        wx/osx/joystick.h
        wx/osx/sound.h
        wx/osx/taskbarosx.h
        wx/osx/timectrl.h
        wx/osx/core/joystick.h
        wx/osx/cocoa/dataview.h

        src/common/taskbarcmn.cpp
        src/generic/animateg.cpp
        src/osx/datetimectrl_osx.cpp
        src/osx/datectrl_osx.cpp
        src/osx/sound_osx.cpp
        src/osx/timectrl_osx.cpp
        src/osx/carbon/sound.cpp
        src/osx/core/sound.cpp
        src/osx/cocoa/aboutdlg.mm
        src/osx/dataview_osx.cpp
        src/osx/cocoa/dataview.mm
        src/osx/cocoa/datetimectrl.mm
        src/osx/cocoa/taskbar.mm
        src/osx/core/hidjoystick.cpp
    }
    end -- wx.cocoa

    if wx.carbon then files
    {
        wx/generic/animate.h
        wx/osx/dataview.h
        wx/osx/dvrenderer.h
        wx/osx/dvrenderers.h
        wx/osx/joystick.h
        wx/osx/sound.h
        wx/osx/taskbarosx.h
        wx/osx/carbon/drawer.h
        wx/osx/carbon/dataview.h
        wx/osx/core/joystick.h

        src/common/taskbarcmn.cpp
        src/generic/animateg.cpp
        src/osx/carbon/aboutdlg.cpp
        src/osx/carbon/drawer.cpp
        src/osx/dataview_osx.cpp
        src/osx/carbon/dataview.cpp
        src/osx/sound_osx.cpp
        src/osx/carbon/sound.cpp
        src/osx/carbon/taskbar.cpp
        src/osx/core/hidjoystick.cpp
    }
    end -- wx.carbon

    if wx.iphone then files
    {
        wx/generic/animate.h
        wx/osx/sound.h

        src/generic/animateg.cpp
        src/osx/sound_osx.cpp
        src/osx/core/sound.cpp
    }
    end -- wx.iphone
-- ============================================================================
--                                  Universal
-- ============================================================================
    if wx.univ then files
    {
        wx/generic/animate.h
--[[
    Don't include src/generic/animateg.cpp many times in wx.univ.
    This file is already included in:

        wx.carbon, wx.cocoa, wx.iphone, COCOA(???),
        wx.os2, wx.motif and wx.gtk == 1.
--]]
        if wx.gtk == 2 or wx.msw then files
        {
            src/generic/animateg.cpp
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
            wx/msw/notifmsg.h
            wx/msw/sound.h
            wx/msw/taskbar.h

            src/common/taskbarcmn.cpp
            src/msw/aboutdlg.cpp
            src/msw/notifmsg.cpp
            src/msw/richtooltip.cpp
            src/msw/sound.cpp
            src/msw/taskbar.cpp
        }

        -- not used with wxUniv
        if not wx.univ then files
        {
            wx/generic/animate.h
            wx/msw/bmpcbox.h
            wx/msw/commandlinkbutton.h
            wx/msw/calctrl.h
            wx/msw/datectrl.h
            wx/msw/datetimectrl.h
            wx/msw/hyperlink.h
            wx/msw/timectrl.h

            src/generic/animateg.cpp
            src/msw/bmpcbox.cpp
            src/msw/calctrl.cpp
            src/msw/commandlinkbutton.cpp
            src/msw/datecontrols.cpp
            src/msw/datectrl.cpp
            src/msw/datetimectrl.cpp
            src/msw/hyperlink.cpp
            src/msw/timectrl.cpp
        }
        end -- not wx.univ

        -- not built on WindowsCE:
        if not wx.wince then files
        {
            wx/msw/joystick.h
            src/msw/joystick.cpp
        } -- not wx.wince
    end -- wx.msw

-- ============================================================================
--                                  OS2 (Currently not supported)
-- ============================================================================
--[[
    if wx.os2 then files
    {
        wx/generic/animate.h
        wx/os2/joystick.h
        wx/os2/sound.h

        src/generic/animateg.cpp
        src/os2/joystick.cpp
        src/os2/sound.cpp
    }
    end
--]]
