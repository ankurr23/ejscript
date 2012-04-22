#
#   win-i686-debug.mk -- Build It Makefile to build Embedthis Ejscript for win on i686
#

VS             := $(VSINSTALLDIR)
VS             ?= \Users\mob\git\ejs\$(VS)
SDK            := $(WindowsSDKDir)
SDK            ?= $(SDK)

export         SDK VS
export PATH    := $(SDK)/Bin:$(VS)/VC/Bin:$(VS)/Common7/IDE:$(VS)/Common7/Tools:$(VS)/SDK/v3.5/bin:$(VS)/VC/VCPackages;$(PATH)
export INCLUDE := $(INCLUDE);$(SDK)/INCLUDE:$(VS)/VC/INCLUDE
export LIB     := $(LIB);$(SDK)/lib:$(VS)/VC/lib

OS       := win
CONFIG   := $(OS)-i686-debug
CC       := cl.exe
LD       := link.exe
CFLAGS   := -nologo -GR- -W3 -Zi -Od -MDd
DFLAGS   := -D_REENTRANT -D_MT
IFLAGS   := -I$(CONFIG)/inc
LDFLAGS  := '-nologo' '-nodefaultlib' '-incremental:no' '-debug' '-machine:x86'
LIBPATHS := -libpath:$(CONFIG)/bin
LIBS     := ws2_32.lib advapi32.lib user32.lib kernel32.lib oldnames.lib msvcrt.lib shell32.lib

all: prep \
        $(CONFIG)/bin/libmpr.dll \
        $(CONFIG)/bin/libmprssl.dll \
        $(CONFIG)/bin/ejsman.exe \
        $(CONFIG)/bin/makerom.exe \
        $(CONFIG)/bin/libpcre.dll \
        $(CONFIG)/bin/libhttp.dll \
        $(CONFIG)/bin/http.exe \
        $(CONFIG)/bin/libsqlite3.dll \
        $(CONFIG)/bin/sqlite.exe \
        $(CONFIG)/bin/libejs.dll \
        $(CONFIG)/bin/ejs.exe \
        $(CONFIG)/bin/ejsc.exe \
        $(CONFIG)/bin/ejsmod.exe \
        $(CONFIG)/bin/ejsrun.exe \
        $(CONFIG)/bin/ejs.mod \
        $(CONFIG)/bin/bit.es \
        $(CONFIG)/bin/bit.exe \
        $(CONFIG)/bin/utest.es \
        $(CONFIG)/bin/utest.exe \
        $(CONFIG)/bin/bits \
        $(CONFIG)/bin/ejs.unix.mod \
        $(CONFIG)/bin/jem.es \
        $(CONFIG)/bin/jem.exe \
        $(CONFIG)/bin/ejs.db.mod \
        $(CONFIG)/bin/ejs.db.mapper.mod \
        $(CONFIG)/bin/ejs.db.sqlite.mod \
        $(CONFIG)/bin/ejs.db.sqlite.dll \
        $(CONFIG)/bin/ejs.web.mod \
        $(CONFIG)/bin/ejs.web.dll \
        $(CONFIG)/bin/www \
        $(CONFIG)/bin/ejs.template.mod \
        $(CONFIG)/bin/ejs.tar.mod \
        $(CONFIG)/bin/mvc.es \
        $(CONFIG)/bin/mvc.exe \
        $(CONFIG)/bin/ejs.mvc.mod \
        $(CONFIG)/bin/utest.worker \
        $(CONFIG)/bin/removeFiles.exe

.PHONY: prep

prep:
	@[ ! -x $(CONFIG)/inc ] && mkdir -p $(CONFIG)/inc $(CONFIG)/obj $(CONFIG)/lib $(CONFIG)/bin ; true
	@[ ! -f $(CONFIG)/inc/bit.h ] && cp projects/ejs-$(OS)-bit.h $(CONFIG)/inc/bit.h ; true
	@if ! diff $(CONFIG)/inc/bit.h projects/ejs-$(OS)-bit.h >/dev/null ; then\
		echo cp projects/ejs-$(OS)-bit.h $(CONFIG)/inc/bit.h  ; \
		cp projects/ejs-$(OS)-bit.h $(CONFIG)/inc/bit.h  ; \
	fi; true

