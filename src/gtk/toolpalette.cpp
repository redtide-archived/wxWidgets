/////////////////////////////////////////////////////////////////////////////
// Name:        src/gtk/toolpalette.cpp
// Purpose:     wxToolPalette Implementation
// Author:      Andrea Zanellato
// Modified by:
// Created:     2011-10-29
// RCS-ID:      $Id$
// Copyright:   (c) wxWidgets team
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

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

#include "wx/toolpalette.h"

#if wxUSE_TOOLPALETTE && defined( wxHAS_NATIVE_TOOLPALETTE )

#ifndef WX_PRECOMP

#endif // WX_PRECOMP

#include "wx/gtk/window.h"
#include "wx/gtk/private.h"

const char wxToolPaletteNameStr[]     = "wxToolPalette";
const char wxToolPalettePageNameStr[] = "wxToolPalettePage";

// ----------------------------------------------------------------------------
// Globals
// ----------------------------------------------------------------------------

// data
extern bool       g_blockEventsOnDrag;
extern wxCursor   g_globalCursor;

// ============================================================================
// wxToolItem
// ============================================================================

class wxToolItem : public wxToolBarToolBase
{
public:
    wxToolItem( wxToolPalettePage *toolPage, int id, const wxString& label,
                const wxBitmap& bitmap1, const wxBitmap& bitmap2,
                wxItemKind kind, wxObject *clientData,
                const wxString& shortHelpString, const wxString& longHelpString)
    :
    wxToolBarToolBase(toolPage, id, label, bitmap1, bitmap2, kind,
                      clientData, shortHelpString, longHelpString)
    {
        m_item = NULL;
    }

    wxToolItem( wxToolPalettePage *toolPage, wxControl *control,
                const wxString& label )
    :
    wxToolBarToolBase(toolPage, control, label)
    {
        m_item = NULL;
    }

    void SetImage();

    GtkToolItem* m_item;
};

// ============================================================================
// wxToolItem implementation
// ============================================================================

void wxToolItem::SetImage()
{
    const wxBitmap& bitmap = GetNormalBitmap();
    wxCHECK_RET(bitmap.IsOk(), "invalid bitmap for wxToolPalettePage icon");

    GtkWidget* image = gtk_tool_button_get_icon_widget(GTK_TOOL_BUTTON(m_item));
    // always use pixbuf, because pixmap mask does not
    // work with disabled images in some themes
    gtk_image_set_from_pixbuf(GTK_IMAGE(image), bitmap.GetPixbuf());
}

// ============================================================================
// wxToolPalettePage implementation
// ============================================================================

wxIMPLEMENT_DYNAMIC_CLASS( wxToolPalettePage, wxToolBarBase );

//-----------------------------------------------------------------------------
// "clicked" from m_item
//-----------------------------------------------------------------------------

extern "C" {
static void item_clicked(GtkToolButton *, wxToolItem *tool)
{
    if (g_blockEventsOnDrag) return;

    tool->GetToolBar()->OnLeftClick(tool->GetId(), false);
}
}

//-----------------------------------------------------------------------------
// "toggled" from m_item
//-----------------------------------------------------------------------------

extern "C" {
static void item_toggled(GtkToggleToolButton *button, wxToolItem *tool)
{
    if (g_blockEventsOnDrag) return;

    const bool active = gtk_toggle_tool_button_get_active(button) != 0;

    tool->Toggle(active);

    if (!active && tool->GetKind() == wxITEM_RADIO)
        return;

    if (!tool->GetToolBar()->OnLeftClick(tool->GetId(), active))
    {
        // revert back
        tool->Toggle();
    }
}
}

//-----------------------------------------------------------------------------
// "button_press_event" from m_item child
//-----------------------------------------------------------------------------

extern "C" {
static gboolean
button_press_event(GtkWidget *, GdkEventButton *event, wxToolItem *tool)
{
    if (event->button != 3)
        return FALSE;

    if (g_blockEventsOnDrag) return TRUE;

    tool->GetToolBar()->OnRightClick(
        tool->GetId(), int(event->x), int(event->y));

    return TRUE;
}
}

//-----------------------------------------------------------------------------
// "enter_notify_event" / "leave_notify_event" from m_item
//-----------------------------------------------------------------------------

extern "C" {
static gboolean
enter_notify_event(GtkWidget *, GdkEventCrossing *event, wxToolItem *tool)
{
    if (g_blockEventsOnDrag) return TRUE;

    int id = -1;
    if (event->type == GDK_ENTER_NOTIFY)
        id = tool->GetId();
    tool->GetToolBar()->OnMouseEnter(id);

    return FALSE;
}
}

