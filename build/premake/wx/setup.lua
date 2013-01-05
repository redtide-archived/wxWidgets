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
wx = {}
-- ----------------------------------------------------------------------------
-- Store functions for unix based platforms
-- ----------------------------------------------------------------------------
wx.unix = {}
-- ----------------------------------------------------------------------------
-- TODO: Temporary options
-- ----------------------------------------------------------------------------
wx.version                      = "2.9.5"
wx.compiler                     = ""
wx.includedir                   = ""
wx.libdir                       = ""
-- ----------------------------------------------------------------------------
-- Thirdpary includes and libraries path
-- ----------------------------------------------------------------------------
wx.includes = {}

wx.includes.libpng = nil
wx.includes.libjpeg = nil
wx.includes.libtiff = nil
wx.includes.regex = nil
wx.includes.zlib = nil
wx.includes.expat = nil

wx.libdirs = {}

wx.libdirs.libpng = nil
wx.libdirs.libjpeg = nil
wx.libdirs.libtiff = nil
wx.libdirs.regex = nil
wx.libdirs.zlib = nil
wx.libdirs.expat = nil
-- ----------------------------------------------------------------------------
-- Global compile options
-- ----------------------------------------------------------------------------
wx.shared                       = true
wx.stl                          = false
wx.std_containers               = false
wx.std_iostreams                = false
wx.std_string                   = false
wx.std_string_conv_in_wxstring  = false
wx.unicode                      = true
wx.extended_rtti                = false
wx.optimize                     = true
wx.profile                      = false
wx.no_rtti                      = false
wx.no_exceptions                = false
wx.permissive                   = false
wx.no_deps                      = false
wx.vararg_macros                = true
wx.compat26                     = false
wx.compat28                     = true
wx.rpath                        = true
wx.objc_uniquifying             = false
wx.visibility                   = false
wx.tls                          = false
-- ----------------------------------------------------------------------------
-- Global build options
-- ----------------------------------------------------------------------------
wx.gui                          = true
wx.monolithic                   = false
wx.plugins                      = false
wx.subdirs                      = false
wx.flavour                      = ""
wx.all_features                 = true
-- ----------------------------------------------------------------------------
-- External libraries
-- ----------------------------------------------------------------------------
wx.libpng                       = 0
wx.libjpeg                      = 0
wx.libtiff                      = 0
wx.libxpm                       = 0
wx.libiconv                     = 0
wx.libmspack                    = 0
wx.libnotify                    = 0
wx.opengl                       = 0

wx.dmalloc                      = 0
wx.sdl                          = 0
wx.regex                        = 0
wx.zlib                         = 0
wx.expat                        = 0
-- ----------------------------------------------------------------------------
-- Debugging options
-- ----------------------------------------------------------------------------
wx.debug                        = false
wx.debug_flag                   = false
wx.debug_gdb                    = false
wx.debug_info                   = false
-- ----------------------------------------------------------------------------
-- Optional non GUI features
-- ----------------------------------------------------------------------------
wx.intl                         = false
wx.xlocale                      = false
wx.config                       = false
wx.protocols                    = false
wx.ftp                          = false
wx.http                         = false
wx.fileproto                    = false
wx.sockets                      = false
wx.ipv6                         = false
wx.dataobj                      = false
wx.baseevtloop                  = false
wx.epollloop                    = false
wx.selectloop                   = false

-- Please keep the settings below in alphabetical order
wx.any                          = false
wx.apple_ieee                   = false
wx.arcstream                    = false
wx.base64                       = false
wx.backtrace                    = false
wx.catch_segvs                  = false
wx.cmdline                      = false
wx.datetime                     = false
wx.debugreport                  = false
wx.dialupman                    = false
wx.dynlib                       = false
wx.dynamicloader                = false
wx.exceptions                   = false
wx.ffile                        = false
wx.file                         = false
wx.filehistory                  = false
wx.filesystem                   = false
wx.fontenum                     = false
wx.fontmap                      = false
wx.fs_archive                   = false
wx.fs_inet                      = false
wx.fs_zip                       = false
wx.fswatcher                    = false
wx.geometry                     = false
wx.log                          = false
wx.longlong                     = false
wx.mimetype                     = false
wx.printfposparam               = false
wx.snglinst                     = false
wx.sound                        = false
wx.stdpaths                     = false
wx.stopwatch                    = false
wx.streams                      = false
wx.sysoptions                   = false
wx.tarstream                    = false
wx.textbuf                      = false
wx.textfile                     = false
wx.timer                        = false
wx.variant                      = false
wx.zipstream                    = false

-- URL-related classes
wx.url                          = false
wx.protocol                     = false
wx.protocol_http                = false
wx.protocol_ftp                 = false
wx.protocol_file                = false

