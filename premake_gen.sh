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

premakedir=$( cd "$( dirname "$0" )" && pwd )/build/premake

# Build premake if needed
if [ ! -e "$premakedir/$platform/bin/release/premake4" ]; then
    make CONFIG=Release -C$premakedir/$platform
fi

# Run premake4 with user's parameters
$premakedir/$platform/bin/release/premake4 --file=$premakedir/wx/main.lua $@

exit 0