//-----------------------------------------------------------------------------
// "expose_event" from GtkImage inside m_item
//-----------------------------------------------------------------------------

extern "C" {
static gboolean
#ifdef __WXGTK3__
image_draw(GtkWidget *widget, cairo_t *cr, wxToolItem *tool)
#else
image_expose_event(GtkWidget *widget, GdkEventExpose *, wxToolItem *tool)
#endif
{
    const wxBitmap& bitmap = tool->GetDisabledBitmap();
    if (tool->IsEnabled() || !bitmap.IsOk())
        return false;

    // draw disabled bitmap ourselves, GtkImage has no way to specify it
    GtkAllocation alloc;
    gtk_widget_get_allocation(widget, &alloc);
    GtkRequisition req;
    gtk_widget_get_requisition(widget, &req);
    const int x = alloc.x + (alloc.width - req.width) / 2;
    const int y = alloc.y + (alloc.height - req.height) / 2;
#ifdef __WXGTK3__
    bitmap.Draw(cr, x, y);
#else
    gdk_draw_pixbuf(
        gtk_widget_get_window(widget), gtk_widget_get_style(widget)->black_gc, bitmap.GetPixbuf(),
        0, 0, x, y,
        -1, -1, GDK_RGB_DITHER_NORMAL, 0, 0);
#endif
    return true;
}
}

void wxToolPalettePage::AddChildGTK(wxWindowGTK* child)
{
    GtkWidget* align = gtk_alignment_new(0.5, 0.5, 0, 0);
    gtk_widget_show(align);
    gtk_container_add(GTK_CONTAINER(align), child->m_widget);
    GtkToolItem* item = gtk_tool_item_new();
    gtk_container_add(GTK_CONTAINER(item), align);

    // Position will be corrected in DoInsertTool if necessary
    gtk_tool_item_group_insert(GTK_TOOL_ITEM_GROUP(
                               gtk_bin_get_child(GTK_BIN(m_widget))), item, -1);
}

// ----------------------------------------------------------------------------
// Construction
// ----------------------------------------------------------------------------

void wxToolPalettePage::Init()
{
    m_toolpage = NULL;
    m_tooltips = NULL;
}

wxToolPalettePage::wxToolPalettePage()
{
    Init();
}

wxToolPalettePage::wxToolPalettePage(wxToolPalette *parent, wxWindowID id,
                                     const wxString& label,
                                     const wxBitmap& bitmap,
                                     const wxBitmap& bmpDisabled,
                                     long style, const wxString& name)
{
    Init();
    Create( parent, id, label, bitmap, bmpDisabled, style, name );
}

bool wxToolPalettePage::Create( wxToolPalette *parent, wxWindowID id,
                                const wxString& label,
                                const wxBitmap& WXUNUSED(bitmap),
                                const wxBitmap& WXUNUSED(bmpDisabled),
                                long style, const wxString& name )
{
    if (!PreCreation(parent, wxDefaultPosition, wxDefaultSize) ||
        !CreateBase(parent, id, wxDefaultPosition, wxDefaultSize,
                    style, wxDefaultValidator, name))
    {
        wxFAIL_MSG( wxS("wxToolPalettePage creation failed") );
        return false;
    }

    FixupStyle();

    // Create the tool palette page widget itself
    m_widget = gtk_tool_item_group_new(label);
    wxCHECK_MSG( m_widget, false, "failed to create GtkToolItemGroup" );
    g_object_ref( m_widget );

    // Set tool item tooltips
#ifndef __WXGTK3__
    if (gtk_check_version(2, 12, 0))
    {
        m_tooltips = gtk_tooltips_new();
        g_object_ref(m_tooltips);
        gtk_object_sink(GTK_OBJECT(m_tooltips));
    }
#endif

    GtkSetStyle();

    // Finish creation and connect to all the signals we're interested in
    m_parent->DoAddChild( this );

    PostCreation( wxDefaultSize );

    return true;
}

wxToolPalettePage::~wxToolPalettePage()
{
#ifndef __WXGTK3__
    if (m_tooltips) // always NULL if GTK >= 2.12
    {
        gtk_object_destroy(GTK_OBJECT(m_tooltips));
        g_object_unref(m_tooltips);
    }
#endif
}

GdkWindow *wxToolPalettePage::GTKGetWindow(wxArrayGdkWindows& WXUNUSED(windows)) const
{
    return gtk_widget_get_window(GTK_WIDGET(m_toolpage));
}

void wxToolPalettePage::GtkSetStyle()
{
    // TODO
}

