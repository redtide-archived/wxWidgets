/////////////////////////////////////////////////////////////////////////////
// Name:        toolpalette.cpp
// Purpose:     wxToolPalette control sample
// Author:      Andrea Zanellato
// Modified by:
// Created:     2012-11-12
// RCS-ID:      $Id$
// Copyright:   (c) wxWidgets Team
// Licence:     wxWindows licence
/////////////////////////////////////////////////////////////////////////////

#include "wx/wxprec.h"

#ifdef __BORLANDC__
    #pragma hdrstop
#endif

#ifndef WX_PRECOMP
    #include "wx/wx.h"
#endif

#include "wx/toolpalette.h"

#ifndef wxHAS_IMAGES_IN_RESOURCES
    #include "../sample.xpm"
#endif

class ToolPaletteSample : public wxApp
{
public:
    virtual bool OnInit();
};

class MyFrame : public wxFrame
{
public:
    MyFrame(const wxString& title);

private:
    void OnAbout(wxCommandEvent& event);
    void OnQuit(wxCommandEvent& event);

    DECLARE_EVENT_TABLE()
};

enum
{
    ID_TEST
};

BEGIN_EVENT_TABLE(MyFrame, wxFrame)
    EVT_MENU(wxID_ABOUT, MyFrame::OnAbout)
    EVT_MENU(wxID_EXIT, MyFrame::OnQuit)
END_EVENT_TABLE()

IMPLEMENT_APP(ToolPaletteSample)

bool ToolPaletteSample::OnInit()
{
    if ( !wxApp::OnInit() )
        return false;

    MyFrame *frame = new MyFrame("wxToolPalette Sample");

    frame->Show(true);

    return true;
}

MyFrame::MyFrame(const wxString& title)
       : wxFrame(NULL, wxID_ANY, title, wxDefaultPosition, wxSize(450,400))
{
    SetIcon(wxICON(sample));

#if wxUSE_MENUS
    wxMenu *fileMenu    = new wxMenu;
    wxMenu *paletteMenu = new wxMenu;
    wxMenu *helpMenu    = new wxMenu;

    fileMenu->Append(wxID_EXIT, "E&xit\tAlt-X", "Quit this program");

    paletteMenu->Append(wxID_ANY, "&Horizontal", "Horizontal layout", wxITEM_RADIO);
    paletteMenu->Append(wxID_ANY, "&Vertical", "Vertical layout", wxITEM_RADIO);
    paletteMenu->AppendSeparator();
    paletteMenu->Append(wxID_ANY, "&Top", "Show the palette to the top", wxITEM_RADIO);
    paletteMenu->Append(wxID_ANY, "Botto&m", "Show the palette to the bottom", wxITEM_RADIO);
    paletteMenu->Append(wxID_ANY, "Le&ft", "Show the palette to the left", wxITEM_RADIO);
    paletteMenu->Append(wxID_ANY, "&Right", "Show the palette to the right", wxITEM_RADIO);
    paletteMenu->AppendSeparator();
    paletteMenu->Append(wxID_ANY, "&Label", "Show only labels in buttons", wxITEM_RADIO);
    paletteMenu->Append(wxID_ANY, "&Icons", "Show only icons in buttons", wxITEM_RADIO);
    paletteMenu->Append(wxID_ANY, "&Both", "Show both icons with labels below", wxITEM_RADIO);
    paletteMenu->Append(wxID_ANY, "Both horizontal (&Default)", "Show icons with labels on the right", wxITEM_RADIO);
    paletteMenu->AppendSeparator();
    helpMenu->Append(wxID_ABOUT, "&About\tF1", "Show about dialog");

    wxMenuBar *menuBar = new wxMenuBar();
    menuBar->Append(fileMenu, "&File");
    menuBar->Append(paletteMenu, "&ToolPalette");
    menuBar->Append(helpMenu, "&Help");

    SetMenuBar(menuBar);
#endif // wxUSE_MENUS

#if wxUSE_STATUSBAR
    CreateStatusBar();
    SetStatusText("Welcome to wxWidgets!");
#endif // wxUSE_STATUSBAR

    // Main sizer
    wxBoxSizer *mainSizer = new wxBoxSizer( wxHORIZONTAL );
    wxBoxSizer *scrollSizer = new wxBoxSizer( wxVERTICAL );

    // Scrolled window to scroll the palette
    wxScrolled<wxPanel> *scrolled = new wxScrolled<wxPanel>(this, wxID_ANY);
    scrolled->SetScrollRate( 5, 5 );

    wxToolPalette *palette = new wxToolPalette(scrolled, wxID_ANY);
    wxSize size = scrolled->GetSize();
    palette->SetVirtualSize(size.GetX() + 15, size.GetY() + 15);

    wxToolPalettePage *pageStockAF = new wxToolPalettePage(palette, wxID_ANY);
    wxToolPalettePage *pageStockGN = new wxToolPalettePage(palette, wxID_ANY);
    wxToolPalettePage *pageStockOR = new wxToolPalettePage(palette, wxID_ANY);
    wxToolPalettePage *pageStockSZ = new wxToolPalettePage(palette, wxID_ANY);
    wxToolPalettePage *pageRadio   = new wxToolPalettePage(palette, wxID_ANY);
/*
    palette->AddPage(pageStockAF, "Stock Icons (A-F)");
    palette->AddPage(pageStockGN, "Stock Icons (G-N)");
    palette->AddPage(pageStockOR, "Stock Icons (O-R)");
    palette->AddPage(pageStockSZ, "Stock Icons (S-Z)");
    palette->AddPage(pageRadio,   "Radio Item");
*/
    scrollSizer->Add( palette, 1, wxEXPAND );

    scrolled->SetBackgroundColour(*wxGREEN);
    palette->SetBackgroundColour(*wxWHITE);

    scrolled->SetSizer( scrollSizer );
    scrolled->Layout();

    scrollSizer->Fit( scrolled );
    mainSizer->Add( scrolled, 1, wxEXPAND );

    wxPanel *panel = new wxPanel(this, wxID_ANY);

    panel->SetBackgroundColour(*wxRED);

    mainSizer->Add( panel, 1, wxEXPAND );

    SetSizer( mainSizer );
    Layout();

    Center(wxBOTH);
}

void MyFrame::OnAbout(wxCommandEvent& WXUNUSED(event))
{
    wxMessageBox(wxString::Format("Welcome to %s!\n\n"
                                  "wxToolPalette Sample\nrunning under %s.",
                                  wxVERSION_STRING, wxGetOsDescription()),
                                  "About wxToolPalette Sample",
                                  wxOK | wxICON_INFORMATION, this);
}

void MyFrame::OnQuit(wxCommandEvent& WXUNUSED(event))
{
    Close(true);
}
