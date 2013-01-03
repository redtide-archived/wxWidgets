-- ============================================================================
-- Name:        configure.lua
-- Purpose:     wxWidgets build configuration
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/17
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <widgets.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
configuration "disable-unicode"
    wx.SetOption("unicode", false)
-- ----------------------------------------------------------------------------
-- Ports configurations
-- ----------------------------------------------------------------------------
configuration "bsd"
    defines{"__BSD__", "__WXGTK__"}

configuration "linux"
    defines{"__LINUX__", "__WXGTK__"}

configuration "macosx"
    defines{"__DARWIN__", "__APPLE__", "__WXMAC__", "__WXOSX__"}

configuration "solaris"
    defines{"__SOLARIS__", "__WXMOTIF__"}

configuration "windows"
    defines{"__WINDOWS__", "__WIN32__", "__WXMSW__", "WIN32", "_WINDOWS"}
    if wx.unicode then
        defines{"UNICODE", "_UNICODE"}
    end
-- ----------------------------------------------------------------------------
-- X Features
-- ----------------------------------------------------------------------------
configuration "x-includes"
    wx.SetOption("x_includes")
    includedirs     { wx.x_includes }

configuration "x-libraries"
    wx.SetOption("x_libraries")
    links           { wx.x_libraries }
-- ----------------------------------------------------------------------------
-- Global build options
-- ----------------------------------------------------------------------------
configuration "disable-gui"
    defines{"__WXBASE__", "wxUSE_GUI=0"}
    wx.SetOption("gui", false)

configuration "not disable-gui"
    defines{"wxUSE_GUI=1"}

configuration "enable-monolithic"
    wx.SetOption("monolithic", true)

configuration "enable-plugins"
    wx.SetOption("plugins", true)

configuration "without-subdirs"
    wx.SetOption("subdirs", false)

configuration "with-flavour"
    wx.SetOption("flavour")

configuration "enable-official_build"
    wx.SetOption("official_build", true)

configuration "enable-vendor"
    wx.SetOption("vendor")

configuration "disable-all-features"
    wx.SetOption("all_features", false)
-- ---------------------------------------------------------------------------
-- Port selection
-- ---------------------------------------------------------------------------
configuration "enable-universal"
    wx.SetOption("universal", true)

configuration "with-themes"
    wx.SetOption("themes", true)

configuration "enable-nanox"
    wx.SetOption("nanox", true)

configuration "enable-gpe"
    wx.SetOption("gpe", true)
-- ---------------------------------------------------------------------------
-- Debugging options
-- ---------------------------------------------------------------------------
configuration "enable-debug"
    wx.SetOption("debug", true)
    wx.SetOption("debug_flag", true)

configuration "disable-debug_flag"
    wx.SetOption("debug", false)
    wx.SetOption("debug_flag", false)
    wx.SetOption("debug_info", false)
    wx.SetOption("debug_gdb", false)

configuration "enable-debug_info"
    wx.SetOption("debug_info", true)

configuration "enable-debug_gdb"
    wx.SetOption("debug_gdb", true)
    wx.debug_gdb    = true
-- ----------------------------------------------------------------------------
-- Global compile options
-- ----------------------------------------------------------------------------
configuration "disable-shared"
    wx.SetOption("shared", false)
-- ----------------------------------------------------------------------------
-- Optional "big" GUI features
-- ----------------------------------------------------------------------------
configuration "enable-aui"
    wx.SetOption("aui", true)
    defines {"wxUSE_AUI=1"}
-------------------------------------------------------------------------------
-- Debug configuration
-------------------------------------------------------------------------------
configuration "Debug"
    defines         {"DEBUG", "_DEBUG"}
    flags           {"Symbols"}
if wx.compiler == "gcc" then
    buildoptions    {"-O0"}
end
-------------------------------------------------------------------------------
-- Release configuration
-------------------------------------------------------------------------------
configuration "Release"
    defines         {"NDEBUG"}
    flags           {"OptimizeSpeed"}