void wxToolPalettePage::SetWindowStyleFlag( long style )
{
    wxToolBarBase::SetWindowStyleFlag(style);

    if ( m_toolpage )
        GtkSetStyle();
}

bool wxToolPalettePage::Realize()
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

bool wxToolPalettePage::DoInsertTool(size_t WXUNUSED(pos), wxToolBarToolBase *toolBase)
{
    wxToolItem* tool = static_cast<wxToolItem*>(toolBase);
//  GSList* radioGroup;
//  GtkWidget* binChild;

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
            wxWindow* control = tool->GetControl();
            if (gtk_widget_get_parent(control->m_widget) == NULL)
                AddChildGTK(control);

            break;
        }
    }

    gtk_widget_show(GTK_WIDGET(tool->m_item));

    InvalidateBestSize();
    return true;
}

bool wxToolPalettePage::DoDeleteTool(size_t /* pos */, wxToolBarToolBase* toolBase)
{
    wxToolItem* tool = static_cast<wxToolItem*>(toolBase);

    if (tool->GetStyle() == wxTOOL_STYLE_CONTROL)
    {
        // don't destroy the control here as we can be called from
        // RemoveTool() and then we need to keep the control alive;
        // while if we're called from DeleteTool() the control will
        // be destroyed when wxToolBarToolBase itself is deleted
        GtkWidget* widget = tool->GetControl()->m_widget;
        gtk_container_remove(GTK_CONTAINER(gtk_widget_get_parent(widget)), widget);
    }

    gtk_widget_destroy(GTK_WIDGET(tool->m_item));
    tool->m_item = NULL;

    InvalidateBestSize();
    return true;
}

GSList *wxToolPalettePage::GetRadioGroup(size_t pos)
{
    GSList *radioGroup = NULL;
    GtkToolItem *item = NULL;
    if (pos > 0)
    {
        item = gtk_tool_item_group_get_nth_item(m_toolpage, int(pos) - 1);
        if (!GTK_IS_RADIO_TOOL_BUTTON(item))
            item = NULL;
    }
    if (item == NULL && pos < m_tools.size())
    {
        item = gtk_tool_item_group_get_nth_item(m_toolpage, int(pos));
        if (!GTK_IS_RADIO_TOOL_BUTTON(item))
            item = NULL;
    }
    if (item)
        radioGroup = gtk_radio_tool_button_get_group((GtkRadioToolButton*)item);
    return radioGroup;
}

// ----------------------------------------------------------------------------
// wxToolPalettePage tools state
// ----------------------------------------------------------------------------

void wxToolPalettePage::DoEnableTool(wxToolBarToolBase *toolBase, bool enable)
{
    wxToolItem* tool = static_cast<wxToolItem*>(toolBase);

    if (tool->m_item)
        gtk_widget_set_sensitive(GTK_WIDGET(tool->m_item), enable);
}

void wxToolPalettePage::DoToggleTool( wxToolBarToolBase *toolBase, bool toggle )
{
    wxToolItem* tool = static_cast<wxToolItem*>(toolBase);

    if (tool->m_item)
    {
        g_signal_handlers_block_by_func(tool->m_item, (void*)item_toggled, tool);

        gtk_toggle_tool_button_set_active(
            GTK_TOGGLE_TOOL_BUTTON(tool->m_item), toggle);

        g_signal_handlers_unblock_by_func(tool->m_item, (void*)item_toggled, tool);
    }
}

void wxToolPalettePage::DoSetToggle(wxToolBarToolBase * WXUNUSED(tool),
                            bool WXUNUSED(toggle))
{
    wxFAIL_MSG( wxS("not implemented") );
}

// ----------------------------------------------------------------------------
// wxToolPalettePage geometry
// ----------------------------------------------------------------------------

wxSize wxToolPalettePage::DoGetBestSize() const
{
    // TODO
    const wxSize size = wxToolBarBase::DoGetBestSize();
    return size;
}

wxToolBarToolBase *wxToolPalettePage::FindToolForPosition(wxCoord WXUNUSED(x),
                                                          wxCoord WXUNUSED(y)) const
{
    wxFAIL_MSG( wxS("wxToolPalettePage::FindToolForPosition() not implemented") );

    return NULL;
}

void wxToolPalettePage::SetToolShortHelp( int id, const wxString& helpString )
{
    wxToolItem* tool = static_cast<wxToolItem*>(FindById(id));

    if (tool)
    {
        (void)tool->SetShortHelp(helpString);
        if (tool->m_item)
        {
#if GTK_CHECK_VERSION(2, 12, 0)
            if (GTK_CHECK_VERSION(3,0,0) || gtk_check_version(2,12,0) == NULL)
            {
                gtk_tool_item_set_tooltip_text( tool->m_item,
                                                wxGTK_CONV(helpString) );
            }
            else
#endif
            {
#ifndef __WXGTK3__
                gtk_tool_item_set_tooltip(tool->m_item, m_tooltips,
                                          wxGTK_CONV(helpString), "");
#endif
            }
        }
    }
}