clean:
	rm -rf $(CONFIG)/bin/libmpr.dll
	rm -rf $(CONFIG)/bin/libmprssl.dll
	rm -rf $(CONFIG)/bin/ejsman.exe
	rm -rf $(CONFIG)/bin/makerom.exe
	rm -rf $(CONFIG)/bin/libpcre.dll
	rm -rf $(CONFIG)/bin/libhttp.dll
	rm -rf $(CONFIG)/bin/http.exe
	rm -rf $(CONFIG)/bin/libsqlite3.dll
	rm -rf $(CONFIG)/bin/sqlite.exe
	rm -rf $(CONFIG)/bin/libejs.dll
	rm -rf $(CONFIG)/bin/ejs.exe
	rm -rf $(CONFIG)/bin/ejsc.exe
	rm -rf $(CONFIG)/bin/ejsmod.exe
	rm -rf $(CONFIG)/bin/ejsrun.exe
	rm -rf $(CONFIG)/bin/utest.es
	rm -rf $(CONFIG)/bin/utest.exe
	rm -rf $(CONFIG)/bin/jem.es
	rm -rf $(CONFIG)/bin/jem.exe
	rm -rf $(CONFIG)/bin/ejs.db.mod
	rm -rf $(CONFIG)/bin/ejs.db.mapper.mod
	rm -rf $(CONFIG)/bin/ejs.db.sqlite.mod
	rm -rf $(CONFIG)/bin/ejs.db.sqlite.dll
	rm -rf $(CONFIG)/bin/ejs.web.mod
	rm -rf $(CONFIG)/bin/ejs.web.dll
	rm -rf $(CONFIG)/bin/www
	rm -rf $(CONFIG)/bin/ejs.template.mod
	rm -rf $(CONFIG)/bin/ejs.zlib.dll
	rm -rf $(CONFIG)/bin/mvc.es
	rm -rf $(CONFIG)/bin/mvc.exe
	rm -rf $(CONFIG)/bin/ejs.mvc.mod
	rm -rf $(CONFIG)/bin/utest.worker
	rm -rf $(CONFIG)/bin/removeFiles.exe
	rm -rf $(CONFIG)/obj/mprLib.obj
	rm -rf $(CONFIG)/obj/mprSsl.obj
	rm -rf $(CONFIG)/obj/manager.obj
	rm -rf $(CONFIG)/obj/makerom.obj
	rm -rf $(CONFIG)/obj/pcre.obj
	rm -rf $(CONFIG)/obj/httpLib.obj
	rm -rf $(CONFIG)/obj/http.obj
	rm -rf $(CONFIG)/obj/sqlite3.obj
	rm -rf $(CONFIG)/obj/sqlite.obj
	rm -rf $(CONFIG)/obj/ecAst.obj
	rm -rf $(CONFIG)/obj/ecCodeGen.obj
	rm -rf $(CONFIG)/obj/ecCompiler.obj
	rm -rf $(CONFIG)/obj/ecLex.obj
	rm -rf $(CONFIG)/obj/ecModuleWrite.obj
	rm -rf $(CONFIG)/obj/ecParser.obj
	rm -rf $(CONFIG)/obj/ecState.obj
	rm -rf $(CONFIG)/obj/ejsApp.obj
	rm -rf $(CONFIG)/obj/ejsArray.obj
	rm -rf $(CONFIG)/obj/ejsBlock.obj
	rm -rf $(CONFIG)/obj/ejsBoolean.obj
	rm -rf $(CONFIG)/obj/ejsByteArray.obj
	rm -rf $(CONFIG)/obj/ejsCache.obj
	rm -rf $(CONFIG)/obj/ejsCmd.obj
	rm -rf $(CONFIG)/obj/ejsConfig.obj
	rm -rf $(CONFIG)/obj/ejsDate.obj
	rm -rf $(CONFIG)/obj/ejsDebug.obj
	rm -rf $(CONFIG)/obj/ejsError.obj
	rm -rf $(CONFIG)/obj/ejsFile.obj
	rm -rf $(CONFIG)/obj/ejsFileSystem.obj
	rm -rf $(CONFIG)/obj/ejsFrame.obj
	rm -rf $(CONFIG)/obj/ejsFunction.obj
	rm -rf $(CONFIG)/obj/ejsGC.obj
	rm -rf $(CONFIG)/obj/ejsGlobal.obj
	rm -rf $(CONFIG)/obj/ejsHttp.obj
	rm -rf $(CONFIG)/obj/ejsIterator.obj
	rm -rf $(CONFIG)/obj/ejsJSON.obj
	rm -rf $(CONFIG)/obj/ejsLocalCache.obj
	rm -rf $(CONFIG)/obj/ejsMath.obj
	rm -rf $(CONFIG)/obj/ejsMemory.obj
	rm -rf $(CONFIG)/obj/ejsMprLog.obj
	rm -rf $(CONFIG)/obj/ejsNamespace.obj
	rm -rf $(CONFIG)/obj/ejsNull.obj
	rm -rf $(CONFIG)/obj/ejsNumber.obj
	rm -rf $(CONFIG)/obj/ejsObject.obj
	rm -rf $(CONFIG)/obj/ejsPath.obj
	rm -rf $(CONFIG)/obj/ejsPot.obj
	rm -rf $(CONFIG)/obj/ejsRegExp.obj
	rm -rf $(CONFIG)/obj/ejsSocket.obj
	rm -rf $(CONFIG)/obj/ejsString.obj
	rm -rf $(CONFIG)/obj/ejsSystem.obj
	rm -rf $(CONFIG)/obj/ejsTimer.obj
	rm -rf $(CONFIG)/obj/ejsType.obj
	rm -rf $(CONFIG)/obj/ejsUri.obj
	rm -rf $(CONFIG)/obj/ejsVoid.obj
	rm -rf $(CONFIG)/obj/ejsWorker.obj
	rm -rf $(CONFIG)/obj/ejsXML.obj
	rm -rf $(CONFIG)/obj/ejsXMLList.obj
	rm -rf $(CONFIG)/obj/ejsXMLLoader.obj
	rm -rf $(CONFIG)/obj/ejsByteCode.obj
	rm -rf $(CONFIG)/obj/ejsException.obj
	rm -rf $(CONFIG)/obj/ejsHelper.obj
	rm -rf $(CONFIG)/obj/ejsInterp.obj
	rm -rf $(CONFIG)/obj/ejsLoader.obj
	rm -rf $(CONFIG)/obj/ejsModule.obj
	rm -rf $(CONFIG)/obj/ejsScope.obj
	rm -rf $(CONFIG)/obj/ejsService.obj
	rm -rf $(CONFIG)/obj/ejs.obj
	rm -rf $(CONFIG)/obj/ejsc.obj
	rm -rf $(CONFIG)/obj/ejsmod.obj
	rm -rf $(CONFIG)/obj/doc.obj
	rm -rf $(CONFIG)/obj/docFiles.obj
	rm -rf $(CONFIG)/obj/listing.obj
	rm -rf $(CONFIG)/obj/slotGen.obj
	rm -rf $(CONFIG)/obj/ejsrun.obj
	rm -rf $(CONFIG)/obj/ejsZlib.obj
	rm -rf $(CONFIG)/obj/ejsSqlite.obj
	rm -rf $(CONFIG)/obj/ejsHttpServer.obj
	rm -rf $(CONFIG)/obj/ejsRequest.obj
	rm -rf $(CONFIG)/obj/ejsSession.obj
	rm -rf $(CONFIG)/obj/ejsWeb.obj
	rm -rf $(CONFIG)/obj/removeFiles.obj

clobber: clean
	rm -fr ./$(CONFIG)

$(CONFIG)/inc/mpr.h: 
	rm -fr $(CONFIG)/inc/mpr.h
	cp -r src/deps/mpr/mpr.h $(CONFIG)/inc/mpr.h

$(CONFIG)/inc/mprSsl.h: 
	rm -fr $(CONFIG)/inc/mprSsl.h
	cp -r src/deps/mpr/mprSsl.h $(CONFIG)/inc/mprSsl.h

$(CONFIG)/obj/mprLib.obj: \
        src/deps/mpr/mprLib.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/mprLib.obj -Fd$(CONFIG)/obj/mprLib.pdb $(CFLAGS) -I$(CONFIG)/inc src/deps/mpr/mprLib.c

$(CONFIG)/bin/libmpr.dll:  \
        $(CONFIG)/inc/mpr.h \
        $(CONFIG)/inc/mprSsl.h \
        $(CONFIG)/obj/mprLib.obj
	"$(LD)" -dll -out:$(CONFIG)/bin/libmpr.dll -entry:_DllMainCRTStartup@12 -def:$(CONFIG)/bin/libmpr.def $(LIBPATHS) $(CONFIG)/obj/mprLib.obj $(LIBS)

$(CONFIG)/obj/mprSsl.obj: \
        src/deps/mpr/mprSsl.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/mprSsl.obj -Fd$(CONFIG)/obj/mprSsl.pdb $(CFLAGS) -I$(CONFIG)/inc src/deps/mpr/mprSsl.c

$(CONFIG)/bin/libmprssl.dll:  \
        $(CONFIG)/bin/libmpr.dll \
        $(CONFIG)/obj/mprSsl.obj
	"$(LD)" -dll -out:$(CONFIG)/bin/libmprssl.dll -entry:_DllMainCRTStartup@12 -def:$(CONFIG)/bin/libmprssl.def $(LIBPATHS) $(CONFIG)/obj/mprSsl.obj $(LIBS) libmpr.lib

$(CONFIG)/obj/manager.obj: \
        src/deps/mpr/manager.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/manager.obj -Fd$(CONFIG)/obj/manager.pdb $(CFLAGS) -I$(CONFIG)/inc src/deps/mpr/manager.c

$(CONFIG)/bin/ejsman.exe:  \
        $(CONFIG)/bin/libmpr.dll \
        $(CONFIG)/obj/manager.obj
	"$(LD)" -out:$(CONFIG)/bin/ejsman.exe -entry:WinMainCRTStartup -subsystem:Windows $(LIBPATHS) $(CONFIG)/obj/manager.obj $(LIBS) libmpr.lib

$(CONFIG)/obj/makerom.obj: \
        src/deps/mpr/makerom.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/makerom.obj -Fd$(CONFIG)/obj/makerom.pdb $(CFLAGS) -I$(CONFIG)/inc src/deps/mpr/makerom.c

$(CONFIG)/bin/makerom.exe:  \
        $(CONFIG)/bin/libmpr.dll \
        $(CONFIG)/obj/makerom.obj
	"$(LD)" -out:$(CONFIG)/bin/makerom.exe -entry:mainCRTStartup -subsystem:console $(LIBPATHS) $(CONFIG)/obj/makerom.obj $(LIBS) libmpr.lib

$(CONFIG)/inc/pcre.h: 
	rm -fr $(CONFIG)/inc/pcre.h
	cp -r src/deps/pcre/pcre.h $(CONFIG)/inc/pcre.h

