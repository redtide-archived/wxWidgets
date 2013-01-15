-- ============================================================================
-- Name:        wx/config/options.lua
-- Purpose:     wx-config options
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/12
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
--- @todo The following will be replaced by some wx.config.option.add(option)
--[[===========================================================================
    Installed root
        These options change or query the filesystem root for the operations
        listed below.
    =======================================================================]]--
newoption
{
    trigger     = "prefix",
    value       = "DIR",
    description =
    {
        "Without the optional argument, the current default prefix will be output.",
        "If the argument is supplied,",
        "PREFIX will be searched for matching configs in place of the default.",
        "You may use both forms in the same command."
    }
}
newoption
{
    trigger     = "exec-prefix",
    value       = "DIR",
    description =
    {
        "Similar to --prefix, but acts on the exec-prefix.",
        "If not specified will default to the value of prefix."
    }
}
--[[===========================================================================
    Query options
        These options return information about the wxWidgets default version
        and installed alternatives.
    =======================================================================]]--
newoption
{
    trigger     = "list",
    description =
    {
        "List all configs in prefix and show those that match any",
        "additional feature options given."
    }
}
newoption
{
    trigger     = "release",
    description = "Output the wxWidgets release number."
}
newoption
{
    trigger     = "version-full",
    description = "Output the wxWidgets version number in all its glory."
}
newoption
{
    trigger     = "basename",
    description = "Output the base name of the wxWidgets libraries."
}
newoption
{
    trigger     = "selected-config",
    description =
    {
        "Output the signature of the selected wxWidgets library.",
        "This is a string of the form \"port-unicode-release-version\"."
    }
}
--[[===========================================================================
    Feature options
        These  options select features which determine which wxWidgets
        configuration to use.
    =======================================================================]]--
newoption
{
    trigger     = "chartype",
    description = "Character type"
}
newoption
{
    trigger     = "debugtype",
    description = "Debug type"
}
newoption
{
    trigger     = "flavour",
    description = "Flavour"
}
newoption
{
    trigger     = "host",
    value       = "HOST",
    description =
    {
        "Specify a (POSIX extended) regex of host aliases to match for",
        "cross compiled configurations. eg. --host=i586-mingw32msvc, --host=.*",
        "If unspecified, the default is to match only configurations native",
        "to the build machine."
    }
}
newoption
{
    trigger     = "linkage",
    description = "Linkage"
}
newoption
{
    trigger     = "toolkit",
    value       = "TOOLKIT",
    description =
    {
        "Specify a (POSIX  extended) regex of the toolkits to match.",
        "The toolkit is responsible for the look and feel",
        "of the compiled application. eg. gtk, gtk2, motif, msw.",
        "If unspecified the default is to prefer the system default toolkit,",
        "but to match any toolkit in the absence of a stricter specification."
    }
}
newoption
{
    trigger     = "version",
    value       = "VERSION",
    description =
    {
        "Without the optional argument, return the wxWidgets version.",
        "If the argument is supplied it specifies a (POSIX extended) regex",
        "of the versions to match.",
        "If unspecified  the default is to prefer the system default version,",
        "but to match any version in the absence of a stricter specification."
    }
}
newoption
{
    trigger     = "widgetset",
    description = "Widget set"
}
--[[===========================================================================
    Input options that accept only a yes or no argument.

    Notice that this includes "debug" but it is done only for compatibility,
    these options (i.e. --debug[=yes] or --debug=no) are completely ignored
    as there is no distinction between debug and release builds in wx any more.
   ========================================================================--]]
