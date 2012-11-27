/////////////////////////////////////////////////////////////////////////////
// Name:        wx/gtk/toolpalette.h
// Purpose:     native implementation of wxToolPalette (GTK+ 2.20 and later)
// Author:      Andrea Zanellato
// Modified by:
// Created:     2011-10-29
// RCS-ID:      $Id$
// Copyright:   (c) wxWidgets Team
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

#ifndef _WX_TOOLPALETTE_GTK_H_
#define _WX_TOOLPALETTE_GTK_H_

#if wxUSE_TOOLPALETTE

// ----------------------------------------------------------------------------
// wxToolPalettePage for GTK+
// ----------------------------------------------------------------------------

typedef struct _GtkTooltips GtkTooltips;

class WXDLLIMPEXP_FWD_CORE wxToolPalette;

class WXDLLIMPEXP_CORE wxToolPalettePage : public wxToolBarBase
{
public:
// ----------------------------------------------------------------------------
// Construction
// ----------------------------------------------------------------------------
    wxToolPalettePage();

    wxToolPalettePage(wxToolPalette  *parent,
                      wxWindowID      id          = wxID_ANY,
                      const wxString& label       = wxEmptyString,
                      const wxBitmap& bitmap      = wxNullBitmap,
                      const wxBitmap& bmpDisabled = wxNullBitmap,
                      long            style       = 0,
                      const wxString& name        = wxToolPalettePageNameStr);

    bool Create(wxToolPalette  *parent,
                wxWindowID      id          = wxID_ANY,
                const wxString& label       = wxEmptyString,
                const wxBitmap& bitmap      = wxNullBitmap,
                const wxBitmap& bmpDisabled = wxNullBitmap,
                long            style       = 0,
                const wxString& name        = wxToolPalettePageNameStr);

    virtual ~wxToolPalettePage();

    virtual wxToolBarToolBase *FindToolForPosition(wxCoord x, wxCoord y) const;

    virtual void SetToolShortHelp(int id, const wxString& helpString);

    virtual void SetWindowStyleFlag( long style );

    virtual void SetToolNormalBitmap(int id, const wxBitmap& bitmap);
    virtual void SetToolDisabledBitmap(int id, const wxBitmap& bitmap);

    virtual bool Realize();

    static wxVisualAttributes
    GetClassDefaultAttributes(wxWindowVariant variant = wxWINDOW_VARIANT_NORMAL);

    virtual wxToolBarToolBase *CreateTool(int             id,
                                          const wxString& label,
                                          const wxBitmap& bitmap1,
                                          const wxBitmap& bitmap2         = wxNullBitmap,
                                          wxItemKind      kind            = wxITEM_NORMAL,
                                          wxObject        *clientData     = NULL,
                                          const wxString& shortHelpString = wxEmptyString,
                                          const wxString& longHelpString  = wxEmptyString);

    virtual wxToolBarToolBase *CreateTool(wxControl *control,
                                          const wxString& label);
// ----------------------------------------------------------------------------
// Implementation
// ----------------------------------------------------------------------------
protected:
    virtual wxSize DoGetBestSize() const;
    virtual GdkWindow *GTKGetWindow(wxArrayGdkWindows& windows) const;

    // implement base class pure virtuals
    virtual bool DoInsertTool(size_t pos, wxToolBarToolBase *tool);
    virtual bool DoDeleteTool(size_t pos, wxToolBarToolBase *tool);

    virtual void DoEnableTool(wxToolBarToolBase *tool, bool enable);
    virtual void DoToggleTool(wxToolBarToolBase *tool, bool toggle);
    virtual void DoSetToggle(wxToolBarToolBase *tool, bool toggle);

private:
    void Init();
    void GtkSetStyle();
    GSList* GetRadioGroup(size_t pos);
    virtual void AddChildGTK(wxWindowGTK* child);

    GtkToolItemGroup *m_toolpage;
    GtkTooltips      *m_tooltips;

    wxDECLARE_DYNAMIC_CLASS( wxToolPalettePage );
};

// ----------------------------------------------------------------------------
// wxToolPalette for GTK+
// ----------------------------------------------------------------------------

class WXDLLIMPEXP_CORE wxToolPalette : public wxBookCtrlBase
{
public:
// ----------------------------------------------------------------------------
// Default for dynamic class
// ----------------------------------------------------------------------------

    wxToolPalette();

    wxToolPalette(wxWindow       *parent,
                  wxWindowID      id    = wxID_ANY,
                  const wxPoint&  pos   = wxDefaultPosition,
                  const wxSize&   size  = wxDefaultSize,
                  long            style = wxBK_DEFAULT,
                  const wxString& name  = wxToolPaletteNameStr);

    bool Create(wxWindow        *parent,
                wxWindowID      id    = wxID_ANY,
                const wxPoint&  pos   = wxDefaultPosition,
                const wxSize&   size  = wxDefaultSize,
                long            style = wxBK_DEFAULT,
                const wxString& name  = wxToolPaletteNameStr);

    virtual ~wxToolPalette();

// ----------------------------------------------------------------------------
// Implement base class methods
// ----------------------------------------------------------------------------

    // Set / get the title of a page
    bool SetPageText(size_t nPage, const wxString& strText);
    wxString GetPageText(size_t nPage) const;

    // Sets / returns item's image index in the current image list
    int  GetPageImage(size_t nPage) const;
    bool SetPageImage(size_t nPage, int nImage);

    // The same as AddPage(), but adds the page at the specified position
    virtual bool InsertPage(size_t n, wxWindow *page, const wxString& text,
                            bool bSelect = false, int imageId = NO_IMAGE);

    // Set the currently selected page, return the index of the previously
    // selected one (or wxNOT_FOUND on error)
    //
    // NB: this function will generate PAGE_CHANGING/ED events
    int SetSelection(size_t n);

    // Acts as SetSelection but does not generate events
    int ChangeSelection(size_t n);

protected:
    // Remove the page and return a pointer to it
    wxWindow *DoRemovePage(size_t page);

private:
    // Common part of all ctors
    void Init();
    virtual void AddChildGTK(wxWindowGTK *child);

    wxDECLARE_DYNAMIC_CLASS( wxToolPalette );
//  wxDECLARE_EVENT_TABLE();
};

#endif // #if wxUSE_TOOLPALETTE

#endif // _WX_TOOLPALETTE_GTK_H_
