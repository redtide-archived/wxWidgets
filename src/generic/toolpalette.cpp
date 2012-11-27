/////////////////////////////////////////////////////////////////////////////
// Name:        src/generic/toolpalette.cpp
// Purpose:     wxToolPaletteGeneric implementation
// Author:      Andrea Zanellato
// Modified by:
// Created:     2011-10-29
// RCS-ID:      $Id$
// Copyright:   (c) wxWidgets Team
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

// ============================================================================
// declarations
// ============================================================================

// ----------------------------------------------------------------------------
// headers
// ----------------------------------------------------------------------------

// For compilers that support precompilation, includes "wx.h".
#include "wx/wxprec.h"

#ifdef __BORLANDC__
    #pragma hdrstop
#endif

#if wxUSE_TOOLPALETTE

#ifndef WX_PRECOMP
    #include "wx/bookctrl.h"
    #include "wx/dcclient.h"
    #include "wx/sizer.h"
#endif

#include "wx/toolpalette.h"
#include "wx/anybutton.h"
#include "wx/renderer.h"
#include "wx/log.h"

const char wxCollapseButtonNameStr[]  = "wxCollapseButton";
const char wxToolPalettePageNameStr[] = "wxToolPalettePage";
const char wxToolPaletteNameStr[]     = "wxToolPalette";

// ============================================================================
// wxCollapseButton
// ============================================================================

//-----------------------------------------------------------------------------
// wxCollapseButton: Appears like a normal button
//                   plus an arrow button on one side.
//-----------------------------------------------------------------------------

class wxCollapseButton : public wxAnyButtonBase
{
public:
    wxCollapseButton() { Init(); }
    wxCollapseButton(wxWindow           *parent,
                     wxWindowID         id        = wxID_ANY,
                     const wxBitmap&    bitmap    = wxNullBitmap,
                     const wxString&    label     = wxEmptyString,
                     const wxPoint&     pos       = wxDefaultPosition,
                     const wxSize&      size      = wxDefaultSize,
                     long               style     = 0,
                     const wxValidator& validator = wxDefaultValidator,
                     const wxString&    name      = wxCollapseButtonNameStr)
    {
        Init();

        Create(parent, id, bitmap, label, pos, size, style, validator, name);
    }

    bool Create(wxWindow           *parent,
                wxWindowID         id        = wxID_ANY,
                const wxBitmap&    bitmap    = wxNullBitmap,
                const wxString&    label     = wxEmptyString,
                const wxPoint&     pos       = wxDefaultPosition,
                const wxSize&      size      = wxDefaultSize,
                long               style     = 0,
                const wxValidator& validator = wxDefaultValidator,
                const wxString&    name      = wxCollapseButtonNameStr);

    virtual ~wxCollapseButton();

    virtual bool IsCollapsed() const { return m_collapsed; }
    virtual bool IsCurrent()   const { return m_state == State_Current; }
    virtual bool IsPressed()   const { return m_state == State_Pressed; }
    virtual bool IsVertical()  const { return HasFlag( wxVERTICAL ); }

    virtual wxSize GetLabelSize() { return GetTextExtent(GetLabelText()); }

protected:
    // Common part of all ctors
    void Init();

    virtual wxSize  DoGetBestSize() const;
    virtual int     DoGetExpanderSize() const;
    virtual void    DoDrawPushButton(int flags = 0, bool withBorders = true);

    void OnMouseEvents(wxMouseEvent& event);
    void OnPaint(wxPaintEvent& event);

    // Current state
    State   m_state;
    bool    m_collapsed;

    // The (optional) image to show and the margins around it
    wxBitmap m_bitmap;
    int      m_margin;

private:
    wxDECLARE_EVENT_TABLE();
};

BEGIN_EVENT_TABLE(wxCollapseButton, wxCollapseButtonBase)
    EVT_PAINT(wxCollapseButton::OnPaint)
    EVT_MOUSE_EVENTS(wxCollapseButton::OnMouseEvents)
END_EVENT_TABLE()

