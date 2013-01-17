--[[===========================================================================
    Name:        main.lua
    Purpose:     Main build configuration script
    Author:      Andrea Zanellato
    Modified by:
    Created:     2013/01/04
    RCS-ID:      $Id$
    Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
    Licence:     wxWindows licence
  =========================================================================--]]

newaction
{
    trigger     = "install",
    description = "Install all built files",
    execute     = function ()
        -- @todo Installation script, here just for reference
    end
}

-- Wrong action
if _ACTION and not premake.action.list[_ACTION] then
    error("Not a valid action: " .. _ACTION)
end

-- Init wx tables
wx = {}
wx.config = {}

-- Set build/premake as current working directory
os.chdir("../")

-- Show help if needed
require "wx.help"

if not wx.needhelp() then
    -- No action == wx-config mode
    if not _ACTION then
        require "wx.config"

        -- Suppress further messages by premake
        os.exit(0)

    -- Install files
    elseif _ACTION == "install" then
        require "wx.install"

    -- Clean files
    elseif _ACTION == "clean" then
        require "wx.clean"

    -- Any valid action here means we are going to configure
    else
        require "wx.solution"
    end
end