newoption
{
    trigger     = "debug",
    value       = "yes|no",
    accepted    =
    {
        {"yes", "Debug build"},
        {"no", "Release build (default)"}
    },
    description =
    {
        "Specify whether to create a debug or release build for the application.",
        "If unspecified the system default (release) will be preferred,",
        "but any type may match in the absence of a stricter specification.",
        "Debug versions are very useful for finding certain",
        "common ways of misusing the wxWidgets API, and you are encouraged",
        "to use them during active development of applications.",
        "They are not binary compatible with release versions, and packages",
        "built against wxWidgets debug builds should never be uploaded to Debian."
    }
}
newoption
{
    trigger     = "static",
    value       = "yes|no",
    accepted    =
    {
        {"yes", "Static linking"},
        {"no", "Dynamic linking (default)"}
    },
    description =
    {
        "Specify whether to statically or dynamically link",
        "wxWidgets libraries into your application.",
        "If unspecified, the system default (dynamic) will be preferred,",
        "but any type may match in the absence of a stricter specification.",
        "Static linking is mainly useful still for cross ports",
        "not natively supported by Debian,",
        "and can be hazardous in conjunction with the GTK toolkits.",
        "Note that static libraries are no longer included in the wxGTK packages."
    }
}
newoption
{
    trigger     = "unicode",
    value       = "yes|no",
    accepted    =
    {
        {"yes", "Unicode (default)"},
        {"no", "ANSI"}
    },
    description =
    {
        "Specify the default character type for the application.",
        "If unspecified, the system default will be preferred,",
        "but any type may match in the absence of a stricter specification."
    }
}
newoption
{
    trigger     = "univ",
    description = "Same as 'universal' option."
}
newoption
{
    trigger     = "universal",
    value       = "yes|no",
    description = "wxUniversal",
    accepted    =
    {
        {"yes", "Use wxUniversal"},
        {"no", "Don't use wxUniversal"}
    }
}
--[[===========================================================================
    Boolean options that do something or not.
    =======================================================================]]--
newoption
{
    trigger     = "selected_config",
    description = "Selected configuration"
}
newoption
{
    trigger     = "no_rpath",
    description = "No rpath"
}
newoption
{
    trigger     = "inplace",
    description = "In-place"
}
--[[===========================================================================
    Compiler options
        These options generate output required to build an application
        using a particular wxWidgets configuration.
    =======================================================================]]--
newoption
{
    trigger     = "cc",
    description = "Output the name of the C compiler $(CC)."
}
newoption
{
    trigger     = "cxx",
    description = "Output the name of the C++ compiler $(CXX)."
}
newoption
{
    trigger     = "cppflags",
    value       = "base",
    description = "Output parameters required by the C preprocessor."
}
newoption
{
    trigger     = "cflags",
    description = "Output parameters required by the C compiler."
}
newoption
{
    trigger     = "cxxflags",
    value       = "base",
    description = "Output parameters required by the C++ compiler."
}
newoption
{
    trigger     = "rescomp",
    description = "Res comp"
}
newoption
{
    trigger     = "rezflags",
    description = "Rez flags"
}
newoption
{
    trigger     = "linkdeps",
    description = "Returns only static libraries for your makefile link rule dependencies."
}
newoption
{
    trigger     = "utility",
    value       = "UTIL",
    description = "Returns the correct version of UTIL to use with the selected build."
}
--[[===========================================================================
    Linker options
    =======================================================================]]--
newoption
{
    trigger     = "ld",
    description = "Output the linker command."
}
newoption
{
    trigger     = "libs",
    value       = "LIBS",
    description = "Output link flags required for a wxWidgets application.",
    accepted    =
    {
        {"all", "Used to import all libraries that have been compiled."},
        {"std", "Used to import all libraries that would be used by default if none were specified explicitly."},
        {"base", "wxBase contains mandatory classes that any wxWidgets code depends on."},
        {"net", "wxNet library: Classes for network access like wxSocket and wxURL."},
        {"xml", "wxXML library: Simple classes for parsing XML documents."},
        {"core", "wxCore library: Basic GUI classes."},
        {"adv", "wxAdvanced library: Advanced or rarely used GUI classes."},
        {"qa", "wxQA library: Extra classes for quality assurance."},
        {"html", "wxHTML library: Simple HTML renderer."},
        {"gl", "wxGL library: Contains wxGLCanvas class for integrating OpenGL library with wxWidgets."},
        {"aui", "wxAui library: Advanced User Interface docking library."},
        {"propgrid", "wxPropertyGrid library: Contains the wxPropertyGrid control."},
        {"ribbon", "wxRibbon library: Ribbon User Interface components library."},
        {"richtext", "wxRichText library: Contains generic rich text control functionality."},
        {"stc", "wxSTC library: STC (Styled Text Control) is a wrapper around Scintilla, a syntax-highlighting text editor."},
        {"webview", "wxWebView library: Contains the wxWebView control and its associated classes."},
        {"xrc", "wxXRC library: Contains wxXmlResource class that provides access to XML resource files in XRC format."}
    }
}
newoption
{
    trigger     = "gl_libs",
    description = "OpenGL libraries"
}
newoption
{
    trigger     = "optional-libs",
    value       = "LIBS",
    description =
    {
        "Should be followed by a list of libs that should be linked to,",
        "but only if they are available."
    }
}
