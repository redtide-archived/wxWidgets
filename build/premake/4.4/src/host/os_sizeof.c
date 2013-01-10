/**
 * \file   os_sizeof.c
 * \brief  Gets the amount of bytes for a given standard c data type.
 * \author Copyright (c) 2013 Jefferson González and the Premake project
 */

#include "premake.h"
#include <string.h>

static int getsizeofwindows(const char* type, int bits);
static int getsizeofunix(const char* type, int bits);
static int getsizeofnative(const char* type);

int os_sizeof(lua_State* L)
{
    const char* type = luaL_checkstring(L, 1);
    int bits = (int) lua_tonumber(L, 2);
    
    /* Get current target platform */
    lua_getglobal(L, "os");
    lua_getfield(L, -1, "get");
    lua_call(L, 0, 1);
    
    const char* current_platform = lua_tostring(L, -1);
    
    if(
        strcmp(type, "char") != 0 &&
        strcmp(type, "short") != 0 &&
        strcmp(type, "int") != 0 &&
        strcmp(type, "long") != 0 &&
        strcmp(type, "long long") != 0 &&
        strcmp(type, "size_t") != 0 &&
        strcmp(type, "pointer") != 0 &&
        strcmp(type, "void") != 0 &&
        strcmp(type, "void*") != 0
    )
    {
        lua_pushnil(L);
        lua_pushfstring(L, "undefined type '%s'", type);
        return 2;
    }
    
    int result = 0;
    
    if(bits != 32 && bits != 64)
    {
        result = getsizeofnative(type);
    }
    else
    {
        if(strcmp(current_platform, "windows") == 0)
            result = getsizeofwindows(type, bits);
            
        else
            result = getsizeofunix(type, bits);
    }
    
    lua_pushnumber(L, result);
    return 1;
}

int getsizeofwindows(const char* type, int bits)
{
	if(strcmp(type, "char") == 0)
        return 1;

    else if(strcmp(type, "short") == 0)
        return 2;
        
    else if(strcmp(type, "int") == 0 || strcmp(type, "long") == 0)
        return 4;

    else if(strcmp(type, "long long") == 0)
        return 8;

    
    if(bits == 32)
    {
        if(strcmp(type, "size_t") == 0)
            return 4;

        else if(strcmp(type, "pointer") == 0 || strcmp(type, "void") == 0 || strcmp(type, "void*") == 0)
            return 4;
    }
    else
    {
        if(strcmp(type, "size_t") == 0)
            return 8;

        else if(strcmp(type, "pointer") == 0 || strcmp(type, "void") == 0 || strcmp(type, "void*") == 0)
            return 8;
    }
    
    return 0;
}

int getsizeofunix(const char* type, int bits)
{
	if(strcmp(type, "char") == 0)
        return 1;
        
    else if(strcmp(type, "short") == 0)
        return 2;
        
    else if(strcmp(type, "int") == 0)
        return 4;
    
    if(bits == 32)
    {
        if(strcmp(type, "long") == 0)
            return 4;
            
        else if(strcmp(type, "long long") == 0)
            return 8;
            
        else if(strcmp(type, "size_t") == 0)
            return 4;
            
        else if(strcmp(type, "pointer") == 0 || strcmp(type, "void") == 0 || strcmp(type, "void*") == 0)
            return 4;
    }
    else
    {
        if(strcmp(type, "long") == 0)
            return 8;
            
        else if(strcmp(type, "long long") == 0)
            return 8;
            
        else if(strcmp(type, "size_t") == 0)
            return 8;
            
        else if(strcmp(type, "pointer") == 0 || strcmp(type, "void") == 0 || strcmp(type, "void*") == 0)
            return 8;
    }
    
    return 0;
}

int getsizeofnative(const char* type)
{
	if(strcmp(type, "char") == 0)
        return sizeof(char);

    else if(strcmp(type, "short") == 0)
        return sizeof(short);

    else if(strcmp(type, "int") == 0)
        return sizeof(int);

    else if(strcmp(type, "long") == 0)
        return sizeof(long);

    else if(strcmp(type, "long long") == 0)
        return sizeof(long long);

    else if(strcmp(type, "size_t") == 0)
        return sizeof(size_t);

    else if(strcmp(type, "pointer") == 0 || strcmp(type, "void") == 0 || strcmp(type, "void*") == 0)
        return sizeof(void*);
    
    return 0;
}