bool wxCollapseButton::Create(wxWindow *parent, wxWindowID id,
                                        const wxBitmap &bitmap,
                                        const wxString &label,
                                        const wxPoint &pos,
                                        const wxSize &size,
                                        long style,
                                        const wxValidator &validator,
                                        const wxString &name)
{
    if ( !wxControl::Create(parent, id, pos, size, style, validator, name) )
        return false;

    SetLabel(label);

    if ( bitmap.IsOk() )
        m_bitmap = bitmap;

    if ( size == wxDefaultSize )
        SetInitialSize(GetBestSize());
    else
        SetInitialSize(size);

    SetBackgroundColour(parent->GetBackgroundColour());

    return true;
}

wxCollapseButton::~wxCollapseButton()
{
}

void wxCollapseButton::Init()
{
    m_collapsed = true;
    m_bitmap    = wxNullBitmap;
    m_state     = State_Normal;
    m_margin    = 5;
}

wxSize wxCollapseButton::DoGetBestSize() const
{
    // TODO: Expander size and margin factor
    int w = 8 // DoGetExpanderSize();
    int h = w, x = 2;

    // Label
    int lblW, lblH;
    int bmpW = 0;
    int bmpH = 0;
    wxString label = GetLabelText();
    GetTextExtent(label, &lblW, &lblH );

    wxRect bmpRect = wxRect(0, 0, 0, 0);

    if ( !label.empty() )
        x++;

    if ( m_bitmap.IsOk() )
    {
        bmpW = m_bitmap.GetWidth();
        bmpH = m_bitmap.GetHeight();
        x++;
    }

    if ( IsVertical() )
    {
        if ( lblH > w )
            w = lblH;

        if ( bmpW > w )
            w = bmpW;

        w += m_margin * 2;
        h += lblW + bmpH + m_margin * x;
    }
    else
    {
        if ( lblH > h )
            h = lblH;

        if ( bmpH > h )
            h = bmpH;

        w += lblW + bmpW + m_margin * x;
        h += m_margin * 2;
    }

    return wxSize( w, h );
}

void wxCollapseButton::OnMouseEvents(wxMouseEvent &event)
{
    int flags = 0;
    bool withBorders = !HasFlag(wxBORDER_NONE);

    if ( event.LeftDown() || event.LeftDClick() )
    {
        m_state     = State_Pressed;
        m_collapsed = !m_collapsed;
        flags       = wxCONTROL_PRESSED;
        withBorders = true;
    }
    else if ( event.Entering() || event.LeftUp() )
    {
        m_state     = State_Current;
        flags       = wxCONTROL_CURRENT;
        withBorders = true;
    }
    else if ( event.Leaving() )
    {
        m_state = State_Normal;
    }
    else
    {
        return;
    }

    DoDrawPushButton(flags, withBorders);
}

void wxCollapseButton::OnPaint(wxPaintEvent &WXUNUSED(event))
{
    DoDrawPushButton(0, !HasFlag(wxBORDER_NONE));
}

