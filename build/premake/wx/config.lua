--[[===========================================================================
    Name:        wx/config.lua
    Purpose:     Premake4 wx-config command
    Author:      Andrea Zanellato
    Modified by:
    Created:     2013/01/14
    RCS-ID:      $Id$
    Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
    Licence:     wxWindows licence
  ===========================================================================]]

wx.config = {}

-- Show help
require "wx.config.help"

if _OPTIONS["help"] or _OPTIONS["h"] then
    wx.config.showhelp()
    os.exit(0)
end
