-- ============================================================================
-- Name:        "../../include/wx/libs/base.lua
-- Purpose:     wxBase library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/05
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
-- IMPORTANT: please read docs/tech/tn0016.txt before modifying this file!
-- ============================================================================
project "base"
    kind( wx.getprojectkind() )

    includedirs
    {
        "../../include"
    }

    files
    {
-- ============================================================================
--                                  UNIX
-- ============================================================================
        -- Files used on all Unix systems, including Darwin
        if not wx.msw then
            "../../include/wx/unix/app.h",
            "../../include/wx/unix/apptbase.h",
            "../../include/wx/unix/apptrait.h",
            "../../include/wx/unix/chkconf.h",
            "../../include/wx/unix/evtloop.h",
            "../../include/wx/unix/evtloopsrc.h",
            "../../include/wx/unix/pipe.h",
            "../../include/wx/unix/stdpaths.h",
            "../../include/wx/unix/stackwalk.h",
            "../../include/wx/unix/tls.h",
            "../../include/wx/unix/fswatcher_kqueue.h",
            "../../src/common/fdiodispatcher.cpp",
            "../../src/common/selectdispatcher.cpp",
            "../../src/unix/appunix.cpp",
            "../../src/unix/dir.cpp",
            "../../src/unix/dlunix.cpp",
            "../../src/unix/epolldispatcher.cpp",
            "../../src/unix/evtloopunix.cpp",
            "../../src/unix/fdiounix.cpp",
            "../../src/unix/snglinst.cpp",
            "../../src/unix/stackwalk.cpp",
            "../../src/unix/stdpaths.cpp",
            "../../src/unix/timerunx.cpp",
            "../../src/unix/threadpsx.cpp",
            "../../src/unix/utilsunx.cpp",
            "../../src/unix/fswatcher_kqueue.cpp",

        -- Files used on all Unix systems, including Darwin with any port but wxMac
        -- (this is really an aberration, we should also use these files for wxMac,
        -- it's not done because of some OS 9 support leftovers only now).

        -- Premake4: Included because doesn't supports MacOS 9.
            "../../include/wx/unix/execute.h",
            "../../include/wx/unix/mimetype.h",
            "../../src/unix/mimetype.cpp",

        -- Files used on all non-Darwin Unix systems (because Darwin provides other,
        -- better, native equivalents of the functionality they implement
        -- (e.g. CFSocket instead of BSD sockets) or doesn't provide it at all
        -- (epoll, backtrace())
            if not wx.osx then
                "../../include/wx/unix/fswatcher_inotify.h",
                "../../src/unix/fswatcher_inotify.cpp",
            else
-- ============================================================================
--                                  OSX
-- ============================================================================
                -- Used on Mac OS X wxMac base, and Mac OS X darwin base
                "../../include/wx/osx/core/cfdataref.h",
                "../../include/wx/osx/core/cfref.h",
                "../../include/wx/osx/core/cfstring.h",
                "../../include/wx/osx/core/hid.h",
                "../../include/wx/osx/core/evtloop.h",
                "../../include/wx/osx/core/objcid.h",
                "../../include/wx/osx/core/private.h",
                "../../include/wx/osx/core/stdpaths.h",

                "../../src/osx/core/cfstring.cpp",
                "../../src/osx/core/evtloop_cf.cpp",
                "../../src/osx/core/stdpaths_cf.cpp",
                "../../src/osx/core/strconv_cf.cpp",
                "../../src/osx/core/utilsexc_base.cpp",

                if wx.carbon then
                    -- Base and GUI files used by OS X
                    "../../src/osx/carbon/utils.cpp",
                    "../../src/osx/carbon/uma.cpp",
                else
                    -- Base files used by OS X ports (not Carbon)
                    "../../src/osx/core/mimetype.cpp",
                end

                if wx.cocoa then
                    "../../src/osx/cocoa/utils.mm",
                end

                if wx.iphone then
                    "../../src/osx/iphone/utils.mm",
                end
            end
        else
-- ============================================================================
--                                  Windows
-- ============================================================================
            -- wxMSW headers
            "../../include/wx/msw/apptrait.h",
            "../../include/wx/msw/apptbase.h",
            "../../include/wx/msw/chkconf.h",
            "../../include/wx/msw/crashrpt.h",
            "../../include/wx/msw/dde.h",
            "../../include/wx/msw/debughlp.h",
            "../../include/wx/msw/evtloopconsole.h",
            "../../include/wx/msw/gccpriv.h",
            "../../include/wx/msw/libraries.h",
            "../../include/wx/msw/mimetype.h",
            "../../include/wx/msw/mslu.h",
            "../../include/wx/msw/private.h",
            "../../include/wx/msw/regconf.h",
            "../../include/wx/msw/registry.h",
            "../../include/wx/msw/seh.h",
            "../../include/wx/msw/stackwalk.h",
            "../../include/wx/msw/stdpaths.h",
            "../../include/wx/msw/winundef.h",
            "../../include/wx/msw/wrapcctl.h",
            "../../include/wx/msw/wrapcdlg.h",
            "../../include/wx/msw/wrapwin.h",
            "../../include/wx/msw/fswatcher.h",

            -- wxMSW sources
            "../../src/msw/basemsw.cpp",
            "../../src/msw/crashrpt.cpp",
            "../../src/msw/debughlp.cpp",
            "../../src/msw/dde.cpp",
            "../../src/msw/dir.cpp",
            "../../src/msw/dlmsw.cpp",
            "../../src/msw/evtloopconsole.cpp",
            "../../src/msw/mimetype.cpp",
            "../../src/msw/power.cpp",
            "../../src/msw/regconf.cpp",
            "../../src/msw/registry.cpp",
            "../../src/msw/snglinst.cpp",
            "../../src/msw/stackwalk.cpp",
            "../../src/msw/stdpaths.cpp",
            "../../src/msw/thread.cpp",
            "../../src/msw/timer.cpp",
            "../../src/msw/utils.cpp",
            "../../src/msw/utilsexc.cpp",
            "../../src/msw/fswatcher.cpp",

            if wx.gui then
                "../../src/msw/main.cpp",
                "../../src/msw/mslu.cpp",
                "../../src/msw/volume.cpp",
            end

            if wx.wince then
                "../../include/wx/msw/wince/time.h",
                "../../include/wx/msw/wince/chkconf.h",
                "../../src/msw/wince/time.cpp",
            end
        end

-- ============================================================================
--                                  OS2 (Currently not supported)
-- ============================================================================
    --[[
        if wx.os2 then
            "../../include/wx/unix/app.h",
            "../../include/wx/os2/apptbase.h",
            "../../include/wx/os2/apptrait.h",
            "../../include/wx/unix/evtloop.h",
            "../../include/wx/os2/mimetype.h",
            "../../include/wx/os2/private.h",
            "../../include/wx/os2/stdpaths.h",
            "../../include/wx/os2/chkconf.h",
            "../../include/wx/os2/wxrsc.h",

            "../../src/common/fdiodispatcher.cpp",
            "../../src/common/selectdispatcher.cpp",
            "../../src/unix/appunix.cpp",
            "../../src/unix/evtloopunix.cpp",
            "../../src/unix/timerunx.cpp",
            "../../src/os2/dir.cpp",
            "../../src/os2/mimetype.cpp",
            "../../src/os2/snglinst.cpp",
            "../../src/os2/stdpaths.cpp",
            "../../src/os2/thread.cpp",
            "../../src/os2/utils.cpp",
            "../../src/os2/utilsexc.cpp"
        end
    --]]
-- ============================================================================
--                                  MSDOS (Currently not supported)
-- ============================================================================
    --[[
        if wx.msdos then
            "../../include/wx/msdos/mimetype.h",

            "../../src/msdos/dir.cpp",
            "../../src/msdos/mimetype.cpp",
            "../../src/msdos/utilsdos.cpp"
        end
    --]]
-- ============================================================================
--                                  Common
-- ============================================================================
        "../../include/wx/afterstd.h",
        "../../include/wx/any.h",
        "../../include/wx/anystr.h",
        "../../include/wx/app.h",
        "../../include/wx/apptrait.h",
        "../../include/wx/archive.h",
        "../../include/wx/arrimpl.cpp",
        "../../include/wx/arrstr.h",
        "../../include/wx/atomic.h",
        "../../include/wx/base64.h",
        "../../include/wx/beforestd.h",
        "../../include/wx/buffer.h",
        "../../include/wx/build.h",
        "../../include/wx/chartype.h",
        "../../include/wx/checkeddelete.h",
        "../../include/wx/chkconf.h",
        "../../include/wx/clntdata.h",
        "../../include/wx/cmdargs.h",
        "../../include/wx/cmdline.h",
        "../../include/wx/confbase.h",
        "../../include/wx/config.h",
        "../../include/wx/convauto.h",
        "../../include/wx/containr.h",
        "../../include/wx/cpp.h",
        "../../include/wx/crt.h",
        "../../include/wx/datetime.h",
        "../../include/wx/datstrm.h",
        "../../include/wx/dde.h",
        "../../include/wx/debug.h",
        "../../include/wx/defs.h",
        "../../include/wx/dir.h",
        "../../include/wx/dlimpexp.h",
        "../../include/wx/dlist.h",
        "../../include/wx/dynarray.h",
        "../../include/wx/dynlib.h",
        "../../include/wx/dynload.h",
        "../../include/wx/encconv.h",
        "../../include/wx/event.h",
        "../../include/wx/eventfilter.h",
        "../../include/wx/evtloop.h",
        "../../include/wx/except.h",
        "../../include/wx/features.h",
        "../../include/wx/flags.h",
        "../../include/wx/ffile.h",
        "../../include/wx/file.h",
        "../../include/wx/fileconf.h",
        "../../include/wx/filefn.h",
        "../../include/wx/filename.h",
        "../../include/wx/filesys.h",
        "../../include/wx/fontenc.h",
        "../../include/wx/fontmap.h",
        "../../include/wx/fs_arc.h",
        "../../include/wx/fs_filter.h",
        "../../include/wx/fs_mem.h",
        "../../include/wx/fs_zip.h",
        "../../include/wx/hash.h",
        "../../include/wx/hashmap.h",
        "../../include/wx/hashset.h",
        "../../include/wx/html/forcelnk.h",
        "../../include/wx/iconloc.h",
        "../../include/wx/init.h",
        "../../include/wx/intl.h",
        "../../include/wx/iosfwrap.h",
        "../../include/wx/ioswrap.h",
        "../../include/wx/ipc.h",
        "../../include/wx/ipcbase.h",
        "../../include/wx/kbdstate.h",
        "../../include/wx/language.h",
        "../../include/wx/link.h",
        "../../include/wx/list.h",
        "../../include/wx/listimpl.cpp",
        "../../include/wx/log.h",
        "../../include/wx/longlong.h",
        "../../include/wx/math.h",
        "../../include/wx/memconf.h",
        "../../include/wx/memory.h",
        "../../include/wx/memtext.h",
        "../../include/wx/mimetype.h",
        "../../include/wx/module.h",
        "../../include/wx/mousestate.h",
        "../../include/wx/msgout.h",
        "../../include/wx/msgqueue.h",
        "../../include/wx/mstream.h",
        "../../include/wx/numformatter.h",
        "../../include/wx/object.h",
        "../../include/wx/platform.h",
        "../../include/wx/platinfo.h",
        "../../include/wx/power.h",
        "../../include/wx/process.h",
        "../../include/wx/ptr_scpd.h",
        "../../include/wx/ptr_shrd.h",
        "../../include/wx/recguard.h",
        "../../include/wx/regex.h",
        "../../include/wx/rtti.h",
        "../../include/wx/scopedarray.h",
        "../../include/wx/scopedptr.h",
        "../../include/wx/scopeguard.h",
        "../../include/wx/sharedptr.h",
        "../../include/wx/snglinst.h",
        "../../include/wx/sstream.h",
        "../../include/wx/stack.h",
        "../../include/wx/stackwalk.h",
        "../../include/wx/stdpaths.h",
        "../../include/wx/stdstream.h",
        "../../include/wx/stockitem.h",
        "../../include/wx/stopwatch.h",
        "../../include/wx/strconv.h",
        "../../include/wx/stream.h",
        "../../include/wx/string.h",
        "../../include/wx/stringimpl.h",
        "../../include/wx/stringops.h",
        "../../include/wx/strvararg.h",
        "../../include/wx/sysopt.h",
        "../../include/wx/tarstrm.h",
        "../../include/wx/textbuf.h",
        "../../include/wx/textfile.h",
        "../../include/wx/thread.h",
        "../../include/wx/thrimpl.cpp",
        "../../include/wx/time.h",
        "../../include/wx/timer.h",
        "../../include/wx/tls.h",
        "../../include/wx/tokenzr.h",
        "../../include/wx/tracker.h",
        "../../include/wx/translation.h",
        "../../include/wx/txtstrm.h",
        "../../include/wx/typeinfo.h",
        "../../include/wx/types.h",
        "../../include/wx/unichar.h",
        "../../include/wx/uri.h",
        "../../include/wx/ustring.h",
        "../../include/wx/utils.h",
        "../../include/wx/variant.h",
        "../../include/wx/vector.h",
        "../../include/wx/version.h",
        "../../include/wx/versioninfo.h",
        "../../include/wx/volume.h",
        "../../include/wx/weakref.h",
        "../../include/wx/wfstream.h",
        "../../include/wx/wx.h",
        "../../include/wx/wxchar.h",
        "../../include/wx/wxcrt.h",
        "../../include/wx/wxcrtbase.h",
        "../../include/wx/wxcrtvararg.h",
        "../../include/wx/wxprec.h",
        "../../include/wx/xlocale.h",
        "../../include/wx/xti.h",
        "../../include/wx/xti2.h",
        "../../include/wx/xtistrm.h",
        "../../include/wx/xtictor.h",
        "../../include/wx/xtihandler.h",
        "../../include/wx/xtiprop.h",
        "../../include/wx/xtitypes.h",
        "../../include/wx/zipstrm.h",
        "../../include/wx/zstream.h",
        "../../include/wx/meta/convertible.h",
        "../../include/wx/meta/if.h",
        "../../include/wx/meta/implicitconversion.h",
        "../../include/wx/meta/int2type.h",
        "../../include/wx/meta/movable.h",
        "../../include/wx/meta/pod.h",
        "../../include/wx/meta/removeref.h",
        "../../include/wx/fswatcher.h",
        "../../include/wx/generic/fswatcher.h",

        "../../src/common/any.cpp",
        "../../src/common/appbase.cpp",
        "../../src/common/arcall.cpp",
        "../../src/common/arcfind.cpp",
        "../../src/common/archive.cpp",
        "../../src/common/arrstr.cpp",
        "../../src/common/base64.cpp",
        "../../src/common/clntdata.cpp",
        "../../src/common/cmdline.cpp",
        "../../src/common/config.cpp",
        "../../src/common/convauto.cpp",
        "../../src/common/datetime.cpp",
        "../../src/common/datetimefmt.cpp",
        "../../src/common/datstrm.cpp",
        "../../src/common/dircmn.cpp",
        "../../src/common/dynarray.cpp",
        "../../src/common/dynlib.cpp",
        "../../src/common/dynload.cpp",
        "../../src/common/encconv.cpp",
        "../../src/common/evtloopcmn.cpp",
        "../../src/common/extended.c",
        "../../src/common/ffile.cpp",
        "../../src/common/file.cpp",
        "../../src/common/fileback.cpp",
        "../../src/common/fileconf.cpp",
        "../../src/common/filefn.cpp",
        "../../src/common/filename.cpp",
        "../../src/common/filesys.cpp",
        "../../src/common/filtall.cpp",
        "../../src/common/filtfind.cpp",
        "../../src/common/fmapbase.cpp",
        "../../src/common/fs_arc.cpp",
        "../../src/common/fs_filter.cpp",
        "../../src/common/hash.cpp",
        "../../src/common/hashmap.cpp",
        "../../src/common/init.cpp",
        "../../src/common/intl.cpp",
        "../../src/common/ipcbase.cpp",
        "../../src/common/languageinfo.cpp",
        "../../src/common/list.cpp",
        "../../src/common/log.cpp",
        "../../src/common/longlong.cpp",
        "../../src/common/memory.cpp",
        "../../src/common/mimecmn.cpp",
        "../../src/common/module.cpp",
        "../../src/common/mstream.cpp",
        "../../src/common/numformatter.cpp",
        "../../src/common/object.cpp",
        "../../src/common/platinfo.cpp",
        "../../src/common/powercmn.cpp",
        "../../src/common/process.cpp",
        "../../src/common/regex.cpp",
        "../../src/common/stdpbase.cpp",
        "../../src/common/sstream.cpp",
        "../../src/common/stdstream.cpp",
        "../../src/common/stopwatch.cpp",
        "../../src/common/strconv.cpp",
        "../../src/common/stream.cpp",
        "../../src/common/string.cpp",
        "../../src/common/stringimpl.cpp",
        "../../src/common/stringops.cpp",
        "../../src/common/strvararg.cpp",
        "../../src/common/sysopt.cpp",
        "../../src/common/tarstrm.cpp",
        "../../src/common/textbuf.cpp",
        "../../src/common/textfile.cpp",
        "../../src/common/time.cpp",
        "../../src/common/timercmn.cpp",
        "../../src/common/timerimpl.cpp",
        "../../src/common/tokenzr.cpp",
        "../../src/common/translation.cpp",
        "../../src/common/txtstrm.cpp",
        "../../src/common/unichar.cpp",
        "../../src/common/uri.cpp",
        "../../src/common/ustring.cpp",
        "../../src/common/variant.cpp",
        "../../src/common/wfstream.cpp",
        "../../src/common/wxcrt.cpp",
        "../../src/common/wxprintf.cpp",
        "../../src/common/xlocale.cpp",
        "../../src/common/xti.cpp",
        "../../src/common/xtistrm.cpp",
        "../../src/common/zipstrm.cpp",
        "../../src/common/zstream.cpp",
        "../../src/common/fswatchercmn.cpp",
        "../../src/generic/fswatcherg.cpp",

        -- BASE_AND_GUI_CMN_SRC
        "../../src/common/event.cpp",
        "../../src/common/fs_mem.cpp",
        "../../src/common/msgout.cpp",
        "../../src/common/utilscmn.cpp",
-- ============================================================================
--                                  wxNet (part of wxBase)
-- ============================================================================
    }
