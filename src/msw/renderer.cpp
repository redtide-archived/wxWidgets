///////////////////////////////////////////////////////////////////////////////
// Name:        src/msw/renderer.cpp
// Purpose:     implementation of wxRendererNative for Windows
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

#ifndef WX_PRECOMP
    #include "wx/string.h"
    #include "wx/window.h"
    #include "wx/dc.h"
    #include "wx/settings.h"
#endif //WX_PRECOMP

#include "wx/dcgraph.h"
#include "wx/scopeguard.h"
#include "wx/splitter.h"
#include "wx/renderer.h"
#include "wx/msw/private.h"
#include "wx/msw/uxtheme.h"

// tmschema.h is in Win32 Platform SDK and might not be available with earlier
// compilers
#ifndef CP_DROPDOWNBUTTON
    #define BP_PUSHBUTTON      1
    #define BP_RADIOBUTTON     2
    #define BP_CHECKBOX        3
    #define RBS_UNCHECKEDNORMAL 1
    #define RBS_CHECKEDNORMAL   (RBS_UNCHECKEDNORMAL + 4)
    #define RBS_MIXEDNORMAL     (RBS_CHECKEDNORMAL + 4)
    #define CBS_UNCHECKEDNORMAL 1
    #define CBS_CHECKEDNORMAL   (CBS_UNCHECKEDNORMAL + 4)
    #define CBS_MIXEDNORMAL     (CBS_CHECKEDNORMAL + 4)

    #define PBS_NORMAL          1
    #define PBS_HOT             2
    #define PBS_PRESSED         3
    #define PBS_DISABLED        4
    #define PBS_DEFAULTED       5

    #define CP_DROPDOWNBUTTON  1

    #define CBXS_NORMAL        1
    #define CBXS_HOT           2
    #define CBXS_PRESSED       3
    #define CBXS_DISABLED      4

    #define TVP_GLYPH           2

    #define GLPS_CLOSED         1
    #define GLPS_OPENED         2

    #define HP_HEADERITEM       1

    #define HIS_NORMAL          1
    #define HIS_HOT             2
    #define HIS_PRESSED         3

    #define TMT_HEIGHT          2417

    #define HP_HEADERSORTARROW  4
    #define HSAS_SORTEDUP       1
    #define HSAS_SORTEDDOWN     2

    #define EP_EDITTEXT         1
    #define ETS_NORMAL          1
    #define ETS_HOT             2
    #define ETS_SELECTED        3
    #define ETS_DISABLED        4
    #define ETS_FOCUSED         5
    #define ETS_READONLY        6
    #define ETS_ASSIST          7
    #define TMT_FILLCOLOR       3802
    #define TMT_TEXTCOLOR       3803
    #define TMT_BORDERCOLOR     3801
    #define TMT_EDGEFILLCOLOR   3808

    #define WP_MINBUTTON 15
    #define WP_MAXBUTTON 17
    #define WP_CLOSEBUTTON 18
    #define WP_RESTOREBUTTON 21
    #define WP_HELPBUTTON 23

// REBAR parts
enum
{
    RP_GRIPPER      = 1,
    RP_GRIPPERVERT  = 2,
    RP_BAND         = 3,
    RP_CHEVRON      = 4,
    RP_CHEVRONVERT  = 5,
// For Windows >= Vista
    RP_BACKGROUND   = 6,
    RP_SPLITTER     = 7,
    RP_SPLITTERVERT = 8
};
// REBAR chevron states
enum
{
    CHEVS_NORMAL  = 1,
    CHEVS_HOT     = 2,
    CHEVS_PRESSED = 3
};
// TOOLBAR parts
enum
{
    TP_BUTTON              = 1,
    TP_DROPDOWNBUTTON      = 2,
    TP_SPLITBUTTON         = 3,
    TP_SPLITBUTTONDROPDOWN = 4,
    TP_SEPARATOR           = 5,
    TP_SEPARATORVERT       = 6
};
// TOOLBAR states
enum
{
    TS_NORMAL     = 1,
    TS_HOT        = 2,
    TS_PRESSED    = 3,
    TS_DISABLED   = 4,
    TS_CHECKED    = 5,
    TS_HOTCHECKED = 6
};
// TAB parts
enum
{
    TABP_TABITEM = 1
};
// TAB states
enum
{
    TIS_NORMAL   = 1,
    TIS_HOT      = 2,
    TIS_SELECTED = 3,
    TIS_DISABLED = 4,
    TIS_FOCUSED  = 5
};
#endif

#if defined(__WXWINCE__)
    #ifndef DFCS_FLAT
        #define DFCS_FLAT 0
    #endif
    #ifndef DFCS_MONO
        #define DFCS_MONO 0
    #endif
#endif

#ifndef DFCS_HOT
    #define DFCS_HOT 0x1000
#endif

// ----------------------------------------------------------------------------
// methods common to wxRendererMSW and wxRendererXP
// ----------------------------------------------------------------------------

class wxRendererMSWBase : public wxDelegateRendererNative
{
public:
    wxRendererMSWBase() { }
    wxRendererMSWBase(wxRendererNative& rendererNative)
        : wxDelegateRendererNative(rendererNative) { }

    void DrawFocusRect(wxWindow * win,
                        wxDC& dc,
                        const wxRect& rect,
                        int flags = 0);

    void DrawItemSelectionRect(wxWindow *win,
                                wxDC& dc,
                                const wxRect& rect,
                                int flags = 0);

    void DrawChoice(wxWindow* win,
                     wxDC& dc,
                     const wxRect& rect,
                     int flags = 0);

    void DrawComboBox(wxWindow* win,
                       wxDC& dc,
                       const wxRect& rect,
                       int flags = 0);

    virtual void DrawComboBoxDropButton(wxWindow *win,
                                         wxDC& dc,
                                         const wxRect& rect,
                                         int flags = 0) = 0;

    virtual void DrawTextCtrl(wxWindow* win,
                               wxDC& dc,
                               const wxRect& rect,
                               int flags = 0) = 0;
};

// ----------------------------------------------------------------------------
// wxRendererMSW: wxRendererNative implementation for "old" Win32 systems
// ----------------------------------------------------------------------------

class wxRendererMSW : public wxRendererMSWBase
{
public:
    wxRendererMSW()
    {
        m_penBlack     = wxPen(wxSystemSettings::GetColour(wxSYS_COLOUR_3DDKSHADOW));
        m_penDarkGrey  = wxPen(wxSystemSettings::GetColour(wxSYS_COLOUR_3DSHADOW));
        m_penLightGrey = wxPen(wxSystemSettings::GetColour(wxSYS_COLOUR_3DLIGHT));
        m_penHighlight = wxPen(wxSystemSettings::GetColour(wxSYS_COLOUR_3DHIGHLIGHT));
    }

    static wxRendererNative& Get();

    virtual void DrawComboBoxDropButton(wxWindow *win,
                                        wxDC& dc,
                                        const wxRect& rect,
                                        int flags = 0);

