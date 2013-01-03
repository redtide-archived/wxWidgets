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

cd build

# Build premake
if [ ! -e "premake/$platform/bin/release/premake4" ]; then
    make CONFIG=Release -C./premake/$platform
fi

./premake/$platform/bin/release/premake4 --file=./premake/solution.lua $@

exit 0
