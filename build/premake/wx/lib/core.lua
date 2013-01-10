-- ============================================================================
-- Name:        wx/lib/core.lua
-- Purpose:     wxCore library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/07
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================

project "core"
    kind( wx.getprojectkind() )
-- ============================================================================
--                                  Common
-- ============================================================================
    files
    {
        wx.includedir .. "wx/affinematrix2dbase.h",
        wx.includedir .. "wx/affinematrix2d.h",
        wx.includedir .. "wx/anybutton.h",
        wx.includedir .. "wx/bmpbuttn.h",
        wx.includedir .. "wx/brush.h",
        wx.includedir .. "wx/button.h",
        wx.includedir .. "wx/checkbox.h",
        wx.includedir .. "wx/checklst.h",
        wx.includedir .. "wx/choicdlg.h",
        wx.includedir .. "wx/choice.h",
        wx.includedir .. "wx/cmndata.h",
        wx.includedir .. "wx/collpane.h",
        wx.includedir .. "wx/combo.h",
        wx.includedir .. "wx/combobox.h",
        wx.includedir .. "wx/compositewin.h",
        wx.includedir .. "wx/control.h",
        wx.includedir .. "wx/ctrlsub.h",
        wx.includedir .. "wx/cursor.h",
        wx.includedir .. "wx/custombgwin.h",
        wx.includedir .. "wx/dc.h",
        wx.includedir .. "wx/dcclient.h",
        wx.includedir .. "wx/dcgraph.h",
        wx.includedir .. "wx/dcmemory.h",
        wx.includedir .. "wx/dcprint.h",
        wx.includedir .. "wx/dcscreen.h",
        wx.includedir .. "wx/dcsvg.h",
        wx.includedir .. "wx/dialog.h",
        wx.includedir .. "wx/dirdlg.h",
        wx.includedir .. "wx/dragimag.h",
        wx.includedir .. "wx/encinfo.h",
        wx.includedir .. "wx/filedlg.h",
        wx.includedir .. "wx/frame.h",
        wx.includedir .. "wx/gauge.h",
        wx.includedir .. "wx/gbsizer.h",
        wx.includedir .. "wx/gdicmn.h",
        wx.includedir .. "wx/generic/accel.h",
        wx.includedir .. "wx/generic/buttonbar.h",
        wx.includedir .. "wx/generic/choicdgg.h",
        wx.includedir .. "wx/generic/colrdlgg.h",
        wx.includedir .. "wx/generic/combo.h",
        wx.includedir .. "wx/generic/custombgwin.h",
        wx.includedir .. "wx/generic/dcpsg.h",
        wx.includedir .. "wx/generic/dirctrlg.h",
        wx.includedir .. "wx/generic/dragimgg.h",
        wx.includedir .. "wx/generic/filectrlg.h",
        wx.includedir .. "wx/generic/headerctrlg.h",
        wx.includedir .. "wx/generic/infobar.h",
        wx.includedir .. "wx/generic/logg.h",
        wx.includedir .. "wx/generic/msgdlgg.h",
        wx.includedir .. "wx/generic/numdlgg.h",
        wx.includedir .. "wx/generic/notebook.h",
        wx.includedir .. "wx/generic/panelg.h",
        wx.includedir .. "wx/generic/prntdlgg.h",
        wx.includedir .. "wx/generic/printps.h",
        wx.includedir .. "wx/generic/progdlgg.h",
        wx.includedir .. "wx/generic/richmsgdlgg.h",
        wx.includedir .. "wx/generic/scrolwin.h",
        wx.includedir .. "wx/generic/spinctlg.h",
        wx.includedir .. "wx/generic/splitter.h",
        wx.includedir .. "wx/generic/srchctlg.h",
        wx.includedir .. "wx/generic/statbmpg.h",
        wx.includedir .. "wx/generic/stattextg.h",
        wx.includedir .. "wx/generic/textdlgg.h",
        wx.includedir .. "wx/generic/treectlg.h",
        wx.includedir .. "wx/graphics.h",
        wx.includedir .. "wx/headercol.h",
        wx.includedir .. "wx/headerctrl.h",
        wx.includedir .. "wx/helphtml.h",
        wx.includedir .. "wx/icon.h",
        wx.includedir .. "wx/infobar.h",
        wx.includedir .. "wx/itemid.h",
        wx.includedir .. "wx/layout.h",
        wx.includedir .. "wx/listbox.h",
        wx.includedir .. "wx/mdi.h",
        wx.includedir .. "wx/menu.h",
        wx.includedir .. "wx/mousemanager.h",
        wx.includedir .. "wx/msgdlg.h",
        wx.includedir .. "wx/nativewin.h",
        wx.includedir .. "wx/numdlg.h",
        wx.includedir .. "wx/overlay.h",
        wx.includedir .. "wx/palette.h",
        wx.includedir .. "wx/panel.h",
        wx.includedir .. "wx/pen.h",
        wx.includedir .. "wx/position.h",
        wx.includedir .. "wx/radiobox.h",
        wx.includedir .. "wx/radiobut.h",
        wx.includedir .. "wx/range.h",
        wx.includedir .. "wx/rearrangectrl.h",
        wx.includedir .. "wx/renderer.h",
        wx.includedir .. "wx/richmsgdlg.h",
        wx.includedir .. "wx/scrolbar.h",
        wx.includedir .. "wx/scrolbar.h",
        wx.includedir .. "wx/scrolwin.h",
        wx.includedir .. "wx/selstore.h",
        wx.includedir .. "wx/settings.h",
        wx.includedir .. "wx/sizer.h",
        wx.includedir .. "wx/slider.h",
        wx.includedir .. "wx/statbmp.h",
        wx.includedir .. "wx/statbox.h",
        wx.includedir .. "wx/stattext.h",
        wx.includedir .. "wx/statusbr.h",
        wx.includedir .. "wx/textcompleter.h",
        wx.includedir .. "wx/textctrl.h",
        wx.includedir .. "wx/textdlg.h",
        wx.includedir .. "wx/textentry.h",
        wx.includedir .. "wx/textwrapper.h",
        wx.includedir .. "wx/toolbar.h",
        wx.includedir .. "wx/validate.h",
        wx.includedir .. "wx/valtext.h",
        wx.includedir .. "wx/valnum.h",
        wx.includedir .. "wx/window.h",
        wx.includedir .. "wx/windowid.h",
        wx.includedir .. "wx/withimages.h",
        wx.includedir .. "wx/wrapsizer.h",
        wx.includedir .. "wx/wupdlock.h",

        wx.includedir .. "wx/accel.h",
        wx.includedir .. "wx/access.h",
        wx.includedir .. "wx/anidecod.h",
        wx.includedir .. "wx/animdecod.h",
        wx.includedir .. "wx/artprov.h",
        wx.includedir .. "wx/bitmap.h",
        wx.includedir .. "wx/bookctrl.h",
        wx.includedir .. "wx/busyinfo.h",
        wx.includedir .. "wx/generic/busyinfo.h",
        wx.includedir .. "wx/caret.h",
        wx.includedir .. "wx/choicebk.h",
        wx.includedir .. "wx/clipbrd.h",
        wx.includedir .. "wx/clrpicker.h",
        wx.includedir .. "wx/cmdproc.h",
        wx.includedir .. "wx/colordlg.h",
        wx.includedir .. "wx/colour.h",
        wx.includedir .. "wx/colourdata.h",
        wx.includedir .. "wx/cshelp.h",
        wx.includedir .. "wx/dataobj.h",
        wx.includedir .. "wx/dcmirror.h",
        wx.includedir .. "wx/dcps.h",
        wx.includedir .. "wx/dialup.h",
        wx.includedir .. "wx/dirctrl.h",
        wx.includedir .. "wx/display.h",
        wx.includedir .. "wx/display_impl.h",
        wx.includedir .. "wx/dnd.h",
        wx.includedir .. "wx/docmdi.h",
        wx.includedir .. "wx/docview.h",
        wx.includedir .. "wx/effects.h",
        wx.includedir .. "wx/evtloopsrc.h",
        wx.includedir .. "wx/fdrepdlg.h",
        wx.includedir .. "wx/filectrl.h",
        wx.includedir .. "wx/filehistory.h",
        wx.includedir .. "wx/filepicker.h",
        wx.includedir .. "wx/fontpicker.h",
        wx.includedir .. "wx/fmappriv.h",
        wx.includedir .. "wx/font.h",
        wx.includedir .. "wx/fontdata.h",
        wx.includedir .. "wx/fontdlg.h",
        wx.includedir .. "wx/fontenum.h",
        wx.includedir .. "wx/fontutil.h",
        wx.includedir .. "wx/gdiobj.h",
        wx.includedir .. "wx/geometry.h",
        wx.includedir .. "wx/gifdecod.h",
        wx.includedir .. "wx/help.h",
        wx.includedir .. "wx/helpbase.h",
        wx.includedir .. "wx/helpwin.h",
        wx.includedir .. "wx/iconbndl.h",
        wx.includedir .. "wx/imagbmp.h",
        wx.includedir .. "wx/image.h",
        wx.includedir .. "wx/imaggif.h",
        wx.includedir .. "wx/imagiff.h",
        wx.includedir .. "wx/imagjpeg.h",
        wx.includedir .. "wx/imaglist.h",
        wx.includedir .. "wx/imagpcx.h",
        wx.includedir .. "wx/imagpng.h",
        wx.includedir .. "wx/imagpnm.h",
        wx.includedir .. "wx/imagtga.h",
        wx.includedir .. "wx/imagtiff.h",
        wx.includedir .. "wx/imagxpm.h",
        wx.includedir .. "wx/listbase.h",
        wx.includedir .. "wx/listbook.h",
        wx.includedir .. "wx/listctrl.h",
        wx.includedir .. "wx/matrix.h",
        wx.includedir .. "wx/menuitem.h",
        wx.includedir .. "wx/metafile.h",
        wx.includedir .. "wx/minifram.h",
        wx.includedir .. "wx/nonownedwnd.h",
        wx.includedir .. "wx/notebook.h",
        wx.includedir .. "wx/ownerdrw.h",
        wx.includedir .. "wx/paper.h",
        wx.includedir .. "wx/persist.h",
        wx.includedir .. "wx/persist/bookctrl.h",
        wx.includedir .. "wx/persist/splitter.h",
        wx.includedir .. "wx/persist/toplevel.h",
        wx.includedir .. "wx/persist/treebook.h",
        wx.includedir .. "wx/persist/window.h",
        wx.includedir .. "wx/pickerbase.h",
        wx.includedir .. "wx/popupwin.h",
        wx.includedir .. "wx/print.h",
        wx.includedir .. "wx/printdlg.h",
        wx.includedir .. "wx/prntbase.h",
        wx.includedir .. "wx/progdlg.h",
        wx.includedir .. "wx/quantize.h",
        wx.includedir .. "wx/rawbmp.h",
        wx.includedir .. "wx/region.h",
        wx.includedir .. "wx/scopeguard.h",
        wx.includedir .. "wx/simplebook.h",
        wx.includedir .. "wx/spinbutt.h",
        wx.includedir .. "wx/spinctrl.h",
        wx.includedir .. "wx/splitter.h",
        wx.includedir .. "wx/srchctrl.h",
        wx.includedir .. "wx/statline.h",
        wx.includedir .. "wx/tbarbase.h",
        wx.includedir .. "wx/tglbtn.h",
        wx.includedir .. "wx/tipwin.h",
        wx.includedir .. "wx/toolbook.h",
        wx.includedir .. "wx/tooltip.h",
        wx.includedir .. "wx/toplevel.h",
        wx.includedir .. "wx/treebase.h",
        wx.includedir .. "wx/treebook.h",
        wx.includedir .. "wx/treectrl.h",
        wx.includedir .. "wx/uiaction.h",
        wx.includedir .. "wx/valgen.h",
        wx.includedir .. "wx/vidmode.h",
        wx.includedir .. "wx/vlbox.h",
        wx.includedir .. "wx/vms_x_fix.h",
        wx.includedir .. "wx/vscroll.h",
        wx.includedir .. "wx/xpmdecod.h",
        wx.includedir .. "wx/xpmhand.h",
        wx.includedir .. "wx/xrc/xmlreshandler.h",

        wx.srcdir .. "common/accelcmn.cpp",
        wx.srcdir .. "common/accesscmn.cpp",
        wx.srcdir .. "common/anidecod.cpp",
        wx.srcdir .. "common/affinematrix2d.cpp",
        wx.srcdir .. "common/appcmn.cpp",
        wx.srcdir .. "common/artprov.cpp",
        wx.srcdir .. "common/artstd.cpp",
        wx.srcdir .. "common/arttango.cpp",
        wx.srcdir .. "common/bmpbase.cpp",
        wx.srcdir .. "common/bmpbtncmn.cpp",
        wx.srcdir .. "common/bookctrl.cpp",
        wx.srcdir .. "common/btncmn.cpp",
        wx.srcdir .. "common/cairo.cpp",
        wx.srcdir .. "common/checkboxcmn.cpp",
        wx.srcdir .. "common/checklstcmn.cpp",
        wx.srcdir .. "common/choiccmn.cpp",
        wx.srcdir .. "common/clipcmn.cpp",
        wx.srcdir .. "common/clrpickercmn.cpp",
        wx.srcdir .. "common/colourcmn.cpp",
        wx.srcdir .. "common/colourdata.cpp",
        wx.srcdir .. "common/combocmn.cpp",
        wx.srcdir .. "common/cmdproc.cpp",
        wx.srcdir .. "common/cmndata.cpp",
        wx.srcdir .. "common/containr.cpp",
        wx.srcdir .. "common/cshelp.cpp",
        wx.srcdir .. "common/ctrlcmn.cpp",
        wx.srcdir .. "common/ctrlsub.cpp",
        wx.srcdir .. "common/dcbase.cpp",
        wx.srcdir .. "common/dcbufcmn.cpp",
        wx.srcdir .. "common/dcgraph.cpp",
        wx.srcdir .. "common/dcsvg.cpp",
        wx.srcdir .. "common/dirctrlcmn.cpp",
        wx.srcdir .. "common/dlgcmn.cpp",
        wx.srcdir .. "common/dndcmn.cpp",
        wx.srcdir .. "common/dobjcmn.cpp",
        wx.srcdir .. "common/docmdi.cpp",
        wx.srcdir .. "common/docview.cpp",
        wx.srcdir .. "common/dpycmn.cpp",
        wx.srcdir .. "common/dseldlg.cpp",
        wx.srcdir .. "common/effects.cpp",
        wx.srcdir .. "common/fddlgcmn.cpp",
        wx.srcdir .. "common/filectrlcmn.cpp",
        wx.srcdir .. "common/filehistorycmn.cpp",
        wx.srcdir .. "common/filepickercmn.cpp",
        wx.srcdir .. "common/fontpickercmn.cpp",
        wx.srcdir .. "common/fldlgcmn.cpp",
        wx.srcdir .. "common/fontcmn.cpp",
        wx.srcdir .. "common/fontdata.cpp",
        wx.srcdir .. "generic/graphicc.cpp",
        wx.srcdir .. "common/fontenumcmn.cpp",
        wx.srcdir .. "common/fontmap.cpp",
        wx.srcdir .. "common/fontutilcmn.cpp",
        wx.srcdir .. "common/framecmn.cpp",
        wx.srcdir .. "common/gaugecmn.cpp",
        wx.srcdir .. "common/gbsizer.cpp",
        wx.srcdir .. "common/gdicmn.cpp",
        wx.srcdir .. "common/geometry.cpp",
        wx.srcdir .. "common/gifdecod.cpp",
        wx.srcdir .. "common/graphcmn.cpp",
        wx.srcdir .. "common/headercolcmn.cpp",
        wx.srcdir .. "common/headerctrlcmn.cpp",
        wx.srcdir .. "common/helpbase.cpp",
        wx.srcdir .. "common/iconbndl.cpp",
        wx.srcdir .. "common/imagall.cpp",
        wx.srcdir .. "common/imagbmp.cpp",
        wx.srcdir .. "common/image.cpp",
        wx.srcdir .. "common/imagfill.cpp",
        wx.srcdir .. "common/imaggif.cpp",
        wx.srcdir .. "common/imagiff.cpp",
        wx.srcdir .. "common/imagjpeg.cpp",
        wx.srcdir .. "common/imagpcx.cpp",
        wx.srcdir .. "common/imagpng.cpp",
        wx.srcdir .. "common/imagpnm.cpp",
        wx.srcdir .. "common/imagtga.cpp",
        wx.srcdir .. "common/imagtiff.cpp",
        wx.srcdir .. "common/imagxpm.cpp",
        wx.srcdir .. "common/layout.cpp",
        wx.srcdir .. "common/lboxcmn.cpp",
        wx.srcdir .. "common/listctrlcmn.cpp",
        wx.srcdir .. "common/markupparser.cpp",
        wx.srcdir .. "common/matrix.cpp",
        wx.srcdir .. "common/menucmn.cpp",
        wx.srcdir .. "common/mousemanager.cpp",
        wx.srcdir .. "common/nbkbase.cpp",
        wx.srcdir .. "common/overlaycmn.cpp",
        wx.srcdir .. "common/ownerdrwcmn.cpp",
        wx.srcdir .. "common/paper.cpp",
        wx.srcdir .. "common/panelcmn.cpp",
        wx.srcdir .. "common/persist.cpp",
        wx.srcdir .. "common/pickerbase.cpp",
        wx.srcdir .. "common/popupcmn.cpp",
        wx.srcdir .. "common/prntbase.cpp",
        wx.srcdir .. "common/quantize.cpp",
        wx.srcdir .. "common/radiobtncmn.cpp",
        wx.srcdir .. "common/radiocmn.cpp",
        wx.srcdir .. "common/rearrangectrl.cpp",
        wx.srcdir .. "common/rendcmn.cpp",
        wx.srcdir .. "common/rgncmn.cpp",
        wx.srcdir .. "common/scrolbarcmn.cpp",
        wx.srcdir .. "common/settcmn.cpp",
        wx.srcdir .. "common/sizer.cpp",
        wx.srcdir .. "common/slidercmn.cpp",
        wx.srcdir .. "common/spinbtncmn.cpp",
        wx.srcdir .. "common/spinctrlcmn.cpp",
        wx.srcdir .. "common/srchcmn.cpp",
        wx.srcdir .. "common/statbar.cpp",
        wx.srcdir .. "common/statbmpcmn.cpp",
        wx.srcdir .. "common/statboxcmn.cpp",
        wx.srcdir .. "common/statlinecmn.cpp",
        wx.srcdir .. "common/stattextcmn.cpp",
        wx.srcdir .. "common/stockitem.cpp",
        wx.srcdir .. "common/tbarbase.cpp",
        wx.srcdir .. "common/textcmn.cpp",
        wx.srcdir .. "common/textentrycmn.cpp",
        wx.srcdir .. "common/textmeasurecmn.cpp",
        wx.srcdir .. "common/toplvcmn.cpp",
        wx.srcdir .. "common/treebase.cpp",
        wx.srcdir .. "common/uiactioncmn.cpp",
        wx.srcdir .. "common/valgen.cpp",
        wx.srcdir .. "common/validate.cpp",
        wx.srcdir .. "common/valtext.cpp",
        wx.srcdir .. "common/valnum.cpp",
        wx.srcdir .. "common/wincmn.cpp",
        wx.srcdir .. "common/windowid.cpp",
        wx.srcdir .. "common/wrapsizer.cpp",
        wx.srcdir .. "common/xpmdecod.cpp",
        wx.srcdir .. "generic/busyinfo.cpp",
        wx.srcdir .. "generic/buttonbar.cpp",
        wx.srcdir .. "generic/choicdgg.cpp",
        wx.srcdir .. "generic/choicbkg.cpp",
        wx.srcdir .. "generic/combog.cpp",
        wx.srcdir .. "generic/dcpsg.cpp",
        wx.srcdir .. "generic/dirctrlg.cpp",
        wx.srcdir .. "generic/dragimgg.cpp",
        wx.srcdir .. "generic/filectrlg.cpp",
        wx.srcdir .. "generic/headerctrlg.cpp",
        wx.srcdir .. "generic/infobar.cpp",
        wx.srcdir .. "generic/listbkg.cpp",
        wx.srcdir .. "generic/logg.cpp",
        wx.srcdir .. "generic/markuptext.cpp",
        wx.srcdir .. "generic/msgdlgg.cpp",
        wx.srcdir .. "generic/numdlgg.cpp",
        wx.srcdir .. "generic/progdlgg.cpp",
        wx.srcdir .. "generic/printps.cpp",
        wx.srcdir .. "generic/renderg.cpp",
        wx.srcdir .. "generic/richmsgdlgg.cpp",
        wx.srcdir .. "generic/scrlwing.cpp",
        wx.srcdir .. "generic/selstore.cpp",
        wx.srcdir .. "generic/spinctlg.cpp",
        wx.srcdir .. "generic/splitter.cpp",
        wx.srcdir .. "generic/srchctlg.cpp",
        wx.srcdir .. "generic/statbmpg.cpp",
        wx.srcdir .. "generic/stattextg.cpp",
        wx.srcdir .. "generic/textdlgg.cpp",
        wx.srcdir .. "generic/tipwin.cpp",
        wx.srcdir .. "generic/toolbkg.cpp",
        wx.srcdir .. "generic/treectlg.cpp",
        wx.srcdir .. "generic/treebkg.cpp",
        wx.srcdir .. "generic/vlbox.cpp",
        wx.srcdir .. "generic/vscroll.cpp",
        wx.srcdir .. "xrc/xmlreshandler.cpp"
    }
