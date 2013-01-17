--[[===========================================================================
    Name:        wx/options.lua
    Purpose:     wxWidgets configure options
    Author:      Andrea Zanellato, Jefferson González
    Modified by:
    Created:     2012/12/16
    RCS-ID:      $Id$
    Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
                 (c) Jefferson González <jgmdev@gmail.com>
    Licence:     wxWindows licence
  =========================================================================--]]

-- ----------------------------------------------------------------------------
-- Global compile options
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "shared",
    description = "create static library instead of shared",
    enable      = false
}
wx.feature.add
{
    name        = "stl",
    description = "use standard C++ classes for everything"
}
wx.feature.add
{
    name        = "std_containers",
    description = "use standard C++ container classes"
}
wx.feature.add
{
    name        = "std_iostreams",
    description = "use standard C++ stream classes"
}
wx.feature.add
{
    name        = "std_string",
    description = "use standard C++ string classes"
}
wx.feature.add
{
    name        = "std_string_conv_in_wxstring",
    description = "provide implicit conversion to std::string in wxString"
}
wx.feature.add
{
    name        = "unicode",
    description = "compile without Unicode support",
    enable      = false
}
wx.feature.add
{
    name        = "mslu",
    description = "use MS Layer for Unicode on Windows 9x (Win32 only)",
    platforms   = {"windows"}
}
wx.feature.add
{
    name        = "utf8",
    description = "use UTF-8 representation for strings (Unix only)",
    platforms   = {"linux", "bsd", "macosx", "solaris", "haiku"}
}
wx.feature.add
{
    name        = "utf8only",
    description = "only support UTF-8 locales in UTF-8 build (Unix only)",
    platforms   = {"linux", "bsd", "macosx", "solaris", "haiku"}
}
wx.feature.add
{
    name        = "extended_rtti",
    description = "use extended RTTI (XTI)"
}
wx.feature.add
{
    name        = "omf",
    description = "use OMF object format (OS/2)",
    platforms   = {"os2"}
}
wx.feature.add
{
    name        = "optimise",
    description = "compile without optimisations",
    enable      = false
}
wx.feature.add
{
    name        = "profile",
    description = "create code with profiling information"
}
wx.feature.add
{
    name        = "no_rtti",
    description = "create code without RTTI information"
}
wx.feature.add
{
    name        = "no_exceptions",
    description = "create code without C++ exceptions handling"
}
wx.feature.add
{
    name        = "permissive",
    description = "compile code disregarding strict ANSI"
}
wx.feature.add
{
    name        = "no_deps",
    description = "create code without dependency information"
}
wx.feature.add
{
    name        = "vararg_macros",
    description = "don't use vararg macros, even if they are supported",
    enable      = false
}
wx.feature.add
{
    name        = "universal_binary",
    value       = "archs",
    description = "create universal binary for the specified (or all supported) architectures"
}
wx.feature.add
{
    name        = "macosx_arch",
    value       = "ARCH",
    description = "build for just the specified architecture"
}
wx.feature.add
{
    name        = "compat26",
    description = "enable wxWidgets 2.6 compatibility"
}
wx.feature.add
{
    name        = "compat28",
    description = "disable wxWidgets 2.8 compatibility",
    enable      = false
}
wx.feature.add
{
    name        = "rpath",
    description = "disable use of rpath for uninstalled builds",
    enable      = false
}
wx.feature.add
{
    name        = "objc_uniquifying",
    description = "enable Objective-C class name uniquifying"
}
wx.feature.add
{
    name        = "visibility",
    description = "disable use of ELF symbols visibility even if supported",
    enable      = false
}
wx.feature.add
{
    name        = "tls",
    description = "disable use of compiler TLS support",
    enable      = false
}
-- ----------------------------------------------------------------------------
-- Global build options
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "gui",
    description = "don't build GUI parts of the library",
    enable      = false
}
wx.feature.add
{
    name        = "monolithic",
    description = "build wxWidgets as single library"
}
wx.feature.add
{
    name        = "plugins",
    description = "build parts of wxWidgets as loadable components"
}
wx.feature.add
{
    name        = "official_build",
    description = "official build of wxWidgets (win32 DLL only)",
    platforms   = {"windows"}
}
wx.feature.add
{
    name        = "vendor",
    value       = "VENDOR",
    description = "vendor name (win32 DLL only)",
    platforms   = {"windows"}
}
wx.feature.add
{
    name        = "all-features",
    description = "disable all optional features to build minimal library",
    enable      = false
}
-- ----------------------------------------------------------------------------
-- X Features
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "x-includes",
    value       = "DIR",
    description = "X include files are in DIR"
}
wx.feature.add
{
    name        = "x-libraries",
    value       = "DIR",
    description = "X library files are in DIR"
}
-- ----------------------------------------------------------------------------
-- Port selection
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "universal",
    description = "use wxWidgets GUI controls instead of native ones"
}
wx.feature.add
{
    name        = "nanox",
    description = "use NanoX"
}
wx.feature.add
{
    name        = "gpe",
    description = "use GNOME PDA Environment features if possible"
}
-- ---------------------------------------------------------------------------
-- Debugging options
-- ---------------------------------------------------------------------------
wx.feature.add
{
    name        = "debug",
    description = "build library for debugging"
}
wx.feature.add
{
    name        = "debug_flag",
    description = "disable all debugging support",
    enable      = false
}
wx.feature.add
{
    name        = "debug_info",
    description = "generate debug information"
}
wx.feature.add
{
    name        = "debug_gdb",
    description = "create code with extra GDB debugging information"
}
-- Obsolete, here just for completeness, not used anywhere
wx.feature.add
{
    name        = "debug_cntxt",
    description = "obsolete, don't use: use wxDebugContext"
}
wx.feature.add
{
    name        = "mem_tracing",
    description = "obsolete, don't use: create code with memory tracing"
}
-- ----------------------------------------------------------------------------
-- Optional non GUI features
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "intl",
    description = "use internationalization system"
}
wx.feature.add
{
    name        = "xlocale",
    description = "use x-locale support (requires wxLocale)"
}
wx.feature.add
{
    name        = "config",
    description = "use wxConfig (and derived) classes"
}
wx.feature.add
{
    name        = "protocols",
    description = "use wxProtocol and derived classes"
}
wx.feature.add
{
    name        = "ftp",
    description = "use wxFTP (requires wxProtocol)"
}
wx.feature.add
{
    name        = "http",
    description = "use wxHTTP (requires wxProtocol)"
}
wx.feature.add
{
    name        = "fileproto",
    description = "use wxFileProto class (requires wxProtocol)"
}
wx.feature.add
{
    name        = "sockets",
    description = "use socket/network classes"
}
wx.feature.add
{
    name        = "ipv6",
    description = "enable IPv6 support in wxSocket"
}
wx.feature.add
{
    name        = "ole",
    description = "use OLE classes (Win32 only)"
}
wx.feature.add
{
    name        = "dataobj",
    description = "use data object classes"
}
wx.feature.add
{
    name        = "ipc",
    description = "use interprocess communication (wxSocket etc.)"
}
wx.feature.add
{
    name        = "baseevtloop",
    description = "use event loop in console programs too"
}
wx.feature.add
{
    name        = "epollloop",
    description = "use wxEpollDispatcher class (Linux only)"
}
wx.feature.add
{
    name        = "selectloop",
    description = "use wxSelectDispatcher class"
}
wx.feature.add
{
    name        = "any",
    description = "use wxAny class"
}
wx.feature.add
{
    name        = "apple_ieee",
    description = "use the Apple IEEE codec"
}
wx.feature.add
{
    name        = "arcstream",
    description = "use wxArchive streams"
}
wx.feature.add
{
    name        = "base64",
    description = "use base64 encoding/decoding functions"
}
wx.feature.add
{
    name        = "backtrace",
    description = "use wxStackWalker class for getting backtraces"
}
wx.feature.add
{
    name        = "catch_segvs",
    description = "catch signals in wxApp::OnFatalException (Unix only)"
}
wx.feature.add
{
    name        = "cmdline",
    description = "use wxCmdLineParser class"
}
wx.feature.add
{
    name        = "datetime",
    description = "use wxDateTime class"
}
wx.feature.add
{
    name        = "debugreport",
    description = "use wxDebugReport class"
}
wx.feature.add
{
    name        = "dialupman",
    description = "use dialup network classes"
}
wx.feature.add
{
    name        = "dynlib",
    description = "use wxLibrary class for DLL loading"
}
wx.feature.add
{
    name        = "dynamicloader",
    description = "use (new) wxDynamicLibrary class"
}
wx.feature.add
{
    name        = "exceptions",
    description = "build exception-safe library"
}
wx.feature.add
{
    name        = "ffile",
    description = "use wxFFile class"
}
wx.feature.add
{
    name        = "file",
    description = "use wxFile class"
}
wx.feature.add
{
    name        = "filehistory",
    description = "use wxFileHistory class"
}
wx.feature.add
{
    name        = "filesystem",
    description = "use virtual file systems classes"
}
wx.feature.add
{
    name        = "fontenum",
    description = "use wxFontEnumerator class"
}
wx.feature.add
{
    name        = "fontmap",
    description = "use font encodings conversion classes"
}
wx.feature.add
{
    name        = "fs_archive",
    description = "   use virtual archive filesystems"
}
wx.feature.add
{
    name        = "fs_inet",
    description = "use virtual HTTP/FTP filesystems"
}
wx.feature.add
{
    name        = "fs_zip",
    description = "now replaced by fs_archive"
}
wx.feature.add
{
    name        = "fswatcher",
    description = "use wxFileSystemWatcher class"
}
wx.feature.add
{
    name        = "geometry",
    description = "use geometry class"
}
wx.feature.add
{
    name        = "log",
    description = "use logging system"
}
wx.feature.add
{
    name        = "longlong",
    description = "use wxLongLong class"
}
wx.feature.add
{
    name        = "mimetype",
    description = "use wxMimeTypesManager"
}
wx.feature.add
{
    name        = "printfposparam",
    description = "use wxVsnprintf() which supports positional parameters"
}
wx.feature.add
{
    name        = "snglinst",
    description = "use wxSingleInstanceChecker class"
}
wx.feature.add
{
    name        = "sound",
    description = "use wxSound class"
}
wx.feature.add
{
    name        = "stdpaths",
    description = "use wxStandardPaths class"
}
wx.feature.add
{
    name        = "stopwatch",
    description = "use wxStopWatch class"
}
wx.feature.add
{
    name        = "streams",
    description = "use wxStream etc classes"
}
wx.feature.add
{
    name        = "sysoptions",
    description = "use wxSystemOptions"
}
wx.feature.add
{
    name        = "tarstream",
    description = "use wxTar streams"
}
wx.feature.add
{
    name        = "textbuf",
    description = "use wxTextBuffer class"
}
wx.feature.add
{
    name        = "textfile",
    description = "use wxTextFile class"
}
wx.feature.add
{
    name        = "timer",
    description = "use wxTimer class"
}
wx.feature.add
{
    name        = "variant",
    description = "use wxVariant class"
}
wx.feature.add
{
    name        = "zipstream",
    description = "use wxZip streams"
}
wx.feature.add
{
    name        = "url",
    description = "use wxURL class"
}
wx.feature.add
{
    name        = "protocol",
    description = "use wxProtocol class"
}
wx.feature.add
{
    name        = "protocol-http",
    description = "HTTP support in wxProtocol"
}
wx.feature.add
{
    name        = "protocol-ftp",
    description = "FTP support in wxProtocol"
}
wx.feature.add
{
    name        = "protocol-file",
    description = "FILE support in wxProtocol"
}
wx.feature.add
{
    name        = "threads",
    description = "use threads"
}
wx.feature.add
{
    name        = "iniconf",
    description = "use wxIniConfig (Win32 only)",
    platforms   = {"windows"}
}
wx.feature.add
{
    name        = "regkey",
    description = "use wxRegKey class (Win32 only)",
    platforms   = {"windows"}
}
-- ----------------------------------------------------------------------------
-- Optional "big" GUI features
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "docview",
    description = "use document view architecture"
}
wx.feature.add
{
    name        = "help",
    description = "use help subsystem"
}
wx.feature.add
{
    name        = "mshtmlhelp",
    description = "use MS HTML Help (win32)" -- TODO: win 32 only?
}
wx.feature.add
{
    name        = "html",
    description = "use wxHTML sub-library"
}
wx.feature.add
{
    name        = "htmlhelp",
    description = "use wxHTML-based help"
}
wx.feature.add
{
    name        = "xrc",
    description = "use XRC resources sub-library"
}
wx.feature.add
{
    name        = "aui",
    description = "use AUI docking library"
}
wx.feature.add
{
    name        = "propgrid",
    description = "use wxPropertyGrid library"
}
wx.feature.add
{
    name        = "ribbon",
    description = "use wxRibbon library"
}
wx.feature.add
{
    name        = "stc",
    description = "use wxStyledTextCtrl library"
}
wx.feature.add
{
    name        = "constraints",
    description = "use layout-constraints system"
}
wx.feature.add
{
    name        = "loggui",
    description = "use standard GUI logger"
}
wx.feature.add
{
    name        = "logwin",
    description = "use wxLogWindow"
}
wx.feature.add
{
    name        = "logdialog",
    description = "use wxLogDialog"
}
wx.feature.add
{
    name        = "mdi",
    description = "use multiple document interface architecture"
}
wx.feature.add
{
    name        = "mdidoc",
    description = "use docview architecture with MDI"
}
wx.feature.add
{
    name        = "mediactrl",
    description = "use wxMediaCtrl class"
}
wx.feature.add
{
    name        = "gstreamer8",
    description = "force GStreamer 0.8 instead of 0.10 with the wxMediaCtrl class on unix",
    platforms   = {"linux", "bsd", "macosx", "solaris", "haiku"}
}
wx.feature.add
{
    name        = "richtext",
    description = "use wxRichTextCtrl"
}
wx.feature.add
{
    name        = "postscript",
    description = "use wxPostscriptDC device context (default for gtk+)"
}
wx.feature.add
{
    name        = "printarch",
    description = "use printing architecture"
}
wx.feature.add
{
    name        = "svg",
    description = "use wxSVGFileDC device context"
}
wx.feature.add
{
    name        = "webkit",
    description = "use wxWebKitCtrl (Mac-only, use wxWebView instead)",
    platforms   = {"macosx"}
}
wx.feature.add
{
    name        = "webview",
    description = "use wxWebView library"
}
wx.feature.add
{
    name        = "graphics_ctx",
    description = "use graphics context 2D drawing API"
}
-- ----------------------------------------------------------------------------
-- IPC &c
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "clipboard",
    description = "use wxClipboard class"
}
wx.feature.add
{
    name        = "dnd",
    description = "use Drag'n'Drop classes"
}
-- ----------------------------------------------------------------------------
-- Optional GUI controls
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "controls",
    description = "disable compilation of all standard controls",
    enable      = false
}
wx.feature.add
{
    name        = "markup",
    description = "support wxControl::SetLabelMarkup"
}
wx.feature.add
{
    name        = "accel",
    description = "use accelerators"
}
wx.feature.add
{
    name        = "animatectrl",
    description = "use wxAnimationCtrl class"
}
wx.feature.add
{
    name        = "artstd",
    description = "use standard XPM icons in wxArtProvider"
}
wx.feature.add
{
    name        = "arttango",
    description = "use Tango icons in wxArtProvider"
}
wx.feature.add
{
    name        = "bannerwindow",
    description = "use wxBannerWindow class"
}
wx.feature.add
{
    name        = "bmpbutton",
    description = "use wxBitmapButton class"
}
wx.feature.add
{
    name        = "bmpcombobox",
    description = "use wxBitmapComboBox class"
}
wx.feature.add
{
    name        = "button",
    description = "use wxButton class"
}
wx.feature.add
{
    name        = "calendar",
    description = "use wxCalendarCtrl class"
}
wx.feature.add
{
    name        = "caret",
    description = "use wxCaret class"
}
wx.feature.add
{
    name        = "checkbox",
    description = "use wxCheckBox class"
}
wx.feature.add
{
    name        = "checklst",
    description = "use wxCheckListBox (listbox with checkboxes) class"
}
wx.feature.add
{
    name        = "choice",
    description = "use wxChoice class"
}
wx.feature.add
{
    name        = "choicebook",
    description = "use wxChoicebook class"
}
wx.feature.add
{
    name        = "collpane",
    description = "use wxCollapsiblePane class"
}
wx.feature.add
{
    name        = "colourpicker",
    description = "use wxColourPickerCtrl class"
}
wx.feature.add
{
    name        = "combobox",
    description = "use wxComboBox class"
}
wx.feature.add
{
    name        = "comboctrl",
    description = "use wxComboCtrl class"
}
wx.feature.add
{
    name        = "commandlinkbutton",
    description = "use wxCommmandLinkButton class"
}
wx.feature.add
{
    name        = "dataviewctrl",
    description = "use wxDataViewCtrl class"
}
wx.feature.add
{
    name        = "datepick",
    description = "use wxDatePickerCtrl class"
}
wx.feature.add
{
    name        = "detect_sm",
    description = "use code to detect X11 session manager"
}
wx.feature.add
{
    name        = "dirpicker",
    description = "use wxDirPickerCtrl class"
}
wx.feature.add
{
    name        = "display",
    description = "use wxDisplay class"
}
wx.feature.add
{
    name        = "editablebox",
    description = "use wxEditableListBox class"
}
wx.feature.add
{
    name        = "filectrl",
    description = "use wxFileCtrl class"
}
wx.feature.add
{
    name        = "filepicker",
    description = "use wxFilePickerCtrl class"
}
wx.feature.add
{
    name        = "fontpicker",
    description = "use wxFontPickerCtrl class"
}
wx.feature.add
{
    name        = "gauge",
    description = "use wxGauge class"
}
wx.feature.add
{
    name        = "grid",
    description = "use wxGrid class"
}
wx.feature.add
{
    name        = "headerctrl",
    description = "use wxHeaderCtrl class"
}
wx.feature.add
{
    name        = "hyperlink",
    description = "use wxHyperlinkCtrl class"
}
wx.feature.add
{
    name        = "imaglist",
    description = "use wxImageList class"
}
wx.feature.add
{
    name        = "infobar",
    description = "use wxInfoBar class"
}
wx.feature.add
{
    name        = "listbook",
    description = "use wxListbook class"
}
wx.feature.add
{
    name        = "listbox",
    description = "use wxListBox class"
}
wx.feature.add
{
    name        = "listctrl",
    description = "use wxListCtrl class"
}
wx.feature.add
{
    name        = "notebook",
    description = "use wxNotebook class"
}
wx.feature.add
{
    name        = "notifmsg",
    description = "use wxNotificationMessage class"
}
wx.feature.add
{
    name        = "odcombobox",
    description = "use wxOwnerDrawnComboBox class"
}
wx.feature.add
{
    name        = "popupwin",
    description = "use wxPopUpWindow class"
}
wx.feature.add
{
    name        = "radiobox",
    description = "use wxRadioBox class"
}
wx.feature.add
{
    name        = "radiobtn",
    description = "use wxRadioButton class"
}
wx.feature.add
{
    name        = "richmsgdlg",
    description = "use wxRichMessageDialog class"
}
wx.feature.add
{
    name        = "richtooltip",
    description = "use wxRichToolTip class"
}
wx.feature.add
{
    name        = "rearrangectrl",
    description = "use wxRearrangeList/Ctrl/Dialog"
}
wx.feature.add
{
    name        = "sash",
    description = "use wxSashWindow class"
}
wx.feature.add
{
    name        = "scrollbar",
    description = "use wxScrollBar class and scrollable windows"
}
wx.feature.add
{
    name        = "searchctrl",
    description = "use wxSearchCtrl class"
}
wx.feature.add
{
    name        = "slider",
    description = "use wxSlider class"
}
wx.feature.add
{
    name        = "spinbtn",
    description = "use wxSpinButton class"
}
wx.feature.add
{
    name        = "spinctrl",
    description = "use wxSpinCtrl class"
}
wx.feature.add
{
    name        = "splitter",
    description = "use wxSplitterWindow class"
}
wx.feature.add
{
    name        = "statbmp",
    description = "use wxStaticBitmap class"
}
wx.feature.add
{
    name        = "statbox",
    description = "use wxStaticBox class"
}
wx.feature.add
{
    name        = "statline",
    description = "use wxStaticLine class"
}
wx.feature.add
{
    name        = "stattext",
    description = "use wxStaticText class"
}
wx.feature.add
{
    name        = "statusbar",
    description = "use wxStatusBar class"
}
wx.feature.add
{
    name        = "taskbaricon",
    description = "use wxTaskBarIcon class"
}
wx.feature.add
{
    name        = "tbarnative",
    description = "use native wxToolBar class"
}
wx.feature.add
{
    name        = "textctrl",
    description = "use wxTextCtrl class"
}
wx.feature.add
{
    name        = "timepick",
    description = "use wxTimePickerCtrl class"
}
wx.feature.add
{
    name        = "tipwindow",
    description = "use wxTipWindow class"
}
wx.feature.add
{
    name        = "togglebtn",
    description = "use wxToggleButton class"
}
wx.feature.add
{
    name        = "toolbar",
    description = "use wxToolBar class"
}
wx.feature.add
{
    name        = "toolbook",
    description = "use wxToolbook class"
}
wx.feature.add
{
    name        = "treebook",
    description = "use wxTreebook class"
}
wx.feature.add
{
    name        = "treectrl",
    description = "use wxTreeCtrl class"
}
wx.feature.add
{
    name        = "treelist",
    description = "use wxTreeListCtrl class"
}
-- ----------------------------------------------------------------------------
-- Common dialogs
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "commondlg",
    description = "use all common dialogs"
}
wx.feature.add
{
    name        = "aboutdlg",
    description = "use wxAboutBox"
}
wx.feature.add
{
    name        = "choicedlg",
    description = "use wxChoiceDialog"
}
wx.feature.add
{
    name        = "coldlg",
    description = "use wxColourDialog"
}
wx.feature.add
{
    name        = "dirdlg",
    description = "use wxDirDialog"
}
wx.feature.add
{
    name        = "filedlg",
    description = "use wxFileDialog"
}
wx.feature.add
{
    name        = "finddlg",
    description = "use wxFindReplaceDialog"
}
wx.feature.add
{
    name        = "fontdlg",
    description = "use wxFontDialog"
}
wx.feature.add
{
    name        = "msgdlg",
    description = "use wxMessageDialog"
}
wx.feature.add
{
    name        = "numberdlg",
    description = "use wxNumberEntryDialog"
}
wx.feature.add
{
    name        = "splash",
    description = "use wxSplashScreen"
}
wx.feature.add
{
    name        = "textdlg",
    description = "use wxTextDialog"
}
wx.feature.add
{
    name        = "tipdlg",
    description = "use startup tips"
}
wx.feature.add
{
    name        = "progressdlg",
    description = "use wxProgressDialog"
}
wx.feature.add
{
    name        = "wizarddlg",
    description = "use wxWizard"
}
-- ----------------------------------------------------------------------------
-- Misc GUI options
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "menus",
    description = "use wxMenu/wxMenuBar/wxMenuItem classes"
}
wx.feature.add
{
    name        = "miniframe",
    description = "use wxMiniFrame class"
}
wx.feature.add
{
    name        = "tooltips",
    description = "use wxToolTip class"
}
wx.feature.add
{
    name        = "splines",
    description = "use spline drawing code"
}
wx.feature.add
{
    name        = "mousewheel",
    description = "use mousewheel"
}
wx.feature.add
{
    name        = "validators",
    description = "use wxValidator and derived classes"
}
wx.feature.add
{
    name        = "busyinfo",
    description = "use wxBusyInfo"
}
wx.feature.add
{
    name        = "hotkey",
    description = "use wxWindow::RegisterHotKey()"
}
wx.feature.add
{
    name        = "joystick",
    description = "use wxJoystick"
}
wx.feature.add
{
    name        = "metafiles",
    description = "use wxMetaFile"
}
wx.feature.add
{
    name        = "dragimage",
    description = "use wxDragImage"
}
wx.feature.add
{
    name        = "accessibility",
    description = "enable accessibility support"
}
wx.feature.add
{
    name        = "uiactionsim",
    description = "use wxUIActionSimulator (experimental)"
}
wx.feature.add
{
    name        = "dctransform",
    description = "use wxDC::SetTransformMatrix and related"
}
wx.feature.add
{
    name        = "webviewwebkit",
    description = "use wxWebView WebKit backend"
}
-- ----------------------------------------------------------------------------
-- Support for image formats that do not rely on external library
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "palette",
    description = "use wxPalette class"
}
wx.feature.add
{
    name        = "image",
    description = "use wxImage class",
    default     = "yes" -- We should store the default action taken
}
wx.feature.add
{
    name        = "gif",
    description = "use gif images (GIF file format)"
}
wx.feature.add
{
    name        = "pcx",
    description = "use pcx images (PCX file format)"
}
wx.feature.add
{
    name        = "tga",
    description = "use tga images (TGA file format)"
}
wx.feature.add
{
    name        = "iff",
    description = "use iff images (IFF file format)"
}
wx.feature.add
{
    name        = "pnm",
    description = "use pnm images (PNM file format)"
}
wx.feature.add
{
    name        = "xpm",
    description = "use xpm images (XPM file format)"
}
wx.feature.add
{
    name        = "ico_cur",
    description = "use Windows ICO and CUR formats"
}
-- ----------------------------------------------------------------------------
-- wxMSW-only options
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "dccache",
    description = "cache temporary wxDC objects (Win32 only)",
    platforms   = {"windows"}
}
wx.feature.add
{
    name        = "ps-in-msw",
    description = "use PS printing in wxMSW (Win32 only)",
    platforms   = {"windows"}
}
wx.feature.add
{
    name        = "ownerdrawn",
    description = "use owner drawn controls (Win32 and OS/2 only)",
    platforms   = {"windows", "os2"}
}
wx.feature.add
{
    name        = "uxtheme",
    description = "enable support for Windows XP themed look (Win32 only)",
    platforms   = {"windows"}
}
wx.feature.add
{
    name        = "wxdib",
    description = "use wxDIB class (Win32 only)",
    platforms   = {"windows"}
}
wx.feature.add
{
    name        = "webviewie",
    description = "use wxWebView IE backend (Win32 only)",
    platforms   = {"windows"}
}
wx.feature.add
{
    name        = "autoidman",
    description = "use automatic ids management"
}
-- ----------------------------------------------------------------------------
-- Autoconf
-- ----------------------------------------------------------------------------
wx.feature.add
{
    name        = "largefile",
    description = "omit support for large files",
    enable      = false
}
wx.feature.add
{
    name        = "gtktest",
    description = "do not try to compile and run a test GTK+ program",
    enable      = false
}
wx.feature.add
{
    name        = "sdltest",
    description = "Do not try to compile and run a test SDL program",
    enable      = false
}
wx.feature.add
{
    name        = "dependency-tracking",
    description = "don't use dependency tracking even if the compiler can",
    enable      = false
}
wx.feature.add
{
    name        = "precomp-headers",
    description = "don't use precompiled headers even if compiler can",
    enable      = false
}