$(CONFIG)/obj/pcre.obj: \
        src/deps/pcre/pcre.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/pcre.obj -Fd$(CONFIG)/obj/pcre.pdb $(CFLAGS) -I$(CONFIG)/inc src/deps/pcre/pcre.c

$(CONFIG)/bin/libpcre.dll:  \
        $(CONFIG)/inc/pcre.h \
        $(CONFIG)/obj/pcre.obj
	"$(LD)" -dll -out:$(CONFIG)/bin/libpcre.dll -entry:_DllMainCRTStartup@12 -def:$(CONFIG)/bin/libpcre.def $(LIBPATHS) $(CONFIG)/obj/pcre.obj $(LIBS)

$(CONFIG)/inc/http.h: 
	rm -fr $(CONFIG)/inc/http.h
	cp -r src/deps/http/http.h $(CONFIG)/inc/http.h

$(CONFIG)/obj/httpLib.obj: \
        src/deps/http/httpLib.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/httpLib.obj -Fd$(CONFIG)/obj/httpLib.pdb $(CFLAGS) -I$(CONFIG)/inc src/deps/http/httpLib.c

$(CONFIG)/bin/libhttp.dll:  \
        $(CONFIG)/bin/libmpr.dll \
        $(CONFIG)/bin/libpcre.dll \
        $(CONFIG)/bin/libmprssl.dll \
        $(CONFIG)/inc/http.h \
        $(CONFIG)/obj/httpLib.obj
	"$(LD)" -dll -out:$(CONFIG)/bin/libhttp.dll -entry:_DllMainCRTStartup@12 -def:$(CONFIG)/bin/libhttp.def $(LIBPATHS) $(CONFIG)/obj/httpLib.obj $(LIBS) libmpr.lib libpcre.lib libmprssl.lib

$(CONFIG)/obj/http.obj: \
        src/deps/http/http.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/http.obj -Fd$(CONFIG)/obj/http.pdb $(CFLAGS) -I$(CONFIG)/inc src/deps/http/http.c

$(CONFIG)/bin/http.exe:  \
        $(CONFIG)/bin/libhttp.dll \
        $(CONFIG)/obj/http.obj
	"$(LD)" -out:$(CONFIG)/bin/http.exe -entry:mainCRTStartup -subsystem:console $(LIBPATHS) $(CONFIG)/obj/http.obj $(LIBS) libhttp.lib libmpr.lib libpcre.lib libmprssl.lib

$(CONFIG)/inc/sqlite3.h: 
	rm -fr $(CONFIG)/inc/sqlite3.h
	cp -r src/deps/sqlite/sqlite3.h $(CONFIG)/inc/sqlite3.h

$(CONFIG)/obj/sqlite3.obj: \
        src/deps/sqlite/sqlite3.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/sqlite3.obj -Fd$(CONFIG)/obj/sqlite3.pdb $(CFLAGS) -I$(CONFIG)/inc src/deps/sqlite/sqlite3.c

$(CONFIG)/bin/libsqlite3.dll:  \
        $(CONFIG)/inc/sqlite3.h \
        $(CONFIG)/obj/sqlite3.obj
	"$(LD)" -dll -out:$(CONFIG)/bin/libsqlite3.dll -entry:_DllMainCRTStartup@12 -def:$(CONFIG)/bin/libsqlite3.def $(LIBPATHS) $(CONFIG)/obj/sqlite3.obj $(LIBS)

$(CONFIG)/obj/sqlite.obj: \
        src/deps/sqlite/sqlite.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/sqlite.obj -Fd$(CONFIG)/obj/sqlite.pdb $(CFLAGS) -I$(CONFIG)/inc src/deps/sqlite/sqlite.c

$(CONFIG)/bin/sqlite.exe:  \
        $(CONFIG)/bin/libsqlite3.dll \
        $(CONFIG)/obj/sqlite.obj
	"$(LD)" -out:$(CONFIG)/bin/sqlite.exe -entry:mainCRTStartup -subsystem:console $(LIBPATHS) $(CONFIG)/obj/sqlite.obj $(LIBS) libsqlite3.lib

$(CONFIG)/inc/ejs.cache.local.slots.h: 
	rm -fr $(CONFIG)/inc/ejs.cache.local.slots.h
	cp -r src/slots/ejs.cache.local.slots.h $(CONFIG)/inc/ejs.cache.local.slots.h

$(CONFIG)/inc/ejs.db.sqlite.slots.h: 
	rm -fr $(CONFIG)/inc/ejs.db.sqlite.slots.h
	cp -r src/slots/ejs.db.sqlite.slots.h $(CONFIG)/inc/ejs.db.sqlite.slots.h

$(CONFIG)/inc/ejs.slots.h: 
	rm -fr $(CONFIG)/inc/ejs.slots.h
	cp -r src/slots/ejs.slots.h $(CONFIG)/inc/ejs.slots.h

$(CONFIG)/inc/ejs.web.slots.h: 
	rm -fr $(CONFIG)/inc/ejs.web.slots.h
	cp -r src/slots/ejs.web.slots.h $(CONFIG)/inc/ejs.web.slots.h

$(CONFIG)/inc/ejs.zlib.slots.h: 
	rm -fr $(CONFIG)/inc/ejs.zlib.slots.h
	cp -r src/slots/ejs.zlib.slots.h $(CONFIG)/inc/ejs.zlib.slots.h

$(CONFIG)/inc/ejs.h: 
	rm -fr $(CONFIG)/inc/ejs.h
	cp -r src/ejs.h $(CONFIG)/inc/ejs.h

$(CONFIG)/inc/ejsByteCode.h: 
	rm -fr $(CONFIG)/inc/ejsByteCode.h
	cp -r src/ejsByteCode.h $(CONFIG)/inc/ejsByteCode.h

$(CONFIG)/inc/ejsByteCodeTable.h: 
	rm -fr $(CONFIG)/inc/ejsByteCodeTable.h
	cp -r src/ejsByteCodeTable.h $(CONFIG)/inc/ejsByteCodeTable.h

$(CONFIG)/inc/ejsCompiler.h: 
	rm -fr $(CONFIG)/inc/ejsCompiler.h
	cp -r src/ejsCompiler.h $(CONFIG)/inc/ejsCompiler.h

$(CONFIG)/inc/ejsCustomize.h: 
	rm -fr $(CONFIG)/inc/ejsCustomize.h
	cp -r src/ejsCustomize.h $(CONFIG)/inc/ejsCustomize.h

$(CONFIG)/obj/ecAst.obj: \
        src/compiler/ecAst.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ecAst.obj -Fd$(CONFIG)/obj/ecAst.pdb $(CFLAGS) -I$(CONFIG)/inc src/compiler/ecAst.c

$(CONFIG)/obj/ecCodeGen.obj: \
        src/compiler/ecCodeGen.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ecCodeGen.obj -Fd$(CONFIG)/obj/ecCodeGen.pdb $(CFLAGS) -I$(CONFIG)/inc src/compiler/ecCodeGen.c

$(CONFIG)/obj/ecCompiler.obj: \
        src/compiler/ecCompiler.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ecCompiler.obj -Fd$(CONFIG)/obj/ecCompiler.pdb $(CFLAGS) -I$(CONFIG)/inc src/compiler/ecCompiler.c

$(CONFIG)/obj/ecLex.obj: \
        src/compiler/ecLex.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ecLex.obj -Fd$(CONFIG)/obj/ecLex.pdb $(CFLAGS) -I$(CONFIG)/inc src/compiler/ecLex.c

$(CONFIG)/obj/ecModuleWrite.obj: \
        src/compiler/ecModuleWrite.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ecModuleWrite.obj -Fd$(CONFIG)/obj/ecModuleWrite.pdb $(CFLAGS) -I$(CONFIG)/inc src/compiler/ecModuleWrite.c

