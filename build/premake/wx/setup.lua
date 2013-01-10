-- ============================================================================
-- Name:        wx/setup.lua
-- Purpose:     Common setup
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/17
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

-- Make the directory to hold the setup.h
local config = wx.getport() .. "-" .. wx.getencoding() .. "-" ..
               string.sub(wx.version, 1, 3)

wx.setuphdir  = wx.libdir .. "/wx/include/" .. config .. "/wx"
wx.setuphpath = wx.setuphdir .. "/setup.h"
os.mkdir( wx.setuphdir )

-- Create default setup.h
if os.get() ~= "windows" then
    os.copyfile( wx.srcrootdir .. "/setup.h.in", wx.setuphpath )
else
    os.copyfile( wx.srcrootdir .. "/include/wx/msw/setup0.h", wx.setuphpath )
end

wx.setuph = wx.header( wx.setuphpath )