-- ----------------------------------------------------------------------------
-- Optional Packages or with without options
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "without-subdirs",
    description = "don't generate makefiles for samples/demos/..."
}
newoption
{
    trigger     = "with-flavour",
    value       = "NAME",
    description = "specify a name to identify this build"
}
newoption
{
    trigger     = "with-themes",
    value       = "all|list",
    description = "use only the specified comma-separated list of wxUniversal themes"
}
newoption
{
    trigger     = "with-gtk",
    value       = "VERSION",
    description = "use GTK+, VERSION can be 3, 2 (default), 1 or \"any\"",
    allowed     =
    {
        { "1",   "GTK" },
        { "2",   "GTK2" },
        { "3",   "GTK3" },
        { "any", "Any GTK version" }
    }
}
newoption
{
    trigger     = "with-motif",
    description = "use Motif/Lesstif"
}
newoption
{
    trigger     = "with-osx_carbon",
    description = "use Mac OS X (Carbon)"
}
newoption
{
    trigger     = "with-osx_cocoa",
    description = "use Mac OS X (Cocoa)"
}
newoption
{
    trigger     = "with-osx_iphone",
    description = "use iPhone OS X port"
}
newoption
{
    trigger     = "with-osx",
    description = "use Mac OS X (default port, currently Carbon)"
}
newoption
{
    trigger     = "with-carbon",
    description = "same as --with-osx_carbon"
}
newoption
{
    trigger     = "with-cocoa",
    description = "same as --with-osx_cocoa"
}
newoption
{
    trigger     = "with-iphone",
    description = "same as --with-osx_iphone"
}
newoption
{
    trigger     = "with-mac",
    description = "same as --with-osx"
}
newoption
{
    trigger     = "with-old_cocoa",
    description = "use old, deprecated, Cocoa port"
}
newoption
{
    trigger     = "with-wine",
    description = "use Wine"
}
newoption
{
    trigger     = "with-msw",
    description = "use MS-Windows"
}
newoption
{
    trigger     = "with-pm",
    description = "use OS/2 Presentation Manager"
}
newoption
{
    trigger     = "with-directfb",
    description = "use DirectFB"
}
newoption
{
    trigger     = "with-microwin",
    description = "use MicroWindows"
}
newoption
{
    trigger     = "with-x11",
    description = "use X11"
}
newoption
{
    trigger     = "with-libpng",
    description = "use libpng (PNG image format)"
}
newoption
{
    trigger     = "with-libjpeg",
    description = "use libjpeg (JPEG file format)"
}
newoption
{
    trigger     = "with-libtiff",
    description = "use libtiff (TIFF file format)"
}
newoption
{
    trigger     = "with-libxpm",
    description = "use libxpm (XPM file format)"
}
newoption
{
    trigger     = "with-libiconv",
    description = "use libiconv (character conversion)"
}
newoption
{
    trigger     = "with-libmspack",
    description = "use libmspack (CHM help files loading)"
}
newoption
{
    trigger     = "without-gtkprint",
    description = "don't use GTK printing support"
}
newoption
{
    trigger     = "without-gnomeprint",
    description = "don't use GNOME printing libraries"
}
newoption
{
    trigger     = "with-gnomevfs",
    description = "use GNOME VFS for associating MIME types"
}
newoption
{
    trigger     = "with-libnotify",
    description = "use libnotify for notifications"
}
newoption
{
    trigger     = "with-hildon",
    description = "use Hildon framework for Nokia 770/800/810"
}
newoption
{
    trigger     = "with-opengl",
    description = "use OpenGL (or Mesa)"
}
newoption
{
    trigger     = "with-dmalloc",
    description = "use dmalloc library (http://dmalloc.com/)"
}
newoption
{
    trigger     = "with-sdl",
    description = "use SDL for audio on Unix"
}
newoption
{
    trigger     = "with-regex",
    description = "enable support for wxRegEx class"
}
newoption
{
    trigger     = "with-zlib",
    description = "use zlib for LZW compression"
}
newoption
{
    trigger     = "with-expat",
    description = "enable XML support using expat parser"
}
newoption
{
    trigger     = "with-macosx-sdk",
    value       = "PATH",
    description = "use an OS X SDK at PATH"
}
newoption
{
    trigger     = "with-macosx-version-min",
    value       = "VERSION",
    description = "build binaries which require at least this OS X version"
}
newoption
{
    trigger     = "with-gtk-prefix",
    value       = "PREFIX",
    description = "Prefix where GTK is installed (optional)"
}
newoption
{
    trigger     = "with-gtk-exec-prefix",
    value       = "PREFIX",
    description = "Exec prefix where GTK is installed (optional)"
}
newoption
{
    trigger     = "with-x",
    description = "use the X Window System"
}
newoption
{
    trigger     = "with-libiconv-prefix",
    value       = "DIR",
    description = "search for libiconv in DIR/include and DIR/lib"
}
newoption
{
    trigger     = "with-sdl-prefix",
    value       = "PREFIX",
    description = "Prefix where SDL is installed (optional)"
}
newoption
{
    trigger     = "with-sdl-exec-prefix",
    value       = "PREFIX",
    description = "Exec prefix where SDL is installed (optional)"
}
newoption
{
    trigger     = "with-cppunit-prefix",
    value       = "PREFIX",
    description = "Prefix where CppUnit is installed (optional)"
}
newoption
{
    trigger     = "with-cppunit-exec-prefix",
    value       = "PREFIX",
    description = "Exec prefix where CppUnit is installed (optional)"
}
