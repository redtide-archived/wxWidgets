#!/bin/sh
# =============================================================================
#   Name:        premake_gen.sh
#   Purpose:     POSIX Premake 4 build and wxWidgets configuration script.
#   Author:      Andrea Zanellato
#   Modified by:
#   Created:     2011/10/22
#   Revision:    $ID$
#   Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
#   Licence:     wxWindows licence
# =============================================================================
# Autodetect OS
unamestr=$(uname)
platform="unknown"
isbsd=`expr "$unamestr" : '.*BSD'`

if ( [ "$isbsd" -gt "0" ] ); then
    platform="bsd"
elif [ "$unamestr" = "Linux" ]; then
    platform="linux"
elif [ "$unamestr" = "Darwin" ]; then
    platform="macosx"
fi

if [ "$platform" = "unknown" ]; then
    echo "Error: Unknown/unsupported platform."
    exit 1
fi

# Build premake if needed
if [ ! -e "build/premake/$platform/bin/release/premake4" ]; then
    make CONFIG=Release -C./build/premake/$platform
fi

# Run premake4 with user's parameters or show help
if [ ! $1 = "--help" ]; then
    ./build/premake/$platform/bin/release/premake4 $@
else
    ./build/premake/$platform/bin/release/premake4 --file=./build/premake/wx/options.lua /help
fi

exit 0