void wxCollapseButton::DoDrawPushButton(int flags, bool withBorders)
{
    wxClientDC dc(this);
    wxString  label   = GetLabelText();
    wxSize    lblSize = GetTextExtent(label);
    wxRect    btnRect = GetClientRect();
    wxRect    expRect;
    wxRect    lblRect = wxRect(0, 0, 0, 0);
    wxRect    bmpRect = wxRect(0, 0, 0, 0);
    bool      haveBmp = m_bitmap.IsOk();

    int       expX    = m_margin;
    int       expY    = m_margin;
    int       expSize = 8 // TODO: DoGetExpanderSize();
    int       x, y;

    if (withBorders)
        wxRendererNative::GetDefault().DrawPushButton(this, dc, btnRect, flags);
    else
        dc.Clear();

    if ( !m_collapsed )
        flags |= wxCONTROL_EXPANDED;

    if ( IsVertical() )
    {
        expX = (btnRect.GetWidth() - expSize) / 2;

        if ( haveBmp )
        {
            bmpRect = wxRect
                        (
                            (btnRect.GetWidth() - m_bitmap.GetWidth()) / 2,
                            btnRect.GetHeight() - m_margin - m_bitmap.GetHeight(),
                            m_bitmap.GetWidth(),
                            m_bitmap.GetHeight()
                        );
        }

        if ( !label.empty() )
        {
            x = (btnRect.GetWidth() - lblSize.GetHeight()) / 2;
            y = (btnRect.GetHeight() - lblSize.GetWidth()) / 2;

            if (HasFlag(wxBU_TOP))
            {
                x /= 2;
            }
            else if (HasFlag(wxBU_BOTTOM))
            {
                x *= 2;
            }

            if (expSize && HasFlag(wxBU_LEFT))
            {
                y = btnRect.GetHeight() - lblSize.GetWidth() -
                    bmpRect.GetHeight() - m_margin * 2;
            }
            else if (haveBmp && HasFlag(wxBU_RIGHT))
            {
                y = expSize + m_margin * 2;
            }

            lblRect = wxRect
                        (
                            x,
                            y,
                            lblSize.GetHeight(),
                            lblSize.GetWidth()
                        );

            dc.DrawRotatedText( label, x, y + lblSize.GetWidth(), 90 );
        }
    }
    else
    {
        expY = (btnRect.GetHeight() - expSize) / 2;

        if ( haveBmp )
        {
            bmpRect = wxRect
                        (
                            btnRect.GetWidth() - m_margin - m_bitmap.GetWidth(),
                            (btnRect.GetHeight() - m_bitmap.GetHeight()) / 2,
                            m_bitmap.GetWidth(),
                            m_bitmap.GetHeight()
                        );
        }

        if ( !label.empty() )
        {
            x = (btnRect.GetWidth() - lblSize.GetWidth()) / 2;
            y = (btnRect.GetHeight() - lblSize.GetHeight()) / 2;

            if (HasFlag(wxBU_TOP))
            {
                y /= 2;
            }
            else if (HasFlag(wxBU_BOTTOM))
            {
                y *= 2;
            }

            if (expSize && HasFlag(wxBU_LEFT))
            {
                x = expSize + m_margin * 2;
            }
            else if (haveBmp && HasFlag(wxBU_RIGHT))
            {
                x = btnRect.GetWidth() - lblSize.GetWidth() -
                    bmpRect.GetWidth() - m_margin * 2;
            }

            lblRect = wxRect
                        (
                            x,
                            y,
                            lblSize.GetWidth(),
                            lblSize.GetHeight()
                        );

            dc.DrawText( label, lblRect.GetX(), lblRect.GetY() );
        }
    }

    expRect = wxRect( expX, expY, expSize, expSize );
    wxRendererNative::GetDefault().DrawTreeItemButton(this, dc, expRect, flags);

    if ( haveBmp )
    {
        dc.DrawBitmap(m_bitmap, bmpRect.GetX(), bmpRect.GetY());
    }
}

// ============================================================================
// wxToolPalettePageGeneric Implementation
// ============================================================================

wxIMPLEMENT_DYNAMIC_CLASS(wxToolPalettePageGeneric, wxToolBarBase);

void wxToolPalettePageGeneric::Init()
{
    // TODO
}

wxToolPalettePageGeneric::wxToolPalettePageGeneric()
{
    Init();
}

wxToolPalettePageGeneric::wxToolPalettePageGeneric(wxToolPaletteGeneric *parent,
                                                   wxWindowID id,
                                                   const wxString& label,
                                                   const wxBitmap& bitmap,
                                                   const wxBitmap& bmpDisabled,
                                                   long style,
                                                   const wxString& name)
{
    Init();
    Create( parent, id, label, bitmap, bmpDisabled, style, name );
}

bool wxToolPalettePageGeneric::Create(wxToolPaletteGeneric *parent,
                                      wxWindowID id,
                                      const wxString& label,
                                      const wxBitmap& WXUNUSED(bitmap),
                                      const wxBitmap& WXUNUSED(bmpDisabled),
                                      long style, const wxString& name )
{
    if (!PreCreation(parent, wxDefaultPosition, wxDefaultSize) ||
        !CreateBase(parent, id, wxDefaultPosition, wxDefaultSize,
                    style, wxDefaultValidator, name))
    {
        wxFAIL_MSG( wxS("wxToolPalettePageGeneric creation failed") );
        return false;
    }

    FixupStyle();

    // TODO

    // Finish creation and connect to all the signals we're interested in
    m_parent->DoAddChild( this );

    PostCreation( wxDefaultSize );

    return true;
}

wxToolPalettePageGeneric::~wxToolPalettePageGeneric()
{
}