$(CONFIG)/obj/ecParser.obj: \
        src/compiler/ecParser.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ecParser.obj -Fd$(CONFIG)/obj/ecParser.pdb $(CFLAGS) -I$(CONFIG)/inc src/compiler/ecParser.c

$(CONFIG)/obj/ecState.obj: \
        src/compiler/ecState.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ecState.obj -Fd$(CONFIG)/obj/ecState.pdb $(CFLAGS) -I$(CONFIG)/inc src/compiler/ecState.c

$(CONFIG)/obj/ejsApp.obj: \
        src/core/src/ejsApp.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsApp.obj -Fd$(CONFIG)/obj/ejsApp.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsApp.c

$(CONFIG)/obj/ejsArray.obj: \
        src/core/src/ejsArray.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsArray.obj -Fd$(CONFIG)/obj/ejsArray.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsArray.c

$(CONFIG)/obj/ejsBlock.obj: \
        src/core/src/ejsBlock.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsBlock.obj -Fd$(CONFIG)/obj/ejsBlock.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsBlock.c

$(CONFIG)/obj/ejsBoolean.obj: \
        src/core/src/ejsBoolean.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsBoolean.obj -Fd$(CONFIG)/obj/ejsBoolean.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsBoolean.c

$(CONFIG)/obj/ejsByteArray.obj: \
        src/core/src/ejsByteArray.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsByteArray.obj -Fd$(CONFIG)/obj/ejsByteArray.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsByteArray.c

$(CONFIG)/obj/ejsCache.obj: \
        src/core/src/ejsCache.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsCache.obj -Fd$(CONFIG)/obj/ejsCache.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsCache.c

$(CONFIG)/obj/ejsCmd.obj: \
        src/core/src/ejsCmd.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsCmd.obj -Fd$(CONFIG)/obj/ejsCmd.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsCmd.c

$(CONFIG)/obj/ejsConfig.obj: \
        src/core/src/ejsConfig.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsConfig.obj -Fd$(CONFIG)/obj/ejsConfig.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsConfig.c

$(CONFIG)/obj/ejsDate.obj: \
        src/core/src/ejsDate.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsDate.obj -Fd$(CONFIG)/obj/ejsDate.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsDate.c

$(CONFIG)/obj/ejsDebug.obj: \
        src/core/src/ejsDebug.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsDebug.obj -Fd$(CONFIG)/obj/ejsDebug.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsDebug.c

$(CONFIG)/obj/ejsError.obj: \
        src/core/src/ejsError.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsError.obj -Fd$(CONFIG)/obj/ejsError.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsError.c

$(CONFIG)/obj/ejsFile.obj: \
        src/core/src/ejsFile.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsFile.obj -Fd$(CONFIG)/obj/ejsFile.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsFile.c

$(CONFIG)/obj/ejsFileSystem.obj: \
        src/core/src/ejsFileSystem.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsFileSystem.obj -Fd$(CONFIG)/obj/ejsFileSystem.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsFileSystem.c

$(CONFIG)/obj/ejsFrame.obj: \
        src/core/src/ejsFrame.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsFrame.obj -Fd$(CONFIG)/obj/ejsFrame.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsFrame.c

$(CONFIG)/obj/ejsFunction.obj: \
        src/core/src/ejsFunction.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsFunction.obj -Fd$(CONFIG)/obj/ejsFunction.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsFunction.c

$(CONFIG)/obj/ejsGC.obj: \
        src/core/src/ejsGC.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsGC.obj -Fd$(CONFIG)/obj/ejsGC.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsGC.c

$(CONFIG)/obj/ejsGlobal.obj: \
        src/core/src/ejsGlobal.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsGlobal.obj -Fd$(CONFIG)/obj/ejsGlobal.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsGlobal.c

$(CONFIG)/obj/ejsHttp.obj: \
        src/core/src/ejsHttp.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsHttp.obj -Fd$(CONFIG)/obj/ejsHttp.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsHttp.c

$(CONFIG)/obj/ejsIterator.obj: \
        src/core/src/ejsIterator.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsIterator.obj -Fd$(CONFIG)/obj/ejsIterator.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsIterator.c

$(CONFIG)/obj/ejsJSON.obj: \
        src/core/src/ejsJSON.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsJSON.obj -Fd$(CONFIG)/obj/ejsJSON.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsJSON.c

$(CONFIG)/obj/ejsLocalCache.obj: \
        src/core/src/ejsLocalCache.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsLocalCache.obj -Fd$(CONFIG)/obj/ejsLocalCache.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsLocalCache.c

$(CONFIG)/obj/ejsMath.obj: \
        src/core/src/ejsMath.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsMath.obj -Fd$(CONFIG)/obj/ejsMath.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsMath.c

$(CONFIG)/obj/ejsMemory.obj: \
        src/core/src/ejsMemory.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsMemory.obj -Fd$(CONFIG)/obj/ejsMemory.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsMemory.c

$(CONFIG)/obj/ejsMprLog.obj: \
        src/core/src/ejsMprLog.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsMprLog.obj -Fd$(CONFIG)/obj/ejsMprLog.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsMprLog.c

$(CONFIG)/obj/ejsNamespace.obj: \
        src/core/src/ejsNamespace.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsNamespace.obj -Fd$(CONFIG)/obj/ejsNamespace.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsNamespace.c

$(CONFIG)/obj/ejsNull.obj: \
        src/core/src/ejsNull.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsNull.obj -Fd$(CONFIG)/obj/ejsNull.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsNull.c

$(CONFIG)/obj/ejsNumber.obj: \
        src/core/src/ejsNumber.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsNumber.obj -Fd$(CONFIG)/obj/ejsNumber.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsNumber.c

$(CONFIG)/obj/ejsObject.obj: \
        src/core/src/ejsObject.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsObject.obj -Fd$(CONFIG)/obj/ejsObject.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsObject.c

$(CONFIG)/obj/ejsPath.obj: \
        src/core/src/ejsPath.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsPath.obj -Fd$(CONFIG)/obj/ejsPath.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsPath.c

$(CONFIG)/obj/ejsPot.obj: \
        src/core/src/ejsPot.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsPot.obj -Fd$(CONFIG)/obj/ejsPot.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsPot.c

$(CONFIG)/obj/ejsRegExp.obj: \
        src/core/src/ejsRegExp.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsRegExp.obj -Fd$(CONFIG)/obj/ejsRegExp.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsRegExp.c

$(CONFIG)/obj/ejsSocket.obj: \
        src/core/src/ejsSocket.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsSocket.obj -Fd$(CONFIG)/obj/ejsSocket.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsSocket.c

$(CONFIG)/obj/ejsString.obj: \
        src/core/src/ejsString.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsString.obj -Fd$(CONFIG)/obj/ejsString.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsString.c

$(CONFIG)/obj/ejsSystem.obj: \
        src/core/src/ejsSystem.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsSystem.obj -Fd$(CONFIG)/obj/ejsSystem.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsSystem.c

$(CONFIG)/obj/ejsTimer.obj: \
        src/core/src/ejsTimer.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsTimer.obj -Fd$(CONFIG)/obj/ejsTimer.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsTimer.c

$(CONFIG)/obj/ejsType.obj: \
        src/core/src/ejsType.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsType.obj -Fd$(CONFIG)/obj/ejsType.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsType.c

$(CONFIG)/obj/ejsUri.obj: \
        src/core/src/ejsUri.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsUri.obj -Fd$(CONFIG)/obj/ejsUri.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsUri.c

$(CONFIG)/obj/ejsVoid.obj: \
        src/core/src/ejsVoid.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsVoid.obj -Fd$(CONFIG)/obj/ejsVoid.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsVoid.c

