/**
 * \file   os_host.c
 * \brief  Retrieve the current working directory.
 * \author Copyright (c) 2013 Jefferson González and the Premake project
 */

#include "premake.h"

int os_host(lua_State* L)
{
	lua_pushstring(L, PLATFORM_STRING);
	return 1;
}


