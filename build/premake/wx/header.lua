-- ============================================================================
-- Name:        wx/header.lua
-- Purpose:     Class to do basic manipulation of header files #define
-- Author:      Jefferson González
-- Modified by:
-- Created:     2013/01/05
-- RCS-ID:      $Id$
-- Copyright:   (c) Jefferson González <jgmdev@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
--[[
    Example usage:
    
        header = wx.header("setup.h")
        value = myheader:getvalue("wxUSE_DEBUG_CONTEXT")
        header:setvalue("wxUSE_DEBUG_CONTEXT", "1")
        header:undefine("wxUSE_DEBUG_CONTEXT")
        header:define("wxUSE_DEBUG_CONTEXT")
        header:comment("#define", "wxUSE_DEBUG_CONTEXT")
        header:ucomment("#define", "wxUSE_DEBUG_CONTEXT", "1")
        header:replace("#define", "wxUSE_DEBUG_CONTEXT", "#define wxBLAH '1'")
        header:setfile("another.h")
        
    Note:
    
        Does not retreives the value of macros like:
            #define NAME my space seperated value
--]]

wx.header = {}

--[[
    Constructor
--]]
local mt = {}
function mt.__call(this, file)
    if file then
        this:setfile(file)
    end
    
    return this
end
setmetatable(wx.header, mt)

--[[
    Gets the full path of current file
--]]
function wx.header:getfile()
    return self.filename
end

--[[
    Assings a new file to the object
--]]
function wx.header:setfile(file)
    if self.file then
        self.file:close()
    end
    
    self.filename = file
    
    self.file = assert(
        io.open(file),
        "Failed to open header file."
    )
end

--[[
    Gets the value of a macro definition
--]]
function wx.header:getvalue(macro)
    local line = ""
    local currentword = ""
    local definefound = false
    local macronamefound = false
    
    self.file:seek("set")
    
    while line do
        line = self.file:read()
        line = line .. "\n" --Append new line to know where it ends
        
        if line and #line > 0 then
            local count = #line
            for i=1, count do
                local c = string.sub(line, i, i)
                
                if c ~= " " and c ~= "\n" and c ~= "\t" and c ~= "\r" and C ~= "\0" then
                    currentword = currentword .. c
                elseif currentword ~= "" and currentword ~= "#" then
                    if currentword == "#define" then
                        definefound = true
                    elseif definefound and not macronamefound then
                        if currentword == macro then
                            macronamefound = true
                        else
                            definefound = false
                        end
                    elseif definefound and macronamefound then
                        return currentword
                    end
                    
                    currentword = ""
                end
            end
        end
    end
end

--[[
    Sets a new value for a given macro
--]]
function wx.header:setvalue(macro, value)
    self:replace(
        "#define", 
        macro, 
        "#define " .. macro .. " " .. value
    )
end

--[[
    Undefines a given macro using #undef
--]]
function wx.header:undefine(macro)
    self:replace(
        "#define", 
        macro, 
        "#undef " .. macro
    )
end

--[[
    Redefines an undefined macro
--]]
function wx.header:define(macro, value)
    self:replace(
        "#undef", 
        macro, 
        "#define " .. macro .. " " .. value
    )
end

--[[
    Comments out a macro declaration
--]]
function wx.header:comment(macrotype, macroname)
    self:replace(
        macrotype, 
        macroname, 
        "/* " .. macrotype .. " " .. macroname  .. " */"
    )
end

--[[
    Uncomment a macro declaration
--]]
function wx.header:uncomment(macrotype, macroname, value)
    self:replace(
        macrotype, 
        macroname, 
        macrotype .. " " .. macroname  .. " " .. value
    )
end

--[[
    Replaces a whole line that containes a macro with a new value
--]]
function wx.header:replace(macrotype, macroname, value)
    local line = ""
    local lines = {}
    local currentword = ""
    local macrotypefound = false
    
    self.file:seek("set")
    
    local linenum = 1
    
    while line do
        line = self.file:read()
        
        if line then
            line = line .. "\n" --Append new line to know where it ends
            lines[linenum] = line
            
            local count = #line
            for i=1, count do
                local c = string.sub(line, i, i)
                
                if c ~= " " and c ~= "\n" and c ~= "\t" and c ~= "\r" and C ~= "\0" then
                    currentword = currentword .. c
                elseif currentword ~= "" and currentword ~= "#" then
                    if currentword == macrotype then
                        macrotypefound = true
                    elseif macrotypefound then
                        if currentword == macroname then
                            
                            -- assign new value to macro
                            lines[linenum] = value .. "\n"
                            
                            -- copy rest of the file
                            while line do
                                line = self.file:read()
                                linenum = linenum + 1
                                
                                if line then
                                    line = line .. "\n"
                                    lines[linenum] = line
                                end
                            end
                            
                            -- write new changes
                            self.file:close()
                            self.file = io.open(self.filename, "w")
                            
                            for i,v in pairs(lines) do
                                self.file:write(lines[i])
                            end
                            
                            -- reload file
                            self:setfile(self.filename)
                            
                            return true
                        else
                            macrotypefound = false
                        end
                    end
                    
                    currentword = ""
                end
            end
        end
        
        linenum = linenum + 1
    end
    
    return nil
end
