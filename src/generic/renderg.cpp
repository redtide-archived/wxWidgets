///////////////////////////////////////////////////////////////////////////////
// Name:        src/generic/renderg.cpp
// Purpose:     generic implementation of wxRendererNative (for any platform)
// Author:      Vadim Zeitlin
// Modified by:
// Created:     20.07.2003
// Copyright:   (c) 2003 Vadim Zeitlin <vadim@wxwindows.org>
// Licence:     wxWindows licence
///////////////////////////////////////////////////////////////////////////////

// ============================================================================
// declarations
// ============================================================================

// ----------------------------------------------------------------------------
// headers
// ----------------------------------------------------------------------------

// for compilers that support precompilation, includes "wx.h".
#include "wx/wxprec.h"

#ifdef __BORLANDC__
    #pragma hdrstop
#endif

#include "wx/renderer.h"

#ifndef WX_PRECOMP
    #include "wx/string.h"
    #include "wx/dc.h"
    #include "wx/settings.h"
    #include "wx/gdicmn.h"
    #include "wx/module.h"
    #include "wx/control.h"
#endif //WX_PRECOMP

#include "wx/splitter.h"
#include "wx/dcmirror.h"

#ifdef __WXMAC__
    #include "wx/osx/private.h"
#endif

// ----------------------------------------------------------------------------
// wxRendererGeneric: our wxRendererNative implementation
// ----------------------------------------------------------------------------

class WXDLLEXPORT wxRendererGeneric : public wxRendererNative
{
public:
    wxRendererGeneric();

    virtual int  DrawHeaderButton(wxWindow *win,
                                  wxDC& dc,
                                  const wxRect& rect,
                                  int flags = 0,
                                  wxHeaderSortIconType sortArrow = wxHDR_SORT_ICON_NONE,
                                  wxHeaderButtonParams* params = NULL);

    virtual int  DrawHeaderButtonContents(wxWindow *win,
                                          wxDC& dc,
                                          const wxRect& rect,
                                          int flags = 0,
                                          wxHeaderSortIconType sortArrow = wxHDR_SORT_ICON_NONE,
                                          wxHeaderButtonParams* params = NULL);

    virtual int GetHeaderButtonHeight(wxWindow *win);

    virtual int GetHeaderButtonMargin(wxWindow *win);

    virtual void DrawTreeItemButton(wxWindow *win,
                                    wxDC& dc,
                                    const wxRect& rect,
                                    int flags = 0);

    virtual void DrawSplitterBorder(wxWindow *win,
                                    wxDC& dc,
                                    const wxRect& rect,
                                    int flags = 0);

    virtual void DrawSplitterSash(wxWindow *win,
                                  wxDC& dc,
                                  const wxSize& size,
                                  wxCoord position,
                                  wxOrientation orient,
                                  int flags = 0);

    virtual void DrawComboBoxDropButton(wxWindow *win,
                                        wxDC& dc,
                                        const wxRect& rect,
                                        int flags = 0);

    virtual void DrawDropArrow(wxWindow *win,
                               wxDC& dc,
                               const wxRect& rect,
                               int flags = 0);

    virtual void DrawCheckBox(wxWindow *win,
                              wxDC& dc,
                              const wxRect& rect,
                              int flags = 0);

    virtual wxSize GetCheckBoxSize(wxWindow *win);

    virtual void DrawPushButton(wxWindow *win,
                                wxDC& dc,
                                const wxRect& rect,
                                int flags = 0);

    virtual void DrawItemSelectionRect(wxWindow *win,
                                       wxDC& dc,
                                       const wxRect& rect,
                                       int flags = 0);

    virtual void DrawFocusRect(wxWindow* win, wxDC& dc, const wxRect& rect, int flags = 0);

    virtual void DrawChoice(wxWindow* win, wxDC& dc, const wxRect& rect, int flags=0);

    virtual void DrawComboBox(wxWindow* win, wxDC& dc, const wxRect& rect, int flags=0);

    virtual void DrawTextCtrl(wxWindow* win, wxDC& dc, const wxRect& rect, int flags=0);

    virtual void DrawRadioBitmap(wxWindow* win, wxDC& dc, const wxRect& rect, int flags=0);

#ifdef wxHAS_DRAW_TITLE_BAR_BITMAP
    virtual void DrawTitleBarBitmap(wxWindow *win,
                                    wxDC& dc,
                                    const wxRect& rect,
                                    wxTitleBarButton button,
                                    int flags = 0);
#endif // wxHAS_DRAW_TITLE_BAR_BITMAP

    virtual void DrawToolBar(wxWindow *window,
                             wxDC& dc,
                             const wxRect& rect,
                             wxOrientation orient = wxHORIZONTAL,
                             int flags = 0);

    virtual void DrawToolButton(wxWindow *window,
                                wxDC& dc,
                                const wxRect& rect,
                                const wxString& label,
                                const wxBitmap& bitmap = wxNullBitmap,
                                wxOrientation orient = wxHORIZONTAL,
                                bool hasDropdown = false,
                                int flags = 0);

