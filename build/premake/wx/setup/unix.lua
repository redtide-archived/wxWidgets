-- ============================================================================
-- Name:        wx/setup/unix.lua
-- Purpose:     Functions for unix based platforms
-- Author:      Jefferson González
-- Modified by:
-- Created:     2013/01/05
-- RCS-ID:      $Id$
-- Copyright:   (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

wx.unix = {}

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
-- Mainly to configure third party libraries like jpeg, png, tiff, etc...
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