wx.threads                      = false
-- ----------------------------------------------------------------------------
-- Optional "big" GUI features
-- ----------------------------------------------------------------------------
wx.docview                      = false
wx.help                         = false
wx.html                         = false
wx.htmlhelp                     = false
wx.xrc                          = false
wx.aui                          = false
wx.propgrid                     = false
wx.ribbon                       = false
wx.stc                          = false
wx.constraints                  = false
wx.loggui                       = false
wx.logwin                       = false
wx.logdialog                    = false
wx.mdi                          = false
wx.mdidoc                       = false
wx.mediactrl                    = false
wx.richtext                     = false
wx.postscript                   = false
wx.printarch                    = false
wx.svg                          = false
wx.webkit                       = false
wx.webview                      = false

-- wxDC is implemented in terms of wxGraphicsContext in wxOSX so the latter
-- can't be disabled, don't even provide an option to do it
wx.graphics_ctx                 = false
-- ----------------------------------------------------------------------------
-- IPC &c
-- ----------------------------------------------------------------------------
wx.clipboard                    = false
wx.dnd                          = false
-- ----------------------------------------------------------------------------
-- Optional GUI controls
-- ----------------------------------------------------------------------------
-- Even with --disable-controls, some may be enabled by an explicit
-- --enable-<control> later on the command line
-- but by default all will be disabled
wx.controls                     = false

-- Features affecting multiple controls
wx.markup                       = false

-- Please keep the settings below in alphabetical order
wx.accel                        = false
wx.animatectrl                  = false
wx.artstd                       = false
wx.arttango                     = false
wx.bannerwindow                 = false
wx.bmpbutton                    = false
wx.bmpcombobox                  = false
wx.button                       = false
wx.calendar                     = false
wx.caret                        = false
wx.checkbox                     = false
wx.checklst                     = false
wx.choice                       = false
wx.choicebook                   = false
wx.collpane                     = false
wx.colourpicker                 = false
wx.combobox                     = false
wx.comboctrl                    = false
wx.commandlinkbutton            = false
wx.dataviewctrl                 = false
wx.datepick                     = false
wx.detect_sm                    = false
wx.dirpicker                    = false
wx.display                      = false
wx.editablebox                  = false
wx.filectrl                     = false
wx.filepicker                   = false
wx.fontpicker                   = false
wx.gauge                        = false
wx.grid                         = false
wx.headerctrl                   = false
wx.hyperlink                    = false
wx.imaglist                     = false
wx.infobar                      = false
wx.listbook                     = false
wx.listbox                      = false
wx.listctrl                     = false
wx.notebook                     = false
wx.notifmsg                     = false
wx.odcombobox                   = false
wx.popupwin                     = false
wx.radiobox                     = false
wx.radiobtn                     = false
wx.richmsgdlg                   = false
wx.richtooltip                  = false
wx.rearrangectrl                = false
wx.sash                         = false
wx.scrollbar                    = false
wx.searchctrl                   = false
wx.slider                       = false
wx.spinbtn                      = false
wx.spinctrl                     = false
wx.splitter                     = false
wx.statbmp                      = false
wx.statbox                      = false
wx.statline                     = false
wx.stattext                     = false
wx.statusbar                    = false
wx.taskbaricon                  = false
wx.tbarnative                   = false
wx.textctrl                     = false
wx.timepick                     = false
wx.tipwindow                    = false
wx.togglebtn                    = false
wx.toolbar                      = false
wx.toolbook                     = false
wx.treebook                     = false
wx.treectrl                     = false
wx.treelist                     = false
-- ----------------------------------------------------------------------------
-- Common dialogs
-- ----------------------------------------------------------------------------
wx.commondlg                    = false
wx.aboutdlg                     = false
wx.choicedlg                    = false
wx.coldlg                       = false
wx.dirdlg                       = false
wx.filedlg                      = false
wx.finddlg                      = false
wx.fontdlg                      = false
wx.msgdlg                       = false
wx.numberdlg                    = false
wx.splash                       = false
wx.textdlg                      = false
wx.tipdlg                       = false
wx.progressdlg                  = false
wx.wizarddlg                    = false
-- ----------------------------------------------------------------------------
-- Misc GUI options
-- ----------------------------------------------------------------------------
wx.menus                        = false
wx.miniframe                    = false
wx.tooltips                     = false
wx.splines                      = false
wx.mousewheel                   = false
wx.validators                   = false
wx.busyinfo                     = false
wx.hotkey                       = false
wx.joystick                     = false
wx.metafiles                    = false
wx.dragimage                    = false
wx.accessibility                = false
wx.uiactionsim                  = false
wx.dctransform                  = false
wx.webviewwebkit                = false
-- ----------------------------------------------------------------------------
-- Support for image formats that do not rely on external library
-- ----------------------------------------------------------------------------
wx.palette                      = false
wx.image                        = false
wx.gif                          = false
wx.pcx                          = false
wx.tga                          = false
wx.iff                          = false
wx.pnm                          = false
wx.xpm                          = false
wx.ico_cur                      = false

-------------------------------------------------------------------------------
-- This one is not really MSW-specific but it exists mainly to be turned off
-- under MSW, it should be off by default on the other platforms
-------------------------------------------------------------------------------
wx.autoidman                    = false

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