    virtual void DrawToolDropButton(wxWindow *window,
                                    wxDC& dc,
                                    const wxRect& rect,
                                    int flags = 0);

    virtual void DrawToolMenuButton(wxWindow *window,
                                    wxDC& dc,
                                    const wxRect& rect,
                                    int flags = 0);

    virtual void DrawToolSeparator(wxWindow *window,
                                   wxDC& dc,
                                   const wxRect& rect,
                                   wxOrientation orient = wxHORIZONTAL,
                                   int spacerWidth = 0,
                                   int flags = 0);

    virtual void DrawGripper(wxWindow *window,
                             wxDC& dc,
                             const wxRect& rect,
                             wxOrientation orient = wxHORIZONTAL,
                             int flags = 0);

    virtual void DrawTab(wxWindow *window,
                         wxDC& dc,
                         const wxRect& rect,
                         const wxString& label,
                         const wxBitmap& bitmap = wxNullBitmap,
                         wxDirection direction = wxTOP,
                         int flags = 0);

    virtual wxSplitterRenderParams GetSplitterParams(const wxWindow *win);

    virtual wxRendererVersion GetVersion() const
    {
        return wxRendererVersion(wxRendererVersion::Current_Version,
                                 wxRendererVersion::Current_Age);
    }


    // Cleanup by deleting standard renderer
    static void Cleanup();

    // Get the generic object
    static wxRendererGeneric* DoGetGeneric();

protected:
    // draw the rectange using the first pen for the left and top sides and
    // the second one for the bottom and right ones
    void DrawShadedRect(wxDC& dc, wxRect *rect,
                        const wxPen& pen1, const wxPen& pen2);

    // the standard pens
    wxPen m_penBlack,
          m_penDarkGrey,
          m_penLightGrey,
          m_penHighlight;

    static wxRendererGeneric* sm_rendererGeneric;
};

// ============================================================================
// wxRendererGeneric implementation
// ============================================================================

// Get the generic object
wxRendererGeneric* wxRendererGeneric::DoGetGeneric()
{
    if (!sm_rendererGeneric)
        sm_rendererGeneric = new wxRendererGeneric;
    return sm_rendererGeneric;
}

// ----------------------------------------------------------------------------
// wxRendererGeneric creation
// ----------------------------------------------------------------------------

/* static */
wxRendererNative& wxRendererNative::GetGeneric()
{
    return * wxRendererGeneric::DoGetGeneric();
}

void wxRendererGeneric::Cleanup()
{
    wxDELETE(sm_rendererGeneric);
}

wxRendererGeneric* wxRendererGeneric::sm_rendererGeneric = NULL;

wxRendererGeneric::wxRendererGeneric()
    : m_penBlack(wxSystemSettings::GetColour(wxSYS_COLOUR_3DDKSHADOW)),
      m_penDarkGrey(wxSystemSettings::GetColour(wxSYS_COLOUR_3DSHADOW)),
      m_penLightGrey(wxSystemSettings::GetColour(wxSYS_COLOUR_3DFACE)),
      m_penHighlight(wxSystemSettings::GetColour(wxSYS_COLOUR_3DHIGHLIGHT))
{
}

// ----------------------------------------------------------------------------
// wxRendererGeneric helpers
// ----------------------------------------------------------------------------

void
wxRendererGeneric::DrawShadedRect(wxDC& dc,
                                  wxRect *rect,
                                  const wxPen& pen1,
                                  const wxPen& pen2)
{
    // draw the rectangle
    dc.SetPen(pen1);
    dc.DrawLine(rect->GetLeft(), rect->GetTop(),
                rect->GetLeft(), rect->GetBottom());
    dc.DrawLine(rect->GetLeft() + 1, rect->GetTop(),
                rect->GetRight(), rect->GetTop());
    dc.SetPen(pen2);
    dc.DrawLine(rect->GetRight(), rect->GetTop(),
                rect->GetRight(), rect->GetBottom());
    dc.DrawLine(rect->GetLeft(), rect->GetBottom(),
                rect->GetRight() + 1, rect->GetBottom());

    // adjust the rect
    rect->Inflate(-1);
}

// ----------------------------------------------------------------------------
// tree/list ctrl drawing
// ----------------------------------------------------------------------------

int
wxRendererGeneric::DrawHeaderButton(wxWindow* win,
                                    wxDC& dc,
                                    const wxRect& rect,
                                    int flags,
                                    wxHeaderSortIconType sortArrow,
                                    wxHeaderButtonParams* params)
{
    const wxCoord x = rect.x,
                  y = rect.y,
                  w = rect.width,
                  h = rect.height;

    dc.SetBrush(wxBrush(wxSystemSettings::GetColour(wxSYS_COLOUR_3DFACE)));
    dc.SetPen(*wxTRANSPARENT_PEN);
    dc.DrawRectangle(rect);

    dc.SetBrush(*wxTRANSPARENT_BRUSH);

    dc.SetPen(m_penBlack);
    dc.DrawLine( x+w-1, y, x+w-1, y+h );  // right (outer)
    dc.DrawLine( x, y+h-1, x+w, y+h-1 );  // bottom (outer)

    dc.SetPen(m_penDarkGrey);
    dc.DrawLine( x+w-2, y+1, x+w-2, y+h-1 );  // right (inner)
    dc.DrawLine( x+1, y+h-2, x+w-1, y+h-2 );  // bottom (inner)

    dc.SetPen(m_penHighlight);
    dc.DrawLine( x, y, x, y+h-1 ); // left (outer)
    dc.DrawLine( x, y, x+w-1, y ); // top (outer)

    return DrawHeaderButtonContents(win, dc, rect, flags, sortArrow, params);
}