    virtual void DrawCheckBox(wxWindow *win,
                              wxDC& dc,
                              const wxRect& rect,
                              int flags = 0)
    {
        DoDrawButton(DFCS_BUTTONCHECK, win, dc, rect, flags);
    }

    virtual void DrawPushButton(wxWindow *win,
                                wxDC& dc,
                                const wxRect& rect,
                                int flags = 0);

    virtual void DrawButtonLabel(wxDC& dc,
                                 const wxString& label,
                                 const wxBitmap& image,
                                 const wxRect& rect,
                                 int flags = 0,
                                 int alignment = wxALIGN_LEFT | wxALIGN_TOP,
                                 int indexAccel = -1,
                                 wxRect *rectBounds = NULL);

    virtual void DrawTab(wxWindow *win,
                         wxDC& dc,
                         const wxRect& rect,
                         const wxString& label,
                         const wxBitmap& bitmap = wxNullBitmap,
                         wxDirection direction = wxTOP,
                         int flags = 0);

    virtual void DrawTextCtrl(wxWindow* win,
                              wxDC& dc,
                              const wxRect& rect,
                              int flags = 0);

    virtual void DrawRadioBitmap(wxWindow* win,
                                 wxDC& dc,
                                 const wxRect& rect,
                                 int flags = 0)
    {
        DoDrawButton(DFCS_BUTTONRADIO, win, dc, rect, flags);
    }

    virtual void DrawTitleBarBitmap(wxWindow *win,
                                    wxDC& dc,
                                    const wxRect& rect,
                                    wxTitleBarButton button,
                                    int flags = 0);

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

    virtual void DrawToolSeparator( wxWindow *window,
                                    wxDC& dc,
                                    const wxRect& rect,
                                    wxOrientation orient = wxHORIZONTAL,
                                    int spacerWidth = 0,
                                    int flags = 0 );

    virtual wxSize GetCheckBoxSize(wxWindow *win);

    virtual int GetHeaderButtonHeight(wxWindow *win);

    virtual int GetHeaderButtonMargin(wxWindow *win);

private:
    // wrapper of DrawFrameControl()
    void DoDrawFrameControl(UINT type,
                            UINT kind,
                            wxWindow *win,
                            wxDC& dc,
                            const wxRect& rect,
                            int flags);

    // common part of Draw{PushButton,CheckBox,RadioBitmap}(): wraps
    // DrawFrameControl(DFC_BUTTON)
    void DoDrawButton(UINT kind,
                      wxWindow *win,
                      wxDC& dc,
                      const wxRect& rect,
                      int flags)
    {
        DoDrawFrameControl(DFC_BUTTON, kind, win, dc, rect, flags);
    }

    void DoDrawToolButton(wxDC& dc,
                          const wxRect& rect,
                          int flags);

    void DrawBorder(wxDC& dc,
                    wxBorder border,
                    const wxRect& rect,
                    int flags = 0);

    void DrawShadedRect(wxDC& dc,
                        wxRect *rect,
                        const wxPen& pen1,
                        const wxPen& pen2);

    void DrawRect(wxDC& dc, wxRect *rect, const wxPen& pen);

    void DrawRaisedBorder(wxDC& dc, wxRect *rect);
    void DrawSunkenBorder(wxDC& dc, wxRect *rect);
    void DrawAntiSunkenBorder(wxDC& dc, wxRect *rect);
    void DrawBoxBorder(wxDC& dc, wxRect *rect);
    void DrawStaticBorder(wxDC& dc, wxRect *rect);

    void DrawHorizontalLine(wxDC& dc, wxCoord y, wxCoord x1, wxCoord x2);
    void DrawVerticalLine(wxDC& dc, wxCoord x, wxCoord y1, wxCoord y2);

    // GDI objects we often use
    wxPen m_penBlack,
          m_penDarkGrey,
          m_penLightGrey,
          m_penHighlight;

    wxDECLARE_NO_COPY_CLASS(wxRendererMSW);
};

// ----------------------------------------------------------------------------
// wxRendererXP: wxRendererNative implementation for Windows XP and later
// ----------------------------------------------------------------------------

#if wxUSE_UXTHEME

class wxRendererXP : public wxRendererMSWBase
{
public:
    wxRendererXP() : wxRendererMSWBase(wxRendererMSW::Get()) { }

    static wxRendererNative& Get();

    virtual int DrawHeaderButton(wxWindow *win,
                                  wxDC& dc,
                                  const wxRect& rect,
                                  int flags = 0,
                                  wxHeaderSortIconType sortArrow = wxHDR_SORT_ICON_NONE,
                                  wxHeaderButtonParams* params = NULL);

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
    virtual void DrawCheckBox(wxWindow *win,
                              wxDC& dc,
                              const wxRect& rect,
                              int flags = 0)
    {
        if ( !DoDrawXPButton(BP_CHECKBOX, win, dc, rect, flags) )
            m_rendererNative.DrawCheckBox(win, dc, rect, flags);
    }

    virtual void DrawPushButton(wxWindow *win,
                                wxDC& dc,
                                const wxRect& rect,
                                int flags = 0)
    {
        if ( !DoDrawXPButton(BP_PUSHBUTTON, win, dc, rect, flags) )
            m_rendererNative.DrawPushButton(win, dc, rect, flags);
    }

    virtual void DrawTextCtrl(wxWindow* win,
                              wxDC& dc,
                              const wxRect& rect,
                              int flags = 0);

    virtual void DrawRadioBitmap(wxWindow *win,
                                 wxDC& dc,
                                 const wxRect& rect,
                                 int flags = 0)
    {
        if ( !DoDrawXPButton(BP_RADIOBUTTON, win, dc, rect, flags) )
            m_rendererNative.DrawRadioBitmap(win, dc, rect, flags);
    }

    virtual void DrawTitleBarBitmap(wxWindow *win,
                                    wxDC& dc,
                                    const wxRect& rect,
                                    wxTitleBarButton button,
                                    int flags = 0);

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

    virtual void DrawToolSeparator( wxWindow *window,
                                    wxDC& dc,
                                    const wxRect& rect,
                                    wxOrientation orient = wxHORIZONTAL,
                                    int spacerWidth = 0,
                                    int flags = 0 );

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

private:
    // wrapper around DrawThemeBackground() translating flags to NORMAL/HOT/
    // PUSHED/DISABLED states (and so suitable for drawing anything
    // button-like)
    void DoDrawButtonLike(HTHEME htheme,
                          int part,
                          wxDC& dc,
                          const wxRect& rect,
                          int flags);

    // common part of DrawCheckBox(), DrawPushButton() and DrawRadioBitmap()
    bool DoDrawXPButton(int kind,
                        wxWindow *win,
                        wxDC& dc,
                        const wxRect& rect,
                        int flags);

    // Common part of all DrawXXXToolButton() functions
    void DoDrawToolButton(HTHEME htheme,
                          int part,
                          wxDC& dc,
                          const wxRect& rect,
                          int flags);

    wxDECLARE_NO_COPY_CLASS(wxRendererXP);
};

#endif // wxUSE_UXTHEME


