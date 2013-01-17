--[[===========================================================================
    Name:        wx/config/configurations.lua
    Purpose:     wx-config option's configurations
    Author:      Andrea Zanellato
    Modified by:
    Created:     2013/01/13
    RCS-ID:      $Id$
    Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
    Licence:     wxWindows licence
  ===========================================================================]]

if _OPTIONS["release"]      then print( wx.getversion("short") )  end
if _OPTIONS["version"]      then print( wx.getversion("simple") ) end
if _OPTIONS["version-full"] then print( wx.getversion() )         end

if _OPTIONS["basename"]     then print( wx.getbasename() )        end

if _OPTIONS["prefix"]       then print( _OPTIONS["prefix"] )      end
