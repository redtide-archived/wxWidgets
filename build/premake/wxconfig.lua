-- ============================================================================
-- Name:        wx-config.lua
-- Purpose:     Premake4 wx-config command
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/16
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
newoption
{
    trigger     = "wxroot",
    value       = "PATH",
    description =
    {
                  "Path to wxwidgets root folder, by default, WXWIN envvar",
                  "will be used or wx-config found in path on POSIX"
    }
}
newoption
{
    trigger     = "wxversion",
    description = "wxWidgets version to use",
    allowed     =
    {
                { "2.9", "wxWidgets 2.9" },
                { "3.0", "wxWidgets 3.0" },
                { "3.1", "wxWidgets 3.1" },
                { "3.2", "wxWidgets 3.2" }
    }
}
-----------------------------------------------------------------------------
-- wx.compiler : compiler used to compile windows libraries ( "vc" or "gcc" )
-----------------------------------------------------------------------------
if not os.is("windows") then
    wx.compiler   = "gcc"
    wx.monolithic = false
elseif wx.compiler ~= "gcc" and wx.compiler ~= "vc" then
    error( wx.compiler .. ": invalid compiler.")
end
-----------------------------------------------------------------------------
-- wxRoot : Path to wxWidgets root folder.
--          Can be left empty if WXWIN is defined or if wx-config is accessible.
--          Useful in case more than a configuration is available in the system.
-----------------------------------------------------------------------------
if os.getenv('WXWIN') and not wx.root then
    wx.root = os.getenv('WXWIN')
elseif not os.isdir(wx.root) then
    error(wx.root .. ": not a valid directory.")
end

-----------------------------------------------------------------------------
-- The wx.configure parameters:
--         Debug    : "yes" use debug version of wxWidgets. Default to "no"
--         Host     : 
--         Universal: use universal configuration. Default to "no"
--         Libs     : a list of wx libraries that you want to link with.
--                     eg: "aui,media,html"
--                     Default to ""; base is implicit
-----------------------------------------------------------------------------
function wx.configure( options )

-- Parameter Checks
    local wrongParam        = false
    local allowedWxOptions  = {"Debug", "Host", "Universal", "Libs"}

    for option in pairs(options) do
        if not table.contains(allowedWxOptions, option) then
            print ("unrecognized option '"..option.. "'")
            wrongParam = true
        end
    end
    if wrongParam then
        print("valid options are : '" .. table.concat(allowedWxOptions, "', '").."'")
    end

    wx.configPrivate(options.Debug     or "",
                     options.Host      or "",
                     options.Universal or "",
                     options.Libs      or "")
end

local function wx.configPrivate( wxDebug, wxHost, wxUniversal, wxLibs )

    if wxDebug == "yes" then
        defines {"__WXDEBUG__"}
    else
        flags   {"Optimize"}
    end

    if wxStatic == "yes" then
        flags   { "StaticRuntime" }
    else
        defines { "WXUSINGDLL" }
    end

    -- function to compensate lack of wx-config program on windows
    -- but wait, look at http://sites.google.com/site/wxconfig/ for one !
    function wx.configMSW(wxCompiler)
        -- buildtype is one of "", "u", "d" or "ud"
        local wxBuildType = wxUnicodeSign

        if wxDebug == "yes" then
            wxBuildType = wxBuildType .. wxDebugSuffix
        end

        local wxLibPath = path.join(wxRoot, "lib")
        wxLibPath = path.join(wxLibPath, wxCompiler .. "_" .. iif(wxStatic == 'yes', 'lib', 'dll'))
        -- common defines
        defines{ "__WXMSW__" }

        -- common include path
        includedirs
        {
            path.join(wxRoot, "include"),
            path.join(wxLibPath, "msw" .. wxBuildType)   -- something like "%WXWIN%\lib\vc_lib\mswud" to find "wx/setup.h"
        }

        -- common library path
        libdirs { wxLibPath }

        -- add the libs
        libVersion = string.gsub(wx.Version(), '%.', '') -- remove dot from version
        if wx.IsMonolithic() then
            links { "wxmsw"..libVersion..wxBuildType }
        else
            links { "wxbase"..libVersion..wxBuildType } -- base lib
            if wxLibs ~= "" then
                for i, lib in ipairs(string.explode(wxLibs, ",")) do
                    local libPrefix = 'wxmsw'
                    if lib == "xml" or lib == "net" or lib == "odbc" then
                        libPrefix = 'wxbase'
                    end
                    links { libPrefix..libVersion..wxBuildType..'_'..lib}
                end
            end
            -- link with support libraries
            for i, lib in ipairs({"wxjpeg", "wxpng", "wxzlib", "wxtiff", "wxexpat"}) do
                links { lib..wxDebugSuffix }
            end
            links { "wxregex" .. wxBuildType }
        end
    end

    -- use wx-config to figure out build parameters
    function wxConfigUnix()
        local configCmd = "wx-config" -- this is the wx-config command line
        if wxRoot ~= "" then configCmd = path.join(wxRoot, "wx-config") end

        local function checkYesNo(value, option)
            if value == "" then return "" end
            if value == "yes" or value == "no" then return " --"..option.."="..value end
            error("wx"..option..' can only be "yes", "no" or empty' )
        end

        configCmd = configCmd .. checkYesNo(wxDebug,     "debug")
        configCmd = configCmd .. checkYesNo(wxStatic,    "static")
        configCmd = configCmd .. checkYesNo(wxUnicode,   "unicode")
        configCmd = configCmd .. checkYesNo(wxUniversal, "universal")

        if wxHost ~= "" then configCmd = configCmd .. " --host=" .. wxHost end
--     if wx.Version() ~= "" then configCmd = configCmd .. " --version=" .. wxVersion end

        -- set the parameters to the current configuration
        buildoptions {"`" .. configCmd .." --cxxflags`"}
        linkoptions  {"`" .. configCmd .." --libs " .. wxLibs .. "`"}
    end

    if not os.is("windows") then
        wxConfigUnix()
    else
        wxConfigMSW( wxCompiler )
    end
end
