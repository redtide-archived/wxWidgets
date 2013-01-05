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
-- ----------------------------------------------------------------------------
-- Global compile options
-- ----------------------------------------------------------------------------
configuration "disable-shared"
    wx.setoption("shared", false)

configuration "enable-stl"
    wx.setoption("stl", true)

configuration "enable-std_containers"
    wx.setoption("std_containers", true)

configuration "enable-std_iostreams"
    wx.setoption("std_iostreams", true)

configuration "enable-std_string"
    wx.setoption("std_string", true)

configuration "enable-std_string_conv_in_wxstring"
    wx.setoption("std_string_conv_in_wxstring", true)

configuration "disable-unicode"
    wx.setoption("unicode", false)

configuration "enable-extended_rtti"
    wx.setoption("extended_rtti", true)

configuration "disable-optimize"
    wx.setoption("optimize", false)

configuration "enable-profile"
    wx.setoption("profile", true)

configuration "enable-no_rtti"
    wx.setoption("no_rtti", true)

configuration "enable-no_exceptions"
    wx.setoption("no_exceptions", true)

configuration "enable-permissive"
    wx.setoption("permissive", true)

configuration "enable-no_deps"
    wx.setoption("no_deps", true)

configuration "disable-vararg_macros"
    wx.setoption("vararg_macros", false)

configuration "enable-compat26"
    wx.setoption("compat26", true)

configuration "disable-compat28"
    wx.setoption("compat28", false)

configuration "disable-rpath"
    wx.setoption("rpath", false)

configuration "enable-objc_uniquifying"
    wx.setoption("objc_uniquifying", true)

configuration "disable-visibility"
    wx.setoption("visibility", false)

configuration "disable-tls"
    wx.setoption("tls", false)
-- ----------------------------------------------------------------------------
-- Global build options
-- ----------------------------------------------------------------------------
configuration "disable-gui"
    wx.setoption("gui", false)

configuration "enable-monolithic"
    wx.setoption("monolithic", true)

configuration "enable-plugins"
    wx.setoption("plugins", true)

configuration "without-subdirs"
    wx.setoption("subdirs", false)

configuration "with-flavour"
    wx.setoption("flavour")

configuration "disable-all-features"
    wx.setoption("all_features", false)
-- ----------------------------------------------------------------------------
-- Third party library options
-- ----------------------------------------------------------------------------
configuration "with-libjpeg"
    wx.setoption("libjpeg")
if wx.libjpeg ~= "no" then
    defines{"wxUSE_LIBJPEG=1"}
end
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
    wx.setoption("x_includes")
    includedirs{ wx.x_includes }

configuration "x-libraries"
    wx.setoption("x_libraries")
    links{ wx.x_libraries }
-- ----------------------------------------------------------------------------
-- Global build options
-- ----------------------------------------------------------------------------
configuration "disable-gui"
    defines{"__WXBASE__", "wxUSE_GUI=0"}
    wx.setoption("gui", false)

configuration "not disable-gui"
    defines{"wxUSE_GUI=1"}

configuration "enable-monolithic"
    wx.setoption("monolithic", true)

configuration "enable-plugins"
    wx.setoption("plugins", true)

configuration "without-subdirs"
    wx.setoption("subdirs", false)

configuration "with-flavour"
    wx.setoption("flavour")

configuration "enable-official_build"
    wx.setoption("official_build", true)

configuration "enable-vendor"
    wx.setoption("vendor")

configuration "disable-all-features"
    wx.setoption("all_features", false)
-- ---------------------------------------------------------------------------
-- Port selection
-- ---------------------------------------------------------------------------
configuration "enable-universal"
    wx.setoption("universal", true)

configuration "with-themes"
    wx.setoption("themes", true)

configuration "enable-nanox"
    wx.setoption("nanox", true)

configuration "enable-gpe"
    wx.setoption("gpe", true)
-- ---------------------------------------------------------------------------
-- Debugging options
-- ---------------------------------------------------------------------------
configuration "enable-debug"
    wx.setoption("debug", true)
    wx.setoption("debug_flag", true)

configuration "disable-debug_flag"
    wx.setoption("debug",      false)
    wx.setoption("debug_flag", false)
    wx.setoption("debug_info", false)
    wx.setoption("debug_gdb",  false)

configuration "enable-debug_info"
    wx.setoption("debug_info", true)

configuration "enable-debug_gdb"
    wx.setoption("debug_gdb", true)
-- ----------------------------------------------------------------------------
-- Optional "big" GUI features
-- ----------------------------------------------------------------------------
configuration "enable-aui"
    wx.setoption("aui", true)
    defines{"wxUSE_AUI=1"}
-------------------------------------------------------------------------------
-- Debug configuration
-------------------------------------------------------------------------------
configuration "Debug"
    defines{"DEBUG", "_DEBUG"}
    flags{"Symbols"}
if wx.compiler == "gcc" then
    buildoptions{"-O0"}
end
-------------------------------------------------------------------------------
-- Release configuration
-------------------------------------------------------------------------------
configuration "Release"
    defines{"NDEBUG"}
    flags{"OptimizeSpeed"}