void wxToolPalettePageGeneric::SetWindowStyleFlag( long style )
{
    wxToolBarBase::SetWindowStyleFlag(style);

    // TODO
}

bool wxToolPalettePageGeneric::Realize()
{
    if ( !wxToolBarBase::Realize() )
        return false;

    // bring the initial state of all the toolbar items in line with the
    // internal state if the latter was changed by calling wxToolItem::
    // Enable(): this works under MSW, where the toolbar items are only created
    // in Realize() which uses the internal state to determine the initial
    // button state, so make it work under GTK too
    for ( wxToolBarToolsList::const_iterator i = m_tools.begin();
          i != m_tools.end();
          ++i )
    {
        // by default the toolbar items are enabled and not toggled, so we only
        // have to do something if their internal state doesn't correspond to
        // this
        if ( !(*i)->IsEnabled() )
            DoEnableTool(*i, false);
        if ( (*i)->IsToggled() )
            DoToggleTool(*i, true);
    }

    return true;
}

bool wxToolPalettePageGeneric::DoInsertTool(size_t WXUNUSED(pos), wxToolBarToolBase *toolBase)
{
    wxToolItem* tool = static_cast<wxToolItem*>(toolBase);

    switch ( tool->GetStyle() )
    {
        case wxTOOL_STYLE_BUTTON:
        {
            switch (tool->GetKind())
            {
                case wxITEM_NORMAL:
                case wxITEM_CHECK:
                case wxITEM_RADIO:
                {
                    break;
                }
                default:
                    wxFAIL_MSG("unknown toolbar child type");
            }
            if (!HasFlag(wxTB_NOICONS))
            {

            }
            if (!tool->GetLabel().empty())
            {

            }
            if (!HasFlag(wxTB_NO_TOOLTIPS) && !tool->GetShortHelp().empty())
            {

            }
            break;
        }
        case wxTOOL_STYLE_CONTROL:
        {
            // TODO
            break;
        }
    }

    // TODO

    InvalidateBestSize();
    return true;
}

bool wxToolPalettePageGeneric::DoDeleteTool(size_t /* pos */, wxToolBarToolBase* toolBase)
{
    wxToolItem* tool = static_cast<wxToolItem*>(toolBase);

    if (tool->GetStyle() == wxTOOL_STYLE_CONTROL)
    {
        // don't destroy the control here as we can be called from
        // RemoveTool() and then we need to keep the control alive;
        // while if we're called from DeleteTool() the control will
        // be destroyed when wxToolBarToolBase itself is deleted
    }

    // TODO

    InvalidateBestSize();
    return true;
}

// ----------------------------------------------------------------------------
// wxToolPalettePageGeneric tools state
// ----------------------------------------------------------------------------

void wxToolPalettePageGeneric::DoEnableTool(wxToolBarToolBase *toolBase, bool enable)
{
    wxToolItem* tool = static_cast<wxToolItem*>(toolBase);

    if (tool)
        tool->Enable();
}

void wxToolPalettePageGeneric::DoToggleTool(wxToolBarToolBase *toolBase, bool toggle)
{
    wxToolItem* tool = static_cast<wxToolItem*>(toolBase);

    if (tool && tool->CanBeToggled())
        tool->Toggle(toggle);
}

void wxToolPalettePageGeneric::DoSetToggle(wxToolBarToolBase * WXUNUSED(tool),
                            bool WXUNUSED(toggle))
{
    wxFAIL_MSG( wxS("not implemented") );
}

// ----------------------------------------------------------------------------
// wxToolPalettePageGeneric geometry
// ----------------------------------------------------------------------------

wxSize wxToolPalettePageGeneric::DoGetBestSize() const
{
    // TODO
    const wxSize size = wxToolBarBase::DoGetBestSize();
    return size;
}

wxToolBarToolBase *wxToolPalettePageGeneric::FindToolForPosition(wxCoord WXUNUSED(x),
                                                          wxCoord WXUNUSED(y)) const
{
    wxFAIL_MSG( wxS("wxToolPalettePageGeneric::FindToolForPosition() not implemented") );

    return NULL;
}

void wxToolPalettePageGeneric::SetToolShortHelp( int id, const wxString& helpString )
{
    wxToolItem* tool = static_cast<wxToolItem*>(FindById(id));

    if (tool)
        tool->SetShortHelp(helpString);
}