-- ============================================================================
--                                  UNIX
-- ============================================================================
    if not wx.msw and not wx.os2 then files
    {
        wx.srcdir .. "unix/apptraits.cpp",
-- ============================================================================
--                                  Common X11 code
-- ============================================================================
        wx.includedir .. "wx/generic/caret.h",
        wx.includedir .. "wx/generic/imaglist.h",
        wx.includedir .. "wx/unix/fontutil.h",
        wx.includedir .. "wx/unix/utilsx11.h",

        wx.srcdir .. "generic/caret.cpp",
        wx.srcdir .. "generic/imaglist.cpp",
        wx.srcdir .. "unix/dialup.cpp",
        wx.srcdir .. "unix/displayx11.cpp",
        wx.srcdir .. "unix/fontenum.cpp",
        wx.srcdir .. "unix/fontutil.cpp",
        wx.srcdir .. "unix/uiactionx11.cpp",
        wx.srcdir .. "unix/utilsx11.cpp"
    }
    end
-- ============================================================================
--                                  wxGTK
-- ============================================================================
    if wx.gtk then
        if wx.msw then files
        {
            wx/generic/caret.h
            wx/generic/imaglist.h
            wx/msw/ole/automtn.h
            wx/msw/ole/oleutils.h
            wx/msw/ole/safearray.h
            wx/msw/ole/uuid.h
            wx/msw/dib.h
            wx/unix/fontutil.h

            src/generic/caret.cpp
            src/generic/imaglist.cpp
            src/msw/ole/automtn.cpp
            src/msw/ole/oleutils.cpp
            src/msw/ole/safearray.cpp
            src/msw/ole/uuid.cpp
            src/msw/dialup.cpp
            src/msw/dib.cpp
            src/msw/display.cpp
            src/msw/utilswin.cpp
            src/unix/fontenum.cpp
            src/unix/fontutil.cpp
        }
        elseif wx.gtk > 1 then
            files
            {
                wx/generic/icon.h
                wx/generic/paletteg.h
                wx/gtk/app.h
                wx/gtk/assertdlg_gtk.h
                wx/gtk/bitmap.h
                wx/gtk/brush.h
                wx/gtk/clipbrd.h
                wx/gtk/colour.h
                wx/gtk/cursor.h
                wx/gtk/dataform.h
                wx/gtk/dataobj.h
                wx/gtk/dataobj2.h
                wx/gtk/dnd.h
                wx/gtk/evtloop.h
                wx/gtk/evtloopsrc.h
                wx/gtk/font.h
                wx/gtk/filehistory.h
                wx/gtk/minifram.h
                wx/gtk/nonownedwnd.h
                wx/gtk/pen.h
                wx/gtk/popupwin.h
                wx/gtk/region.h
                wx/gtk/tooltip.h
                wx/gtk/toplevel.h
                wx/gtk/window.h

                src/generic/icon.cpp
                src/generic/paletteg.cpp
                src/gtk/app.cpp
                src/gtk/assertdlg_gtk.cpp
                src/gtk/bitmap.cpp
                src/gtk/brush.cpp
                src/gtk/clipbrd.cpp
                src/gtk/colour.cpp
                src/gtk/cursor.cpp
                src/gtk/dataobj.cpp
                src/gtk/dc.cpp
                src/gtk/dnd.cpp
                src/gtk/evtloop.cpp
                src/gtk/filectrl.cpp
                src/gtk/filehistory.cpp
                src/gtk/font.cpp
                src/gtk/sockgtk.cpp
                src/gtk/minifram.cpp
                src/gtk/nonownedwnd.cpp
                src/gtk/pen.cpp
                src/gtk/popupwin.cpp
                src/gtk/private.cpp
                src/gtk/region.cpp
                src/gtk/renderer.cpp
                src/gtk/settings.cpp
                src/gtk/textmeasure.cpp
                src/gtk/timer.cpp
                src/gtk/tooltip.cpp
                src/gtk/toplevel.cpp
                src/gtk/utilsgtk.cpp
                src/gtk/win_gtk.cpp
                src/gtk/window.cpp

                wx/generic/fdrepdlg.h
                wx/generic/filepickerg.h
                wx/generic/listctrl.h
                wx/generic/statusbr.h
                wx/gtk/accel.h
                wx/gtk/anybutton.h
                wx/gtk/bmpbuttn.h
                wx/gtk/button.h
                wx/gtk/checkbox.h
                wx/gtk/checklst.h
                wx/gtk/chkconf.h
                wx/gtk/collpane.h
                wx/gtk/colordlg.h
                wx/gtk/choice.h
                wx/gtk/combobox.h
                wx/gtk/control.h
                wx/gtk/clrpicker.h
                wx/gtk/dialog.h
                wx/gtk/dirdlg.h
                wx/gtk/filectrl.h
                wx/gtk/filedlg.h
                wx/gtk/fontpicker.h
                wx/gtk/filepicker.h
                wx/gtk/fontdlg.h
                wx/gtk/frame.h
                wx/gtk/gauge.h
                wx/gtk/gnome/gvfs.h
                wx/gtk/infobar.h
                wx/gtk/listbox.h
                wx/gtk/mdi.h
                wx/gtk/menu.h
                wx/gtk/menuitem.h
                wx/gtk/msgdlg.h
                wx/gtk/notebook.h
                wx/gtk/print.h
                wx/gtk/radiobox.h
                wx/gtk/radiobut.h
                wx/gtk/scrolbar.h
                wx/gtk/scrolwin.h
                wx/gtk/slider.h
                wx/gtk/spinbutt.h
                wx/gtk/spinctrl.h
                wx/gtk/statbmp.h
                wx/gtk/statbox.h
                wx/gtk/statline.h
                wx/gtk/stattext.h
                wx/gtk/toolbar.h
                wx/gtk/textctrl.h
                wx/gtk/textentry.h
                wx/gtk/tglbtn.h
                wx/gtk/treeentry_gtk.h

                -- Generic implementations used by wxGTK
                src/generic/accel.cpp
                src/generic/fdrepdlg.cpp

                -- Needed as long as we support GTK+ < 2.6
                src/generic/filepickerg.cpp
                src/generic/listctrl.cpp
                src/generic/prntdlgg.cpp
                src/generic/statusbr.cpp

                -- GTK+ specific files
                src/gtk/anybutton.cpp
                src/gtk/artgtk.cpp
                src/gtk/bmpbuttn.cpp
                src/gtk/button.cpp
                src/gtk/checkbox.cpp
                src/gtk/checklst.cpp
                src/gtk/choice.cpp
                src/gtk/collpane.cpp
                src/gtk/colordlg.cpp
                src/gtk/combobox.cpp
                src/gtk/control.cpp
                src/gtk/clrpicker.cpp
                src/gtk/dialog.cpp
                src/gtk/fontpicker.cpp
                src/gtk/filepicker.cpp
                src/gtk/dirdlg.cpp
                src/gtk/filedlg.cpp
                src/gtk/fontdlg.cpp
                src/gtk/frame.cpp
                src/gtk/gauge.cpp
                src/gtk/gnome/gvfs.cpp
                src/gtk/infobar.cpp
                src/gtk/listbox.cpp
                src/gtk/mdi.cpp
                src/gtk/menu.cpp
                src/gtk/mnemonics.cpp
                src/gtk/msgdlg.cpp
                src/gtk/nativewin.cpp
                src/gtk/notebook.cpp
                src/gtk/print.cpp
                src/gtk/radiobox.cpp
                src/gtk/radiobut.cpp
                src/gtk/scrolbar.cpp
                src/gtk/scrolwin.cpp
                src/gtk/slider.cpp
                src/gtk/spinbutt.cpp
                src/gtk/spinctrl.cpp
                src/gtk/statbmp.cpp
                src/gtk/statbox.cpp
                src/gtk/statline.cpp
                src/gtk/stattext.cpp
                src/gtk/toolbar.cpp
                src/gtk/textctrl.cpp
                src/gtk/textentry.cpp
                src/gtk/tglbtn.cpp
                src/gtk/treeentry_gtk.c
            }

            if wx.gtk == 2 then files
            {
                src/gtk/dcclient.cpp
                src/gtk/dcmemory.cpp
                src/gtk/dcscreen.cpp

                wx/generic/fontdlgg.h
                wx/gtk/gnome/gprint.h

                -- Generic implementations used by wxGPE
                src/generic/fontdlgg.cpp
                -- GTK+ specific files
                src/gtk/gnome/gprint.cpp
            }
            end
        elseif wx.gtk == 1 then files
        {
            wx/generic/clrpickerg.h
            wx/generic/collpaneg.h
            wx/generic/colrdlgg.h
            wx/generic/dirdlgg.h
            wx/generic/fdrepdlg.h
            wx/generic/filedlgg.h
            wx/generic/filepickerg.h
            wx/generic/fontdlgg.h
            wx/generic/fontpickerg.h
            wx/generic/listctrl.h
            wx/generic/statusbr.h
            wx/gtk1/accel.h
            wx/gtk1/bmpbuttn.h
            wx/gtk1/button.h
            wx/gtk1/checkbox.h
            wx/gtk1/checklst.h
            wx/gtk1/choice.h
            wx/gtk1/combobox.h
            wx/gtk1/control.h
            wx/gtk1/dialog.h
            wx/gtk1/filedlg.h
            wx/gtk1/fontdlg.h
            wx/gtk1/frame.h
            wx/gtk1/gauge.h
            wx/gtk1/listbox.h
            wx/gtk1/mdi.h
            wx/gtk1/menu.h
            wx/gtk1/menuitem.h
            wx/gtk1/msgdlg.h
            wx/gtk1/notebook.h
            wx/gtk1/radiobox.h
            wx/gtk1/radiobut.h
            wx/gtk1/scrolbar.h
            wx/gtk1/scrolwin.h
            wx/gtk1/slider.h
            wx/gtk1/spinbutt.h
            wx/gtk1/spinctrl.h
            wx/gtk1/statbmp.h
            wx/gtk1/statbox.h
            wx/gtk1/statline.h
            wx/gtk1/stattext.h
            wx/gtk1/toolbar.h
            wx/gtk1/textctrl.h
            wx/gtk1/tglbtn.h
            wx/gtk1/treectrl.h

            wx/generic/icon.h
            wx/generic/paletteg.h
            wx/gtk1/app.h
            wx/gtk1/bitmap.h
            wx/gtk1/brush.h
            wx/gtk1/clipbrd.h
            wx/gtk1/colour.h
            wx/gtk1/cursor.h
            wx/gtk1/dataform.h
            wx/gtk1/dataobj.h
            wx/gtk1/dataobj2.h
            wx/gtk1/dc.h
            wx/gtk1/dcclient.h
            wx/gtk1/dcmemory.h
            wx/gtk1/dcscreen.h
            wx/gtk1/dnd.h
            wx/gtk1/font.h
            wx/gtk1/minifram.h
            wx/gtk1/pen.h
            wx/gtk1/popupwin.h
            wx/gtk1/region.h
            wx/gtk1/tooltip.h
            wx/gtk1/toplevel.h
            wx/gtk1/win_gtk.h
            wx/gtk1/window.h

            -- Generic implementations used by wxGTK1
            src/generic/accel.cpp
            src/generic/clrpickerg.cpp
            src/generic/collpaneg.cpp
            src/generic/colrdlgg.cpp
            src/generic/dirdlgg.cpp
            src/generic/fdrepdlg.cpp
            src/generic/filedlgg.cpp
            src/generic/filepickerg.cpp
            src/generic/fontdlgg.cpp
            src/generic/fontpickerg.cpp
            src/generic/listctrl.cpp
            src/generic/prntdlgg.cpp
            src/generic/statusbr.cpp

            -- GTK1 specific files
            src/gtk1/bmpbuttn.cpp
            src/gtk1/button.cpp
            src/gtk1/checkbox.cpp
            src/gtk1/checklst.cpp
            src/gtk1/choice.cpp
            src/gtk1/combobox.cpp
            src/gtk1/control.cpp
            src/gtk1/dialog.cpp
            src/gtk1/filedlg.cpp
            src/gtk1/fontdlg.cpp
            src/gtk1/frame.cpp
            src/gtk1/gauge.cpp
            src/gtk1/listbox.cpp
            src/gtk1/mdi.cpp
            src/gtk1/menu.cpp
            src/gtk1/mnemonics.cpp
            src/gtk1/notebook.cpp
            src/gtk1/radiobox.cpp
            src/gtk1/radiobut.cpp
            src/gtk1/scrolbar.cpp
            src/gtk1/scrolwin.cpp
            src/gtk1/slider.cpp
            src/gtk1/spinbutt.cpp
            src/gtk1/spinctrl.cpp
            src/gtk1/statbmp.cpp
            src/gtk1/statbox.cpp
            src/gtk1/statline.cpp
            src/gtk1/stattext.cpp
            src/gtk1/toolbar.cpp
            src/gtk1/textctrl.cpp
            src/gtk1/tglbtn.cpp

            src/generic/icon.cpp
            src/generic/paletteg.cpp
            src/generic/textmeasure.cpp
            src/gtk1/app.cpp
            src/gtk1/bitmap.cpp
            src/gtk1/brush.cpp
            src/gtk1/clipbrd.cpp
            src/gtk1/colour.cpp
            src/gtk1/cursor.cpp
            src/gtk1/data.cpp
            src/gtk1/dataobj.cpp
            src/gtk1/dc.cpp
            src/gtk1/dcclient.cpp
            src/gtk1/dcmemory.cpp
            src/gtk1/dcscreen.cpp
            src/gtk1/dnd.cpp
            src/gtk1/evtloop.cpp
            src/gtk1/font.cpp
            src/gtk1/sockgtk.cpp
            src/gtk1/main.cpp
            src/gtk1/minifram.cpp
            src/gtk1/pen.cpp
            src/gtk1/popupwin.cpp
            src/gtk1/region.cpp
            src/gtk1/renderer.cpp
            src/gtk1/settings.cpp
            src/gtk1/timer.cpp
            src/gtk1/tooltip.cpp
            src/gtk1/toplevel.cpp
            src/gtk1/utilsgtk.cpp
            src/gtk1/win_gtk.c
            src/gtk1/window.cpp
        }
        end
