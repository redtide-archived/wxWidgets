--[[===========================================================================
    Name:        wx/config/help.lua
    Purpose:     wx-config help
    Author:      Andrea Zanellato
    Modified by:
    Created:     2013/01/16
    RCS-ID:      $Id$
    Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
    Licence:     wxWindows licence
  ===========================================================================]]

function wx.config.showhelp()

    local help = {
"",
" wx-config [--prefix[=DIR]] [--exec-prefix[=DIR]] [--release] [--version-full]",
"           [--list] [--selected-config] [--host=HOST] [--toolkit=TOOLKIT]",
"           [--universal[=yes|no]] [--unicode[=yes|no]] [--static[=yes|no]]",
"           [--debug[=yes|no]] [--version[=VERSION]] [--basename] [--cc] [--cxx]",
"           [--cppflags [base]] [--cxxflags [base]] [--cflags]",
"           [--rescomp] [--linkdeps] [--ld] [--utility=UTIL]",
"           [--libs [LIBS...]] [--optional-libs [LIBS...]]",
"",
"    wx-config returns information about the wxWidgets libraries available on",
"  your system.  It may be used to retrieve the information required to build",
"  applications using these libraries using --cppflags, --cxxflags, --cflags,",
"  and --libs options. And you may query the properties of this configuration",
"  using --query-{host,toolkit,widgetset,chartype,debugtype,version,linkage}.",
"",
"    NOTE:    Usage of --debug and --query-debugtype are only relevant if you",
"  have any  versions prior to 2.9 installed  and use the --version option to",
"  select an earlier version.",
"",
"    If multiple builds of wxWidgets  are available,  you can use the options",
"  --prefix, --host, --toolkit, --unicode, --static, --universal or --version",
"  to select from them.  The  --selected-config  option shows the name of the",
"  current configuration and --list  shows available alternatives which match",
"  specified criteria.  The  --utility  option returns the correct version of",
"  UTIL to use with the selected build.  The  --linkdeps  option returns only",
"  static libraries for your makefile link rule dependencies.",
"",
"    The LIBS arguments (comma or space separated) may be used to specify the",
"  wxWidgets libraries that  you wish to use. The \"std\" label may be used  to",
"  import all libraries that would be used by default if none were  specified",
"  explicitly, e.g. wx-config --libs core,base. The \"all\" label may  be  used",
"  to  import  all libraries that have been compiled which are shown  in  the",
"  list  below.  The  --optional-libs parameter should be followed by  a list",
"  of  libs that should be linked to, but only if they are available.",
"",
"  Available libraries in this build are:"}

    for index,line in pairs( help ) do print( line ) end

    -- @todo print library list here
end