void wxToolPalettePageGeneric::SetToolNormalBitmap( int id, const wxBitmap& bitmap )
{
    wxToolItem* tool = static_cast<wxToolItem*>(FindById(id));
    if (tool)
    {
        wxCHECK_RET( tool->IsButton(), wxS("Can only set bitmap on button tools."));

        tool->SetNormalBitmap(bitmap);
        tool->SetImage();
    }
}

void wxToolPalettePageGeneric::SetToolDisabledBitmap( int id, const wxBitmap& bitmap )
{
    wxToolItem* tool = static_cast<wxToolItem*>(FindById(id));
    if (tool)
    {
        wxCHECK_RET( tool->IsButton(), wxS("Can only set bitmap on button tools."));

        tool->SetDisabledBitmap(bitmap);
    }
}

// ----------------------------------------------------------------------------
// Static functions
// ----------------------------------------------------------------------------

wxVisualAttributes
wxToolPalettePageGeneric::GetClassDefaultAttributes(wxWindowVariant WXUNUSED(variant))
{
    return GetDefaultAttributesFromGTKWidget(gtk_tool_item_group_new);
}

wxToolBarToolBase *wxToolPalettePageGeneric::CreateTool(int id, const wxString& text,
                                                 const wxBitmap& bitmap1,
                                                 const wxBitmap& bitmap2,
                                                 wxItemKind kind,
                                                 wxObject *clientData,
                                                 const wxString& shortHelpString,
                                                 const wxString& longHelpString)
{
    return new wxToolItem(this, id, text, bitmap1, bitmap2, kind,
                          clientData, shortHelpString, longHelpString);
}

wxToolBarToolBase *
wxToolPalettePageGeneric::CreateTool(wxControl *control, const wxString& label)
{
    return new wxToolItem(this, control, label);
}

// ============================================================================
// wxToolPaletteGeneric Implementation
// ============================================================================

wxIMPLEMENT_DYNAMIC_CLASS(wxToolPaletteGeneric, wxBookCtrlBase);

void wxToolPaletteGeneric::Init()
{
    m_sizer = NULL;
}

wxToolPaletteGeneric::wxToolPaletteGeneric()
{
    Init();
}

wxToolPaletteGeneric::wxToolPaletteGeneric(wxWindow *parent, wxWindowID id,
                                           const wxPoint& pos, const wxSize& size,
                                           long style, const wxString& name)
{
    Init();
    Create(parent, id, pos, size, style, name);
}

bool wxToolPaletteGeneric::Create(wxWindow *parent, wxWindowID winid,
                                    const wxPoint& pos, const wxSize& size,
                                    long style, const wxString& name)
{
    if ( !wxWindow::Create(parent, winid, pos, size, style, name) )
        return false;

    m_sizer = new wxBoxSizer(wxVERTICAL);
    this->SetSizerAndFit(m_sizer);

    return true;
}

wxToolPaletteGeneric::~wxToolPaletteGeneric()
{
    // TODO
}

bool wxToolPaletteGeneric::SetPageText(size_t nPage, const wxString& strText)
{
    // TODO
    return true;
}

wxString wxToolPaletteGeneric::GetPageText(size_t nPage) const
{
    // TODO
    return wxEmptyString;
}

int wxToolPaletteGeneric::GetPageImage(size_t nPage) const
{
    // TODO
    return NO_IMAGE;
}

bool wxToolPaletteGeneric::SetPageImage(size_t nPage, int nImage)
{
    // TODO
    return true;
}

bool wxToolPaletteGeneric::InsertPage(size_t n, wxWindow *page,
                                      const wxString& text, bool bSelect,
                                      int imageId)
{
    // TODO
    return true;
}

int wxToolPaletteGeneric::SetSelection(size_t n)
{
    // TODO
    return wxNOT_FOUND;
}

int wxToolPaletteGeneric::ChangeSelection(size_t n)
{
    // TODO
    return wxNOT_FOUND;
}

wxWindow *wxToolPaletteGeneric::DoRemovePage(size_t page)
{
    // TODO
    return NULL;
}

#endif // wxUSE_TOOLPALETTE