$(CONFIG)/obj/ejsWorker.obj: \
        src/core/src/ejsWorker.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsWorker.obj -Fd$(CONFIG)/obj/ejsWorker.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsWorker.c

$(CONFIG)/obj/ejsXML.obj: \
        src/core/src/ejsXML.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsXML.obj -Fd$(CONFIG)/obj/ejsXML.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsXML.c

$(CONFIG)/obj/ejsXMLList.obj: \
        src/core/src/ejsXMLList.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsXMLList.obj -Fd$(CONFIG)/obj/ejsXMLList.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsXMLList.c

$(CONFIG)/obj/ejsXMLLoader.obj: \
        src/core/src/ejsXMLLoader.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsXMLLoader.obj -Fd$(CONFIG)/obj/ejsXMLLoader.pdb $(CFLAGS) -I$(CONFIG)/inc src/core/src/ejsXMLLoader.c

$(CONFIG)/obj/ejsByteCode.obj: \
        src/vm/ejsByteCode.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsByteCode.obj -Fd$(CONFIG)/obj/ejsByteCode.pdb $(CFLAGS) -I$(CONFIG)/inc src/vm/ejsByteCode.c

$(CONFIG)/obj/ejsException.obj: \
        src/vm/ejsException.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsException.obj -Fd$(CONFIG)/obj/ejsException.pdb $(CFLAGS) -I$(CONFIG)/inc src/vm/ejsException.c

$(CONFIG)/obj/ejsHelper.obj: \
        src/vm/ejsHelper.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsHelper.obj -Fd$(CONFIG)/obj/ejsHelper.pdb $(CFLAGS) -I$(CONFIG)/inc src/vm/ejsHelper.c

$(CONFIG)/obj/ejsInterp.obj: \
        src/vm/ejsInterp.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsInterp.obj -Fd$(CONFIG)/obj/ejsInterp.pdb $(CFLAGS) -I$(CONFIG)/inc src/vm/ejsInterp.c

$(CONFIG)/obj/ejsLoader.obj: \
        src/vm/ejsLoader.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsLoader.obj -Fd$(CONFIG)/obj/ejsLoader.pdb $(CFLAGS) -I$(CONFIG)/inc src/vm/ejsLoader.c

$(CONFIG)/obj/ejsModule.obj: \
        src/vm/ejsModule.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsModule.obj -Fd$(CONFIG)/obj/ejsModule.pdb $(CFLAGS) -I$(CONFIG)/inc src/vm/ejsModule.c

$(CONFIG)/obj/ejsScope.obj: \
        src/vm/ejsScope.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsScope.obj -Fd$(CONFIG)/obj/ejsScope.pdb $(CFLAGS) -I$(CONFIG)/inc src/vm/ejsScope.c

$(CONFIG)/obj/ejsService.obj: \
        src/vm/ejsService.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsService.obj -Fd$(CONFIG)/obj/ejsService.pdb $(CFLAGS) -I$(CONFIG)/inc src/vm/ejsService.c

$(CONFIG)/bin/libejs.dll:  \
        $(CONFIG)/bin/libhttp.dll \
        $(CONFIG)/inc/ejs.cache.local.slots.h \
        $(CONFIG)/inc/ejs.db.sqlite.slots.h \
        $(CONFIG)/inc/ejs.slots.h \
        $(CONFIG)/inc/ejs.web.slots.h \
        $(CONFIG)/inc/ejs.zlib.slots.h \
        $(CONFIG)/inc/ejs.h \
        $(CONFIG)/inc/ejsByteCode.h \
        $(CONFIG)/inc/ejsByteCodeTable.h \
        $(CONFIG)/inc/ejsCompiler.h \
        $(CONFIG)/inc/ejsCustomize.h \
        $(CONFIG)/obj/ecAst.obj \
        $(CONFIG)/obj/ecCodeGen.obj \
        $(CONFIG)/obj/ecCompiler.obj \
        $(CONFIG)/obj/ecLex.obj \
        $(CONFIG)/obj/ecModuleWrite.obj \
        $(CONFIG)/obj/ecParser.obj \
        $(CONFIG)/obj/ecState.obj \
        $(CONFIG)/obj/ejsApp.obj \
        $(CONFIG)/obj/ejsArray.obj \
        $(CONFIG)/obj/ejsBlock.obj \
        $(CONFIG)/obj/ejsBoolean.obj \
        $(CONFIG)/obj/ejsByteArray.obj \
        $(CONFIG)/obj/ejsCache.obj \
        $(CONFIG)/obj/ejsCmd.obj \
        $(CONFIG)/obj/ejsConfig.obj \
        $(CONFIG)/obj/ejsDate.obj \
        $(CONFIG)/obj/ejsDebug.obj \
        $(CONFIG)/obj/ejsError.obj \
        $(CONFIG)/obj/ejsFile.obj \
        $(CONFIG)/obj/ejsFileSystem.obj \
        $(CONFIG)/obj/ejsFrame.obj \
        $(CONFIG)/obj/ejsFunction.obj \
        $(CONFIG)/obj/ejsGC.obj \
        $(CONFIG)/obj/ejsGlobal.obj \
        $(CONFIG)/obj/ejsHttp.obj \
        $(CONFIG)/obj/ejsIterator.obj \
        $(CONFIG)/obj/ejsJSON.obj \
        $(CONFIG)/obj/ejsLocalCache.obj \
        $(CONFIG)/obj/ejsMath.obj \
        $(CONFIG)/obj/ejsMemory.obj \
        $(CONFIG)/obj/ejsMprLog.obj \
        $(CONFIG)/obj/ejsNamespace.obj \
        $(CONFIG)/obj/ejsNull.obj \
        $(CONFIG)/obj/ejsNumber.obj \
        $(CONFIG)/obj/ejsObject.obj \
        $(CONFIG)/obj/ejsPath.obj \
        $(CONFIG)/obj/ejsPot.obj \
        $(CONFIG)/obj/ejsRegExp.obj \
        $(CONFIG)/obj/ejsSocket.obj \
        $(CONFIG)/obj/ejsString.obj \
        $(CONFIG)/obj/ejsSystem.obj \
        $(CONFIG)/obj/ejsTimer.obj \
        $(CONFIG)/obj/ejsType.obj \
        $(CONFIG)/obj/ejsUri.obj \
        $(CONFIG)/obj/ejsVoid.obj \
        $(CONFIG)/obj/ejsWorker.obj \
        $(CONFIG)/obj/ejsXML.obj \
        $(CONFIG)/obj/ejsXMLList.obj \
        $(CONFIG)/obj/ejsXMLLoader.obj \
        $(CONFIG)/obj/ejsByteCode.obj \
        $(CONFIG)/obj/ejsException.obj \
        $(CONFIG)/obj/ejsHelper.obj \
        $(CONFIG)/obj/ejsInterp.obj \
        $(CONFIG)/obj/ejsLoader.obj \
        $(CONFIG)/obj/ejsModule.obj \
        $(CONFIG)/obj/ejsScope.obj \
        $(CONFIG)/obj/ejsService.obj
	"$(LD)" -dll -out:$(CONFIG)/bin/libejs.dll -entry:_DllMainCRTStartup@12 -def:$(CONFIG)/bin/libejs.def $(LIBPATHS) $(CONFIG)/obj/ecAst.obj $(CONFIG)/obj/ecCodeGen.obj $(CONFIG)/obj/ecCompiler.obj $(CONFIG)/obj/ecLex.obj $(CONFIG)/obj/ecModuleWrite.obj $(CONFIG)/obj/ecParser.obj $(CONFIG)/obj/ecState.obj $(CONFIG)/obj/ejsApp.obj $(CONFIG)/obj/ejsArray.obj $(CONFIG)/obj/ejsBlock.obj $(CONFIG)/obj/ejsBoolean.obj $(CONFIG)/obj/ejsByteArray.obj $(CONFIG)/obj/ejsCache.obj $(CONFIG)/obj/ejsCmd.obj $(CONFIG)/obj/ejsConfig.obj $(CONFIG)/obj/ejsDate.obj $(CONFIG)/obj/ejsDebug.obj $(CONFIG)/obj/ejsError.obj $(CONFIG)/obj/ejsFile.obj $(CONFIG)/obj/ejsFileSystem.obj $(CONFIG)/obj/ejsFrame.obj $(CONFIG)/obj/ejsFunction.obj $(CONFIG)/obj/ejsGC.obj $(CONFIG)/obj/ejsGlobal.obj $(CONFIG)/obj/ejsHttp.obj $(CONFIG)/obj/ejsIterator.obj $(CONFIG)/obj/ejsJSON.obj $(CONFIG)/obj/ejsLocalCache.obj $(CONFIG)/obj/ejsMath.obj $(CONFIG)/obj/ejsMemory.obj $(CONFIG)/obj/ejsMprLog.obj $(CONFIG)/obj/ejsNamespace.obj $(CONFIG)/obj/ejsNull.obj $(CONFIG)/obj/ejsNumber.obj $(CONFIG)/obj/ejsObject.obj $(CONFIG)/obj/ejsPath.obj $(CONFIG)/obj/ejsPot.obj $(CONFIG)/obj/ejsRegExp.obj $(CONFIG)/obj/ejsSocket.obj $(CONFIG)/obj/ejsString.obj $(CONFIG)/obj/ejsSystem.obj $(CONFIG)/obj/ejsTimer.obj $(CONFIG)/obj/ejsType.obj $(CONFIG)/obj/ejsUri.obj $(CONFIG)/obj/ejsVoid.obj $(CONFIG)/obj/ejsWorker.obj $(CONFIG)/obj/ejsXML.obj $(CONFIG)/obj/ejsXMLList.obj $(CONFIG)/obj/ejsXMLLoader.obj $(CONFIG)/obj/ejsByteCode.obj $(CONFIG)/obj/ejsException.obj $(CONFIG)/obj/ejsHelper.obj $(CONFIG)/obj/ejsInterp.obj $(CONFIG)/obj/ejsLoader.obj $(CONFIG)/obj/ejsModule.obj $(CONFIG)/obj/ejsScope.obj $(CONFIG)/obj/ejsService.obj $(LIBS) libhttp.lib libmpr.lib libpcre.lib libmprssl.lib

