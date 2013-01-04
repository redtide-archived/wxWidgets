-- ============================================================================
-- Name:        premake4.lua
-- Purpose:     Premake4 build configuration script
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/04
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <widgets.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
if _ACTION ~= nil and _ACTION ~= "help" then
    dofile(os.getcwd() .. "/build/premake/solution.lua")
else
    dofile(os.getcwd() .. "/build/premake/wx/options.lua")
end