int
wxRendererGeneric::DrawHeaderButtonContents(wxWindow *win,
                                            wxDC& dc,
                                            const wxRect& rect,
                                            int flags,
                                            wxHeaderSortIconType sortArrow,
                                            wxHeaderButtonParams* params)
{
    int labelWidth = 0;

    // Mark this item as selected.  For the generic version we'll just draw an
    // underline
    if ( flags & wxCONTROL_SELECTED )
    {
        // draw a line at the bottom of the header button, overlaying the
        // native hot-tracking line (on XP)
        const int penwidth = 3;
        int y = rect.y + rect.height + 1 - penwidth;
        wxColour c = (params && params->m_selectionColour.IsOk()) ?
            params->m_selectionColour : wxColour(0x66, 0x66, 0x66);
        wxPen pen(c, penwidth);
        pen.SetCap(wxCAP_BUTT);
        dc.SetPen(pen);
        dc.DrawLine(rect.x, y, rect.x + rect.width, y);
    }

    // Draw an up or down arrow
    int arrowSpace = 0;
    if (sortArrow != wxHDR_SORT_ICON_NONE )
    {
        wxRect ar = rect;

        // make a rect for the arrow
        ar.height = 4;
        ar.width = 8;
        ar.y += (rect.height - ar.height)/2;
        ar.x = ar.x + rect.width - 3*ar.width/2;
        arrowSpace = 3*ar.width/2; // space to preserve when drawing the label

        wxPoint triPt[3];
        if ( sortArrow & wxHDR_SORT_ICON_UP )
        {
            triPt[0].x = ar.width / 2;
            triPt[0].y = 0;
            triPt[1].x = ar.width;
            triPt[1].y = ar.height;
            triPt[2].x = 0;
            triPt[2].y = ar.height;
        }
        else
        {
            triPt[0].x = 0;
            triPt[0].y = 0;
            triPt[1].x = ar.width;
            triPt[1].y = 0;
            triPt[2].x = ar.width / 2;
            triPt[2].y = ar.height;
        }

        wxColour c = (params && params->m_arrowColour.IsOk()) ?
            params->m_arrowColour : wxSystemSettings::GetColour(wxSYS_COLOUR_3DSHADOW);

        wxDCPenChanger setPen(dc, c);
        wxDCBrushChanger setBrush(dc, c);

        wxDCClipper clip(dc, rect);
        dc.DrawPolygon( 3, triPt, ar.x, ar.y);
    }
    labelWidth += arrowSpace;

    int bmpWidth = 0;

    // draw the bitmap if there is one
    if ( params && params->m_labelBitmap.IsOk() )
    {
        int w = params->m_labelBitmap.GetWidth();
        int h = params->m_labelBitmap.GetHeight();

        const int margin = 1; // an extra pixel on either side of the bitmap

        bmpWidth = w + 2*margin;
        labelWidth += bmpWidth;

        int x = rect.x + margin;
        const int y = rect.y + wxMax(1, (rect.height - h) / 2);

        const int extraSpace = rect.width - labelWidth;
        if ( params->m_labelText.empty() && extraSpace > 0 )
        {
            // use the alignment flags
            switch (params->m_labelAlignment)
            {
                default:
                case wxALIGN_LEFT:
                    break;

                case wxALIGN_CENTER:
                    x += extraSpace/2;
                    break;

                case wxALIGN_RIGHT:
                    x += extraSpace;
                    break;
            }
        }

        wxDCClipper clip(dc, rect);
        dc.DrawBitmap(params->m_labelBitmap, x, y, true);
    }

    // Draw a label if one is given
    if ( params && !params->m_labelText.empty() )
    {
        const int margin = 5;   // number of pixels to reserve on either side of the label
        labelWidth += 2*margin;

        wxFont font  = params->m_labelFont.IsOk() ?
            params->m_labelFont : win->GetFont();
        wxColour clr = params->m_labelColour.IsOk() ?
            params->m_labelColour : win->GetForegroundColour();

        wxString label( params->m_labelText );

        dc.SetFont(font);
        dc.SetTextForeground(clr);
        dc.SetBackgroundMode(wxBRUSHSTYLE_TRANSPARENT);

        int tw, th, td;
        dc.GetTextExtent( label, &tw, &th, &td);

        int x = rect.x + bmpWidth + margin;
        const int y = rect.y + wxMax(0, (rect.height - (th+td)) / 2);

        // truncate and add an ellipsis (...) if the text is too wide.
        const int availWidth = rect.width - labelWidth;
#if wxUSE_CONTROLS
        if ( tw > availWidth )
        {
            label = wxControl::Ellipsize(label,
                                         dc,
                                         wxELLIPSIZE_END,
                                         availWidth,
                                         wxELLIPSIZE_FLAGS_NONE);
            tw = dc.GetTextExtent(label).x;
        }
        else // enough space, we can respect alignment
#endif // wxUSE_CONTROLS
        {
            switch (params->m_labelAlignment)
            {
                default:
                case wxALIGN_LEFT:
                    break;

                case wxALIGN_CENTER:
                    x += (availWidth - tw)/2;
                    break;

                case wxALIGN_RIGHT:
                    x += availWidth - tw;
                    break;
            }
        }

        dc.DrawText(label, x, y);

        labelWidth += tw;
    }

    return labelWidth;
}