$(CONFIG)/obj/ejs.obj: \
        src/cmd/ejs.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejs.obj -Fd$(CONFIG)/obj/ejs.pdb $(CFLAGS) -I$(CONFIG)/inc src/cmd/ejs.c

$(CONFIG)/bin/ejs.exe:  \
        $(CONFIG)/bin/libejs.dll \
        $(CONFIG)/obj/ejs.obj
	"$(LD)" -out:$(CONFIG)/bin/ejs.exe -entry:mainCRTStartup -subsystem:console $(LIBPATHS) $(CONFIG)/obj/ejs.obj $(LIBS) libejs.lib libhttp.lib libmpr.lib libpcre.lib libmprssl.lib

$(CONFIG)/obj/ejsc.obj: \
        src/cmd/ejsc.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsc.obj -Fd$(CONFIG)/obj/ejsc.pdb $(CFLAGS) -I$(CONFIG)/inc src/cmd/ejsc.c

$(CONFIG)/bin/ejsc.exe:  \
        $(CONFIG)/bin/libejs.dll \
        $(CONFIG)/obj/ejsc.obj
	"$(LD)" -out:$(CONFIG)/bin/ejsc.exe -entry:mainCRTStartup -subsystem:console $(LIBPATHS) $(CONFIG)/obj/ejsc.obj $(LIBS) libejs.lib libhttp.lib libmpr.lib libpcre.lib libmprssl.lib

$(CONFIG)/obj/ejsmod.obj: \
        src/cmd/ejsmod.c \
        $(CONFIG)/inc/bit.h \
        src/cmd/ejsmod.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsmod.obj -Fd$(CONFIG)/obj/ejsmod.pdb $(CFLAGS) -I$(CONFIG)/inc -Isrc/cmd src/cmd/ejsmod.c

$(CONFIG)/obj/doc.obj: \
        src/cmd/doc.c \
        $(CONFIG)/inc/bit.h \
        src/cmd/ejsmod.h
	"$(CC)" -c -Fo$(CONFIG)/obj/doc.obj -Fd$(CONFIG)/obj/doc.pdb $(CFLAGS) -I$(CONFIG)/inc -Isrc/cmd src/cmd/doc.c

$(CONFIG)/obj/docFiles.obj: \
        src/cmd/docFiles.c \
        $(CONFIG)/inc/bit.h \
        src/cmd/ejsmod.h
	"$(CC)" -c -Fo$(CONFIG)/obj/docFiles.obj -Fd$(CONFIG)/obj/docFiles.pdb $(CFLAGS) -I$(CONFIG)/inc -Isrc/cmd src/cmd/docFiles.c

$(CONFIG)/obj/listing.obj: \
        src/cmd/listing.c \
        $(CONFIG)/inc/bit.h \
        src/cmd/ejsmod.h
	"$(CC)" -c -Fo$(CONFIG)/obj/listing.obj -Fd$(CONFIG)/obj/listing.pdb $(CFLAGS) -I$(CONFIG)/inc -Isrc/cmd src/cmd/listing.c

$(CONFIG)/obj/slotGen.obj: \
        src/cmd/slotGen.c \
        $(CONFIG)/inc/bit.h \
        src/cmd/ejsmod.h
	"$(CC)" -c -Fo$(CONFIG)/obj/slotGen.obj -Fd$(CONFIG)/obj/slotGen.pdb $(CFLAGS) -I$(CONFIG)/inc -Isrc/cmd src/cmd/slotGen.c

$(CONFIG)/bin/ejsmod.exe:  \
        $(CONFIG)/bin/libejs.dll \
        $(CONFIG)/obj/ejsmod.obj \
        $(CONFIG)/obj/doc.obj \
        $(CONFIG)/obj/docFiles.obj \
        $(CONFIG)/obj/listing.obj \
        $(CONFIG)/obj/slotGen.obj
	"$(LD)" -out:$(CONFIG)/bin/ejsmod.exe -entry:mainCRTStartup -subsystem:console $(LIBPATHS) $(CONFIG)/obj/ejsmod.obj $(CONFIG)/obj/doc.obj $(CONFIG)/obj/docFiles.obj $(CONFIG)/obj/listing.obj $(CONFIG)/obj/slotGen.obj $(LIBS) libejs.lib libhttp.lib libmpr.lib libpcre.lib libmprssl.lib

$(CONFIG)/obj/ejsrun.obj: \
        src/cmd/ejsrun.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsrun.obj -Fd$(CONFIG)/obj/ejsrun.pdb $(CFLAGS) -I$(CONFIG)/inc src/cmd/ejsrun.c

$(CONFIG)/bin/ejsrun.exe:  \
        $(CONFIG)/bin/libejs.dll \
        $(CONFIG)/obj/ejsrun.obj
	"$(LD)" -out:$(CONFIG)/bin/ejsrun.exe -entry:mainCRTStartup -subsystem:console $(LIBPATHS) $(CONFIG)/obj/ejsrun.obj $(LIBS) libejs.lib libhttp.lib libmpr.lib libpcre.lib libmprssl.lib