-------------------------------------------------------------------------------
-- Search for a header on standard unix locations and returns the path found.
-- TODO: Add macosx standard paths.
-------------------------------------------------------------------------------
function wx.unix.findheader(header)
    -- directories used to search for headers
    local directories = {
        "/usr/include",
        "/usr/local/include",
    }
    
    local path
    
    wx.print("Searching for header " .. header .. "... ")
    
    for i,dir in pairs(directories) do
        local result = wx.execute("find " .. dir .. " -print0 | grep -FzZ " .. "\"".. header .."\"")
        
        if #result > 0 then
            local headervalid = string.find(result[1], "/" .. header)
            if headervalid then
                path = string.gsub(result[1], "/" .. header, "")
                if path == dir then
                    path = "standard"
                end
            end
        end
    end
    
    if path ~= nil then
        wx.print("found")
    else
        wx.print("not found")
    end
        
    wx.print("\n")
        
    return path
end

-------------------------------------------------------------------------------
-- Search for a library on standard unix locations and returns table
-- with static and shared fields that contain the path found for each
-- or nil if was not found.
-- TODO: Add macosx standard paths.
-------------------------------------------------------------------------------
function wx.unix.findlib(library)
    local static, shared
    
    -- directories used to search for libraries
    local directories = {
        "/usr/lib",
        "/usr/local/lib",
    }
    
    library = "lib" .. library
    
    wx.print("Searching for library " .. library .. "... ")
    
    -- search static library
    for i,dir in pairs(directories) do
        local result = wx.execute("find " .. dir .. " -name " .. "\"".. library ..".a\" | grep java -v")
        
        if #result > 0 then
            static = string.gsub(result[1], "/" .. library .. ".a", "")
            if static == dir then
                static = "standard"
            end
            break
        end
    end
    
    -- search shared library
    for i,dir in pairs(directories) do
        local result = wx.execute("find " .. dir .. " -name " .. "\"".. library ..".so\" | grep java -v")
        
        if #result > 0 then
            shared = string.gsub(result[1], "/" .. library .. ".so", "")
            if shared == dir then
                shared = "standard"
            end
            break
        end
    end
    
    if shared or static then
        wx.print("found")
    else
        wx.print("not found")
    end
        
    wx.print("\n")
    
    return {["shared"]=shared, ["static"]=static}
end

-------------------------------------------------------------------------------
-- Checks if a library is installed by using pkg-config and returns true or 
-- false if not installed
-------------------------------------------------------------------------------
function wx.unix.checklib(library, required)
    local exists
    local available = true
    
    wx.print("Checking for " .. library .. "... ")
    exists = os.execute("pkg-config " .. library .. " --exists")
    
    if exists > 0 then
        wx.print(" not found")
        available = false
        
        if required == true then
            wx.print(" (required)\n")
            os.exit(1)
        end
    else
        wx.print(" found")
    end
    
    wx.print("\n")
    
    return available
end

-------------------------------------------------------------------------------
-- Checks with pkg-config if a library of a minimum version given is available
-------------------------------------------------------------------------------
function wx.unix.checklibversion(library, version, required)
    local value, output, available
    
    output = "Checking " .. library .. " >= " .. version .. "..."
    
    for index,line in pairs(wx.execute("pkg-config " .. library .. " --modversion 2> /dev/null")) do
        value = line
        break
    end
    
    if type(value) ~= "nil" and value >= version then
        output = output .. " found"
        available = true
    else
        output = output .. " not found"
        if required == true then
            print("error: " .. output)
            os.exit(1)
        end
        available = false
    end
    
    print(output)
    
    return available
end

-------------------------------------------------------------------------------
-- Mainly to configure third party libraries.
-------------------------------------------------------------------------------
function wx.unix.configurelib(library, header_file, library_file, dependencies)
    local with_library = "with-" .. library
    
    -- Check dependencies
    if dependencies and #dependencies > 0 then
        for i,d in pairs(dependencies) do
            if _OPTIONS["with-"..d] == "no" then
                return nil
            end
        end
    end
    
    -- Check library
    if not _OPTIONS[with_library] or _OPTIONS[with_library] ~= "no" then
        local header = wx.unix.findheader(header_file)
        local libdir = wx.unix.findlib(library_file)
        
        -- Forced builtin or not found
        if _OPTIONS[with_library] == "builtin" or not header then
            _OPTIONS[with_library] = "builtin"
        -- Non standard path found
        elseif header and header ~= "standard" then
            _OPTIONS[with_library] = "yes"
            wx.includes[library] = header
            
            if libdir.static and libdir.static ~= "standard" then
                wx.libdirs[library] = libdir.static
            elseif libdir.shared and libdir.shared ~= "standard" then
                wx.libdirs[library] = libdir.shared
            end
        -- Standard path found
        elseif header then
            _OPTIONS[with_library] = "yes"
        end
    end
end
