-- ============================================================================
-- Name:        wx/solution.lua
-- Purpose:     Premake4 wxWidgets solution
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/17
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

solution "wx"
    language            "C++"
    configurations      {"Debug", "Release"}

-- Init wx table
    wx = {}

-- Load common functions used in later scripts
    require "wx.common"
    
-- Load options
    require "wx.options"

-- Load the header manipulation class
    require "wx.header"

-- Init wx table defaults
    require "wx.init"

-- Load library checks
    require "wx.check"

-- Setup configuration
    require "wx.setup"

-- Set the solution location, that is the build base dir.
    location( wx.builddir )

-- Temporary workaround
    targetdir( wx.libdir )
    libdirs  { wx.libdir }

-- Set include directories that should be used by all projects,
-- including setup.h location.
    includedirs
    {
        wx.includedir, wx.setuphdir
    }

-- Load configuration
    require "wx.configure"

-- Load library and binary projects
    require "wx.libs"
    require "wx.bins"