int wxRendererGeneric::GetHeaderButtonHeight(wxWindow *win)
{
    // Copied and adapted from src/generic/listctrl.cpp
    const int HEADER_OFFSET_Y = 1;
    const int EXTRA_HEIGHT = 4;

    int w=0, h=14, d=0;
    if (win)
        win->GetTextExtent(wxT("Hg"), &w, &h, &d);

    return h + d + 2 * HEADER_OFFSET_Y + EXTRA_HEIGHT;
}

int wxRendererGeneric::GetHeaderButtonMargin(wxWindow *WXUNUSED(win))
{
    return 5;
}

// From wxAuiDefaultToolBarArt
static wxColour GetBaseColour()
{
#if defined( __WXMAC__ ) && wxOSX_USE_COCOA_OR_CARBON
    wxColour baseColour =
    wxColour(wxMacCreateCGColorFromHITheme(kThemeBrushToolbarBackground));
#else
    wxColour baseColour = wxSystemSettings::GetColour(wxSYS_COLOUR_3DFACE);
#endif

    // the baseColour is too pale to use as our base colour,
    // so darken it a bit --
    if ((255-baseColour.Red()) + (255-baseColour.Green()) +
        (255-baseColour.Blue()) < 60)
    {
        baseColour = baseColour.ChangeLightness(92);
    }

    return baseColour;
}

void wxRendererGeneric::DrawToolBar(wxWindow * WXUNUSED(window),
                                    wxDC& dc,
                                    const wxRect& rect,
                                    wxOrientation WXUNUSED(orient),
                                    int WXUNUSED(flags))
{
    wxColour baseColour  = GetBaseColour();
    wxColour startColour = baseColour.ChangeLightness(150);
    wxColour endColour   = baseColour.ChangeLightness(90);
    dc.GradientFillLinear(rect, startColour, endColour, wxSOUTH);
}

void wxRendererGeneric::DrawToolButton( wxWindow * WXUNUSED(window),
                                        wxDC& dc,
                                        const wxRect& rect,
                                        const wxString& WXUNUSED(label),
                                        const wxBitmap& WXUNUSED(bitmap),
                                        wxOrientation WXUNUSED(orient),
                                        bool WXUNUSED(hasDropdown),
                                        int flags)
{
    if (!(flags & wxCONTROL_DISABLED))
    {
        wxColour highlightColour =
        wxSystemSettings::GetColour(wxSYS_COLOUR_HIGHLIGHT);

        dc.SetPen(wxPen(highlightColour));

        if (flags & wxCONTROL_PRESSED)
        {
            dc.SetBrush(wxBrush(highlightColour.ChangeLightness(150)));
            dc.DrawRectangle(rect);
        }
        else if (flags & wxCONTROL_CURRENT)
        {
            dc.SetBrush(wxBrush(highlightColour.ChangeLightness(170)));
            dc.DrawRectangle(rect);
        }
        else if (flags & wxCONTROL_CHECKED)
        {
            dc.SetBrush(wxBrush(highlightColour.ChangeLightness(180)));
            dc.DrawRectangle(rect);
        }
    }
}

void wxRendererGeneric::DrawToolDropButton(wxWindow *window,
                                           wxDC& dc,
                                           const wxRect& rect,
                                           int flags)
{
    DrawToolButton(window, dc, rect, wxString(), wxBitmap(), wxHORIZONTAL, true, flags);
    DrawDropArrow(window, dc, rect, flags);
}

void wxRendererGeneric::DrawToolMenuButton(wxWindow * window,
                                           wxDC& dc,
                                           const wxRect& rect,
                                           int flags)
{
    DrawToolButton(window, dc, rect, wxString(), wxBitmap(), wxHORIZONTAL, false, flags);

    wxRect arrowRect
    (
        rect.GetX() + (rect.GetWidth()  /3 *2),
        rect.GetY() + (rect.GetHeight() /3),
        rect.GetWidth()  / 3,
        rect.GetHeight() / 3
    );

    DrawDropArrow(window, dc, arrowRect, flags);
}

