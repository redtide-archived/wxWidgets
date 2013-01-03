-- ============================================================================
-- Name:        options.lua
-- Purpose:     wxWidgets configure options
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2012/12/16
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
-- ----------------------------------------------------------------------------
-- Global compile options
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "disable-shared",
    description = "create static library instead of shared"
}
newoption
{
    trigger     = "enable-stl",
    description = "use standard C++ classes for everything"
}
newoption
{
    trigger     = "enable-std_containers",
    description = "use standard C++ container classes"
}
newoption
{
    trigger     = "enable-std_iostreams",
    description = "use standard C++ stream classes"
}
newoption
{
    trigger     = "enable-std_string",
    description = "use standard C++ string classes"
}
newoption
{
    trigger     = "enable-std_string_conv_in_wxstring",
    description = "provide implicit conversion to std::string in wxString"
}
newoption
{
    trigger     = "disable-unicode",
    description = "compile without Unicode support"
}
newoption
{
    trigger     = "enable-mslu",
    description = "use MS Layer for Unicode on Windows 9x (Win32 only)"
}
newoption
{
    trigger     = "enable-utf8",
    description = "use UTF-8 representation for strings (Unix only)"
}
newoption
{
    trigger     = "enable-utf8only",
    description = "only support UTF-8 locales in UTF-8 build (Unix only)"
}
newoption
{
    trigger     = "enable-extended_rtti",
    description = "use extended RTTI (XTI)"
}
newoption
{
    trigger     = "enable-omf",
    description = "use OMF object format (OS/2)"
}
newoption
{
    trigger     = "disable-optimise",
    description = "compile without optimisations"
}
newoption
{
    trigger     = "enable-profile",
    description = "create code with profiling information"
}
newoption
{
    trigger     = "enable-no_rtti",
    description = "create code without RTTI information"
}
newoption
{
    trigger     = "enable-no_exceptions",
    description = "create code without C++ exceptions handling"
}
newoption
{
    trigger     = "enable-permissive",
    description = "compile code disregarding strict ANSI"
}
newoption
{
    trigger     = "enable-no_deps",
    description = "create code without dependency information"
}
newoption
{
    trigger     = "disable-vararg_macros",
    description = "don't use vararg macros, even if they are supported"
}
newoption
{
    trigger     = "enable-universal_binary",
    value       = "archs",
    description = "create universal binary for the specified (or all supported) architectures"
}
newoption
{
    trigger     = "enable-macosx_arch",
    value       = "ARCH",
    description = "build for just the specified architecture"
}
newoption
{
    trigger     = "enable-compat26",
    description = "enable wxWidgets 2.6 compatibility"
}
newoption
{
    trigger     = "disable-compat28",
    description = "disable wxWidgets 2.8 compatibility"
}
newoption
{
    trigger     = "disable-rpath",
    description = "disable use of rpath for uninstalled builds"
}
newoption
{
    trigger     = "enable-objc_uniquifying",
    description = "enable Objective-C class name uniquifying"
}
newoption
{
    trigger     = "disable-visibility",
    description = "disable use of ELF symbols visibility even if supported"
}
newoption
{
    trigger     = "disable-tls",
    description = "disable use of compiler TLS support"
}
-- ----------------------------------------------------------------------------
-- Global build options
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "disable-gui",
    description = "don't build GUI parts of the library"
}
newoption
{
    trigger     = "enable-monolithic",
    description = "build wxWidgets as single library"
}
newoption
{
    trigger     = "enable-plugins",
    description = "build parts of wxWidgets as loadable components"
}
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
    trigger     = "enable-official_build",
    description = "official build of wxWidgets (win32 DLL only)"
}
newoption
{
    trigger     = "enable-vendor",
    value       = "VENDOR",
    description = "vendor name (win32 DLL only)"
}
newoption
{
    trigger     = "disable-all-features",
    description = "disable all optional features to build minimal library"
}
-- ----------------------------------------------------------------------------
-- X Features
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "x-includes",
    value       = "DIR",
    description = "X include files are in DIR"
}
newoption
{
    trigger     = "x-libraries",
    value       = "DIR",
    description = "X library files are in DIR"
}
-- ----------------------------------------------------------------------------
-- Port selection
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "enable-universal",
    description = "use wxWidgets GUI controls instead of native ones"
}
newoption
{
    trigger     = "with-themes",
    value       = "all|list",
    description = "use only the specified comma-separated list of wxUniversal themes"
}
newoption
{
    trigger     = "enable-nanox",
    description = "use NanoX"
}
newoption
{
    trigger     = "enable-gpe",
    description = "use GNOME PDA Environment features if possible"
}
-- ---------------------------------------------------------------------------
-- Debugging options
-- ---------------------------------------------------------------------------
newoption
{
    trigger     = "enable-debug",
    description = "build library for debugging"
}
newoption
{
    trigger     = "disable-debug_flag",
    description = "disable all debugging support"
}
newoption
{
    trigger     = "enable-debug_info",
    description = "generate debug information"
}
newoption
{
    trigger     = "enable-debug_gdb",
    description = "create code with extra GDB debugging information"
}
-- Obsolete, here just for completeness, not used anywhere
newoption
{
    trigger     = "enable-debug_cntxt",
    description = "obsolete, don't use: use wxDebugContext"
}
newoption
{
    trigger     = "enable-mem_tracing",
    description = "obsolete, don't use: create code with memory tracing"
}
-- ----------------------------------------------------------------------------
-- Optional non GUI features
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "enable-intl",
    description = "use internationalization system"
}
newoption
{
    trigger     = "enable-xlocale",
    description = "use x-locale support (requires wxLocale)"
}
newoption
{
    trigger     = "enable-config",
    description = "use wxConfig (and derived) classes"
}
newoption
{
    trigger     = "enable-protocols",
    description = "use wxProtocol and derived classes"
}
newoption
{
    trigger     = "enable-ftp",
    description = "use wxFTP (requires wxProtocol)"
}
newoption
{
    trigger     = "enable-http",
    description = "use wxHTTP (requires wxProtocol)"
}
newoption
{
    trigger     = "enable-fileproto",
    description = "use wxFileProto class (requires wxProtocol)"
}
newoption
{
    trigger     = "enable-sockets",
    description = "use socket/network classes"
}
newoption
{
    trigger     = "enable-ipv6",
    description = "enable IPv6 support in wxSocket"
}
newoption
{
    trigger     = "enable-ole",
    description = "use OLE classes (Win32 only)"
}
newoption
{
    trigger     = "enable-dataobj",
    description = "use data object classes"
}
newoption
{
    trigger     = "enable-ipc",
    description = "use interprocess communication (wxSocket etc.)"
}
newoption
{
    trigger     = "enable-baseevtloop",
    description = "use event loop in console programs too"
}
newoption
{
    trigger     = "enable-epollloop",
    description = "use wxEpollDispatcher class (Linux only)"
}
newoption
{
    trigger     = "enable-selectloop",
    description = "use wxSelectDispatcher class"
}
newoption
{
    trigger     = "enable-any",
    description = "use wxAny class"
}
newoption
{
    trigger     = "enable-apple_ieee",
    description = "use the Apple IEEE codec"
}
newoption
{
    trigger     = "enable-arcstream",
    description = "use wxArchive streams"
}
newoption
{
    trigger     = "enable-base64",
    description = "use base64 encoding/decoding functions"
}
newoption
{
    trigger     = "enable-backtrace",
    description = "use wxStackWalker class for getting backtraces"
}
newoption
{
    trigger     = "enable-catch_segvs",
    description = "catch signals in wxApp::OnFatalException (Unix only)"
}
newoption
{
    trigger     = "enable-cmdline",
    description = "use wxCmdLineParser class"
}
newoption
{
    trigger     = "enable-datetime",
    description = "use wxDateTime class"
}
newoption
{
    trigger     = "enable-debugreport",
    description = "use wxDebugReport class"
}
newoption
{
    trigger     = "enable-dialupman",
    description = "use dialup network classes"
}
newoption
{
    trigger     = "enable-dynlib",
    description = "use wxLibrary class for DLL loading"
}
newoption
{
    trigger     = "enable-dynamicloader",
    description = "use (new) wxDynamicLibrary class"
}
newoption
{
    trigger     = "enable-exceptions",
    description = "build exception-safe library"
}
newoption
{
    trigger     = "enable-ffile",
    description = "use wxFFile class"
}
newoption
{
    trigger     = "enable-file",
    description = "use wxFile class"
}
newoption
{
    trigger     = "enable-filehistory",
    description = "use wxFileHistory class"
}
newoption
{
    trigger     = "enable-filesystem",
    description = "use virtual file systems classes"
}
newoption
{
    trigger     = "enable-fontenum",
    description = "use wxFontEnumerator class"
}
newoption
{
    trigger     = "enable-fontmap",
    description = "use font encodings conversion classes"
}
newoption
{
    trigger     = "enable-fs_archive",
    description = "   use virtual archive filesystems"
}
newoption
{
    trigger     = "enable-fs_inet",
    description = "use virtual HTTP/FTP filesystems"
}
newoption
{
    trigger     = "enable-fs_zip",
    description = "now replaced by fs_archive"
}
newoption
{
    trigger     = "enable-fswatcher",
    description = "use wxFileSystemWatcher class"
}
newoption
{
    trigger     = "enable-geometry",
    description = "use geometry class"
}
newoption
{
    trigger     = "enable-log",
    description = "use logging system"
}
newoption
{
    trigger     = "enable-longlong",
    description = "use wxLongLong class"
}
newoption
{
    trigger     = "enable-mimetype",
    description = "use wxMimeTypesManager"
}
newoption
{
    trigger     = "enable-printfposparam",
    description = "use wxVsnprintf() which supports positional parameters"
}
newoption
{
    trigger     = "enable-snglinst",
    description = "use wxSingleInstanceChecker class"
}
newoption
{
    trigger     = "enable-sound",
    description = "use wxSound class"
}
newoption
{
    trigger     = "enable-stdpaths",
    description = "use wxStandardPaths class"
}
newoption
{
    trigger     = "enable-stopwatch",
    description = "use wxStopWatch class"
}
newoption
{
    trigger     = "enable-streams",
    description = "use wxStream etc classes"
}
newoption
{
    trigger     = "enable-sysoptions",
    description = "use wxSystemOptions"
}
newoption
{
    trigger     = "enable-tarstream",
    description = "use wxTar streams"
}
newoption
{
    trigger     = "enable-textbuf",
    description = "use wxTextBuffer class"
}
newoption
{
    trigger     = "enable-textfile",
    description = "use wxTextFile class"
}
newoption
{
    trigger     = "enable-timer",
    description = "use wxTimer class"
}
newoption
{
    trigger     = "enable-variant",
    description = "use wxVariant class"
}
newoption
{
    trigger     = "enable-zipstream",
    description = "use wxZip streams"
}
newoption
{
    trigger     = "enable-url",
    description = "use wxURL class"
}
newoption
{
    trigger     = "enable-protocol",
    description = "use wxProtocol class"
}
newoption
{
    trigger     = "enable-protocol-http",
    description = "HTTP support in wxProtocol"
}
newoption
{
    trigger     = "enable-protocol-ftp",
    description = "FTP support in wxProtocol"
}
newoption
{
    trigger     = "enable-protocol-file",
    description = "FILE support in wxProtocol"
}
newoption
{
    trigger     = "enable-threads",
    description = "use threads"
}
newoption
{
    trigger     = "enable-iniconf",
    description = "use wxIniConfig (Win32 only)"
}
newoption
{
    trigger     = "enable-regkey",
    description = "use wxRegKey class (Win32 only)"
}
-- ----------------------------------------------------------------------------
-- Optional "big" GUI features
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "enable-docview",
    description = "use document view architecture"
}
newoption
{
    trigger     = "enable-help",
    description = "use help subsystem"
}
newoption
{
    trigger     = "enable-mshtmlhelp",
    description = "use MS HTML Help (win32)"
}
newoption
{
    trigger     = "enable-html",
    description = "use wxHTML sub-library"
}
newoption
{
    trigger     = "enable-htmlhelp",
    description = "use wxHTML-based help"
}
newoption
{
    trigger     = "enable-xrc",
    description = "use XRC resources sub-library"
}
newoption
{
    trigger     = "enable-aui",
    description = "use AUI docking library"
}
newoption
{
    trigger     = "enable-propgrid",
    description = "use wxPropertyGrid library"
}
newoption
{
    trigger     = "enable-ribbon",
    description = "use wxRibbon library"
}
newoption
{
    trigger     = "enable-stc",
    description = "use wxStyledTextCtrl library"
}
newoption
{
    trigger     = "enable-constraints",
    description = "use layout-constraints system"
}
newoption
{
    trigger     = "enable-loggui",
    description = "use standard GUI logger"
}
newoption
{
    trigger     = "enable-logwin",
    description = "use wxLogWindow"
}
newoption
{
    trigger     = "enable-logdialog",
    description = "use wxLogDialog"
}
newoption
{
    trigger     = "enable-mdi",
    description = "use multiple document interface architecture"
}
newoption
{
    trigger     = "enable-mdidoc",
    description = "use docview architecture with MDI"
}
newoption
{
    trigger     = "enable-mediactrl",
    description = "use wxMediaCtrl class"
}
newoption
{
    trigger     = "enable-gstreamer8",
    description = "force GStreamer 0.8 instead of 0.10 with the wxMediaCtrl class on unix"
}
newoption
{
    trigger     = "enable-richtext",
    description = "use wxRichTextCtrl"
}
newoption
{
    trigger     = "enable-postscript",
    description = "use wxPostscriptDC device context (default for gtk+)"
}
newoption
{
    trigger     = "enable-printarch",
    description = "use printing architecture"
}
newoption
{
    trigger     = "enable-svg",
    description = "use wxSVGFileDC device context"
}
newoption
{
    trigger     = "enable-webkit",
    description = "use wxWebKitCtrl (Mac-only, use wxWebView instead)"
}
newoption
{
    trigger     = "enable-webview",
    description = "use wxWebView library"
}
newoption
{
    trigger     = "enable-graphics_ctx",
    description = "use graphics context 2D drawing API"
}
-- ----------------------------------------------------------------------------
-- IPC &c
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "enable-clipboard",
    description = "use wxClipboard class"
}
newoption
{
    trigger     = "enable-dnd",
    description = "use Drag'n'Drop classes"
}
-- ----------------------------------------------------------------------------
-- Optional GUI controls
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "disable-controls",
    description = "disable compilation of all standard controls"
}
newoption
{
    trigger     = "enable-markup",
    description = "support wxControl::SetLabelMarkup"
}
newoption
{
    trigger     = "enable-accel",
    description = "use accelerators"
}
newoption
{
    trigger     = "enable-animatectrl",
    description = "use wxAnimationCtrl class"
}
newoption
{
    trigger     = "enable-artstd",
    description = "use standard XPM icons in wxArtProvider"
}
newoption
{
    trigger     = "enable-arttango",
    description = "use Tango icons in wxArtProvider"
}
newoption
{
    trigger     = "enable-bannerwindow",
    description = "use wxBannerWindow class"
}
newoption
{
    trigger     = "enable-bmpbutton",
    description = "use wxBitmapButton class"
}
newoption
{
    trigger     = "enable-bmpcombobox",
    description = "use wxBitmapComboBox class"
}
newoption
{
    trigger     = "enable-button",
    description = "use wxButton class"
}
newoption
{
    trigger     = "enable-calendar",
    description = "use wxCalendarCtrl class"
}
newoption
{
    trigger     = "enable-caret",
    description = "use wxCaret class"
}
newoption
{
    trigger     = "enable-checkbox",
    description = "use wxCheckBox class"
}
newoption
{
    trigger     = "enable-checklst",
    description = "use wxCheckListBox (listbox with checkboxes) class"
}
newoption
{
    trigger     = "enable-choice",
    description = "use wxChoice class"
}
newoption
{
    trigger     = "enable-choicebook",
    description = "use wxChoicebook class"
}
newoption
{
    trigger     = "enable-collpane",
    description = "use wxCollapsiblePane class"
}
newoption
{
    trigger     = "enable-colourpicker",
    description = "use wxColourPickerCtrl class"
}
newoption
{
    trigger     = "enable-combobox",
    description = "use wxComboBox class"
}
newoption
{
    trigger     = "enable-comboctrl",
    description = "use wxComboCtrl class"
}
newoption
{
    trigger     = "enable-commandlinkbutton",
    description = "use wxCommmandLinkButton class"
}
newoption
{
    trigger     = "enable-dataviewctrl",
    description = "use wxDataViewCtrl class"
}
newoption
{
    trigger     = "enable-datepick",
    description = "use wxDatePickerCtrl class"
}
newoption
{
    trigger     = "enable-detect_sm",
    description = "use code to detect X11 session manager"
}
newoption
{
    trigger     = "enable-dirpicker",
    description = "use wxDirPickerCtrl class"
}
newoption
{
    trigger     = "enable-display",
    description = "use wxDisplay class"
}
newoption
{
    trigger     = "enable-editablebox",
    description = "use wxEditableListBox class"
}
newoption
{
    trigger     = "enable-filectrl",
    description = "use wxFileCtrl class"
}
newoption
{
    trigger     = "enable-filepicker",
    description = "use wxFilePickerCtrl class"
}
newoption
{
    trigger     = "enable-fontpicker",
    description = "use wxFontPickerCtrl class"
}
newoption
{
    trigger     = "enable-gauge",
    description = "use wxGauge class"
}
newoption
{
    trigger     = "enable-grid",
    description = "use wxGrid class"
}
newoption
{
    trigger     = "enable-headerctrl",
    description = "use wxHeaderCtrl class"
}
newoption
{
    trigger     = "enable-hyperlink",
    description = "use wxHyperlinkCtrl class"
}
newoption
{
    trigger     = "enable-imaglist",
    description = "use wxImageList class"
}
newoption
{
    trigger     = "enable-infobar",
    description = "use wxInfoBar class"
}
newoption
{
    trigger     = "enable-listbook",
    description = "use wxListbook class"
}
newoption
{
    trigger     = "enable-listbox",
    description = "use wxListBox class"
}
newoption
{
    trigger     = "enable-listctrl",
    description = "use wxListCtrl class"
}
newoption
{
    trigger     = "enable-notebook",
    description = "use wxNotebook class"
}
newoption
{
    trigger     = "enable-notifmsg",
    description = "use wxNotificationMessage class"
}
newoption
{
    trigger     = "enable-odcombobox",
    description = "use wxOwnerDrawnComboBox class"
}
newoption
{
    trigger     = "enable-popupwin",
    description = "use wxPopUpWindow class"
}
newoption
{
    trigger     = "enable-radiobox",
    description = "use wxRadioBox class"
}
newoption
{
    trigger     = "enable-radiobtn",
    description = "use wxRadioButton class"
}
newoption
{
    trigger     = "enable-richmsgdlg",
    description = "use wxRichMessageDialog class"
}
newoption
{
    trigger     = "enable-richtooltip",
    description = "use wxRichToolTip class"
}
newoption
{
    trigger     = "enable-rearrangectrl",
    description = "use wxRearrangeList/Ctrl/Dialog"
}
newoption
{
    trigger     = "enable-sash",
    description = "use wxSashWindow class"
}
newoption
{
    trigger     = "enable-scrollbar",
    description = "use wxScrollBar class and scrollable windows"
}
newoption
{
    trigger     = "enable-searchctrl",
    description = "use wxSearchCtrl class"
}
newoption
{
    trigger     = "enable-slider",
    description = "use wxSlider class"
}
newoption
{
    trigger     = "enable-spinbtn",
    description = "use wxSpinButton class"
}
newoption
{
    trigger     = "enable-spinctrl",
    description = "use wxSpinCtrl class"
}
newoption
{
    trigger     = "enable-splitter",
    description = "use wxSplitterWindow class"
}
newoption
{
    trigger     = "enable-statbmp",
    description = "use wxStaticBitmap class"
}
newoption
{
    trigger     = "enable-statbox",
    description = "use wxStaticBox class"
}
newoption
{
    trigger     = "enable-statline",
    description = "use wxStaticLine class"
}
newoption
{
    trigger     = "enable-stattext",
    description = "use wxStaticText class"
}
newoption
{
    trigger     = "enable-statusbar",
    description = "use wxStatusBar class"
}
newoption
{
    trigger     = "enable-taskbaricon",
    description = "use wxTaskBarIcon class"
}
newoption
{
    trigger     = "enable-tbarnative",
    description = "use native wxToolBar class"
}
newoption
{
    trigger     = "enable-textctrl",
    description = "use wxTextCtrl class"
}
newoption
{
    trigger     = "enable-timepick",
    description = "use wxTimePickerCtrl class"
}
newoption
{
    trigger     = "enable-tipwindow",
    description = "use wxTipWindow class"
}
newoption
{
    trigger     = "enable-togglebtn",
    description = "use wxToggleButton class"
}
newoption
{
    trigger     = "enable-toolbar",
    description = "use wxToolBar class"
}
newoption
{
    trigger     = "enable-toolbook",
    description = "use wxToolbook class"
}
newoption
{
    trigger     = "enable-treebook",
    description = "use wxTreebook class"
}
newoption
{
    trigger     = "enable-treectrl",
    description = "use wxTreeCtrl class"
}
newoption
{
    trigger     = "enable-treelist",
    description = "use wxTreeListCtrl class"
}
-- ----------------------------------------------------------------------------
-- Common dialogs
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "enable-commondlg",
    description = "use all common dialogs"
}
newoption
{
    trigger     = "enable-aboutdlg",
    description = "use wxAboutBox"
}
newoption
{
    trigger     = "enable-choicedlg",
    description = "use wxChoiceDialog"
}
newoption
{
    trigger     = "enable-coldlg",
    description = "use wxColourDialog"
}
newoption
{
    trigger     = "enable-dirdlg",
    description = "use wxDirDialog"
}
newoption
{
    trigger     = "enable-filedlg",
    description = "use wxFileDialog"
}
newoption
{
    trigger     = "enable-finddlg",
    description = "use wxFindReplaceDialog"
}
newoption
{
    trigger     = "enable-fontdlg",
    description = "use wxFontDialog"
}
newoption
{
    trigger     = "enable-msgdlg",
    description = "use wxMessageDialog"
}
newoption
{
    trigger     = "enable-numberdlg",
    description = "use wxNumberEntryDialog"
}
newoption
{
    trigger     = "enable-splash",
    description = "use wxSplashScreen"
}
newoption
{
    trigger     = "enable-textdlg",
    description = "use wxTextDialog"
}
newoption
{
    trigger     = "enable-tipdlg",
    description = "use startup tips"
}
newoption
{
    trigger     = "enable-progressdlg",
    description = "use wxProgressDialog"
}
newoption
{
    trigger     = "enable-wizarddlg",
    description = "use wxWizard"
}
-- ----------------------------------------------------------------------------
-- Misc GUI options
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "enable-menus",
    description = "use wxMenu/wxMenuBar/wxMenuItem classes"
}
newoption
{
    trigger     = "enable-miniframe",
    description = "use wxMiniFrame class"
}
newoption
{
    trigger     = "enable-tooltips",
    description = "use wxToolTip class"
}
newoption
{
    trigger     = "enable-splines",
    description = "use spline drawing code"
}
newoption
{
    trigger     = "enable-mousewheel",
    description = "use mousewheel"
}
newoption
{
    trigger     = "enable-validators",
    description = "use wxValidator and derived classes"
}
newoption
{
    trigger     = "enable-busyinfo",
    description = "use wxBusyInfo"
}
newoption
{
    trigger     = "enable-hotkey",
    description = "use wxWindow::RegisterHotKey()"
}
newoption
{
    trigger     = "enable-joystick",
    description = "use wxJoystick"
}
newoption
{
    trigger     = "enable-metafiles",
    description = "use wxMetaFile"
}
newoption
{
    trigger     = "enable-dragimage",
    description = "use wxDragImage"
}
newoption
{
    trigger     = "enable-accessibility",
    description = "enable accessibility support"
}
newoption
{
    trigger     = "enable-uiactionsim",
    description = "use wxUIActionSimulator (experimental)"
}
newoption
{
    trigger     = "enable-dctransform",
    description = "use wxDC::SetTransformMatrix and related"
}
newoption
{
    trigger     = "enable-webviewwebkit",
    description = "use wxWebView WebKit backend"
}
-- ----------------------------------------------------------------------------
-- Support for image formats that do not rely on external library
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "enable-palette",
    description = "use wxPalette class"
}
newoption
{
    trigger     = "enable-image",
    description = "use wxImage class"
}
newoption
{
    trigger     = "enable-gif",
    description = "use gif images (GIF file format)"
}
newoption
{
    trigger     = "enable-pcx",
    description = "use pcx images (PCX file format)"
}
newoption
{
    trigger     = "enable-tga",
    description = "use tga images (TGA file format)"
}
newoption
{
    trigger     = "enable-iff",
    description = "use iff images (IFF file format)"
}
newoption
{
    trigger     = "enable-pnm",
    description = "use pnm images (PNM file format)"
}
newoption
{
    trigger     = "enable-xpm",
    description = "use xpm images (XPM file format)"
}
newoption
{
    trigger     = "enable-ico_cur",
    description = "use Windows ICO and CUR formats"
}
-- ----------------------------------------------------------------------------
-- wxMSW-only options
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "enable-dccache",
    description = "cache temporary wxDC objects (Win32 only)"
}
newoption
{
    trigger     = "enable-ps-in-msw",
    description = "use PS printing in wxMSW (Win32 only)"
}
newoption
{
    trigger     = "enable-ownerdrawn",
    description = "use owner drawn controls (Win32 and OS/2 only)"
}
newoption
{
    trigger     = "enable-uxtheme",
    description = "enable support for Windows XP themed look (Win32 only)"
}
newoption
{
    trigger     = "enable-wxdib",
    description = "use wxDIB class (Win32 only)"
}
newoption
{
    trigger     = "enable-webviewie",
    description = "use wxWebView IE backend (Win32 only)"
}
newoption
{
    trigger     = "enable-autoidman",
    description = "use automatic ids management"
}
-- ----------------------------------------------------------------------------
-- Autoconf
-- ----------------------------------------------------------------------------
newoption
{
    trigger     = "disable-largefile",
    description = "omit support for large files"
}
newoption
{
    trigger     = "disable-gtktest",
    description = "do not try to compile and run a test GTK+ program"
}
newoption
{
    trigger     = "disable-sdltest",
    description = "Do not try to compile and run a test SDL program"
}
newoption
{
    trigger     = "disable-dependency-tracking",
    description = "don't use dependency tracking even if the compiler can"
}
newoption
{
    trigger     = "disable-precomp-headers",
    description = "don't use precompiled headers even if compiler can"
}

-- ----------------------------------------------------------------------------
-- Optional Packages
-- ----------------------------------------------------------------------------
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