-- ============================================================================
--                                  wxMotif
-- ============================================================================
    elseif wx.motif then files
    {
        wx/x11/bitmap.h
        wx/x11/brush.h
        wx/x11/palette.h
        wx/x11/pen.h
        wx/x11/region.h

        wx/generic/clrpickerg.h
        wx/generic/collpaneg.h
        wx/generic/colrdlgg.h
        wx/generic/ctrlsub.h
        wx/generic/dirdlgg.h
        wx/generic/fdrepdlg.h
        wx/generic/filepickerg.h
        wx/generic/fontdlgg.h
        wx/generic/fontpickerg.h
        wx/generic/listctrl.h
        wx/generic/mdig.h
        wx/generic/notebook.h
        wx/generic/prntdlgg.h
        wx/generic/statline.h
        wx/generic/statusbr.h
        wx/generic/tabg.h
        wx/motif/accel.h
        wx/motif/app.h
        wx/motif/bmpbuttn.h
        wx/motif/bmpmotif.h
        wx/motif/button.h
        wx/motif/checkbox.h
        wx/motif/checklst.h
        wx/motif/chkconf.h
        wx/motif/choice.h
        wx/motif/clipbrd.h
        wx/motif/colour.h
        wx/motif/combobox.h
        wx/motif/control.h
        wx/motif/ctrlsub.h
        wx/motif/cursor.h
        wx/motif/dataform.h
        wx/motif/dataobj.h
        wx/motif/dataobj2.h
        wx/motif/dc.h
        wx/motif/dcclient.h
        wx/motif/dcmemory.h
        wx/motif/dcprint.h
        wx/motif/dcscreen.h
        wx/motif/dialog.h
        wx/motif/dnd.h
        wx/motif/filedlg.h
        wx/motif/font.h
        wx/motif/frame.h
        wx/motif/gauge.h
        wx/motif/icon.h
        wx/motif/listbox.h
        wx/motif/menu.h
        wx/motif/menuitem.h
        wx/motif/minifram.h
        wx/motif/msgdlg.h
        wx/motif/popupwin.h
        wx/motif/print.h
        wx/motif/private.h
        wx/motif/radiobox.h
        wx/motif/radiobut.h
        wx/motif/scrolbar.h
        wx/motif/slider.h
        wx/motif/spinbutt.h
        wx/motif/statbmp.h
        wx/motif/statbox.h
        wx/motif/stattext.h
        wx/motif/textctrl.h
        wx/motif/textentry.h
        wx/motif/tglbtn.h
        wx/motif/toolbar.h
        wx/motif/toplevel.h
        wx/motif/window.h

        src/generic/textmeasure.cpp
        src/x11/bitmap.cpp
        src/x11/brush.cpp
        src/x11/palette.cpp
        src/x11/pen.cpp
        src/x11/region.cpp
        src/x11/utilsx.cpp

        src/motif/accel.cpp
        src/motif/app.cpp
        src/motif/bmpbuttn.cpp
        src/motif/bmpmotif.cpp
        src/motif/button.cpp
        src/motif/checkbox.cpp
        src/motif/checklst.cpp
        src/motif/choice.cpp
        src/motif/clipbrd.cpp
        src/motif/colour.cpp
        src/motif/combobox.cpp
        src/motif/combobox_native.cpp
        src/motif/control.cpp
        src/motif/cursor.cpp
        src/motif/data.cpp
        src/motif/dataobj.cpp
        src/motif/dc.cpp
        src/motif/dcclient.cpp
        src/motif/dcmemory.cpp
        src/motif/dcscreen.cpp
        src/motif/dialog.cpp
        src/motif/evtloop.cpp
        src/motif/filedlg.cpp
        src/motif/font.cpp
        src/motif/frame.cpp
        src/motif/gauge.cpp
        src/motif/sockmot.cpp
        src/motif/icon.cpp
        src/motif/listbox.cpp
        src/motif/main.cpp
        src/motif/menu.cpp
        src/motif/menuitem.cpp
        src/motif/minifram.cpp
        src/motif/msgdlg.cpp
        src/motif/popupwin.cpp
        src/motif/radiobox.cpp
        src/motif/radiobut.cpp
        src/motif/scrolbar.cpp
        src/motif/settings.cpp
        src/motif/slider.cpp
        src/motif/spinbutt.cpp
        src/motif/statbmp.cpp
        src/motif/statbox.cpp
        src/motif/stattext.cpp
        src/motif/textctrl.cpp
        src/motif/textentry.cpp
        src/motif/timer.cpp
        src/motif/toolbar.cpp
        src/motif/toplevel.cpp
        src/motif/utils.cpp
        src/motif/window.cpp
        src/motif/xmcombo/xmcombo.c

        -- Generic files used by wxMotif
        src/generic/clrpickerg.cpp
        src/generic/collpaneg.cpp
        src/generic/colrdlgg.cpp
        src/generic/dirdlgg.cpp
        src/generic/fdrepdlg.cpp
        src/generic/filepickerg.cpp
        src/generic/fontdlgg.cpp
        src/generic/fontpickerg.cpp
        src/generic/listctrl.cpp
        src/generic/mdig.cpp
        src/generic/notebook.cpp
        src/generic/prntdlgg.cpp
        src/generic/statline.cpp
        src/generic/statusbr.cpp
        src/generic/tabg.cpp
    }
    end
-- ============================================================================
--                                  OSX
-- ============================================================================
    elseif wx.osx then

    end
-- ============================================================================
--                                  Windows
-- ============================================================================
    elseif wx.msw then
        files
        {

        }

        if wx.gtk then files
        {

        }
        end
    end
-- ============================================================================
--                                  OS2 (Currently not supported)
-- ============================================================================
--[[
    if wx.os2 then files
    {

    }
    end
--]]