void wxRendererGeneric::DrawToolSeparator(wxWindow * WXUNUSED(window),
                                          wxDC& dc,
                                          const wxRect& rect,
                                          wxOrientation orient,
                                          int WXUNUSED(spacerWidth),
                                          int WXUNUSED(flags))
{
    bool horizontal = (orient == wxHORIZONTAL);

    wxRect _rect = rect;

    if (horizontal)
    {
        _rect.y += (_rect.height/2);
        _rect.height = 1;
        int new_width = (_rect.width*3)/4;
        _rect.x += (_rect.width/2) - (new_width/2);
        _rect.width = new_width;
    }
    else
    {
        _rect.x += (_rect.width/2);
        _rect.width = 1;
        int new_height = (_rect.height*3)/4;
        _rect.y += (_rect.height/2) - (new_height/2);
        _rect.height = new_height;
    }

    wxColour baseColour  = GetBaseColour();
    wxColour startColour = baseColour.ChangeLightness(80);
    wxColour endColour   = baseColour.ChangeLightness(80);
    dc.GradientFillLinear(_rect, startColour, endColour,
                          horizontal ? wxEAST : wxSOUTH);
}

void wxRendererGeneric::DrawGripper(wxWindow * WXUNUSED(window),
                                    wxDC& dc,
                                    const wxRect& rect,
                                    wxOrientation orient,
                                    int WXUNUSED(flags))
{
    wxColor baseColour = GetBaseColour();
    wxColor darkColour1 = baseColour.ChangeLightness(60);
    wxColor darkColour2 = baseColour.ChangeLightness(40);

    int i = 0;
    while (1)
    {
        int x, y;

        if (orient == wxHORIZONTAL)
        {
            x = rect.GetX() + (i*4) + 4;
            y = rect.GetY() + 4;
            if (x > (rect.GetX() + rect.GetWidth() -4))
                break;
        }
        else
        {
            x = rect.GetX() + 4;
            y = rect.GetY() + (i*4) + 4;
            if (y > (rect.GetY() + rect.GetHeight() -4))
                break;
        }

        dc.SetPen(wxPen(darkColour2));
        dc.DrawPoint(x, y);
        dc.SetPen(wxPen(darkColour1));
        dc.DrawPoint(x, y+1);
        dc.DrawPoint(x+1, y);
        dc.SetPen(*wxWHITE_PEN);
        dc.DrawPoint(x+2, y+1);
        dc.DrawPoint(x+2, y+2);
        dc.DrawPoint(x+1, y+2);

        i++;
    }
}

void wxRendererGeneric::DrawTab(wxWindow * WXUNUSED(window),
                                wxDC& dc,
                                const wxRect& rect,
                                const wxString& WXUNUSED(label),
                                const wxBitmap& WXUNUSED(bitmap),
                                wxDirection direction,
                                int flags)
{
    wxPoint  borderPoints[6];
    wxColour baseColour   = GetBaseColour();
    wxColour borderColour = baseColour.ChangeLightness(75);

    if( direction == wxBOTTOM )
    {
        borderPoints[0] = wxPoint(rect.GetX(), rect.GetY());

        borderPoints[1] = wxPoint(rect.GetX(),
                                  rect.GetY() + rect.GetHeight() - 6);

        borderPoints[2] = wxPoint(rect.GetX() + 2,
                                  rect.GetY() + rect.GetHeight() - 4);

        borderPoints[3] = wxPoint(rect.GetX() + rect.GetWidth()  - 2,
                                  rect.GetY() + rect.GetHeight() - 4);

        borderPoints[4] = wxPoint(rect.GetX() + rect.GetWidth(),
                                  rect.GetY() + rect.GetHeight() - 6);

        borderPoints[5] = wxPoint(rect.GetX() + rect.GetWidth(), rect.GetY());
    }
    else // if( direction == wxTOP )
    {
        borderPoints[0] = wxPoint(rect.GetX(),
                                  rect.GetY() + rect.GetHeight() - 4);

        borderPoints[1] = wxPoint(rect.GetX(), rect.GetY() + 2);

        borderPoints[2] = wxPoint(rect.GetX() + 2, rect.GetY());

        borderPoints[3] = wxPoint(rect.GetX() + rect.GetWidth() - 2,
                                  rect.GetY());

        borderPoints[4] = wxPoint(rect.GetX() + rect.GetWidth(),
                                  rect.GetY() + 2);

        borderPoints[5] = wxPoint(rect.GetX() + rect.GetWidth(),
                                  rect.GetY() + rect.GetHeight() - 4);
    }
    // TODO: else if( direction == wxLEFT ) {}
    // TODO: else if( direction == wxRIGHT ) {}

    if( flags & wxCONTROL_SELECTED ) // Draw active tab
    {
        // Draw base background color
        wxRect r(rect.GetX(), rect.GetY(), rect.GetWidth(), rect.GetHeight());

        wxColour activeColour = GetBaseColour();

        dc.SetPen(wxPen(activeColour));
        dc.SetBrush(wxBrush(activeColour));
        dc.DrawRectangle(r.x+1, r.y+1, r.width-1, r.height-4);

        // This white helps fill out the gradient at the top of the tab
        dc.SetPen(*wxWHITE_PEN);
        dc.SetBrush(*wxWHITE_BRUSH);
        dc.DrawRectangle(r.GetX() + 2, r.GetY() + 1,
                         r.GetWidth() - 3, r.GetHeight() - 4);

        // These two points help the rounded corners appear more antialiased
        dc.SetPen(wxPen(activeColour));
        dc.DrawPoint(r.GetX() + 2, r.GetY() + 1);
        dc.DrawPoint(r.GetX() + r.GetWidth() - 2, r.GetY() + 1);

        // Set rectangle down a bit for gradient drawing
        r.SetX(r.GetX() + 2);
        r.SetHeight(r.GetHeight() / 2);
        r.SetWidth(r.GetWidth() - 3);
        r.SetY(r.GetY() + r.GetHeight() - 2);

        // Draw gradient background
        dc.GradientFillLinear(r, activeColour, *wxWHITE, wxNORTH);
    }
    else // Draw inactive tab
    {
        wxRect r(rect.GetX(), rect.GetY() + 1,
                 rect.GetWidth(), rect.GetHeight() - 3);

        // Start the gradent up a bit and leave the inside border inset
        // by a pixel for a 3D look.  Only the top half of the inactive
        // tab will have a slight gradient
        r.SetX(r.GetX() + 3);
        r.SetY(r.GetY() + 1);
        r.SetWidth(r.GetWidth() - 4);
        r.SetHeight((r.GetHeight() / 2) - 1);

        // -- Draw top gradient fill for glossy look
        wxColor topColour    = baseColour;
        wxColor bottomColour = topColour.ChangeLightness(160);
        dc.GradientFillLinear(r, bottomColour, topColour, wxNORTH);

        r.SetY((r.GetY() + r.GetHeight()) - 1);

        // -- Draw bottom fill for glossy look
        dc.GradientFillLinear(r, baseColour, baseColour, wxSOUTH);
    }

    // Draw tab outline
    dc.SetPen(wxPen(borderColour));
    dc.SetBrush(*wxTRANSPARENT_BRUSH);
    dc.DrawPolygon(WXSIZEOF(borderPoints), borderPoints);

    // There are two horizontal grey lines at the bottom of the tab control,
    // this gets rid of the top one of those lines in the tab control
    if( flags & wxCONTROL_SELECTED )
    {
        if( direction == wxBOTTOM )
        {
            dc.SetPen(wxPen(baseColour.ChangeLightness(170)));
        }
        // TODO: else if( direction == wxLEFT ) {}
        // TODO: else if( direction == wxRIGHT ) {}
        else // if( direction == wxTOP )
        {
            dc.SetPen(wxPen(baseColour));
        }

        dc.DrawLine(borderPoints[0].x + 1, borderPoints[0].y,
                    borderPoints[5].x,     borderPoints[5].y);
    }
}

