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
    configurations      {"Debug", "Release"}
    location            ( "../../build/" .. _ACTION )

    PremakeDir          = os.getcwd()

    dofile( PremakeDir .. "/options.lua" )
    dofile( PremakeDir .. "/setup.lua" )

    BuildDir            = solution().location

    os.chdir( BuildDir )

    configuration "windows"
        defines         {"WIN32", "_WINDOWS"}
