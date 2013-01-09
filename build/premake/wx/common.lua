-- ============================================================================
-- Name:        wx/common.lua
-- Purpose:     wx Lua namespace, common/generic functions
-- Author:      Andrea Zanellato, Jefferson González
-- Modified by:
-- Created:     2012/12/17
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
--              (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

--- Returns the project kind
function wx.getprojectkind(isapp)
    if isapp then
        if wx.gui then
            return "WindowedApp"
        else
            return "ConsoleApp"
        end
    end

    if wx.shared then
        return "SharedLib"
    else
        return "StaticLib"
    end

    error("Could not retrieve project kind.")
end

--- Utility to load dynamically all wx/toolkit/<port>/setup.lua files.
function wx.requireports()
    local portdir = os.getcwd() .. "/wx/toolkit"
    local ports   = wx.scandir( portdir, "dirs" )

    for index, port in pairs( ports ) do
        if port ~= "." and port ~= ".." then
            local path = "wx.toolkit." .. port .. ".setup"
            require( path )
        end
    end
end

--- Utility to get the current wx.toolkit.
-- TODO: check with wx.feature
function wx.getport()
    if _OPTIONS["with-msw"] then
        return "msw"
    elseif _OPTIONS["with-gtk"] then
        local version = _OPTIONS["with-gtk"]
        if version == "any" then version = 1 end
        return "gtk" .. version
    elseif _OPTIONS["with-motif"] then
        return "motif"
    end

    local osname = os.get()
    if osname == "windows" then
        -- TODO: gtk under windows
        return "msw"
    end

    return "gtk2"
end

--- Utility to get the current encoding.
-- TODO: check with wx.feature
function wx.getencoding()
    if _OPTIONS["disable-unicode"] then
        return "ansi"
    end

    return "unicode"
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

--[[---------------------------------------------------------------------------
    Get a table array with the content of a directory.
    @param string dir The directory to scan.
    @param string content The type of content to retrieve "files", "dirs" or nil for everything.
    @return table
-----------------------------------------------------------------------------]]
function wx.scandir(dir, contenttype)
    local dircontent = {}
    local newcontent = {}

    dir = wx.rtrim(dir, "/")
    dir = wx.rtrim(dir, "\\")

    dir = dir .. "/"

    if _OS == "windows" then
        dircontent = wx.execute('dir "'..dir..'" /b')
    else
        dircontent = wx.execute('ls -a "'..dir..'"')
    end

    local index = 1
    if contenttype and contenttype == "files" then
        for _,value in pairs(dircontent) do
            if not os.isdir(dir .. value) then
                newcontent[index] = value
                index = index + 1
            end
        end
        return newcontent
    elseif contenttype and contenttype == "dirs" then
        for _,value in pairs(dircontent) do
            if os.isdir(dir .. value) then
                newcontent[index] = value
                index = index + 1
            end
        end
        return newcontent
    end

    return dircontent
end

--[[---------------------------------------------------------------------------
    Trims a specific character from the end of the input specified.
    @param string input A strint to trim.
    @param string char A single character to trim.
    @return string right trimmed version of the string
-----------------------------------------------------------------------------]]
function wx.rtrim(input, char)
    local result = input
    local output = input:match("(.-)" .. char .. "$")

    while output do
        if output then result = output end
        output = output:match("(.-)" .. char .. "$")
    end

    return result
end

-------------------------------------------------------------------------------
-- Print strings to stdout without new line in contrast to default print.
-------------------------------------------------------------------------------
function wx.print(text)
    io.stdout:write(text)
    io.stdout:flush()
end

-------------------------------------------------------------------------------
-- Functions to handle --enable/--disable features
-------------------------------------------------------------------------------
wx.feature = {}

function wx.feature.add(name, description, ison, enable, platforms)
    if not name or not description then
        error("Missing required parameters.")
    end

    local default_status = "yes"

    if ison == false then
        default_status="no"
    end

    local trigger="enable-"..name

    if enable == false then
        trigger = "disable-"..name
    end

    newoption
    {
        ["trigger"]     = trigger,
        ["description"] = description,
        ["platforms"] = platforms,
        ["default"] = default_status,
    }
end

--[[---------------------------------------------------------------------------
    To facilitate the action taken if a wxWidgets feature
    is enabled or disabled (--enable-FEATURE, --disable-FEATURE).
    @param name Name of the feature without enable or disable prepended.
    @param active String of lua code executed if the feature is enabled.
    @param inactive String of lua code executed if the feature is disabled.
    @return true if feature enabled, false if disabled.
-----------------------------------------------------------------------------]]
function wx.feature.eval(name, active, inactive)
    local default -- The default value of the feature (yes=enabled or no=disabled)
    local platforms -- The platforms where the feature is supported

    -- Check how the feature was defined (enable or disable)
    local enabled = type(premake.option.get("enable-"..name)) == "table"
    local disabled = type(premake.option.get("disable-"..name)) == "table"

    -- Retreive the feature parameters depending on how it was defined
    if enabled then
        default = premake.option.get("enable-"..name).default
        platforms = premake.option.get("enable-"..name).platforms
    elseif disabled then
        default = premake.option.get("disable-"..name).default
        platforms = premake.option.get("disable-"..name).platforms
    end

    --[[
        If the feature is only applicable to certain platforms
        it shouldn't be processed.
    --]]
    if platforms then
        if not table.contains(platforms, os.get()) then
            return false
        end
    end

    if not enabled and not disabled then
        error(string.format("Invalid feature '%s' specified.", name))
    end

    -- Set current value of the feature assigned on the command line
    enabled = _OPTIONS["enable-"..name]
    disabled = _OPTIONS["disable-"..name]

    if (default == "yes" or enabled) and enabled ~= "no" and not disabled then
        if type(active) == "string" then
            assert(
                loadstring(active),
                string.format(
                    "Syntax error on active code for '%s' feature",
                    name
                )
            )()
        end
        return true
    else
        if type(inactive) == "string" then
            assert(
                loadstring(inactive),
                string.format(
                    "Syntax error on inactive code for '%s' feature",
                    name
                )
            )()
        end
        return false
    end
end

--[[---------------------------------------------------------------------------
    Function that should be used on check.lua when a feature can be
    enabled after a series of checks.
    @param name Name of the feature without disable- or enable- prefix
-----------------------------------------------------------------------------]]
function wx.feature.enable(enabled)
    local value = "yes"

    if enabled == false then
        value = "no"
    end

    if premake.option.get("enable-"..name) then
        premake.option.get("enable-"..name).default = value
    elseif premake.option.get("disable-"..name) then
        premake.option.get("disable-"..name).default = value
    else
        error(string.format("Invalid feature '%s' specified.", name))
    end

    if value == "yes" then
        _OPTIONS["enable-"..name] = "yes"
        _OPTIONS["disable-"..name] = nil
    else
        _OPTIONS["enable-"..name] = nil
        _OPTIONS["disable-"..name] = "yes"
    end
end