// ============================================================================
// wxRendererMSWBase implementation
// ============================================================================

void wxRendererMSWBase::DrawFocusRect(wxWindow * WXUNUSED(win),
                                      wxDC& dc,
                                      const wxRect& rect,
                                      int WXUNUSED(flags))
{
    RECT rc;
    wxCopyRectToRECT(rect, rc);

    ::DrawFocusRect(GetHdcOf(dc.GetTempHDC()), &rc);
}

void wxRendererMSWBase::DrawItemSelectionRect(wxWindow *win,
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
            brush = wxBrush(wxSystemSettings::GetColour(wxSYS_COLOUR_BTNFACE));
        }
    }
    else // !selected
    {
        brush = *wxTRANSPARENT_BRUSH;
    }

    dc.SetBrush(brush);
    dc.SetPen(*wxTRANSPARENT_PEN);
    dc.DrawRectangle( rect );

    if ((flags & wxCONTROL_FOCUSED) && (flags & wxCONTROL_CURRENT))
        DrawFocusRect( win, dc, rect, flags );
}

void wxRendererMSWBase::DrawChoice(wxWindow* win,
                                   wxDC& dc,
                                   const wxRect& rect,
                                   int flags)
{
    DrawComboBox(win, dc, rect, flags);
}

void wxRendererMSWBase::DrawComboBox(wxWindow* win,
                                     wxDC& dc,
                                     const wxRect& rect,
                                     int flags)
{
    // Draw the main part of the control same as TextCtrl
    DrawTextCtrl(win, dc, rect, flags);

    // Draw the button inside the border, on the right side
    wxRect br(rect);
    br.height -= 2;
    br.x += br.width - br.height - 1;
    br.width = br.height;
    br.y += 1;

    DrawComboBoxDropButton(win, dc, br, flags);
}

// ============================================================================
// wxRendererNative and wxRendererMSW implementation
// ============================================================================

/* static */
wxRendererNative& wxRendererNative::GetDefault()
{
#if wxUSE_UXTHEME
    wxUxThemeEngine *themeEngine = wxUxThemeEngine::Get();
    if ( themeEngine && themeEngine->IsAppThemed() )
        return wxRendererXP::Get();
#endif // wxUSE_UXTHEME

    return wxRendererMSW::Get();
}

/* static */
wxRendererNative& wxRendererMSW::Get()
{
    static wxRendererMSW s_rendererMSW;

    return s_rendererMSW;
}

