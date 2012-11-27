/////////////////////////////////////////////////////////////////////////////
// Name:        wx/toolpalette.h
// Purpose:     wxToolPalette class interface
// Author:      Andrea Zanellato
// Modified by:
// Created:     2011-10-29
// RCS-ID:      $Id$
// Copyright:   (c) wxWidgets Team
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

#ifndef _WX_TOOLPALETTE_H_BASE_
#define _WX_TOOLPALETTE_H_BASE_

// ----------------------------------------------------------------------------
// headers
// ----------------------------------------------------------------------------

#include "wx/defs.h"

#if wxUSE_TOOLPALETTE

#include "wx/anybutton.h"
#include "wx/bookctrl.h"
#include "wx/tbarbase.h"
#include "wx/withimages.h"
#include "wx/control.h"
//#include "wx/vector.h"

// TODO: Can we use a vector instead wxList?

// A vector of tool palette items
// #define wxToolPaletteItems wxVector<wxToolItem *>;

// ----------------------------------------------------------------------------
// Constants
// ----------------------------------------------------------------------------

extern WXDLLIMPEXP_DATA_CORE(const char) wxToolPalettePageNameStr[];
extern WXDLLIMPEXP_DATA_CORE(const char) wxToolPaletteNameStr[];

// ----------------------------------------------------------------------------
// wxToolPalette:       A tool palette with categories.
//
// wxToolPalettePage:   Used together with wxToolPalette to add wxToolPaletteItems
//                      to a palette like container with different categories
//                      and drag and drop support.
//
// wxToolPaletteItem is a toolpalette tool element.
//
// It has a unique id, the style (telling whether it is a normal button or a
// control), the state (toggled or not, enabled or not) and short and long help
// strings. The default implementations use the short help string for the
// tooltip text which is popped up when the mouse pointer enters the tool and the
// long help string for the applications status bar.
// ----------------------------------------------------------------------------

// Currently only GTK+ 2.20+ has a native implementation.
#if 0 // def __WXGTK__
    #include <gtk/gtk.h>
    #if GTK_CHECK_VERSION(2,20,0) && !defined(__WXUNIVERSAL__)
        #include "wx/gtk/toolpalette.h"
        #define wxHAS_NATIVE_TOOLPALETTE
    #endif // wxGTK2
#endif

// If the generic version is the only one we have, use it.
#ifndef wxHAS_NATIVE_TOOLPALETTE
    #include "wx/generic/toolpalette.h"
    #define wxToolPalettePage wxToolPalettePageGeneric
    #define wxToolPalette     wxToolPaletteGeneric
#endif

#endif // wxUSE_TOOLPALETTE

#endif // _WX_TOOLPALETTE_H_BASE_
