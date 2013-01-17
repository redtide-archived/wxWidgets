--[[===========================================================================
    Name:        wx/config.lua
    Purpose:     Premake4 wx-config command
    Author:      Andrea Zanellato
    Modified by:
    Created:     2013/01/14
    RCS-ID:      $Id$
    Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
    Licence:     wxWindows licence
  =========================================================================--]]

-- Load common functions
require "wx.common"

-- Init wx table defaults
require "wx.init"

-- Load options
require "wx.config.options"

-- Load configuration
require "wx.config.configurations"
