-- ============================================================================
-- Name:        setup.lua
-- Purpose:     wxWidgets setup
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/17
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <widgets.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

configuration "bsd"
    defines{"__BSD__", "__WXGTK__"}

configuration "linux"
    defines{"__LINUX__", "__WXGTK__"}

configuration "macosx"
    defines{"__DARWIN__", "__APPLE__", "__WXMAC__", "__WXOSX__"}

configuration "solaris"
    defines{"__SOLARIS__", "__WXMOTIF__"}

configuration "windows"
    defines{"__WINDOWS__", "__WIN32__", "__WXMSW__"}
-- ----------------------------------------------------------------------------
-- X Features
-- ----------------------------------------------------------------------------
configuration "x-includes"
    includedirs{ _OPTIONS.x-includes }

configuration "x-libraries"
    links{ _OPTIONS.x-libraries }
-- ----------------------------------------------------------------------------
-- Global build options
-- ----------------------------------------------------------------------------
configuration "disable-gui"
    defines{"__WXBASE__", "wxUSE_GUI=0"}
    wx.gui = false

configuration "not disable-gui"
    defines{"wxUSE_GUI=1"}
    wx.gui          = true

configuration "enable-monolithic"
    wx.monolithic   = true

configuration "enable-plugins"
    wx.plugins      = true

configuration "without-subdirs"
    wx.subdirs      = false

configuration "with-flavour"
    wx.flavour = _OPTIONS.with-flavour

configuration "enable-official_build"
    wx.official_build = true

configuration "enable-vendor"
    wx.vendor = _OPTIONS.enable-vendor

configuration "disable-all-features"
    wx.all-features = false
-- ---------------------------------------------------------------------------
-- Port selection
-- ---------------------------------------------------------------------------
configuration "enable-universal"
    wx.universal    = true

configuration "with-themes"
    wx.themes       = true

configuration "enable-nanox"
    wx.nanox        = true

configuration "enable-gpe"
    wx.gpe          = true

configuration ""
-- ---------------------------------------------------------------------------
-- Debugging options
-- ---------------------------------------------------------------------------
configuration "enable-debug"
    wx.debug        = true
    wx.debug_flag   = true

configuration "disable-debug_flag"
    wx.debug        = false
    wx.debug_flag   = false
    wx.debug_info   = false
    wx.debug_gdb    = false

configuration "enable-debug_info"
    wx.debug_info   = true

configuration "enable-debug_gdb"
    wx.debug_gdb    = true
-- ----------------------------------------------------------------------------
-- Global compile options
-- ----------------------------------------------------------------------------
configuration "disable-shared"
    wx.shared = false

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

configuration ""
    wx.

