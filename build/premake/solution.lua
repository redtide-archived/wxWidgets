-- ============================================================================
-- Name:        solution.lua
-- Purpose:     Premake4 wxWidgets solution
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/17
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

solution "wxWidgets"
    language            "C++"
    location            ( "../../build/" .. _ACTION )
    configurations      {"Debug", "Release"}

    -- Temporary workaround
    targetdir           ( "../../build/" .. _ACTION .. "/libs" )
    libdirs             { "../../build/" .. _ACTION .. "/libs" }

-- Make directory to hold the setup.h
    os.mkdir("../../build/" .. _ACTION .. "/wx")

-- Create default setup.h
    if os.get() ~= "windows" then
        os.copyfile("../../setup.h.in", "../../build/" .. _ACTION .. "/wx/setup.h")
    else
        os.copyfile("../../include/msw/setup0.h", "../../build/" .. _ACTION .. "/wx/setup.h")
    end

-- Set include directories that should be used by all projects
    includedirs
    {
        -- wx includes
        "../../include",

        -- include directory with setup.h
        "../../build/" .. _ACTION
    }

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
