-- ============================================================================
-- Name:        solution.lua
-- Purpose:     Premake4 wxWidgets solution
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/17
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <widgets.wx@gmail.com>
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
    
-- Create default setup.h based on setup0.h
    if os.get() == "bsd" or os.get() == "linux" then
        os.copyfile("../../include/wx/gtk/setup0.h", "../../build/" .. _ACTION .. "/wx/setup.h")
    elseif os.get() == "macosx" then
        os.copyfile("../../include/osx/setup0.h", "../../build/" .. _ACTION .. "/wx/setup.h")
    elseif os.get() == "solaris" then
        os.copyfile("../../include/motif/setup0.h", "../../build/" .. _ACTION .. "/wx/setup.h")
    elseif os.get() == "windows" then
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
