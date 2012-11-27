/////////////////////////////////////////////////////////////////////////////
// Name:        src/xrc/xh_toolpalette.cpp
// Purpose:     XML resource handler for wxToolPalette
// Author:      Francesco Montorsi
// Created:     2006-10-27
// RCS-ID:      $Id: xh_toolpalette.cpp 61724 2009-08-21 10:41:26Z VZ $
// Copyright:   (c) 2006 Francesco Montorsi
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

// For compilers that support precompilation, includes "wx.h".
#include "wx/wxprec.h"
#include "defines.h"
#ifdef __BORLANDC__
    #pragma hdrstop
#endif

#if wxUSE_XRC && wxUSE_TOOLPALETTE

#ifndef WX_PRECOMP
    #include "wx/log.h"
#endif

#include "wx/toolpalette.h"
#include "wx/xrc/xh_toolpalette.h"

IMPLEMENT_DYNAMIC_CLASS(wxToolPaletteXmlHandler, wxXmlResourceHandler)

wxToolPaletteXmlHandler::wxToolPaletteXmlHandler()
: wxXmlResourceHandler(), m_isInside(false)
{
    XRC_ADD_STYLE(wxTP_DEFAULT_STYLE);
    AddWindowStyles();
}

wxObject *wxToolPaletteXmlHandler::DoCreateResource()
{
    if (m_class == wxT("panewindow"))   // read the XRC for the pane window
    {
        wxXmlNode *n = GetParamNode(wxT("object"));

        if ( !n )
            n = GetParamNode(wxT("object_ref"));

        if (n)
        {
            bool old_ins = m_isInside;
            m_isInside = false;
            wxObject *item = CreateResFromNode(n, m_toolpalette->GetPane(), NULL);
            m_isInside = old_ins;

            return item;
        }
        else
        {
            ReportError("no control within panewindow");
            return NULL;
        }
    }
    else
    {
        XRC_MAKE_INSTANCE(ctrl, wxToolPalette)

        wxString label = GetParamValue(wxT("label"));
        if (label.empty())
        {
            ReportParamError("label", "label cannot be empty");
            return NULL;
        }

        ctrl->Create(m_parentAsWindow,
                    GetID(),
                    label,
                    GetPosition(), GetSize(),
                    GetStyle(wxT("style"), wxTP_DEFAULT_STYLE),
                    wxDefaultValidator,
                    GetName());

        ctrl->Collapse(GetBool(wxT("collapsed")));
        SetupWindow(ctrl);

        wxToolPalette *old_par = m_toolpalette;
        m_toolpalette = ctrl;
        bool old_ins = m_isInside;
        m_isInside = true;
        CreateChildren(m_toolpalette, true/*only this handler*/);
        m_isInside = old_ins;
        m_toolpalette = old_par;

        return ctrl;
    }
}

bool wxToolPaletteXmlHandler::CanHandle(wxXmlNode *node)
{
    return IsOfClass(node, wxT("wxToolPalette")) ||
            (m_isInside && IsOfClass(node, wxT("panewindow")));
}

#endif // wxUSE_XRC && wxUSE_TOOLPALETTE
