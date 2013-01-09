-- ============================================================================
-- Name:        wx/lib/base.lua
-- Purpose:     wxBase library project
-- Author:      Andrea Zanellato
-- Modified by:
-- Created:     2013/01/05
-- RCS-ID:      $Id$
-- Copyright:   (c) Andrea Zanellato <redtide.wx@gmail.com>
-- Licence:     wxWindows licence
-- ============================================================================
-- IMPORTANT:   Please read docs/tech/tn0016.txt before modifying this file!
-- ============================================================================

project "base"
    kind( wx.getprojectkind() )
-- ============================================================================
--                                  Common
-- ============================================================================
    files
    {
        wx.includedir .. "wx/afterstd.h",
        wx.includedir .. "wx/any.h",
        wx.includedir .. "wx/anystr.h",
        wx.includedir .. "wx/app.h",
        wx.includedir .. "wx/apptrait.h",
        wx.includedir .. "wx/archive.h",
        wx.includedir .. "wx/arrimpl.cpp",
        wx.includedir .. "wx/arrstr.h",
        wx.includedir .. "wx/atomic.h",
        wx.includedir .. "wx/base64.h",
        wx.includedir .. "wx/beforestd.h",
        wx.includedir .. "wx/buffer.h",
        wx.includedir .. "wx/build.h",
        wx.includedir .. "wx/chartype.h",
        wx.includedir .. "wx/checkeddelete.h",
        wx.includedir .. "wx/chkconf.h",
        wx.includedir .. "wx/clntdata.h",
        wx.includedir .. "wx/cmdargs.h",
        wx.includedir .. "wx/cmdline.h",
        wx.includedir .. "wx/confbase.h",
        wx.includedir .. "wx/config.h",
        wx.includedir .. "wx/convauto.h",
        wx.includedir .. "wx/containr.h",
        wx.includedir .. "wx/cpp.h",
        wx.includedir .. "wx/crt.h",
        wx.includedir .. "wx/datetime.h",
        wx.includedir .. "wx/datstrm.h",
        wx.includedir .. "wx/dde.h",
        wx.includedir .. "wx/debug.h",
        wx.includedir .. "wx/defs.h",
        wx.includedir .. "wx/dir.h",
        wx.includedir .. "wx/dlimpexp.h",
        wx.includedir .. "wx/dlist.h",
        wx.includedir .. "wx/dynarray.h",
        wx.includedir .. "wx/dynlib.h",
        wx.includedir .. "wx/dynload.h",
        wx.includedir .. "wx/encconv.h",
        wx.includedir .. "wx/event.h",
        wx.includedir .. "wx/eventfilter.h",
        wx.includedir .. "wx/evtloop.h",
        wx.includedir .. "wx/except.h",
        wx.includedir .. "wx/features.h",
        wx.includedir .. "wx/flags.h",
        wx.includedir .. "wx/ffile.h",
        wx.includedir .. "wx/file.h",
        wx.includedir .. "wx/fileconf.h",
        wx.includedir .. "wx/filefn.h",
        wx.includedir .. "wx/filename.h",
        wx.includedir .. "wx/filesys.h",
        wx.includedir .. "wx/fontenc.h",
        wx.includedir .. "wx/fontmap.h",
        wx.includedir .. "wx/fs_arc.h",
        wx.includedir .. "wx/fs_filter.h",
        wx.includedir .. "wx/fs_mem.h",
        wx.includedir .. "wx/fs_zip.h",
        wx.includedir .. "wx/hash.h",
        wx.includedir .. "wx/hashmap.h",
        wx.includedir .. "wx/hashset.h",
        wx.includedir .. "wx/html/forcelnk.h",
        wx.includedir .. "wx/iconloc.h",
        wx.includedir .. "wx/init.h",
        wx.includedir .. "wx/intl.h",
        wx.includedir .. "wx/iosfwrap.h",
        wx.includedir .. "wx/ioswrap.h",
        wx.includedir .. "wx/ipc.h",
        wx.includedir .. "wx/ipcbase.h",
        wx.includedir .. "wx/kbdstate.h",
        wx.includedir .. "wx/language.h",
        wx.includedir .. "wx/link.h",
        wx.includedir .. "wx/list.h",
        wx.includedir .. "wx/listimpl.cpp",
        wx.includedir .. "wx/log.h",
        wx.includedir .. "wx/longlong.h",
        wx.includedir .. "wx/math.h",
        wx.includedir .. "wx/memconf.h",
        wx.includedir .. "wx/memory.h",
        wx.includedir .. "wx/memtext.h",
        wx.includedir .. "wx/mimetype.h",
        wx.includedir .. "wx/module.h",
        wx.includedir .. "wx/mousestate.h",
        wx.includedir .. "wx/msgout.h",
        wx.includedir .. "wx/msgqueue.h",
        wx.includedir .. "wx/mstream.h",
        wx.includedir .. "wx/numformatter.h",
        wx.includedir .. "wx/object.h",
        wx.includedir .. "wx/platform.h",
        wx.includedir .. "wx/platinfo.h",
        wx.includedir .. "wx/power.h",
        wx.includedir .. "wx/process.h",
        wx.includedir .. "wx/ptr_scpd.h",
        wx.includedir .. "wx/ptr_shrd.h",
        wx.includedir .. "wx/recguard.h",
        wx.includedir .. "wx/regex.h",
        wx.includedir .. "wx/rtti.h",
        wx.includedir .. "wx/scopedarray.h",
        wx.includedir .. "wx/scopedptr.h",
        wx.includedir .. "wx/scopeguard.h",
        wx.includedir .. "wx/sharedptr.h",
        wx.includedir .. "wx/snglinst.h",
        wx.includedir .. "wx/sstream.h",
        wx.includedir .. "wx/stack.h",
        wx.includedir .. "wx/stackwalk.h",
        wx.includedir .. "wx/stdpaths.h",
        wx.includedir .. "wx/stdstream.h",
        wx.includedir .. "wx/stockitem.h",
        wx.includedir .. "wx/stopwatch.h",
        wx.includedir .. "wx/strconv.h",
        wx.includedir .. "wx/stream.h",
        wx.includedir .. "wx/string.h",
        wx.includedir .. "wx/stringimpl.h",
        wx.includedir .. "wx/stringops.h",
        wx.includedir .. "wx/strvararg.h",
        wx.includedir .. "wx/sysopt.h",
        wx.includedir .. "wx/tarstrm.h",
        wx.includedir .. "wx/textbuf.h",
        wx.includedir .. "wx/textfile.h",
        wx.includedir .. "wx/thread.h",
        wx.includedir .. "wx/thrimpl.cpp",
        wx.includedir .. "wx/time.h",
        wx.includedir .. "wx/timer.h",
        wx.includedir .. "wx/tls.h",
        wx.includedir .. "wx/tokenzr.h",
        wx.includedir .. "wx/tracker.h",
        wx.includedir .. "wx/translation.h",
        wx.includedir .. "wx/txtstrm.h",
        wx.includedir .. "wx/typeinfo.h",
        wx.includedir .. "wx/types.h",
        wx.includedir .. "wx/unichar.h",
        wx.includedir .. "wx/uri.h",
        wx.includedir .. "wx/ustring.h",
        wx.includedir .. "wx/utils.h",
        wx.includedir .. "wx/variant.h",
        wx.includedir .. "wx/vector.h",
        wx.includedir .. "wx/version.h",
        wx.includedir .. "wx/versioninfo.h",
        wx.includedir .. "wx/volume.h",
        wx.includedir .. "wx/weakref.h",
        wx.includedir .. "wx/wfstream.h",
        wx.includedir .. "wx/wx.h",
        wx.includedir .. "wx/wxchar.h",
        wx.includedir .. "wx/wxcrt.h",
        wx.includedir .. "wx/wxcrtbase.h",
        wx.includedir .. "wx/wxcrtvararg.h",
        wx.includedir .. "wx/wxprec.h",
        wx.includedir .. "wx/xlocale.h",
        wx.includedir .. "wx/xti.h",
        wx.includedir .. "wx/xti2.h",
        wx.includedir .. "wx/xtistrm.h",
        wx.includedir .. "wx/xtictor.h",
        wx.includedir .. "wx/xtihandler.h",
        wx.includedir .. "wx/xtiprop.h",
        wx.includedir .. "wx/xtitypes.h",
        wx.includedir .. "wx/zipstrm.h",
        wx.includedir .. "wx/zstream.h",
        wx.includedir .. "wx/meta/convertible.h",
        wx.includedir .. "wx/meta/if.h",
        wx.includedir .. "wx/meta/implicitconversion.h",
        wx.includedir .. "wx/meta/int2type.h",
        wx.includedir .. "wx/meta/movable.h",
        wx.includedir .. "wx/meta/pod.h",
        wx.includedir .. "wx/meta/removeref.h",
        wx.includedir .. "wx/fswatcher.h",
        wx.includedir .. "wx/generic/fswatcher.h",

        wx.srcdir .. "common/any.cpp",
        wx.srcdir .. "common/appbase.cpp",
        wx.srcdir .. "common/arcall.cpp",
        wx.srcdir .. "common/arcfind.cpp",
        wx.srcdir .. "common/archive.cpp",
        wx.srcdir .. "common/arrstr.cpp",
        wx.srcdir .. "common/base64.cpp",
        wx.srcdir .. "common/clntdata.cpp",
        wx.srcdir .. "common/cmdline.cpp",
        wx.srcdir .. "common/config.cpp",
        wx.srcdir .. "common/convauto.cpp",
        wx.srcdir .. "common/datetime.cpp",
        wx.srcdir .. "common/datetimefmt.cpp",
        wx.srcdir .. "common/datstrm.cpp",
        wx.srcdir .. "common/dircmn.cpp",
        wx.srcdir .. "common/dynarray.cpp",
        wx.srcdir .. "common/dynlib.cpp",
        wx.srcdir .. "common/dynload.cpp",
        wx.srcdir .. "common/encconv.cpp",
        wx.srcdir .. "common/evtloopcmn.cpp",
        wx.srcdir .. "common/extended.c",
        wx.srcdir .. "common/ffile.cpp",
        wx.srcdir .. "common/file.cpp",
        wx.srcdir .. "common/fileback.cpp",
        wx.srcdir .. "common/fileconf.cpp",
        wx.srcdir .. "common/filefn.cpp",
        wx.srcdir .. "common/filename.cpp",
        wx.srcdir .. "common/filesys.cpp",
        wx.srcdir .. "common/filtall.cpp",
        wx.srcdir .. "common/filtfind.cpp",
        wx.srcdir .. "common/fmapbase.cpp",
        wx.srcdir .. "common/fs_arc.cpp",
        wx.srcdir .. "common/fs_filter.cpp",
        wx.srcdir .. "common/hash.cpp",
        wx.srcdir .. "common/hashmap.cpp",
        wx.srcdir .. "common/init.cpp",
        wx.srcdir .. "common/intl.cpp",
        wx.srcdir .. "common/ipcbase.cpp",
        wx.srcdir .. "common/languageinfo.cpp",
        wx.srcdir .. "common/list.cpp",
        wx.srcdir .. "common/log.cpp",
        wx.srcdir .. "common/longlong.cpp",
        wx.srcdir .. "common/memory.cpp",
        wx.srcdir .. "common/mimecmn.cpp",
        wx.srcdir .. "common/module.cpp",
        wx.srcdir .. "common/mstream.cpp",
        wx.srcdir .. "common/numformatter.cpp",
        wx.srcdir .. "common/object.cpp",
        wx.srcdir .. "common/platinfo.cpp",
        wx.srcdir .. "common/powercmn.cpp",
        wx.srcdir .. "common/process.cpp",
        wx.srcdir .. "common/regex.cpp",
        wx.srcdir .. "common/stdpbase.cpp",
        wx.srcdir .. "common/sstream.cpp",
        wx.srcdir .. "common/stdstream.cpp",
        wx.srcdir .. "common/stopwatch.cpp",
        wx.srcdir .. "common/strconv.cpp",
        wx.srcdir .. "common/stream.cpp",
        wx.srcdir .. "common/string.cpp",
        wx.srcdir .. "common/stringimpl.cpp",
        wx.srcdir .. "common/stringops.cpp",
        wx.srcdir .. "common/strvararg.cpp",
        wx.srcdir .. "common/sysopt.cpp",
        wx.srcdir .. "common/tarstrm.cpp",
        wx.srcdir .. "common/textbuf.cpp",
        wx.srcdir .. "common/textfile.cpp",
        wx.srcdir .. "common/time.cpp",
        wx.srcdir .. "common/timercmn.cpp",
        wx.srcdir .. "common/timerimpl.cpp",
        wx.srcdir .. "common/tokenzr.cpp",
        wx.srcdir .. "common/translation.cpp",
        wx.srcdir .. "common/txtstrm.cpp",
        wx.srcdir .. "common/unichar.cpp",
        wx.srcdir .. "common/uri.cpp",
        wx.srcdir .. "common/ustring.cpp",
        wx.srcdir .. "common/variant.cpp",
        wx.srcdir .. "common/wfstream.cpp",
        wx.srcdir .. "common/wxcrt.cpp",
        wx.srcdir .. "common/wxprintf.cpp",
        wx.srcdir .. "common/xlocale.cpp",
        wx.srcdir .. "common/xti.cpp",
        wx.srcdir .. "common/xtistrm.cpp",
        wx.srcdir .. "common/zipstrm.cpp",
        wx.srcdir .. "common/zstream.cpp",
        wx.srcdir .. "common/fswatchercmn.cpp",
        wx.srcdir .. "generic/fswatcherg.cpp",

        -- wxBase and wxCore common files
        wx.srcdir .. "common/event.cpp",
        wx.srcdir .. "common/fs_mem.cpp",
        wx.srcdir .. "common/msgout.cpp",
        wx.srcdir .. "common/utilscmn.cpp",

        -- wxNet (part of wxBase)
        wx.includedir .. "wx/fs_inet.h",
        wx.includedir .. "wx/protocol/file.h",
        wx.includedir .. "wx/protocol/ftp.h",
        wx.includedir .. "wx/protocol/http.h",
        wx.includedir .. "wx/protocol/log.h",
        wx.includedir .. "wx/protocol/protocol.h",
        wx.includedir .. "wx/sckaddr.h",
        wx.includedir .. "wx/sckipc.h",
        wx.includedir .. "wx/sckstrm.h",
        wx.includedir .. "wx/socket.h",
        wx.includedir .. "wx/url.h",

        wx.srcdir .. "common/fs_inet.cpp",
        wx.srcdir .. "common/ftp.cpp",
        wx.srcdir .. "common/http.cpp",
        wx.srcdir .. "common/protocol.cpp",
        wx.srcdir .. "common/sckaddr.cpp",
        wx.srcdir .. "common/sckfile.cpp",
        wx.srcdir .. "common/sckipc.cpp",
        wx.srcdir .. "common/sckstrm.cpp",
        wx.srcdir .. "common/socket.cpp",
        wx.srcdir .. "common/url.cpp"
    }
