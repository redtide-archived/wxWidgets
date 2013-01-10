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

-- Set premake as current working directory
os.chdir( os.getcwd() .. "/build/premake/" )

if _ACTION ~= nil and _ACTION ~= "help" then
    require "wx.solution"
elseif _OPTIONS["premake-only"] == nil then
    wx = {}
    require "wx.common"
    require "wx.options"
end
