/////////////////////////////////////////////////////////////////////////////
// Name:        wx/xrc/xh_toolpalette.h
// Purpose:     XML resource handler for wxToolPalette
// Author:      Andrea Zanellato
// Created:     2012-11-11
// RCS-ID:      $Id$
// Copyright:   (c) wxWidgets Team
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

#ifndef _WX_XH_TOOLPALETTE_H_
#define _WX_XH_TOOLPALETTE_H_

#include "wx/xrc/xmlres.h"

#if wxUSE_XRC && wxUSE_TOOLPALETTE

class WXDLLIMPEXP_FWD_CORE wxToolPalette;

class WXDLLIMPEXP_XRC wxToolPaletteXmlHandler : public wxXmlResourceHandler
{
public:
    wxToolPaletteXmlHandler();
    virtual wxObject *DoCreateResource();
    virtual bool CanHandle(wxXmlNode *node);

private:
    bool m_isInside;
    wxToolPalette *m_toolpalette;

    wxDECLARE_DYNAMIC_CLASS(wxToolPaletteXmlHandler);
};

#endif // wxUSE_XRC && wxUSE_TOOLPALETTE

#endif // _WX_XH_TOOLPALETTE_H_