-- ============================================================================
--                                  UNIX
-- ============================================================================
--  Files used on all Unix systems, including Darwin
    if not wx.msw then
        files
        {
            wx.includedir .. "wx/unix/app.h",
            wx.includedir .. "wx/unix/apptbase.h",
            wx.includedir .. "wx/unix/apptrait.h",
            wx.includedir .. "wx/unix/chkconf.h",
            wx.includedir .. "wx/unix/evtloop.h",
            wx.includedir .. "wx/unix/evtloopsrc.h",
            wx.includedir .. "wx/unix/pipe.h",
            wx.includedir .. "wx/unix/stdpaths.h",
            wx.includedir .. "wx/unix/stackwalk.h",
            wx.includedir .. "wx/unix/tls.h",
            wx.includedir .. "wx/unix/fswatcher_kqueue.h",
            wx.srcdir .. "common/fdiodispatcher.cpp",
            wx.srcdir .. "common/selectdispatcher.cpp",
            wx.srcdir .. "unix/appunix.cpp",
            wx.srcdir .. "unix/dir.cpp",
            wx.srcdir .. "unix/dlunix.cpp",
            wx.srcdir .. "unix/epolldispatcher.cpp",
            wx.srcdir .. "unix/evtloopunix.cpp",
            wx.srcdir .. "unix/fdiounix.cpp",
            wx.srcdir .. "unix/snglinst.cpp",
            wx.srcdir .. "unix/stackwalk.cpp",
            wx.srcdir .. "unix/stdpaths.cpp",
            wx.srcdir .. "unix/timerunx.cpp",
            wx.srcdir .. "unix/threadpsx.cpp",
            wx.srcdir .. "unix/utilsunx.cpp",
            wx.srcdir .. "unix/fswatcher_kqueue.cpp",

            -- wxNet
            wx.srcdir .. "common/socketiohandler.cpp",
            wx.srcdir .. "unix/sockunix.cpp",

-- Files used on all Unix systems, including Darwin with any port but wxMac
-- (this is really an aberration, we should also use these files for wxMac,
-- it's not done because of some OS 9 support leftovers only now).
-- Premake4: Included because doesn't supports MacOS 9.

            wx.includedir .. "wx/unix/execute.h",
            wx.includedir .. "wx/unix/mimetype.h",
            wx.srcdir .. "unix/mimetype.cpp"
        }

-- Files used on all non-Darwin Unix systems (because Darwin provides other,
-- better, native equivalents of the functionality they implement
-- (e.g. CFSocket instead of BSD sockets) or doesn't provide it at all
-- (epoll, backtrace())
        if not wx.osx then files
        {
            wx.includedir .. "wx/unix/fswatcher_inotify.h",
            wx.srcdir .. "unix/fswatcher_inotify.cpp"
        }
        else
-- ============================================================================
--                                  OSX
-- ============================================================================
            -- Used on MacOSX wxMac base, and MacOSX Darwin base
            files
            {
                wx.includedir .. "wx/osx/core/cfdataref.h",
                wx.includedir .. "wx/osx/core/cfref.h",
                wx.includedir .. "wx/osx/core/cfstring.h",
                wx.includedir .. "wx/osx/core/hid.h",
                wx.includedir .. "wx/osx/core/evtloop.h",
                wx.includedir .. "wx/osx/core/objcid.h",
                wx.includedir .. "wx/osx/core/private.h",
                wx.includedir .. "wx/osx/core/stdpaths.h",

                wx.srcdir .. "osx/core/cfstring.cpp",
                wx.srcdir .. "osx/core/evtloop_cf.cpp",
                wx.srcdir .. "osx/core/stdpaths_cf.cpp",
                wx.srcdir .. "osx/core/strconv_cf.cpp",
                wx.srcdir .. "osx/core/utilsexc_base.cpp",

                -- wxNet
                wx.srcdir .. "osx/core/sockosx.cpp"
            }

            if wx.carbon then files
            {
                -- wxBase and wxCore files used by OSX
                wx.srcdir .. "osx/carbon/utils.cpp",
                wx.srcdir .. "osx/carbon/uma.cpp"
            }
            else files
            {
                -- wxBase files used by OSX ports (not Carbon)
                wx.srcdir .. "osx/core/mimetype.cpp"
            }
            end

            if wx.cocoa then files
            {
                wx.srcdir .. "osx/cocoa/utils.mm"
            }
            end

            if wx.iphone then files
            {
                wx.srcdir .. "osx/iphone/utils.mm"
            }
            end
        end
    else
-- ============================================================================
--                                  Windows
-- ============================================================================
        files
        {
            wx.includedir .. "wx/msw/apptrait.h",
            wx.includedir .. "wx/msw/apptbase.h",
            wx.includedir .. "wx/msw/chkconf.h",
            wx.includedir .. "wx/msw/crashrpt.h",
            wx.includedir .. "wx/msw/dde.h",
            wx.includedir .. "wx/msw/debughlp.h",
            wx.includedir .. "wx/msw/evtloopconsole.h",
            wx.includedir .. "wx/msw/gccpriv.h",
            wx.includedir .. "wx/msw/libraries.h",
            wx.includedir .. "wx/msw/mimetype.h",
            wx.includedir .. "wx/msw/mslu.h",
            wx.includedir .. "wx/msw/private.h",
            wx.includedir .. "wx/msw/regconf.h",
            wx.includedir .. "wx/msw/registry.h",
            wx.includedir .. "wx/msw/seh.h",
            wx.includedir .. "wx/msw/stackwalk.h",
            wx.includedir .. "wx/msw/stdpaths.h",
            wx.includedir .. "wx/msw/winundef.h",
            wx.includedir .. "wx/msw/wrapcctl.h",
            wx.includedir .. "wx/msw/wrapcdlg.h",
            wx.includedir .. "wx/msw/wrapwin.h",
            wx.includedir .. "wx/msw/fswatcher.h",

            wx.srcdir .. "msw/basemsw.cpp",
            wx.srcdir .. "msw/crashrpt.cpp",
            wx.srcdir .. "msw/debughlp.cpp",
            wx.srcdir .. "msw/dde.cpp",
            wx.srcdir .. "msw/dir.cpp",
            wx.srcdir .. "msw/dlmsw.cpp",
            wx.srcdir .. "msw/evtloopconsole.cpp",
            wx.srcdir .. "msw/mimetype.cpp",
            wx.srcdir .. "msw/power.cpp",
            wx.srcdir .. "msw/regconf.cpp",
            wx.srcdir .. "msw/registry.cpp",
            wx.srcdir .. "msw/snglinst.cpp",
            wx.srcdir .. "msw/stackwalk.cpp",
            wx.srcdir .. "msw/stdpaths.cpp",
            wx.srcdir .. "msw/thread.cpp",
            wx.srcdir .. "msw/timer.cpp",
            wx.srcdir .. "msw/utils.cpp",
            wx.srcdir .. "msw/utilsexc.cpp",
            wx.srcdir .. "msw/fswatcher.cpp",

            -- wxNet
            wx.srcdir .. "msw/sockmsw.cpp",
            wx.srcdir .. "msw/urlmsw.cpp"
        }

        if wx.gui then files
        {
            -- Common with wxCore
            wx.srcdir .. "msw/main.cpp",
            wx.srcdir .. "msw/mslu.cpp",
            wx.srcdir .. "msw/volume.cpp"
        }
        end

        if wx.wince then files
        {
            wx.includedir .. "wx/msw/wince/time.h",
            wx.includedir .. "wx/msw/wince/chkconf.h",
            wx.srcdir .. "msw/wince/time.cpp",

            -- wxNet
            wx.includedir .. "wx/msw/wince/net.h",
            wx.srcdir .. "msw/wince/net.cpp"
        }
        end
    end
-- ============================================================================
--                                  OS2 (Currently not supported)
-- ============================================================================
--[[
    if wx.os2 then files
    {
        wx.includedir .. "wx/unix/app.h",
        wx.includedir .. "wx/os2/apptbase.h",
        wx.includedir .. "wx/os2/apptrait.h",
        wx.includedir .. "wx/unix/evtloop.h",
        wx.includedir .. "wx/os2/mimetype.h",
        wx.includedir .. "wx/os2/private.h",
        wx.includedir .. "wx/os2/stdpaths.h",
        wx.includedir .. "wx/os2/chkconf.h",
        wx.includedir .. "wx/os2/wxrsc.h",

        wx.srcdir .. "common/fdiodispatcher.cpp",
        wx.srcdir .. "common/selectdispatcher.cpp",
        wx.srcdir .. "unix/appunix.cpp",
        wx.srcdir .. "unix/evtloopunix.cpp",
        wx.srcdir .. "unix/timerunx.cpp",
        wx.srcdir .. "os2/dir.cpp",
        wx.srcdir .. "os2/mimetype.cpp",
        wx.srcdir .. "os2/snglinst.cpp",
        wx.srcdir .. "os2/stdpaths.cpp",
        wx.srcdir .. "os2/thread.cpp",
        wx.srcdir .. "os2/utils.cpp",
        wx.srcdir .. "os2/utilsexc.cpp",

        -- wxNet (part of wxBase)
        wx.srcdir .. "unix/sockunix.cpp"
    }
    end
-- ]]
-- ============================================================================
--                                  MSDOS (Currently not supported)
-- ============================================================================
--[[
    if wx.msdos then files
    {
        wx.includedir .. "wx/msdos/mimetype.h",

        wx.srcdir .. "msdos/dir.cpp",
        wx.srcdir .. "msdos/mimetype.cpp",
        wx.srcdir .. "msdos/utilsdos.cpp"
    }
    end
--]]