void wxToolPalettePage::SetToolNormalBitmap( int id, const wxBitmap& bitmap )
{
    wxToolItem* tool = static_cast<wxToolItem*>(FindById(id));
    if (tool)
    {
        wxCHECK_RET( tool->IsButton(), wxS("Can only set bitmap on button tools."));

        tool->SetNormalBitmap(bitmap);
        tool->SetImage();
    }
}

void wxToolPalettePage::SetToolDisabledBitmap( int id, const wxBitmap& bitmap )
{
    wxToolItem* tool = static_cast<wxToolItem*>(FindById(id));
    if (tool)
    {
        wxCHECK_RET( tool->IsButton(), wxS("Can only set bitmap on button tools."));

        tool->SetDisabledBitmap(bitmap);
    }
}

// ----------------------------------------------------------------------------

// static
wxVisualAttributes
wxToolPalettePage::GetClassDefaultAttributes(wxWindowVariant WXUNUSED(variant))
{
    return GetDefaultAttributesFromGTKWidget(gtk_tool_item_group_new);
}

wxToolBarToolBase *wxToolPalettePage::CreateTool(int id, const wxString& text,
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
wxToolPalettePage::CreateTool(wxControl *control, const wxString& label)
{
    return new wxToolItem(this, control, label);
}

// ============================================================================
// wxToolPalette implementation
// ============================================================================

wxIMPLEMENT_DYNAMIC_CLASS(wxToolPalette, wxBookCtrlBase);

void wxToolPalette::Init()
{
    // TODO
}

wxToolPalette::wxToolPalette()
{
    Init();
}

wxToolPalette::wxToolPalette(wxWindow *parent, wxWindowID id,
                             const wxPoint& pos, const wxSize& size,
                             long style, const wxString& name )
{
    Init();
    Create( parent, id, pos, size, style, name );
}

bool wxToolPalette::Create(wxWindow *parent, wxWindowID id,
                           const wxPoint& pos, const wxSize& size,
                           long style, const wxString& name )
{
    if ( (style & wxBK_ALIGN_MASK) == wxBK_DEFAULT )
        style |= wxBK_TOP;

    if (!PreCreation( parent, pos, size ) ||
        !CreateBase( parent, id, pos, size, style, wxDefaultValidator, name ))
    {
        wxFAIL_MSG( wxS("wxToolPalette creation failed") );
        return false;
    }

    // Create the tool palette widget itself
    m_widget = gtk_tool_palette_new();

    wxCHECK_MSG( m_widget, false, "failed to create GtkToolPalette" );

    g_object_ref( m_widget );

    // finish creation and connect to all the signals we're interested in
    m_parent->DoAddChild( this );

    PostCreation( wxDefaultSize );

    return true;
}

wxToolPalette::~wxToolPalette()
{
    // TODO
}

bool wxToolPalette::SetPageText(size_t WXUNUSED(nPage), const wxString& WXUNUSED(strText))
{
    // TODO
    return true;
}

wxString wxToolPalette::GetPageText(size_t WXUNUSED(nPage)) const
{
    // TODO
    return wxEmptyString;
}

int wxToolPalette::GetPageImage(size_t WXUNUSED(nPage)) const
{
    // TODO
    return NO_IMAGE;
}

bool wxToolPalette::SetPageImage(size_t WXUNUSED(nPage), int WXUNUSED(nImage))
{
    // TODO
    return true;
}

bool wxToolPalette::InsertPage(size_t WXUNUSED(n), wxWindow *WXUNUSED(page),
                               const wxString& WXUNUSED(text),
                               bool WXUNUSED(bSelect), int WXUNUSED(imageId))
{
    // TODO
    return true;
}

int wxToolPalette::SetSelection(size_t WXUNUSED(n))
{
    // TODO
    return wxNOT_FOUND;
}

int wxToolPalette::ChangeSelection(size_t WXUNUSED(n))
{
    // TODO
    return wxNOT_FOUND;
}

wxWindow *wxToolPalette::DoRemovePage(size_t WXUNUSED(page))
{
    // TODO
    return NULL;
}

void wxToolPalette::AddChildGTK(wxWindowGTK *child)
{
    gtk_container_add(GTK_CONTAINER(m_widget), child->m_widget);
}

#endif // wxUSE_TOOLPALETTE
