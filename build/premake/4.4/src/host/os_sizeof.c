/**
 * \file   os_chdir.c
 * \brief  Change the current working directory.
 * \author Copyright (c) 2002-2008 Jason Perkins and the Premake project
 */

#include "premake.h"
#include <string.h>

int os_sizeof(lua_State* L)
{
    const char* type = luaL_checkstring(L, 1);

    if(strcmp(type, "char") == 0)
    {
        lua_pushnumber(L, sizeof(char));
        return 1;
    }
    else if(strcmp(type, "short") == 0)
    {
        lua_pushnumber(L, sizeof(short));
        return 1;
    }
    else if(strcmp(type, "short int") == 0)
    {
        lua_pushnumber(L, sizeof(short int));
        return 1;
    }
    else if(strcmp(type, "signed short") == 0)
    {
        lua_pushnumber(L, sizeof(signed short));
        return 1;
    }
    else if(strcmp(type, "signed short int") == 0)
    {
        lua_pushnumber(L, sizeof(signed short int));
        return 1;
    }
    else if(strcmp(type, "int") == 0)
    {
        lua_pushnumber(L, sizeof(int));
        return 1;
    }
    else if(strcmp(type, "signed int") == 0)
    {
        lua_pushnumber(L, sizeof(signed int));
        return 1;
    }
    else if(strcmp(type, "long") == 0)
    {
        lua_pushnumber(L, sizeof(long));
        return 1;
    }
    else if(strcmp(type, "long int") == 0)
    {
        lua_pushnumber(L, sizeof(long int));
        return 1;
    }
    else if(strcmp(type, "signed long") == 0)
    {
        lua_pushnumber(L, sizeof(signed long));
        return 1;
    }
    else if(strcmp(type, "signed long int") == 0)
    {
        lua_pushnumber(L, sizeof(signed long int));
        return 1;
    }
    else if(strcmp(type, "long long") == 0)
    {
        lua_pushnumber(L, sizeof(long long));
        return 1;
    }
    else if(strcmp(type, "long long int") == 0)
    {
        lua_pushnumber(L, sizeof(long long int));
        return 1;
    }
    else if(strcmp(type, "signed long long") == 0)
    {
        lua_pushnumber(L, sizeof(signed long long));
        return 1;
    }
    else if(strcmp(type, "signed long long int") == 0)
    {
        lua_pushnumber(L, sizeof(signed long long int));
        return 1;
    }
    else if(strcmp(type, "float") == 0)
    {
        lua_pushnumber(L, sizeof(float));
        return 1;
    }
    else if(strcmp(type, "double") == 0)
    {
        lua_pushnumber(L, sizeof(double));
        return 1;
    }
    else if(strcmp(type, "long double") == 0)
    {
        lua_pushnumber(L, sizeof(long double));
        return 1;
    }
    else
    {
        lua_pushnil(L);
		lua_pushfstring(L, "undefined type '%s'", type);
		return 2;
    }
}