// draw the plus or minus sign
void
wxRendererGeneric::DrawTreeItemButton(wxWindow * WXUNUSED(win),
                                      wxDC& dc,
                                      const wxRect& rect,
                                      int flags)
{
    // store settings
    wxDCPenChanger penChanger(dc, *wxGREY_PEN);
    wxDCBrushChanger brushChanger(dc, *wxWHITE_BRUSH);

    dc.DrawRectangle(rect);

    // black lines
    const wxCoord xMiddle = rect.x + rect.width/2;
    const wxCoord yMiddle = rect.y + rect.height/2;

    // half of the length of the horz lines in "-" and "+"
    const wxCoord halfWidth = rect.width/2 - 2;
    dc.SetPen(*wxBLACK_PEN);
    dc.DrawLine(xMiddle - halfWidth, yMiddle,
                xMiddle + halfWidth + 1, yMiddle);

    if ( !(flags & wxCONTROL_EXPANDED) )
    {
        // turn "-" into "+"
        const wxCoord halfHeight = rect.height/2 - 2;
        dc.DrawLine(xMiddle, yMiddle - halfHeight,
                    xMiddle, yMiddle + halfHeight + 1);
    }
}

// ----------------------------------------------------------------------------
// sash drawing
// ----------------------------------------------------------------------------

wxSplitterRenderParams
wxRendererGeneric::GetSplitterParams(const wxWindow *win)
{
    // see below
    wxCoord sashWidth,
            border;

    if ( win->HasFlag(wxSP_3DSASH) )
        sashWidth = 7;
    else if ( win->HasFlag(wxSP_NOSASH) )
        sashWidth = 0;
    else // no 3D effect
        sashWidth = 3;

    if ( win->HasFlag(wxSP_3DBORDER) )
        border = 2;
    else // no 3D effect
        border = 0;

    return wxSplitterRenderParams(sashWidth, border, false);
}

void
wxRendererGeneric::DrawSplitterBorder(wxWindow *win,
                                      wxDC& dc,
                                      const wxRect& rectOrig,
                                      int WXUNUSED(falgs))
{
    if ( win->HasFlag(wxSP_3DBORDER) )
    {
        wxRect rect = rectOrig;
        DrawShadedRect(dc, &rect, m_penDarkGrey, m_penHighlight);
        DrawShadedRect(dc, &rect, m_penBlack, m_penLightGrey);
    }
}

