-- ============================================================================
-- Name:        wx-config.lua
-- Purpose:     Premake4 wx-config command
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/16
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <widgets.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
newoption
{
    trigger     = "wxcompiler",
    description = "Compiler to use",
    allowed     =
    { 
                { "gcc", "GNU Compiler" },
                { "vc",  "MS Visual C" }
    }
}
newoption
{
    trigger     = "wxmedia",
    description = "Whether to use wxMediaCtrl in wxMedia library",
    allowed     =
    {
                { "yes", "Don't use wxMedia library" },
                { "no",  "Use wxMedia library" }
    }
}
newoption
{
    trigger     = "wxmonolithic",
    description = "Whether to use wxWidgets as monolithic DLL (MSW only)",
}
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
    trigger     = "wxstatic",
    description = "Whether to use static or dynamic library build",
    allowed     =
    {
                { "yes", "Static build" },
                { "no",  "DLL build" }
    }
}
newoption
{
    trigger     = "wxunicode",
    description = "Whether to use Unicode or ANSI build (wxWidgets 2.8 only)",
    allowed     =
    {
                { "yes", "Unicode build" },
                { "no",  "ANSI build" }
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
-- Common globals initialization
-----------------------------------------------------------------------------
wx = {}

function wx.GetCompilerName() return _OPTIONS.wxcompiler   end
function wx.IsMonolithic()    return _OPTIONS.wxmonolithic end
function wx.GetLibDir()       return _OPTIONS.wxroot       end
function wx.IsStatic()        return _OPTIONS.wxstatic     end
function wx.IsUnicode()       return _OPTIONS.wxunicode    end
function wx.UseMediaCtrl()    return _OPTIONS.wxmedia      end
function wx.Version()         return _OPTIONS.wxversion    end

wx.GetCompilerName()      = 
wx.IsMonolithic()    = 
wxRoot          = 
wxStatic        = _OPTIONS.wxstatic
wxUnicode       = _OPTIONS.wxunicode
wxUseMediaCtrl  = _OPTIONS.wxmedia
wxVersion       = _OPTIONS.wxversion
-----------------------------------------------------------------------------
-- FIXME the 'allowed' parameter seems to work only on wxversion
-- Version : one of '2.4', '2.5', '2.6', '2.7', '2.8', '2.9'.
-- Default to '2.9'
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
-- wx.GetCompilerName() : compiler used to compile windows libraries ( "vc" or "gcc" )
-----------------------------------------------------------------------------
if not os.is("windows") then
    wxCompiler = "gcc"
    wx.IsMonolithic() = "no"
elseif wxCompiler ~= "gcc" and wxCompiler ~= "vc" then
    error( wxCompiler .. ": invalid compiler.")
end
-----------------------------------------------------------------------------
-- wxMedia/wxUseMediaCtrl
-----------------------------------------------------------------------------
if wxUseMediaCtrl == "yes" then
    wxUseMediaCtrl = true
elseif wxUseMediaCtrl == "no" then
    wxUseMediaCtrl = false
else
    error( wxUseMediaCtrl .. ": wrong parameter, use only yes or no." )
end
-----------------------------------------------------------------------------
-- wx.IsMonolithic()
-----------------------------------------------------------------------------
if wx.IsMonolithic() ~= "yes" and wx.IsMonolithic() ~= "no" then
    error( wx.IsMonolithic() .. ": wrong parameter, use only yes or no." )
elseif wx.IsMonolithic() == "no" then
    wx.IsMonolithic() = false
else
    wx.IsMonolithic() = true
end
-----------------------------------------------------------------------------
-- wxRoot : Path to wxWidgets root folder.
--         Can be left empty if WXWIN is defined or if wx-config is accessible.
--         Useful in case more than a configuration is present in the system
--         e.g. wx 2.8 installed and a self built 2.9 one is used.
-----------------------------------------------------------------------------
if os.getenv('WXWIN') and not wxRoot then
    wxRoot = os.getenv('WXWIN')
elseif not os.isdir(wxRoot) then
    error(wxRoot..": not a valid directory.")
end
-----------------------------------------------------------------------------
-- wxStatic : indicates how wx is to be linked. Values are either
--             "yes" for static linking or "no" for shared linking.
--             Default to "no"
-----------------------------------------------------------------------------
if wxStatic ~= "yes" and wxStatic ~= "no" then
    error( wxStatic .. ": wrong parameter, use only yes or no." )
end
-----------------------------------------------------------------------------
-- wxUnicode : use "yes" for Unicode or "no" for ANSI version.
--             ANSI version only available up to 2.8
--             Default to "yes"
-----------------------------------------------------------------------------
if wxUnicode ~= "yes" and wxUnicode ~= "no" then
    error( wxUnicode .. ": wrong parameter, use only yes or no." )
elseif wxUnicode == "no" and wx.Version() < "2.9" then
    wxUseUnicode    = false
    wxUnicodeSign   = ""
elseif not os.is("windows") and wx.Version() > "2.8" then
    wxDebugSuffix   = ""
    wxUseUnicode    = true
else
    wxUseUnicode    = true
end

if os.is("windows") then
    wxPrefix  = "wx"
    wxToolkit = "msw"
elseif os.is("macosx") then
    wxToolkit = "mac"
else -- linux or bsd
    wxToolkit = "gtk2"
end
-----------------------------------------------------------------------------
-- The wxConfig the parameters are:
--         Debug   : "yes" use debug version of wxwidgets. Default to "no"
--         Host    : 
--         Universal : use universal configuration. Default to "no"
--         Libs    : a list of wx libraries that you want to link with.
--                     eg: "aui,media,html"
--                     Default to ""; base is implicit
-----------------------------------------------------------------------------
function wxConfig( options )

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

    wxConfigPrivate(options.Debug     or "",
                    options.Host      or "",
                    options.Universal or "",
                    options.Libs      or "")
end

function wxConfigPrivate( wxDebug, wxHost, wxUniversal, wxLibs )

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
    function wxConfigMSW(wxCompiler)
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
