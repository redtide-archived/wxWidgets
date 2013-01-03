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

-- Load options
    require "wx.options"

-- Load wx namespace defaults
    require "wx.wx"
    
    require "wx.ports.unix"

-- Load configuration
    require "wx.configure"

-- Load libs
    require "wx.libs"