void
wxRendererGeneric::DrawSplitterSash(wxWindow *win,
                                    wxDC& dcReal,
                                    const wxSize& sizeReal,
                                    wxCoord position,
                                    wxOrientation orient,
                                    int WXUNUSED(flags))
{
    // to avoid duplicating the same code for horizontal and vertical sashes,
    // simply mirror the DC instead if needed (i.e. if horz splitter)
    wxMirrorDC dc(dcReal, orient != wxVERTICAL);
    wxSize size = dc.Reflect(sizeReal);


    // we draw a Win32-like grey sash with possible 3D border here:
    //
    //   ---- this is position
    //  /
    // v
    // dWGGGDd
    // GWGGGDB
    // GWGGGDB  where G is light grey (face)
    // GWGGGDB        W    white      (light)
    // GWGGGDB        D    dark grey  (shadow)
    // GWGGGDB        B    black      (dark shadow)
    // GWGGGDB
    // GWGGGDB  and lower letters are our border (already drawn)
    // GWGGGDB
    // wWGGGDd
    //
    // only the middle 3 columns are drawn unless wxSP_3D is specified

    const wxCoord h = size.y;
    wxCoord offset = 0;

    // If we're drawing the border, draw the sash 3d lines shorter
    if ( win->HasFlag(wxSP_3DBORDER) )
    {
        offset = 1;
    }

    dc.SetPen(*wxTRANSPARENT_PEN);
    dc.SetBrush(wxBrush(wxSystemSettings::GetColour(wxSYS_COLOUR_3DFACE)));

    if ( win->HasFlag(wxSP_3DSASH) )
    {
        // Draw the 3D sash
        dc.DrawRectangle(position + 2, 0, 3, h);

        dc.SetPen(m_penLightGrey);
        dc.DrawLine(position, offset, position, h - offset);

        dc.SetPen(m_penHighlight);
        dc.DrawLine(position + 1, 0, position + 1, h);

        dc.SetPen(m_penDarkGrey);
        dc.DrawLine(position + 5, 0, position + 5, h);

        dc.SetPen(m_penBlack);
        dc.DrawLine(position + 6, offset, position + 6, h - offset);
    }
    else
    {
        // Draw a flat sash
        dc.DrawRectangle(position, 0, 3, h);
    }
}

// ----------------------------------------------------------------------------
// button drawing
// ----------------------------------------------------------------------------

void
wxRendererGeneric::DrawComboBoxDropButton(wxWindow *win,
                                          wxDC& dc,
                                          const wxRect& rect,
                                          int flags)
{
    DrawPushButton(win,dc,rect,flags);
    DrawDropArrow(win,dc,rect,flags);
}

void
wxRendererGeneric::DrawDropArrow(wxWindow *win,
                                 wxDC& dc,
                                 const wxRect& rect,
                                 int WXUNUSED(flags))
{
    // This generic implementation should be good
    // enough for Windows platforms (including XP).

    int arrowHalf = rect.width/5;
    int rectMid = rect.width / 2;
    int arrowTopY = (rect.height/2) - (arrowHalf/2);

    // This should always result in arrow with odd width.
    wxPoint pt[] =
    {
        wxPoint(rectMid - arrowHalf, arrowTopY),
        wxPoint(rectMid + arrowHalf, arrowTopY),
        wxPoint(rectMid, arrowTopY + arrowHalf)
    };
    dc.SetBrush(wxBrush(win->GetForegroundColour()));
    dc.SetPen(wxPen(win->GetForegroundColour()));
    dc.DrawPolygon(WXSIZEOF(pt), pt, rect.x, rect.y);
}

void
wxRendererGeneric::DrawCheckBox(wxWindow *WXUNUSED(win),
                                wxDC& dc,
                                const wxRect& rect,
                                int flags)
{
    dc.SetPen(*(flags & wxCONTROL_DISABLED ? wxGREY_PEN : wxBLACK_PEN));
    dc.SetBrush( *wxTRANSPARENT_BRUSH );
    dc.DrawRectangle(rect);

    if ( flags & wxCONTROL_CHECKED )
    {
        dc.DrawCheckMark(rect.Deflate(2, 2));
    }
}

wxSize wxRendererGeneric::GetCheckBoxSize(wxWindow *WXUNUSED(win))
{
    return wxSize(16, 16);
}

void
wxRendererGeneric::DrawPushButton(wxWindow *win,
                                  wxDC& dc,
                                  const wxRect& rect,
                                  int flags)
{
    // Don't try anything too fancy. It'll just turn out looking
    // out-of-place on most platforms.
    wxColour bgCol = flags & wxCONTROL_DISABLED ?
                        wxSystemSettings::GetColour(wxSYS_COLOUR_BTNFACE) :
                        win->GetBackgroundColour();
    dc.SetBrush(wxBrush(bgCol));
    dc.SetPen(wxPen(bgCol));
    dc.DrawRectangle(rect);
}

