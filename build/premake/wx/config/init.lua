--[[===========================================================================
    Name:        wx/config/init.lua
    Purpose:     Pre-setup, wx.config table init
    Author:      Andrea Zanellato
    Modified by:
    Created:     2013/01/13
    RCS-ID:      $Id$
    Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
    Licence:     wxWindows licence
  ===========================================================================]]

wx.config.options = {}
wx.config.options.schema =
{
    "host", "toolkit", "widgetset", "chartype", "debugtype",
    "flavour", "version", "linkage"
}
