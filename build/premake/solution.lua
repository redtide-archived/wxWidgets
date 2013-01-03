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

    BuildDir            = solution().location
    PremakeDir          = os.getcwd()
    os.chdir( BuildDir )

-- Load options
    dofile( PremakeDir .. "/wx/options.lua" )

-- Load wx namespace defaults
    dofile( PremakeDir .. "/wx/wx.lua" )
    dofile( PremakeDir .. "/wx/ports/unix.lua" )

-- Load configuration
    dofile( PremakeDir .. "/wx/configure.lua" )

-- Load libs
    dofile( PremakeDir .. "/wx/libs.lua" )