$(CONFIG)/bin/ejs.mod:  \
        $(CONFIG)/bin/ejsc.exe \
        $(CONFIG)/bin/ejsmod.exe
	cd src/core >/dev/null ;\
		../../$(CONFIG)/bin/ejsc --out ../../$(CONFIG)/bin/ejs.mod --debug --optimize 9 --bind --require null *.es  ;\
	../../$(CONFIG)/bin/ejsmod --require null --cslots ../../$(CONFIG)/bin/ejs.mod ;\
	if ! diff ejs.slots.h ../../$(CONFIG)/inc/ejs.slots.h >/dev/null; then cp ejs.slots.h ../../$(CONFIG)/inc; fi ;\
	rm -f ejs.slots.h ;\
		cd - >/dev/null 

$(CONFIG)/bin/bit.es: 
	cd src/jems/ejs.bit >/dev/null ;\
		cp bit.es ../../../$(CONFIG)/bin ;\
		cd - >/dev/null 

$(CONFIG)/bin/bits: 
	cd src/jems/ejs.bit >/dev/null ;\
		rm -fr ../../../$(CONFIG)/bin/bits ;\
	cp -r bits ../../../$(CONFIG)/bin ;\
		cd - >/dev/null 

$(CONFIG)/obj/ejsZlib.obj: \
        src/jems/ejs.zlib/src/ejsZlib.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsZlib.obj -Fd$(CONFIG)/obj/ejsZlib.pdb $(CFLAGS) -I$(CONFIG)/inc src/jems/ejs.zlib/src/ejsZlib.c

$(CONFIG)/bin/bit.exe:  \
        $(CONFIG)/bin/libejs.dll \
        $(CONFIG)/bin/bits \
        $(CONFIG)/bin/bit.es \
        $(CONFIG)/obj/ejsrun.obj \
        $(CONFIG)/obj/ejsZlib.obj
	"$(LD)" -out:$(CONFIG)/bin/bit.exe -entry:mainCRTStartup -subsystem:console $(LIBPATHS) $(CONFIG)/obj/ejsrun.obj $(CONFIG)/obj/ejsZlib.obj $(CONFIG)/obj/mprLib.obj $(CONFIG)/obj/pcre.obj $(CONFIG)/obj/mprSsl.obj $(CONFIG)/obj/httpLib.obj $(CONFIG)/obj/ecAst.obj $(CONFIG)/obj/ecCodeGen.obj $(CONFIG)/obj/ecCompiler.obj $(CONFIG)/obj/ecLex.obj $(CONFIG)/obj/ecModuleWrite.obj $(CONFIG)/obj/ecParser.obj $(CONFIG)/obj/ecState.obj $(CONFIG)/obj/ejsApp.obj $(CONFIG)/obj/ejsArray.obj $(CONFIG)/obj/ejsBlock.obj $(CONFIG)/obj/ejsBoolean.obj $(CONFIG)/obj/ejsByteArray.obj $(CONFIG)/obj/ejsCache.obj $(CONFIG)/obj/ejsCmd.obj $(CONFIG)/obj/ejsConfig.obj $(CONFIG)/obj/ejsDate.obj $(CONFIG)/obj/ejsDebug.obj $(CONFIG)/obj/ejsError.obj $(CONFIG)/obj/ejsFile.obj $(CONFIG)/obj/ejsFileSystem.obj $(CONFIG)/obj/ejsFrame.obj $(CONFIG)/obj/ejsFunction.obj $(CONFIG)/obj/ejsGC.obj $(CONFIG)/obj/ejsGlobal.obj $(CONFIG)/obj/ejsHttp.obj $(CONFIG)/obj/ejsIterator.obj $(CONFIG)/obj/ejsJSON.obj $(CONFIG)/obj/ejsLocalCache.obj $(CONFIG)/obj/ejsMath.obj $(CONFIG)/obj/ejsMemory.obj $(CONFIG)/obj/ejsMprLog.obj $(CONFIG)/obj/ejsNamespace.obj $(CONFIG)/obj/ejsNull.obj $(CONFIG)/obj/ejsNumber.obj $(CONFIG)/obj/ejsObject.obj $(CONFIG)/obj/ejsPath.obj $(CONFIG)/obj/ejsPot.obj $(CONFIG)/obj/ejsRegExp.obj $(CONFIG)/obj/ejsSocket.obj $(CONFIG)/obj/ejsString.obj $(CONFIG)/obj/ejsSystem.obj $(CONFIG)/obj/ejsTimer.obj $(CONFIG)/obj/ejsType.obj $(CONFIG)/obj/ejsUri.obj $(CONFIG)/obj/ejsVoid.obj $(CONFIG)/obj/ejsWorker.obj $(CONFIG)/obj/ejsXML.obj $(CONFIG)/obj/ejsXMLList.obj $(CONFIG)/obj/ejsXMLLoader.obj $(CONFIG)/obj/ejsByteCode.obj $(CONFIG)/obj/ejsException.obj $(CONFIG)/obj/ejsHelper.obj $(CONFIG)/obj/ejsInterp.obj $(CONFIG)/obj/ejsLoader.obj $(CONFIG)/obj/ejsModule.obj $(CONFIG)/obj/ejsScope.obj $(CONFIG)/obj/ejsService.obj $(LIBS)

$(CONFIG)/bin/utest.es: 
	cd src/jems/ejs.utest >/dev/null ;\
		cp ./utest.es ../../../$(CONFIG)/bin ;\
		cd - >/dev/null 

$(CONFIG)/bin/utest.exe:  \
        $(CONFIG)/bin/ejsrun.exe
	rm -fr $(CONFIG)/bin/utest.exe
	cp -r win-i686-debug/bin/ejsrun.exe $(CONFIG)/bin/utest.exe

$(CONFIG)/bin/ejs.unix.mod:  \
        $(CONFIG)/bin/ejsc.exe \
        $(CONFIG)/bin/ejsmod.exe \
        $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.unix >/dev/null ;\
		../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.unix.mod --debug --optimize 9 ./Unix.es ;\
		cd - >/dev/null 

$(CONFIG)/bin/jem.es: 
	cd src/jems/ejs.jem >/dev/null ;\
		cp ./jem.es ../../../$(CONFIG)/bin ;\
		cd - >/dev/null 

$(CONFIG)/bin/jem.exe:  \
        $(CONFIG)/bin/ejsrun.exe
	rm -fr $(CONFIG)/bin/jem.exe
	cp -r win-i686-debug/bin/ejsrun.exe $(CONFIG)/bin/jem.exe

