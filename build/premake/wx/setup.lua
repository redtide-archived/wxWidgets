-- ============================================================================
-- Name:        wx/setup.lua
-- Purpose:     wx Lua namespace, common setup
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/17
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

-- Create default setup.h
if os.get() ~= "windows" then
    os.copyfile( wx.rootdir .. "/setup.h.in", wx.setuphpath )
else
    os.copyfile( wx.rootdir .. "/include/msw/setup0.h", wx.setuphpath )
end

wx.setuph = wx.header( wx.setuphpath )