void
wxRendererMSW::DrawShadedRect(wxDC& dc,
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

void
wxRendererMSW::DrawRect(wxDC& dc, wxRect *rect, const wxPen& pen)
{
    // draw
    dc.SetPen(pen);
    dc.SetBrush(*wxTRANSPARENT_BRUSH);
    dc.DrawRectangle(*rect);

    // adjust the rect
    rect->Inflate(-1);
}

void
wxRendererMSW::DrawRaisedBorder(wxDC& dc, wxRect *rect)
{
    DrawShadedRect(dc, rect, m_penHighlight, m_penBlack);
    DrawShadedRect(dc, rect, m_penLightGrey, m_penDarkGrey);
}

void
wxRendererMSW::DrawSunkenBorder(wxDC& dc, wxRect *rect)
{
    DrawShadedRect(dc, rect, m_penDarkGrey, m_penHighlight);
    DrawShadedRect(dc, rect, m_penBlack, m_penLightGrey);
}

void
wxRendererMSW::DrawAntiSunkenBorder(wxDC& dc, wxRect *rect)
{
    DrawShadedRect(dc, rect, m_penLightGrey, m_penBlack);
    DrawShadedRect(dc, rect, m_penHighlight, m_penDarkGrey);
}

void
wxRendererMSW::DrawBoxBorder(wxDC& dc, wxRect *rect)
{
    DrawShadedRect(dc, rect, m_penDarkGrey, m_penHighlight);
    DrawShadedRect(dc, rect, m_penHighlight, m_penDarkGrey);
}

void
wxRendererMSW::DrawStaticBorder(wxDC& dc, wxRect *rect)
{
    DrawShadedRect(dc, rect, m_penDarkGrey, m_penHighlight);
}

void
wxRendererMSW::DrawBorder(wxDC& dc,
                         wxBorder border,
                         const wxRect& rectTotal,
                         int WXUNUSED(flags))
{
    wxRect rect = rectTotal;

    switch ( border )
    {
        case wxBORDER_SUNKEN:
        case wxBORDER_THEME:
            DrawSunkenBorder(dc, &rect);
            break;

        // wxBORDER_DOUBLE and wxBORDER_THEME are currently the same value.
#if 0
        case wxBORDER_DOUBLE:
            DrawAntiSunkenBorder(dc, &rect);
            DrawExtraBorder(dc, &rect);
            break;
#endif
        case wxBORDER_STATIC:
            DrawStaticBorder(dc, &rect);
            break;

        case wxBORDER_RAISED:
            DrawRaisedBorder(dc, &rect);
            break;

        case wxBORDER_SIMPLE:
            DrawRect(dc, &rect, wxSystemSettings::GetColour(wxSYS_COLOUR_3DDKSHADOW));
            break;

        default:
            wxFAIL_MSG(wxT("unknown border type"));
            // fall through

        case wxBORDER_DEFAULT:
        case wxBORDER_NONE:
            break;
    }
}

void
wxRendererMSW::DrawHorizontalLine(wxDC& dc, wxCoord y, wxCoord x1, wxCoord x2)
{
    dc.SetPen(m_penDarkGrey);
    dc.DrawLine(x1, y, x2 + 1, y);

    dc.SetPen(m_penHighlight);
    y++;
    dc.DrawLine(x1, y, x2 + 1, y);
}

void
wxRendererMSW::DrawVerticalLine(wxDC& dc, wxCoord x, wxCoord y1, wxCoord y2)
{
    dc.SetPen(m_penDarkGrey);
    dc.DrawLine(x, y1, x, y2 + 1);

    dc.SetPen(m_penHighlight);
    x++;
    dc.DrawLine(x, y1, x, y2 + 1);
}

void
wxRendererMSW::DrawComboBoxDropButton(wxWindow * WXUNUSED(win),
                                      wxDC& dc,
                                      const wxRect& rect,
                                      int flags)
{
    wxCHECK_RET( dc.GetImpl(), wxT("Invalid wxDC") );

    wxRect adjustedRect = dc.GetImpl()->MSWApplyGDIPlusTransform(rect);
    
    RECT r;
    wxCopyRectToRECT(adjustedRect, r);

    int style = DFCS_SCROLLCOMBOBOX;
    if ( flags & wxCONTROL_DISABLED )
        style |= DFCS_INACTIVE;
    if ( flags & wxCONTROL_PRESSED )
        style |= DFCS_PUSHED | DFCS_FLAT;

    ::DrawFrameControl(GetHdcOf(dc.GetTempHDC()), &r, DFC_SCROLL, style);
}

void
wxRendererMSW::DoDrawFrameControl(UINT type,
                                  UINT kind,
                                  wxWindow * WXUNUSED(win),
                                  wxDC& dc,
                                  const wxRect& rect,
                                  int flags)
{
    wxCHECK_RET( dc.GetImpl(), wxT("Invalid wxDC") );

    wxRect adjustedRect = dc.GetImpl()->MSWApplyGDIPlusTransform(rect);

    RECT r;
    wxCopyRectToRECT(adjustedRect, r);

    int style = kind;
    if ( flags & wxCONTROL_CHECKED )
        style |= DFCS_CHECKED;
    if ( flags & wxCONTROL_DISABLED )
        style |= DFCS_INACTIVE;
    if ( flags & wxCONTROL_FLAT )
        style |= DFCS_MONO;
    if ( flags & wxCONTROL_PRESSED )
        style |= DFCS_PUSHED;
    if ( flags & wxCONTROL_CURRENT )
        style |= DFCS_HOT;
    if ( flags & wxCONTROL_UNDETERMINED )
        // Using DFCS_BUTTON3STATE here doesn't work (as might be expected),
        // use the following two styles to get the same look of a check box
        // in the undetermined state.
        style |= DFCS_INACTIVE | DFCS_CHECKED;

    ::DrawFrameControl(GetHdcOf(dc.GetTempHDC()), &r, type, style);
}

void
wxRendererMSW::DrawPushButton(wxWindow *win,
                              wxDC& dc,
                              const wxRect& rectOrig,
                              int flags)
{
    wxRect rect(rectOrig);
    if ( flags & wxCONTROL_ISDEFAULT )
    {
        // DrawFrameControl() doesn't seem to support default buttons so we
        // have to draw the border ourselves
        wxDCPenChanger pen(dc, *wxBLACK_PEN);
        wxDCBrushChanger brush(dc, *wxTRANSPARENT_BRUSH);
        dc.DrawRectangle(rect);
        rect.Deflate(1);
    }

    DoDrawButton(DFCS_BUTTONPUSH, win, dc, rect, flags);
}

void
wxRendererMSW::DrawButtonLabel(wxDC& dc,
                               const wxString& label,
                               const wxBitmap& image,
                               const wxRect& rect,
                               int flags,
                               int alignment,
                               int indexAccel,
                               wxRect *rectBounds)
{
    wxDCTextColourChanger clrChanger(dc);

    wxRect rectLabel = rect;
    if ( !label.empty() && (flags & wxCONTROL_DISABLED) )
    {
        if ( flags & wxCONTROL_PRESSED )
        {
            // shift the label if a button is pressed
            rectLabel.Offset(1, 1);
        }

        // draw shadow of the text
        clrChanger.Set(wxSystemSettings::GetColour( wxSYS_COLOUR_3DHIGHLIGHT ));
        wxRect rectShadow = rect;
        rectShadow.Offset(1, 1);
        dc.DrawLabel(label, rectShadow, alignment, indexAccel);

        // make the main label text grey
        clrChanger.Set(wxSystemSettings::GetColour( wxSYS_COLOUR_3DSHADOW ));

        if ( flags & wxCONTROL_FOCUSED )
        {
            // leave enough space for the focus rect
            rectLabel.Inflate(-2);
        }
    }

    dc.DrawLabel(label, image, rectLabel, alignment, indexAccel, rectBounds);

    if ( !label.empty() && (flags & wxCONTROL_FOCUSED) )
    {
        rectLabel.Inflate(-1);

        DrawFocusRect(NULL, dc, rectLabel);
    }
}

void
wxRendererMSW::DrawTab(wxWindow * WXUNUSED(win),
                       wxDC& dc,
                       const wxRect& rect,
                       const wxString& label,
                       const wxBitmap& bitmap,
                       wxDirection direction,
                       int flags)
{
    #define SELECT_FOR_VERTICAL(X,Y) ( isVertical ? Y : X )
    #define REVERSE_FOR_VERTICAL(X,Y) \
        SELECT_FOR_VERTICAL(X,Y)      \
        ,                             \
        SELECT_FOR_VERTICAL(Y,X)

    wxRect r = rect;

    bool isVertical = ( direction == wxLEFT ) || ( direction == wxRIGHT );

    // the current tab is drawn indented (to the top for default case) and
    // bigger than the other ones
    const wxSize indent = wxSize(2, 2);

    if ( flags & wxCONTROL_SELECTED )
    {
        r.Inflate( SELECT_FOR_VERTICAL( indent.x , 0),
                   SELECT_FOR_VERTICAL( 0, indent.y ));

        switch ( direction )
        {
            default:
                wxFAIL_MSG(wxT("invaild notebook tab orientation"));
                // fall through
            case wxTOP:
                r.y -= indent.y;
                // fall through
            case wxBOTTOM:
                r.height += indent.y;
                break;
            case wxLEFT:
                r.x -= indent.x;
                // fall through
            case wxRIGHT:
                r.width += indent.x;
                break;
        }
    }

    // draw the text, image and the focus around them (if necessary)
    wxRect rectLabel( REVERSE_FOR_VERTICAL(r.x, r.y),
                      REVERSE_FOR_VERTICAL(r.width, r.height) );
    rectLabel.Deflate(1, 1);

    if ( isVertical )
    {
        // draw it horizontally into memory and rotate for screen
        wxMemoryDC dcMem;
        wxBitmap bmpRotated, bmpMem( rectLabel.x + rectLabel.width,
                                     rectLabel.y + rectLabel.height );
        dcMem.SelectObject(bmpMem);
        dcMem.SetBackground(dc.GetBackground());
        dcMem.SetFont(dc.GetFont());
        dcMem.SetTextForeground(dc.GetTextForeground());
        dcMem.Clear();

        bmpRotated =
#if wxUSE_IMAGE
        wxBitmap( wxImage(bitmap.ConvertToImage()).Rotate90(direction==wxLEFT) );
#else
        bitmap;
#endif // wxUSE_IMAGE

        DrawButtonLabel(dcMem, label, bmpRotated, rectLabel, 
                        flags, wxALIGN_CENTRE);
        dcMem.SelectObject(wxNullBitmap);

        bmpMem =
#if wxUSE_IMAGE
        wxBitmap( wxImage(bmpMem.ConvertToImage()).Rotate90(direction==wxRIGHT) );
#else
        bmpMem.GetSubBitmap(rectLabel);
#endif // wxUSE_IMAGE

        dc.DrawBitmap(bmpMem, rectLabel.y, rectLabel.x, false);
    }
    else
    {
        DrawButtonLabel(dc, label, bitmap, rectLabel, flags, wxALIGN_CENTRE);
    }

    // now draw the tab border itself (maybe use DrawRoundedRectangle()?)
    static const wxCoord CUTOFF = 2; // radius of the rounded corner
    wxCoord x  = SELECT_FOR_VERTICAL(r.x, r.y),
            y  = SELECT_FOR_VERTICAL(r.y, r.x),
            x2 = SELECT_FOR_VERTICAL(r.GetRight(), r.GetBottom()),
            y2 = SELECT_FOR_VERTICAL(r.GetBottom(), r.GetRight());

    // FIXME: all this code will break if the tab indent or the border width,
    //        it is tied to the fact that both of them are equal to 2
    switch ( direction )
    {
        default:
            // default is top
        case wxLEFT:
            // left orientation looks like top but IsVertical makes x and y reversed
        case wxTOP:
            // top is not vertical so use coordinates in written order
            dc.SetPen(m_penHighlight);
            dc.DrawLine(REVERSE_FOR_VERTICAL(x, y2),
                        REVERSE_FOR_VERTICAL(x, y + CUTOFF));
            dc.DrawLine(REVERSE_FOR_VERTICAL(x, y + CUTOFF),
                        REVERSE_FOR_VERTICAL(x + CUTOFF, y));
            dc.DrawLine(REVERSE_FOR_VERTICAL(x + CUTOFF, y),
                        REVERSE_FOR_VERTICAL(x2 - CUTOFF + 1, y));

            dc.SetPen(m_penBlack);
            dc.DrawLine(REVERSE_FOR_VERTICAL(x2, y2),
                        REVERSE_FOR_VERTICAL(x2, y + CUTOFF));
            dc.DrawLine(REVERSE_FOR_VERTICAL(x2, y + CUTOFF),
                        REVERSE_FOR_VERTICAL(x2 - CUTOFF, y));

            dc.SetPen(m_penDarkGrey);
            dc.DrawLine(REVERSE_FOR_VERTICAL(x2 - 1, y2),
                        REVERSE_FOR_VERTICAL(x2 - 1, y + CUTOFF - 1));

            if ( flags & wxCONTROL_SELECTED )
            {
                dc.SetPen(m_penLightGrey);

                // overwrite the part of the border below this tab
                dc.DrawLine(REVERSE_FOR_VERTICAL(x + 1, y2 + 1),
                            REVERSE_FOR_VERTICAL(x2 - 1, y2 + 1));

                // and the shadow of the tab to the left of us
                dc.DrawLine(REVERSE_FOR_VERTICAL(x + 1, y + CUTOFF + 1),
                            REVERSE_FOR_VERTICAL(x + 1, y2 + 1));
            }
            break;

        case wxRIGHT:
            // right orientation looks like bottom but IsVertical makes x and y reversed
        case wxBOTTOM:
            // bottom is not vertical so use coordinates in written order
            dc.SetPen(m_penHighlight);
            // we need to continue one pixel further to overwrite the corner of
            // the border for the selected tab
            dc.DrawLine(REVERSE_FOR_VERTICAL(x, y - (flags & wxCONTROL_SELECTED ? 1 : 0)),
                        REVERSE_FOR_VERTICAL(x, y2 - CUTOFF));
            dc.DrawLine(REVERSE_FOR_VERTICAL(x, y2 - CUTOFF),
                        REVERSE_FOR_VERTICAL(x + CUTOFF, y2));

            dc.SetPen(m_penBlack);
            dc.DrawLine(REVERSE_FOR_VERTICAL(x + CUTOFF, y2),
                        REVERSE_FOR_VERTICAL(x2 - CUTOFF + 1, y2));
            dc.DrawLine(REVERSE_FOR_VERTICAL(x2, y),
                        REVERSE_FOR_VERTICAL(x2, y2 - CUTOFF));
            dc.DrawLine(REVERSE_FOR_VERTICAL(x2, y2 - CUTOFF),
                        REVERSE_FOR_VERTICAL(x2 - CUTOFF, y2));

            dc.SetPen(m_penDarkGrey);
            dc.DrawLine(REVERSE_FOR_VERTICAL(x + CUTOFF, y2 - 1),
                        REVERSE_FOR_VERTICAL(x2 - CUTOFF + 1, y2 - 1));
            dc.DrawLine(REVERSE_FOR_VERTICAL(x2 - 1, y),
                        REVERSE_FOR_VERTICAL(x2 - 1, y2 - CUTOFF + 1));

            if ( flags & wxCONTROL_SELECTED )
            {
                dc.SetPen(m_penLightGrey);

                // overwrite the part of the (double!) border above this tab
                dc.DrawLine(REVERSE_FOR_VERTICAL(x + 1, y - 1),
                            REVERSE_FOR_VERTICAL(x2 - 1, y - 1));
                dc.DrawLine(REVERSE_FOR_VERTICAL(x + 1, y - 2),
                            REVERSE_FOR_VERTICAL(x2 - 1, y - 2));

                // and the shadow of the tab to the left of us
                dc.DrawLine(REVERSE_FOR_VERTICAL(x + 1, y2 - CUTOFF),
                            REVERSE_FOR_VERTICAL(x + 1, y - 1));
            }
            break;
    }

    #undef SELECT_FOR_VERTICAL
    #undef REVERSE_FOR_VERTICAL
}

void
wxRendererMSW::DrawToolBar(wxWindow * WXUNUSED(window),
                           wxDC& dc,
                           const wxRect& rect,
                           wxOrientation orient,
                           int WXUNUSED(flags))
{
    if(orient == wxHORIZONTAL)
    {
        DrawHorizontalLine(dc, rect.GetY(), rect.GetX(), rect.GetRight());
        DrawHorizontalLine(dc, rect.GetY() + rect.GetHeight() -1,
                                rect.GetX(), rect.GetRight());
    }
    else
    {
        DrawVerticalLine(dc, rect.x, rect.y, rect.GetBottom());
    }
}

void
wxRendererMSW::DoDrawToolButton(wxDC& dc,
                                const wxRect& rect,
                                int flags)
{
    wxPoint upperLeft(rect.x, rect.y);
    wxPoint downLeft(rect.x, rect.y + rect.height - 1);
    wxPoint upperRight(rect.x + rect.width -1, rect.y);

    if ( flags & wxCONTROL_PRESSED )
    {
        dc.SetPen(m_penHighlight);
        dc.DrawRectangle(rect);
        dc.SetPen(m_penDarkGrey);

        dc.DrawLine(upperLeft, downLeft);
        dc.DrawLine(upperLeft, upperRight);
    }
    else if ( flags & wxCONTROL_CURRENT )
    {
        dc.SetPen(m_penDarkGrey);
        dc.DrawRectangle(rect);
        dc.SetPen(m_penHighlight);

        dc.DrawLine(upperLeft, downLeft);
        dc.DrawLine(upperLeft, upperRight);
    }
}

void
wxRendererMSW::DrawToolButton(wxWindow *WXUNUSED(window),
                              wxDC& dc,
                              const wxRect& rect,
                              const wxString& label,
                              const wxBitmap& bitmap,
                              wxOrientation orient,
                              bool WXUNUSED(hasDropdown),
                              int flags)
{
    DoDrawToolButton(dc, rect, flags);

    if(!label.empty())
    {
        if(orient == wxHORIZONTAL)
            dc.DrawLabel(label, bitmap, rect, wxALIGN_CENTRE);
        else
            dc.DrawLabel(label, bitmap, rect, wxALIGN_LEFT|wxALIGN_CENTER_VERTICAL);
    }
    else
    {
        int x = (rect.GetLeft() + rect.GetRight() - bitmap.GetWidth()) / 2;
        int y = (rect.GetTop() + rect.GetBottom() + 1 - bitmap.GetHeight()) / 2;

        if ( flags & wxCONTROL_PRESSED )
            x++;

        dc.DrawBitmap(bitmap, x, y, bitmap.GetMask() != NULL);
    }
}

void wxRendererMSW::DrawToolDropButton( wxWindow *window,
                                        wxDC& dc,
                                        const wxRect& rect,
                                        int flags )
{
    DoDrawToolButton(dc, rect, flags);
    DrawDropArrow(window, dc, rect, flags);
}

void wxRendererMSW::DrawToolMenuButton( wxWindow *window,
                                        wxDC& dc,
                                        const wxRect& rect,
                                        int flags )
{
    DoDrawToolButton(dc, rect, flags);

    wxRect arrowRect
    (
        rect.GetX() + (rect.GetWidth()  /3 *2),
        rect.GetY() + (rect.GetHeight() /3),
        rect.GetWidth()  / 3,
        rect.GetHeight() / 3
    );

    DrawDropArrow(window, dc, rect, flags);
}

void
wxRendererMSW::DrawToolSeparator(wxWindow *WXUNUSED(window),
                                 wxDC& dc,
                                 const wxRect& rect,
                                 wxOrientation orient,
                                 int WXUNUSED(spacerWidth),
                                 int WXUNUSED(flags))
{
    if(orient == wxHORIZONTAL)
    {
        DrawHorizontalLine(dc, rect.y + rect.height/2, rect.x, rect.GetRight());
    }
    else
    {
        DrawVerticalLine(dc, rect.x + rect.width/2, rect.y, rect.GetBottom());
    }
}

void
wxRendererMSW::DrawTitleBarBitmap(wxWindow *win,
                                  wxDC& dc,
                                  const wxRect& rect,
                                  wxTitleBarButton button,
                                  int flags)
{
    UINT kind;
    switch ( button )
    {
        case wxTITLEBAR_BUTTON_CLOSE:
            kind = DFCS_CAPTIONCLOSE;
            break;

        case wxTITLEBAR_BUTTON_MAXIMIZE:
            kind = DFCS_CAPTIONMAX;
            break;

        case wxTITLEBAR_BUTTON_ICONIZE:
            kind = DFCS_CAPTIONMIN;
            break;

        case wxTITLEBAR_BUTTON_RESTORE:
            kind = DFCS_CAPTIONRESTORE;
            break;

        case wxTITLEBAR_BUTTON_HELP:
            kind = DFCS_CAPTIONHELP;
            break;

        default:
            wxFAIL_MSG( "unsupported title bar button" );
            return;
    }

    DoDrawFrameControl(DFC_CAPTION, kind, win, dc, rect, flags);
}

wxSize wxRendererMSW::GetCheckBoxSize(wxWindow * WXUNUSED(win))
{
    return wxSize(::GetSystemMetrics(SM_CXMENUCHECK),
                  ::GetSystemMetrics(SM_CYMENUCHECK));
}

int wxRendererMSW::GetHeaderButtonHeight(wxWindow * WXUNUSED(win))
{
    // some "reasonable" value returned in case of error, it doesn't really
    // correspond to anything but it's better than returning 0
    static const int DEFAULT_HEIGHT = 20;


    // create a temporary header window just to get its geometry
    HWND hwndHeader = ::CreateWindow(WC_HEADER, NULL, 0,
                                     0, 0, 0, 0, NULL, NULL, NULL, NULL);
    if ( !hwndHeader )
        return DEFAULT_HEIGHT;

    wxON_BLOCK_EXIT1( ::DestroyWindow, hwndHeader );

    // initialize the struct filled with the values by Header_Layout()
    RECT parentRect = { 0, 0, 100, 100 };
    WINDOWPOS wp = { 0, 0, 0, 0, 0, 0, 0 };
    HDLAYOUT hdl = { &parentRect, &wp };

    return Header_Layout(hwndHeader, &hdl) ? wp.cy : DEFAULT_HEIGHT;
}

int wxRendererMSW::GetHeaderButtonMargin(wxWindow *WXUNUSED(win))
{
    return 10;
}

// Uses the theme to draw the border and fill for something like a wxTextCtrl
void wxRendererMSW::DrawTextCtrl(wxWindow* WXUNUSED(win),
                                 wxDC& dc,
                                 const wxRect& rect,
                                 int WXUNUSED(flags))
{
    wxColour fill;
    wxColour bdr;
    {
        fill = wxSystemSettings::GetColour(wxSYS_COLOUR_WINDOW);
        bdr = *wxBLACK;
    }

    dc.SetPen(bdr);
    dc.SetBrush(fill);
    dc.DrawRectangle(rect);
}


// ============================================================================
// wxRendererXP implementation
// ============================================================================

#if wxUSE_UXTHEME

/* static */
wxRendererNative& wxRendererXP::Get()
{
    static wxRendererXP s_rendererXP;

    return s_rendererXP;
}

// NOTE: There is no guarantee that the button drawn fills the entire rect (XP
// default theme, for example), so the caller should have cleared button's
// background before this call. This is quite likely a wxMSW-specific thing.
void
wxRendererXP::DrawComboBoxDropButton(wxWindow * win,
                                      wxDC& dc,
                                      const wxRect& rect,
                                      int flags)
{
    wxUxThemeHandle hTheme(win, L"COMBOBOX");
    if ( !hTheme )
    {
        m_rendererNative.DrawComboBoxDropButton(win, dc, rect, flags);
        return;
    }

    wxCHECK_RET( dc.GetImpl(), wxT("Invalid wxDC") );

    wxRect adjustedRect = dc.GetImpl()->MSWApplyGDIPlusTransform(rect);

    RECT r;
    wxCopyRectToRECT(adjustedRect, r);

    int state;
    if ( flags & wxCONTROL_PRESSED )
        state = CBXS_PRESSED;
    else if ( flags & wxCONTROL_CURRENT )
        state = CBXS_HOT;
    else if ( flags & wxCONTROL_DISABLED )
        state = CBXS_DISABLED;
    else
        state = CBXS_NORMAL;

    wxUxThemeEngine::Get()->DrawThemeBackground
                            (
                                hTheme,
                                GetHdcOf(dc.GetTempHDC()),
                                CP_DROPDOWNBUTTON,
                                state,
                                &r,
                                NULL
                            );

}

int
wxRendererXP::DrawHeaderButton(wxWindow *win,
                               wxDC& dc,
                               const wxRect& rect,
                               int flags,
                               wxHeaderSortIconType sortArrow,
                               wxHeaderButtonParams* params)
{
    wxUxThemeHandle hTheme(win, L"HEADER");
    if ( !hTheme )
    {
        return m_rendererNative.DrawHeaderButton(win, dc, rect, flags, sortArrow, params);
    }

    wxCHECK_MSG( dc.GetImpl(), -1, wxT("Invalid wxDC") );

    wxRect adjustedRect = dc.GetImpl()->MSWApplyGDIPlusTransform(rect);

    RECT r;
    wxCopyRectToRECT(adjustedRect, r);

    int state;
    if ( flags & wxCONTROL_PRESSED )
        state = HIS_PRESSED;
    else if ( flags & wxCONTROL_CURRENT )
        state = HIS_HOT;
    else
        state = HIS_NORMAL;
    wxUxThemeEngine::Get()->DrawThemeBackground
                            (
                                hTheme,
                                GetHdcOf(dc.GetTempHDC()),
                                HP_HEADERITEM,
                                state,
                                &r,
                                NULL
                            );

    // NOTE: Using the theme to draw HP_HEADERSORTARROW doesn't do anything.
    // Why?  If this can be fixed then draw the sort arrows using the theme
    // and then clear those flags before calling DrawHeaderButtonContents.

    // Add any extras that are specified in flags and params
    return DrawHeaderButtonContents(win, dc, rect, flags, sortArrow, params);
}


void
wxRendererXP::DrawTreeItemButton(wxWindow *win,
                                 wxDC& dc,
                                 const wxRect& rect,
                                 int flags)
{
    wxUxThemeHandle hTheme(win, L"TREEVIEW");
    if ( !hTheme )
    {
        m_rendererNative.DrawTreeItemButton(win, dc, rect, flags);
        return;
    }

    wxCHECK_RET( dc.GetImpl(), wxT("Invalid wxDC") );

    wxRect adjustedRect = dc.GetImpl()->MSWApplyGDIPlusTransform(rect);

    RECT r;
    wxCopyRectToRECT(adjustedRect, r);

    int state = flags & wxCONTROL_EXPANDED ? GLPS_OPENED : GLPS_CLOSED;
    wxUxThemeEngine::Get()->DrawThemeBackground
                            (
                                hTheme,
                                GetHdcOf(dc.GetTempHDC()),
                                TVP_GLYPH,
                                state,
                                &r,
                                NULL
                            );
}

bool
wxRendererXP::DoDrawXPButton(int kind,
                             wxWindow *win,
                             wxDC& dc,
                             const wxRect& rect,
                             int flags)
{
    wxUxThemeHandle hTheme(win, L"BUTTON");
    if ( !hTheme )
        return false;

    DoDrawButtonLike(hTheme, kind, dc, rect, flags);

    return true;
}

void
wxRendererXP::DoDrawButtonLike(HTHEME htheme,
                               int part,
                               wxDC& dc,
                               const wxRect& rect,
                               int flags)
{
    wxCHECK_RET( dc.GetImpl(), wxT("Invalid wxDC") );

    wxRect adjustedRect = dc.GetImpl()->MSWApplyGDIPlusTransform(rect);

    RECT r;
    wxCopyRectToRECT(adjustedRect, r);

    // the base state is always 1, whether it is PBS_NORMAL,
    // {CBS,RBS}_UNCHECKEDNORMAL or CBS_NORMAL
    int state = 1;

    // XBS_XXX is followed by XBX_XXXHOT, then XBS_XXXPRESSED and DISABLED
    enum
    {
        NORMAL_OFFSET,
        HOT_OFFSET,
        PRESSED_OFFSET,
        DISABLED_OFFSET,
        STATES_COUNT
    };

    // in both RBS_ and CBS_ enums CHECKED elements are offset by 4 from base
    // (UNCHECKED) ones and MIXED are offset by 4 again as there are all states
    // from the above enum in between them
    if ( flags & wxCONTROL_CHECKED )
        state += STATES_COUNT;
    else if ( flags & wxCONTROL_UNDETERMINED )
        state += 2*STATES_COUNT;

    if ( flags & wxCONTROL_DISABLED )
        state += DISABLED_OFFSET;
    else if ( flags & wxCONTROL_PRESSED )
        state += PRESSED_OFFSET;
    else if ( flags & wxCONTROL_CURRENT )
        state += HOT_OFFSET;
    // wxCONTROL_ISDEFAULT flag is only valid for push buttons
    else if ( part == BP_PUSHBUTTON && (flags & wxCONTROL_ISDEFAULT) )
        state = PBS_DEFAULTED;

    wxUxThemeEngine::Get()->DrawThemeBackground
                            (
                                htheme,
                                GetHdcOf(dc.GetTempHDC()),
                                part,
                                state,
                                &r,
                                NULL
                            );
}

void wxRendererXP::DoDrawToolButton(HTHEME hTheme,
                                    int part,
                                    wxDC& dc,
                                    const wxRect& rect,
                                    int flags)
{
    wxCHECK_RET( dc.GetImpl(), wxT("Invalid wxDC") );

    wxRect adjustedRect = dc.GetImpl()->MSWApplyGDIPlusTransform(rect);

    RECT rc;
    wxCopyRectToRECT(adjustedRect, rc);

    int state = TS_NORMAL;
    if ( flags & wxCONTROL_DISABLED )
        state = TS_DISABLED;
    else if ( flags & wxCONTROL_CURRENT &~ wxCONTROL_CHECKED )
        state = TS_HOT;
    else if ( flags & wxCONTROL_CURRENT & wxCONTROL_CHECKED )
        state = TS_HOTCHECKED;
    else if ( flags & wxCONTROL_CHECKED )
        state = TS_CHECKED;
    else if ( flags & wxCONTROL_PRESSED )
        state = TS_PRESSED;

    wxUxThemeEngine::Get()->DrawThemeBackground(hTheme,
                                                GetHdcOf(dc.GetTempHDC()),
                                                part,
                                                state,
                                                &rc, NULL);
}

void
wxRendererXP::DrawTitleBarBitmap(wxWindow *win,
                                 wxDC& dc,
                                 const wxRect& rect,
                                 wxTitleBarButton button,
                                 int flags)
{
    wxUxThemeHandle hTheme(win, L"WINDOW");
    if ( !hTheme )
    {
        m_rendererNative.DrawTitleBarBitmap(win, dc, rect, button, flags);
        return;
    }

    int part;
    switch ( button )
    {
        case wxTITLEBAR_BUTTON_CLOSE:
            part = WP_CLOSEBUTTON;
            break;

        case wxTITLEBAR_BUTTON_MAXIMIZE:
            part = WP_MAXBUTTON;
            break;

        case wxTITLEBAR_BUTTON_ICONIZE:
            part = WP_MINBUTTON;
            break;

        case wxTITLEBAR_BUTTON_RESTORE:
            part = WP_RESTOREBUTTON;
            break;

        case wxTITLEBAR_BUTTON_HELP:
            part = WP_HELPBUTTON;
            break;

        default:
            wxFAIL_MSG( "unsupported title bar button" );
            return;
    }

    DoDrawButtonLike(hTheme, part, dc, rect, flags);
}

// Uses the theme to draw the border and fill for something like a wxTextCtrl
void wxRendererXP::DrawTextCtrl(wxWindow* win,
                                wxDC& dc,
                                const wxRect& rect,
                                int flags)
{
    wxUxThemeHandle hTheme(win, L"EDIT");
    if ( !hTheme )
    {
        m_rendererNative.DrawTextCtrl(win,dc,rect,flags);
        return;
    }

    wxColour fill;
    wxColour bdr;
    COLORREF cref;

    wxUxThemeEngine::Get()->GetThemeColor(hTheme, EP_EDITTEXT,
                                          ETS_NORMAL, TMT_FILLCOLOR, &cref);
    fill = wxRGBToColour(cref);

    int etsState;
    if ( flags & wxCONTROL_DISABLED )
        etsState = ETS_DISABLED;
    else
        etsState = ETS_NORMAL;

    wxUxThemeEngine::Get()->GetThemeColor(hTheme, EP_EDITTEXT,
                                              etsState, TMT_BORDERCOLOR, &cref);
    bdr = wxRGBToColour(cref);

    dc.SetPen( bdr );
    dc.SetBrush( fill );
    dc.DrawRectangle(rect);
}

void wxRendererXP::DrawToolBar(wxWindow *window,
                               wxDC& dc,
                               const wxRect& rect,
                               wxOrientation WXUNUSED(orient),
                               int WXUNUSED(flags))
{
    wxUxThemeHandle hTheme(window, L"TOOLBAR");
    if ( !hTheme )
        return;

    RECT rc;
    wxCopyRectToRECT(rect, rc);

    wxUxThemeEngine::Get()->DrawThemeBackground(hTheme,
                                                GetHdcOf(dc.GetTempHDC()),
                                                0, 0,
                                                &rc, NULL);
}

void wxRendererXP::DrawToolButton(wxWindow *window,
                                  wxDC& dc,
                                  const wxRect& rect,
                                  const wxString& WXUNUSED(label),
                                  const wxBitmap& WXUNUSED(bitmap),
                                  wxOrientation WXUNUSED(orient),
                                  bool hasDropdown,
                                  int flags)
{
    wxUxThemeHandle hTheme(window, L"TOOLBAR");
    if ( !hTheme )
        return;

    int part = hasDropdown ? TP_SPLITBUTTON : TP_BUTTON;

    DoDrawToolButton(hTheme, part, dc, rect, flags);
}

void wxRendererXP::DrawToolDropButton(wxWindow *window,
                                      wxDC& dc,
                                      const wxRect& rect,
                                      int flags)
{
    wxUxThemeHandle hTheme(window, L"TOOLBAR");
    if ( !hTheme )
        return;

    DoDrawToolButton(hTheme, TP_SPLITBUTTONDROPDOWN, dc, rect, flags);
}

void wxRendererXP::DrawToolMenuButton(wxWindow *window,
                                      wxDC& dc,
                                      const wxRect& rect,
                                      int flags)
{
    wxUxThemeHandle hTheme(window, L"TOOLBAR");
    if ( !hTheme )
        return;

    DoDrawToolButton(hTheme, TP_DROPDOWNBUTTON, dc, rect, flags);
}

void wxRendererXP::DrawToolSeparator(wxWindow *window,
                                     wxDC& dc,
                                     const wxRect& rect,
                                     wxOrientation orient,
                                     int WXUNUSED(spacerWidth),
                                     int flags)
{
    wxUxThemeHandle hTheme(window, L"TOOLBAR");
    if ( !hTheme )
        return;

    // The orientation in MSW is related to the toolbar, here is
    // related to the separator one instead
    int part = orient == wxVERTICAL ? TP_SEPARATOR : TP_SEPARATORVERT;

    DoDrawToolButton(hTheme, part, dc, rect, flags);
}

void wxRendererXP::DrawGripper(wxWindow *window, wxDC& dc, const wxRect& rect,
                               wxOrientation orient, int WXUNUSED(flags))
{
    wxUxThemeHandle hTheme(window, L"REBAR");
    if ( !hTheme )
        return;

    RECT rc;
    wxCopyRectToRECT(rect, rc);

    int part = RP_GRIPPER;
    if (orient == wxVERTICAL)
        part = RP_GRIPPERVERT;

    wxUxThemeEngine::Get()->DrawThemeBackground(hTheme,
                                                GetHdcOf(dc.GetTempHDC()),
                                                part, 0,
                                                &rc, NULL);
}

void wxRendererXP::DrawTab(wxWindow *window,
                           wxDC& dc,
                           const wxRect& rect,
                           const wxString& WXUNUSED(label),
                           const wxBitmap& WXUNUSED(bitmap),
                           wxDirection WXUNUSED(direction),
                           int flags)
{
    wxUxThemeHandle hTheme(window, L"TAB");
    if ( !hTheme )
        return;

    RECT rc;
    wxCopyRectToRECT(rect, rc);

    int state = TIS_NORMAL;
    if ( flags & wxCONTROL_DISABLED )
        state = TIS_DISABLED;
    else if ( flags & wxCONTROL_SELECTED )
        state = TIS_SELECTED;
    else if ( flags & wxCONTROL_CURRENT )
        state = TIS_HOT;
    else if ( flags & wxCONTROL_FOCUSED )
        state = TIS_FOCUSED;

    wxUxThemeEngine::Get()->DrawThemeBackground(hTheme,
                                                GetHdcOf(dc.GetTempHDC()),
                                                TABP_TABITEM,
                                                state,
                                                &rc, NULL);
}

// ----------------------------------------------------------------------------
// splitter drawing
// ----------------------------------------------------------------------------

// the width of the sash: this is the same as used by Explorer...
static const wxCoord SASH_WIDTH = 4;

wxSplitterRenderParams
wxRendererXP::GetSplitterParams(const wxWindow * win)
{
    if ( win->HasFlag(wxSP_NO_XP_THEME) )
        return m_rendererNative.GetSplitterParams(win);
    else
        return wxSplitterRenderParams(SASH_WIDTH, 0, false);
}

void
wxRendererXP::DrawSplitterBorder(wxWindow * win,
                                 wxDC& dc,
                                 const wxRect& rect,
                                 int flags)
{
    if ( win->HasFlag(wxSP_NO_XP_THEME) )
    {
        m_rendererNative.DrawSplitterBorder(win, dc, rect, flags);
    }
}

void
wxRendererXP::DrawSplitterSash(wxWindow *win,
                               wxDC& dc,
                               const wxSize& size,
                               wxCoord position,
                               wxOrientation orient,
                               int flags)
{
    if ( !win->HasFlag(wxSP_NO_XP_THEME) )
    {
        dc.SetPen(*wxTRANSPARENT_PEN);
        dc.SetBrush(wxBrush(wxSystemSettings::GetColour(wxSYS_COLOUR_BTNFACE)));
        if ( orient == wxVERTICAL )
        {
            dc.DrawRectangle(position, 0, SASH_WIDTH, size.y);
        }
        else // wxHORIZONTAL
        {
            dc.DrawRectangle(0, position, size.x, SASH_WIDTH);
        }

        return;
    }

    m_rendererNative.DrawSplitterSash(win, dc, size, position, orient, flags);
}

#endif // wxUSE_UXTHEME
