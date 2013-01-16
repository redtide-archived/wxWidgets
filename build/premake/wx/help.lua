--[[===========================================================================
    Name:        wx/help.lua
    Purpose:     wx help
    Author:      Andrea Zanellato
    Modified by:
    Created:     2013/01/16
    RCS-ID:      $Id$
    Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
    Licence:     wxWindows licence
  ===========================================================================]]

function wx.showhelp()

    local help = {
"wxWidgets configuration to adapt to many kinds of systems.",
"",
"Usage: wx-config [OPTION]... [VAR=VALUE]... [ACTION]",
"",
"To assign environment variables (e.g., CC, CFLAGS...), specify them as",
"VAR=VALUE.  See below for descriptions of some of the useful variables.",
"",
"Defaults for the options are specified in brackets.",
"",
"Configuration:",
"  -h, --help              display this help and exit",
"      --help=short        display options specific to this package",
"      --help=recursive    display the short help of all the included packages",
"  -V, --version           display version information and exit",
"  -q, --quiet, --silent   do not print `checking ...' messages",
"      --cache-file=FILE   cache test results in FILE [disabled]",
"  -C, --config-cache      alias for `--cache-file=config.cache'",
"  -n, --no-create         do not create output files",
"      --srcdir=DIR        find the sources in DIR [configure dir or `..']",
"",
"Installation directories:",
"  --prefix=PREFIX         install architecture-independent files in PREFIX",
"",
"  --exec-prefix=EPREFIX   install architecture-dependent files in EPREFIX",
"                          [PREFIX]",
"",
"By default, `wx-config install' will install all the files in",
"`/usr/local/bin', `/usr/local/lib' etc.  You can specify",
"an installation prefix other than `/usr/local' using `--prefix',",
"for instance `--prefix=$HOME'.",
"",
"For better control, use the options below.",
"",
"Fine tuning of the installation directories:",
"  --bindir=DIR            user executables [EPREFIX/bin]",
"  --sbindir=DIR           system admin executables [EPREFIX/sbin]",
"  --libexecdir=DIR        program executables [EPREFIX/libexec]",
"  --sysconfdir=DIR        read-only single-machine data [PREFIX/etc]",
"  --sharedstatedir=DIR    modifiable architecture-independent data [PREFIX/com]",
"  --localstatedir=DIR     modifiable single-machine data [PREFIX/var]",
"  --libdir=DIR            object code libraries [EPREFIX/lib]",
"  --includedir=DIR        C header files [PREFIX/include]",
"  --oldincludedir=DIR     C header files for non-gcc [/usr/include]",
"  --datarootdir=DIR       read-only arch.-independent data root [PREFIX/share]",
"  --datadir=DIR           read-only architecture-independent data [DATAROOTDIR]",
"  --infodir=DIR           info documentation [DATAROOTDIR/info]",
"  --localedir=DIR         locale-dependent data [DATAROOTDIR/locale]",
"  --mandir=DIR            man documentation [DATAROOTDIR/man]",
"  --docdir=DIR            documentation root [DATAROOTDIR/doc/wxwidgets]",
"  --htmldir=DIR           html documentation [DOCDIR]",
"  --dvidir=DIR            dvi documentation [DOCDIR]",
"  --pdfdir=DIR            pdf documentation [DOCDIR]",
"  --psdir=DIR             ps documentation [DOCDIR]"}

    for index,line in pairs( help ) do print( line ) end
end
