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

-- wx table
    wx = {}

-- Set premake as current working directory
    os.chdir("../")

-- Load options
    require "wx.options"

-- Load common functions used in later scripts
    require "wx.common"

-- Load the header manipulation class
    require "wx.header"

-- Init wx table defaults
    require "wx.init"

-- Temporary workaround
    targetdir( wx.libdir )
    libdirs  { wx.libdir }

-- Set include directories that should be used by all projects,
-- including setup.h location.
    includedirs
    {
        wx.includedir, wx.setuphdir
    }

-- Setup configuration
    require "wx.setup"

-- Load library checks
    require "wx.check"

-- Load configuration
    require "wx.configure"

-- Load libs
    require "wx.libs"
