-- ============================================================================
-- Name:        wx/setup.lua
-- Purpose:     wx Lua namespace, common/generic functions
-- Author:      Andrea Zanellato, Jefferson González
-- Modified by:
-- Created:     2012/12/17
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
--              (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

function wx.getprojectkind()
    if wx.shared then
        return "SharedLib"
    else
        return "StaticLib"
    end
end

-------------------------------------------------------------------------------
-- Sets a wx option based on the current configuration been checked
-------------------------------------------------------------------------------
function wx.setoption(name, value)
    local configuration
    
    for index,option in pairs(premake.CurrentConfiguration.terms) do
        configuration = option
    end
    
    local option_type, option_value = type(_OPTIONS[configuration]), _OPTIONS[configuration]
    
    if option_type == "string" then
        if option_value ~= "" then
            wx[name] = option_value
        else
            wx[name] = value
        end
    elseif option_type == "number" then
        wx[name] = option_value
    elseif option_type == "boolean" then
        wx[name] = value
    end
end

-------------------------------------------------------------------------------
-- Execute a command and return the result in a table
-------------------------------------------------------------------------------
function wx.execute(command)
    local process = assert(io.popen(command), "Failed to execute: " .. command)
    local lines = {}
    
    for line in process:lines() do
        table.insert(lines, line)
    end
    
    process:close()
    
    return lines
end

-------------------------------------------------------------------------------
-- Print strings to stdout without new line in contrast to default print.
-------------------------------------------------------------------------------
function wx.print(text)
    io.stdout:write(text)
    io.stdout:flush()
end
