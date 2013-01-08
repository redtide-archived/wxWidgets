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
    wx = {}
    language            "C++"
    configurations      {"Debug", "Release"}

    -- Make wx dir the current working directory
    os.chdir("../../../")
    local wxdir = os.getcwd()

    -- Set the solution location (that is the build base dir)
    local builddir = wxdir .. "/build/" .. _ACTION
    location( builddir )

    -- Create and set the target dir for built libraries
    local libdir = builddir .. "/lib"
    os.mkdir( libdir )

    -- Temporary workaround
    targetdir( libdir )
    libdirs  { libdir }

    -- Make directory to hold the setup.h
    os.mkdir( libdir .. "/wx" )
    os.mkdir( libdir .. "/wx/include" )
    os.mkdir( libdir .. "/wx/include/wx" )
--[[
    TODO: setup.h should be located, at least on unix, in:
    libdir/wx/include/<port>-<encoding>-<version>/wx/ e.g.:
    libdir/wx/include/gtk2-unicode-2.9/wx/setup.h

    for now just libdir/wx/include/wx/setup.h
--]]
    local setuphdir = libdir .. "/wx/include/wx"

    -- Create default setup.h
    if os.get() ~= "windows" then
        os.copyfile( wxdir .. "/setup.h.in", setuphdir .. "/setup.h")
    else
        os.copyfile( wxdir .. "/include/msw/setup0.h", setuphdir .. "/setup.h")
    end

-- Set include directories that should be used by all projects
    includedirs
    {
        -- wx includes
        "../../include",

        -- include directory with setup.h
        "../../build/" .. _ACTION
    }

    os.chdir("build/premake")

-- Load options
    require "wx.options"

-- Load wx namespace defaults
    require "wx.setup"

-- Load library checks
    require "wx.check"

-- Load configuration
    require "wx.configure"

-- Load libs
    require "wx.libs"