void
wxRendererGeneric::DrawItemSelectionRect(wxWindow * win,
                                         wxDC& dc,
                                         const wxRect& rect,
                                         int flags)
{
    wxBrush brush;
    if ( flags & wxCONTROL_SELECTED )
    {
        if ( flags & wxCONTROL_FOCUSED )
        {
            brush = wxBrush(wxSystemSettings::GetColour(wxSYS_COLOUR_HIGHLIGHT));
        }
        else // !focused
        {
            brush = wxBrush(wxSystemSettings::GetColour(wxSYS_COLOUR_BTNSHADOW));
        }
    }
    else // !selected
    {
        brush = *wxTRANSPARENT_BRUSH;
    }

    dc.SetBrush(brush);
    if ((flags & wxCONTROL_CURRENT) && (flags & wxCONTROL_FOCUSED)
#if defined( __WXMAC__ ) && !defined(__WXUNIVERSAL__) && wxOSX_USE_CARBON
                && IsControlActive( (ControlRef)win->GetHandle() )
#endif
    )
        dc.SetPen( *wxBLACK_PEN );
    else
        dc.SetPen( *wxTRANSPARENT_PEN );

    dc.DrawRectangle( rect );

    // it's unused everywhere except in wxOSX/Carbon
    wxUnusedVar(win);
}

void
wxRendererGeneric::DrawFocusRect(wxWindow* WXUNUSED(win), wxDC& dc, const wxRect& rect, int WXUNUSED(flags))
{
    // draw the pixels manually because the "dots" in wxPen with wxDOT style
    // may be short traits and not really dots
    //
    // note that to behave in the same manner as DrawRect(), we must exclude
    // the bottom and right borders from the rectangle
    wxCoord x1 = rect.GetLeft(),
            y1 = rect.GetTop(),
            x2 = rect.GetRight(),
            y2 = rect.GetBottom();

    dc.SetPen(m_penBlack);

#ifdef __WXMAC__
    dc.SetLogicalFunction(wxCOPY);
#else
    // this seems to be closer than what Windows does than wxINVERT although
    // I'm still not sure if it's correct
    dc.SetLogicalFunction(wxAND_REVERSE);
#endif

    wxCoord z;
    for ( z = x1 + 1; z < x2; z += 2 )
        dc.DrawPoint(z, rect.GetTop());

    wxCoord shift = z == x2 ? 0 : 1;
    for ( z = y1 + shift; z < y2; z += 2 )
        dc.DrawPoint(x2, z);

    shift = z == y2 ? 0 : 1;
    for ( z = x2 - shift; z > x1; z -= 2 )
        dc.DrawPoint(z, y2);

    shift = z == x1 ? 0 : 1;
    for ( z = y2 - shift; z > y1; z -= 2 )
        dc.DrawPoint(x1, z);

    dc.SetLogicalFunction(wxCOPY);
}

void wxRendererGeneric::DrawChoice(wxWindow* WXUNUSED(win), wxDC& WXUNUSED(dc),
                           const wxRect& WXUNUSED(rect), int WXUNUSED(flags))
{
    wxFAIL_MSG("UNIMPLEMENTED: wxRendererGeneric::DrawChoice");
}

void wxRendererGeneric::DrawComboBox(wxWindow* WXUNUSED(win), wxDC& WXUNUSED(dc),
                           const wxRect& WXUNUSED(rect), int WXUNUSED(flags))
{
    wxFAIL_MSG("UNIMPLEMENTED: wxRendererGeneric::DrawComboBox");
}

void wxRendererGeneric::DrawRadioBitmap(wxWindow* WXUNUSED(win), wxDC& WXUNUSED(dc),
                           const wxRect& WXUNUSED(rect), int WXUNUSED(flags))
{
    wxFAIL_MSG("UNIMPLEMENTED: wxRendererGeneric::DrawRadioBitmap");
}

void wxRendererGeneric::DrawTextCtrl(wxWindow* WXUNUSED(win), wxDC& WXUNUSED(dc),
                           const wxRect& WXUNUSED(rect), int WXUNUSED(flags))
{
    wxFAIL_MSG("UNIMPLEMENTED: wxRendererGeneric::DrawTextCtrl");
}

#ifdef wxHAS_DRAW_TITLE_BAR_BITMAP

void wxRendererGeneric::DrawTitleBarBitmap(wxWindow * WXUNUSED(win),
                                           wxDC& WXUNUSED(dc),
                                           const wxRect& WXUNUSED(rect),
                                           wxTitleBarButton WXUNUSED(button),
                                           int WXUNUSED(flags))
{
    // no need to fail here, if wxHAS_DRAW_TITLE_BAR_BITMAP is defined this
    // will be implemented in the native renderer and this version is never
    // going to be used -- but we still need to define it to allow
    // instantiation of this class (which would have been pure virtual
    // otherwise)
}

#endif // wxHAS_DRAW_TITLE_BAR_BITMAP


// ----------------------------------------------------------------------------
// A module to allow cleanup of generic renderer.
// ----------------------------------------------------------------------------

class wxGenericRendererModule: public wxModule
{
DECLARE_DYNAMIC_CLASS(wxGenericRendererModule)
public:
    wxGenericRendererModule() {}
    bool OnInit() { return true; }
    void OnExit() { wxRendererGeneric::Cleanup(); }
};

IMPLEMENT_DYNAMIC_CLASS(wxGenericRendererModule, wxModule)
