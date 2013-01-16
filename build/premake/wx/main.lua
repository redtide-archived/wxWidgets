-- ============================================================================
-- Name:        main.lua
-- Purpose:     Main build configuration script
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/04
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <widgets.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

-- Init wx table
wx = {}

-- Set premake as current working directory
os.chdir("../")

-- Show help
if _OPTIONS["help"] or _OPTIONS["h"] then
--  require "wx.common"
--  require "wx.options"
    require "wx.config"
end

-- Wrong action
if _ACTION and not premake.action.list[_ACTION] then
    error("Not a valid action: " .. _ACTION)
end

-- Load common functions used in later scripts
    require "wx.common"

-- Load options
    require "wx.options"

if not _ACTION then
-- No action == wx-config mode
    require "wx.common"
    require "wx.config.options"
    require "wx.init"
    require "wx.config.init"
    require "wx.config.configurations"

elseif _ACTION == "help" or _ACTION == "h" then
-- Show help
    require "wx.common"
    require "wx.options"

elseif _ACTION ~= "clean" then
-- Any valid action here means we are going to configure

    require "wx.solution"
end

-- Clean