$(CONFIG)/bin/ejs.db.mod:  \
        $(CONFIG)/bin/ejsc.exe \
        $(CONFIG)/bin/ejsmod.exe \
        $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.db >/dev/null ;\
		../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.db.mod --debug --optimize 9 ./*.es ;\
		cd - >/dev/null 

$(CONFIG)/bin/ejs.db.mapper.mod:  \
        $(CONFIG)/bin/ejsc.exe \
        $(CONFIG)/bin/ejsmod.exe \
        $(CONFIG)/bin/ejs.mod \
        $(CONFIG)/bin/ejs.db.mod
	cd src/jems/ejs.db.mapper >/dev/null ;\
		../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.db.mapper.mod --debug --optimize 9 ./*.es ;\
		cd - >/dev/null 

$(CONFIG)/bin/ejs.db.sqlite.mod:  \
        $(CONFIG)/bin/ejsc.exe \
        $(CONFIG)/bin/ejsmod.exe \
        $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.db.sqlite >/dev/null ;\
		../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.db.sqlite.mod --debug --optimize 9 *.es ;\
		cd - >/dev/null 

$(CONFIG)/obj/ejsSqlite.obj: \
        src/jems/ejs.db.sqlite/src/ejsSqlite.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsSqlite.obj -Fd$(CONFIG)/obj/ejsSqlite.pdb $(CFLAGS) -I$(CONFIG)/inc src/jems/ejs.db.sqlite/src/ejsSqlite.c

$(CONFIG)/bin/ejs.db.sqlite.dll:  \
        $(CONFIG)/bin/libmpr.dll \
        $(CONFIG)/bin/libejs.dll \
        $(CONFIG)/bin/ejs.mod \
        $(CONFIG)/bin/ejs.db.sqlite.mod \
        $(CONFIG)/bin/libsqlite3.dll \
        $(CONFIG)/obj/ejsSqlite.obj
	"$(LD)" -dll -out:$(CONFIG)/bin/ejs.db.sqlite.dll -entry:_DllMainCRTStartup@12 -def:$(CONFIG)/bin/ejs.db.sqlite.def $(LIBPATHS) $(CONFIG)/obj/ejsSqlite.obj $(LIBS) libmpr.lib libejs.lib libhttp.lib libpcre.lib libmprssl.lib libsqlite3.lib

$(CONFIG)/bin/ejs.web.mod:  \
        $(CONFIG)/bin/ejsc.exe \
        $(CONFIG)/bin/ejsmod.exe \
        $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.web >/dev/null ;\
		../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.web.mod --debug --optimize 9 ./*.es ;\
	../../../$(CONFIG)/bin/ejsmod --cslots ../../../$(CONFIG)/bin/ejs.web.mod ;\
	if ! diff ejs.web.slots.h ../../../$(CONFIG)/inc/ejs.web.slots.h >/dev/null; then cp ejs.web.slots.h ../../../$(CONFIG)/inc; fi ;\
	rm -f ejs.web.slots.h ;\
		cd - >/dev/null 

$(CONFIG)/obj/ejsHttpServer.obj: \
        src/jems/ejs.web/src/ejsHttpServer.c \
        $(CONFIG)/inc/bit.h \
        src/jems/ejs.web/src/ejsWeb.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsHttpServer.obj -Fd$(CONFIG)/obj/ejsHttpServer.pdb $(CFLAGS) -I$(CONFIG)/inc -Isrc/jems/ejs.web/src src/jems/ejs.web/src/ejsHttpServer.c

$(CONFIG)/obj/ejsRequest.obj: \
        src/jems/ejs.web/src/ejsRequest.c \
        $(CONFIG)/inc/bit.h \
        src/jems/ejs.web/src/ejsWeb.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsRequest.obj -Fd$(CONFIG)/obj/ejsRequest.pdb $(CFLAGS) -I$(CONFIG)/inc -Isrc/jems/ejs.web/src src/jems/ejs.web/src/ejsRequest.c

$(CONFIG)/obj/ejsSession.obj: \
        src/jems/ejs.web/src/ejsSession.c \
        $(CONFIG)/inc/bit.h \
        src/jems/ejs.web/src/ejsWeb.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsSession.obj -Fd$(CONFIG)/obj/ejsSession.pdb $(CFLAGS) -I$(CONFIG)/inc -Isrc/jems/ejs.web/src src/jems/ejs.web/src/ejsSession.c

$(CONFIG)/obj/ejsWeb.obj: \
        src/jems/ejs.web/src/ejsWeb.c \
        $(CONFIG)/inc/bit.h \
        src/jems/ejs.web/src/ejsWeb.h
	"$(CC)" -c -Fo$(CONFIG)/obj/ejsWeb.obj -Fd$(CONFIG)/obj/ejsWeb.pdb $(CFLAGS) -I$(CONFIG)/inc -Isrc/jems/ejs.web/src src/jems/ejs.web/src/ejsWeb.c

$(CONFIG)/bin/ejs.web.dll:  \
        $(CONFIG)/bin/libejs.dll \
        $(CONFIG)/bin/ejs.mod \
        $(CONFIG)/obj/ejsHttpServer.obj \
        $(CONFIG)/obj/ejsRequest.obj \
        $(CONFIG)/obj/ejsSession.obj \
        $(CONFIG)/obj/ejsWeb.obj
	"$(LD)" -dll -out:$(CONFIG)/bin/ejs.web.dll -entry:_DllMainCRTStartup@12 -def:$(CONFIG)/bin/ejs.web.def $(LIBPATHS) $(CONFIG)/obj/ejsHttpServer.obj $(CONFIG)/obj/ejsRequest.obj $(CONFIG)/obj/ejsSession.obj $(CONFIG)/obj/ejsWeb.obj $(LIBS) libejs.lib libhttp.lib libmpr.lib libpcre.lib libmprssl.lib

$(CONFIG)/bin/www: 
	cd src/jems/ejs.web >/dev/null ;\
		rm -fr ../../../$(CONFIG)/bin/www ;\
	cp -r ./www ../../../$(CONFIG)/bin ;\
		cd - >/dev/null 

$(CONFIG)/bin/ejs.template.mod:  \
        $(CONFIG)/bin/ejsc.exe \
        $(CONFIG)/bin/ejsmod.exe \
        $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.template >/dev/null ;\
		../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.template.mod --debug --optimize 9 ./TemplateParser.es ;\
		cd - >/dev/null 

$(CONFIG)/bin/ejs.tar.mod:  \
        $(CONFIG)/bin/ejsc.exe \
        $(CONFIG)/bin/ejsmod.exe \
        $(CONFIG)/bin/ejs.mod
	cd src/jems/ejs.tar >/dev/null ;\
		../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.tar.mod --debug --optimize 9 ./*.es ;\
		cd - >/dev/null 

$(CONFIG)/bin/mvc.es: 
	cd src/jems/ejs.mvc >/dev/null ;\
		cp ./mvc.es ../../../$(CONFIG)/bin ;\
		cd - >/dev/null 

$(CONFIG)/bin/mvc.exe:  \
        $(CONFIG)/bin/ejsrun.exe
	rm -fr $(CONFIG)/bin/mvc.exe
	cp -r win-i686-debug/bin/ejsrun.exe $(CONFIG)/bin/mvc.exe

$(CONFIG)/bin/ejs.mvc.mod:  \
        $(CONFIG)/bin/ejsc.exe \
        $(CONFIG)/bin/ejsmod.exe \
        $(CONFIG)/bin/ejs.mod \
        $(CONFIG)/bin/ejs.web.mod \
        $(CONFIG)/bin/ejs.template.mod \
        $(CONFIG)/bin/ejs.unix.mod
	cd src/jems/ejs.mvc >/dev/null ;\
		../../../$(CONFIG)/bin/ejsc --out ../../../$(CONFIG)/bin/ejs.mvc.mod --debug --optimize 9 ./*.es ;\
		cd - >/dev/null 

$(CONFIG)/bin/utest.worker: 
	cd src/jems/ejs.utest >/dev/null ;\
		cp ./utest.worker ../../../$(CONFIG)/bin ;\
		cd - >/dev/null 

$(CONFIG)/obj/removeFiles.obj: \
        package/WIN/removeFiles.c \
        $(CONFIG)/inc/bit.h
	"$(CC)" -c -Fo$(CONFIG)/obj/removeFiles.obj -Fd$(CONFIG)/obj/removeFiles.pdb $(CFLAGS) -I$(CONFIG)/inc package/WIN/removeFiles.c

$(CONFIG)/bin/removeFiles.exe:  \
        $(CONFIG)/bin/libmpr.dll \
        $(CONFIG)/obj/removeFiles.obj
	"$(LD)" -out:$(CONFIG)/bin/removeFiles.exe -entry:WinMainCRTStartup -subsystem:Windows $(LIBPATHS) $(CONFIG)/obj/removeFiles.obj $(LIBS) libmpr.lib
