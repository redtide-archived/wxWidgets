-- ============================================================================
-- Name:        wx.lua
-- Purpose:     wx Lua namespace
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/17
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <widgets.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
wx = {}

wx.version          = "2.9.5"
wx.compiler         = ""
wx.includedir       = ""
wx.libdir           = ""
wx.static           = false
-- ----------------------------------------------------------------------------
-- X Features
-- ----------------------------------------------------------------------------
wx.x-includes       = ""
wx.x-libraries      = ""
-- ----------------------------------------------------------------------------
-- Global build options
-- ----------------------------------------------------------------------------
wx.gui              = true
wx.monolithic       = false
wx.plugins          = false
wx.subdirs          = false
wx.flavour          = ""
wx.official_build   = false
wx.vendor           = "custom"
wx.all-features     = true
-- ----------------------------------------------------------------------------
-- Port selection
-- ----------------------------------------------------------------------------
wx.gtk              = 0
wx.motif            = 0
wx.osx_carbon       = 0
wx.osx_cocoa        = 0
wx.osx_iphone       = 0
wx.osx              = 0
wx.carbon           = wx.osx_carbon
wx.cocoa            = wx.osx_cocoa
wx.iphone           = wx.osx_iphone
wx.mac              = wx.osx
wx.old_cocoa        = 0
wx.wine             = 0
wx.msw              = 0
wx.pm               = 0
wx.directfb         = 0
wx.microwin         = 0
wx.x11              = 0
wx.nanox            = 0
wx.gpe              = 0
wx.universal        = false
wx.themes           = "all"
-- ----------------------------------------------------------------------------
-- External libraries
-- ----------------------------------------------------------------------------
wx.libpng           = 0
wx.libjpeg          = 0
wx.libtiff          = 0
wx.libxpm           = 0
wx.libiconv         = 0
wx.libmspack        = 0
wx.gtkprint         = 0
wx.gnomeprint       = 0
wx.gnomevfs         = 0
wx.libnotify        = 0
wx.hildon           = 0
wx.opengl           = 0

wx.dmalloc          = 0
wx.sdl              = 0
wx.regex            = 0
wx.zlib             = 0
wx.expat            = 0

wx.macosx-sdk         = ""
wx.macosx-version-min = ""
-- ---------------------------------------------------------------------------
-- Debugging options
-- ---------------------------------------------------------------------------
wx.debug            = false
wx.debug_flag       = false
wx.debug_info       = false
wx.debug_gdb        = false
-- ---------------------------------------------------------------------------
-- Global compile options
-- ---------------------------------------------------------------------------
wx.shared                       = true
wx.stl                          = false
wx.std_containers               = false
wx.std_iostreams                = false
wx.std_string                   = false
wx.std_string_conv_in_wxstring  = false
wx.unicode                      = true
wx.mslu                         = false
wx.utf8                         = false
wx.utf8only                     = false
wx.extended_rtti                = false
wx.omf                          = false
