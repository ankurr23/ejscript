#
#   ejs-macosx-debug.sh -- Build It Shell Script to build Embedthis Ejscript
#

ARCH="x64"
ARCH="`uname -m | sed 's/i.86/x86/;s/x86_64/x64/;s/arm.*/arm/;s/mips.*/mips/'`"
OS="macosx"
PROFILE="debug"
CONFIG="${OS}-${ARCH}-${PROFILE}"
CC="/usr/bin/clang"
LD="/usr/bin/ld"
CFLAGS="-w"
DFLAGS="-DBIT_DEBUG"
IFLAGS="-I${CONFIG}/inc"
LDFLAGS="-Wl,-rpath,@executable_path/ -Wl,-rpath,@loader_path/ -g"
LIBPATHS="-L${CONFIG}/bin"
LIBS="-lpthread -lm -ldl"

[ ! -x ${CONFIG}/inc ] && mkdir -p ${CONFIG}/inc ${CONFIG}/obj ${CONFIG}/lib ${CONFIG}/bin

[ ! -f ${CONFIG}/inc/bit.h ] && cp projects/ejs-${OS}-${PROFILE}-bit.h ${CONFIG}/inc/bit.h
[ ! -f ${CONFIG}/inc/bitos.h ] && cp ${SRC}/src/bitos.h ${CONFIG}/inc/bitos.h
if ! diff ${CONFIG}/inc/bit.h projects/ejs-${OS}-${PROFILE}-bit.h >/dev/null ; then
	cp projects/ejs-${OS}-${PROFILE}-bit.h ${CONFIG}/inc/bit.h
fi

rm -rf ${CONFIG}/inc/bitos.h
cp -r src/bitos.h ${CONFIG}/inc/bitos.h

rm -rf ${CONFIG}/inc/mpr.h
cp -r src/deps/mpr/mpr.h ${CONFIG}/inc/mpr.h

${CC} -c -o ${CONFIG}/obj/mprLib.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/deps/mpr/mprLib.c

${CC} -dynamiclib -o ${CONFIG}/bin/libmpr.dylib -arch x86_64 ${LDFLAGS} -compatibility_version 2.3.0 -current_version 2.3.0 ${LIBPATHS} -install_name @rpath/libmpr.dylib ${CONFIG}/obj/mprLib.o ${LIBS}

rm -rf ${CONFIG}/inc/est.h
cp -r src/deps/est/est.h ${CONFIG}/inc/est.h

${CC} -c -o ${CONFIG}/obj/mprSsl.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/deps/mpr/mprSsl.c

${CC} -dynamiclib -o ${CONFIG}/bin/libmprssl.dylib -arch x86_64 ${LDFLAGS} -compatibility_version 2.3.0 -current_version 2.3.0 ${LIBPATHS} -install_name @rpath/libmprssl.dylib ${CONFIG}/obj/mprSsl.o -lmpr ${LIBS}

${CC} -c -o ${CONFIG}/obj/manager.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/deps/mpr/manager.c

${CC} -o ${CONFIG}/bin/ejsman -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/manager.o -lmpr ${LIBS}

${CC} -c -o ${CONFIG}/obj/makerom.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/deps/mpr/makerom.c

${CC} -o ${CONFIG}/bin/makerom -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/makerom.o -lmpr ${LIBS}

rm -rf ${CONFIG}/inc/pcre.h
cp -r src/deps/pcre/pcre.h ${CONFIG}/inc/pcre.h

${CC} -c -o ${CONFIG}/obj/pcre.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/deps/pcre/pcre.c

${CC} -dynamiclib -o ${CONFIG}/bin/libpcre.dylib -arch x86_64 ${LDFLAGS} ${LIBPATHS} -install_name @rpath/libpcre.dylib ${CONFIG}/obj/pcre.o ${LIBS}

rm -rf ${CONFIG}/inc/http.h
cp -r src/deps/http/http.h ${CONFIG}/inc/http.h

${CC} -c -o ${CONFIG}/obj/httpLib.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/deps/http/httpLib.c

${CC} -dynamiclib -o ${CONFIG}/bin/libhttp.dylib -arch x86_64 ${LDFLAGS} -compatibility_version 2.3.0 -current_version 2.3.0 ${LIBPATHS} -install_name @rpath/libhttp.dylib ${CONFIG}/obj/httpLib.o -lpcre -lmpr ${LIBS}

${CC} -c -o ${CONFIG}/obj/http.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/deps/http/http.c

${CC} -o ${CONFIG}/bin/http -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/http.o -lhttp ${LIBS} -lpcre -lmpr

rm -rf ${CONFIG}/inc/sqlite3.h
cp -r src/deps/sqlite/sqlite3.h ${CONFIG}/inc/sqlite3.h

${CC} -c -o ${CONFIG}/obj/sqlite3.o -arch x86_64 ${DFLAGS} -I${CONFIG}/inc src/deps/sqlite/sqlite3.c

${CC} -dynamiclib -o ${CONFIG}/bin/libsqlite3.dylib -arch x86_64 ${LDFLAGS} -compatibility_version 2.3.0 -current_version 2.3.0 ${LIBPATHS} -install_name @rpath/libsqlite3.dylib ${CONFIG}/obj/sqlite3.o ${LIBS}

${CC} -c -o ${CONFIG}/obj/sqlite.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/deps/sqlite/sqlite.c

${CC} -o ${CONFIG}/bin/sqlite -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/sqlite.o -lsqlite3 ${LIBS}

rm -rf ${CONFIG}/inc/zlib.h
cp -r src/deps/zlib/zlib.h ${CONFIG}/inc/zlib.h

${CC} -c -o ${CONFIG}/obj/zlib.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/deps/zlib/zlib.c

${CC} -dynamiclib -o ${CONFIG}/bin/libzlib.dylib -arch x86_64 ${LDFLAGS} -compatibility_version 2.3.0 -current_version 2.3.0 ${LIBPATHS} -install_name @rpath/libzlib.dylib ${CONFIG}/obj/zlib.o ${LIBS}

rm -rf ${CONFIG}/inc/ejs.cache.local.slots.h
cp -r src/slots/ejs.cache.local.slots.h ${CONFIG}/inc/ejs.cache.local.slots.h

rm -rf ${CONFIG}/inc/ejs.db.sqlite.slots.h
cp -r src/slots/ejs.db.sqlite.slots.h ${CONFIG}/inc/ejs.db.sqlite.slots.h

rm -rf ${CONFIG}/inc/ejs.slots.h
cp -r src/slots/ejs.slots.h ${CONFIG}/inc/ejs.slots.h

rm -rf ${CONFIG}/inc/ejs.web.slots.h
cp -r src/slots/ejs.web.slots.h ${CONFIG}/inc/ejs.web.slots.h

rm -rf ${CONFIG}/inc/ejs.zlib.slots.h
cp -r src/slots/ejs.zlib.slots.h ${CONFIG}/inc/ejs.zlib.slots.h

rm -rf ${CONFIG}/inc/ejsByteCode.h
cp -r src/ejsByteCode.h ${CONFIG}/inc/ejsByteCode.h

rm -rf ${CONFIG}/inc/ejsByteCodeTable.h
cp -r src/ejsByteCodeTable.h ${CONFIG}/inc/ejsByteCodeTable.h

rm -rf ${CONFIG}/inc/ejsCustomize.h
cp -r src/ejsCustomize.h ${CONFIG}/inc/ejsCustomize.h

rm -rf ${CONFIG}/inc/ejs.h
cp -r src/ejs.h ${CONFIG}/inc/ejs.h

rm -rf ${CONFIG}/inc/ejsCompiler.h
cp -r src/ejsCompiler.h ${CONFIG}/inc/ejsCompiler.h

${CC} -c -o ${CONFIG}/obj/ecAst.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/compiler/ecAst.c

${CC} -c -o ${CONFIG}/obj/ecCodeGen.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/compiler/ecCodeGen.c

${CC} -c -o ${CONFIG}/obj/ecCompiler.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/compiler/ecCompiler.c

${CC} -c -o ${CONFIG}/obj/ecLex.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/compiler/ecLex.c

${CC} -c -o ${CONFIG}/obj/ecModuleWrite.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/compiler/ecModuleWrite.c

${CC} -c -o ${CONFIG}/obj/ecParser.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/compiler/ecParser.c

${CC} -c -o ${CONFIG}/obj/ecState.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/compiler/ecState.c

${CC} -c -o ${CONFIG}/obj/dtoa.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/dtoa.c

${CC} -c -o ${CONFIG}/obj/ejsApp.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsApp.c

${CC} -c -o ${CONFIG}/obj/ejsArray.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsArray.c

${CC} -c -o ${CONFIG}/obj/ejsBlock.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsBlock.c

${CC} -c -o ${CONFIG}/obj/ejsBoolean.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsBoolean.c

${CC} -c -o ${CONFIG}/obj/ejsByteArray.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsByteArray.c

${CC} -c -o ${CONFIG}/obj/ejsCache.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsCache.c

${CC} -c -o ${CONFIG}/obj/ejsCmd.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsCmd.c

${CC} -c -o ${CONFIG}/obj/ejsConfig.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsConfig.c

${CC} -c -o ${CONFIG}/obj/ejsDate.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsDate.c

${CC} -c -o ${CONFIG}/obj/ejsDebug.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsDebug.c

${CC} -c -o ${CONFIG}/obj/ejsError.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsError.c

${CC} -c -o ${CONFIG}/obj/ejsFile.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsFile.c

${CC} -c -o ${CONFIG}/obj/ejsFileSystem.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsFileSystem.c

${CC} -c -o ${CONFIG}/obj/ejsFrame.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsFrame.c

${CC} -c -o ${CONFIG}/obj/ejsFunction.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsFunction.c

${CC} -c -o ${CONFIG}/obj/ejsGC.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsGC.c

${CC} -c -o ${CONFIG}/obj/ejsGlobal.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsGlobal.c

${CC} -c -o ${CONFIG}/obj/ejsHttp.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsHttp.c

${CC} -c -o ${CONFIG}/obj/ejsIterator.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsIterator.c

${CC} -c -o ${CONFIG}/obj/ejsJSON.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsJSON.c

${CC} -c -o ${CONFIG}/obj/ejsLocalCache.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsLocalCache.c

${CC} -c -o ${CONFIG}/obj/ejsMath.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsMath.c

${CC} -c -o ${CONFIG}/obj/ejsMemory.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsMemory.c

${CC} -c -o ${CONFIG}/obj/ejsMprLog.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsMprLog.c

${CC} -c -o ${CONFIG}/obj/ejsNamespace.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsNamespace.c

${CC} -c -o ${CONFIG}/obj/ejsNull.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsNull.c

${CC} -c -o ${CONFIG}/obj/ejsNumber.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsNumber.c

${CC} -c -o ${CONFIG}/obj/ejsObject.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsObject.c

${CC} -c -o ${CONFIG}/obj/ejsPath.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsPath.c

${CC} -c -o ${CONFIG}/obj/ejsPot.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsPot.c

${CC} -c -o ${CONFIG}/obj/ejsRegExp.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsRegExp.c

${CC} -c -o ${CONFIG}/obj/ejsSocket.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsSocket.c

${CC} -c -o ${CONFIG}/obj/ejsString.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsString.c

${CC} -c -o ${CONFIG}/obj/ejsSystem.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsSystem.c

${CC} -c -o ${CONFIG}/obj/ejsTimer.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsTimer.c

${CC} -c -o ${CONFIG}/obj/ejsType.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsType.c

${CC} -c -o ${CONFIG}/obj/ejsUri.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsUri.c

${CC} -c -o ${CONFIG}/obj/ejsVoid.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsVoid.c

${CC} -c -o ${CONFIG}/obj/ejsWebSocket.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsWebSocket.c

${CC} -c -o ${CONFIG}/obj/ejsWorker.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsWorker.c

${CC} -c -o ${CONFIG}/obj/ejsXML.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsXML.c

${CC} -c -o ${CONFIG}/obj/ejsXMLList.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsXMLList.c

${CC} -c -o ${CONFIG}/obj/ejsXMLLoader.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/core/src/ejsXMLLoader.c

${CC} -c -o ${CONFIG}/obj/ejsByteCode.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/vm/ejsByteCode.c

${CC} -c -o ${CONFIG}/obj/ejsException.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/vm/ejsException.c

${CC} -c -o ${CONFIG}/obj/ejsHelper.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/vm/ejsHelper.c

${CC} -c -o ${CONFIG}/obj/ejsInterp.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/vm/ejsInterp.c

${CC} -c -o ${CONFIG}/obj/ejsLoader.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/vm/ejsLoader.c

${CC} -c -o ${CONFIG}/obj/ejsModule.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/vm/ejsModule.c

${CC} -c -o ${CONFIG}/obj/ejsScope.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/vm/ejsScope.c

${CC} -c -o ${CONFIG}/obj/ejsService.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/vm/ejsService.c

${CC} -dynamiclib -o ${CONFIG}/bin/libejs.dylib -arch x86_64 ${LDFLAGS} -compatibility_version 2.3.0 -current_version 2.3.0 ${LIBPATHS} -install_name @rpath/libejs.dylib ${CONFIG}/obj/ecAst.o ${CONFIG}/obj/ecCodeGen.o ${CONFIG}/obj/ecCompiler.o ${CONFIG}/obj/ecLex.o ${CONFIG}/obj/ecModuleWrite.o ${CONFIG}/obj/ecParser.o ${CONFIG}/obj/ecState.o ${CONFIG}/obj/dtoa.o ${CONFIG}/obj/ejsApp.o ${CONFIG}/obj/ejsArray.o ${CONFIG}/obj/ejsBlock.o ${CONFIG}/obj/ejsBoolean.o ${CONFIG}/obj/ejsByteArray.o ${CONFIG}/obj/ejsCache.o ${CONFIG}/obj/ejsCmd.o ${CONFIG}/obj/ejsConfig.o ${CONFIG}/obj/ejsDate.o ${CONFIG}/obj/ejsDebug.o ${CONFIG}/obj/ejsError.o ${CONFIG}/obj/ejsFile.o ${CONFIG}/obj/ejsFileSystem.o ${CONFIG}/obj/ejsFrame.o ${CONFIG}/obj/ejsFunction.o ${CONFIG}/obj/ejsGC.o ${CONFIG}/obj/ejsGlobal.o ${CONFIG}/obj/ejsHttp.o ${CONFIG}/obj/ejsIterator.o ${CONFIG}/obj/ejsJSON.o ${CONFIG}/obj/ejsLocalCache.o ${CONFIG}/obj/ejsMath.o ${CONFIG}/obj/ejsMemory.o ${CONFIG}/obj/ejsMprLog.o ${CONFIG}/obj/ejsNamespace.o ${CONFIG}/obj/ejsNull.o ${CONFIG}/obj/ejsNumber.o ${CONFIG}/obj/ejsObject.o ${CONFIG}/obj/ejsPath.o ${CONFIG}/obj/ejsPot.o ${CONFIG}/obj/ejsRegExp.o ${CONFIG}/obj/ejsSocket.o ${CONFIG}/obj/ejsString.o ${CONFIG}/obj/ejsSystem.o ${CONFIG}/obj/ejsTimer.o ${CONFIG}/obj/ejsType.o ${CONFIG}/obj/ejsUri.o ${CONFIG}/obj/ejsVoid.o ${CONFIG}/obj/ejsWebSocket.o ${CONFIG}/obj/ejsWorker.o ${CONFIG}/obj/ejsXML.o ${CONFIG}/obj/ejsXMLList.o ${CONFIG}/obj/ejsXMLLoader.o ${CONFIG}/obj/ejsByteCode.o ${CONFIG}/obj/ejsException.o ${CONFIG}/obj/ejsHelper.o ${CONFIG}/obj/ejsInterp.o ${CONFIG}/obj/ejsLoader.o ${CONFIG}/obj/ejsModule.o ${CONFIG}/obj/ejsScope.o ${CONFIG}/obj/ejsService.o -lhttp ${LIBS} -lpcre -lmpr

${CC} -c -o ${CONFIG}/obj/ejs.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/cmd/ejs.c

${CC} -o ${CONFIG}/bin/ejs -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/ejs.o -lejs ${LIBS} -lhttp -lpcre -lmpr -ledit

${CC} -c -o ${CONFIG}/obj/ejsc.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/cmd/ejsc.c

${CC} -o ${CONFIG}/bin/ejsc -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/ejsc.o -lejs ${LIBS} -lhttp -lpcre -lmpr

${CC} -c -o ${CONFIG}/obj/ejsmod.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc -Isrc/cmd src/cmd/ejsmod.c

${CC} -c -o ${CONFIG}/obj/doc.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc -Isrc/cmd src/cmd/doc.c

${CC} -c -o ${CONFIG}/obj/docFiles.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc -Isrc/cmd src/cmd/docFiles.c

${CC} -c -o ${CONFIG}/obj/listing.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc -Isrc/cmd src/cmd/listing.c

${CC} -c -o ${CONFIG}/obj/slotGen.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc -Isrc/cmd src/cmd/slotGen.c

${CC} -o ${CONFIG}/bin/ejsmod -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/ejsmod.o ${CONFIG}/obj/doc.o ${CONFIG}/obj/docFiles.o ${CONFIG}/obj/listing.o ${CONFIG}/obj/slotGen.o -lejs ${LIBS} -lhttp -lpcre -lmpr

${CC} -c -o ${CONFIG}/obj/ejsrun.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/cmd/ejsrun.c

${CC} -o ${CONFIG}/bin/ejsrun -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/ejsrun.o -lejs ${LIBS} -lhttp -lpcre -lmpr

cd src/core >/dev/null ;\
../../${CONFIG}/bin/ejsc --out ../../${CONFIG}/bin/ejs.mod --debug --optimize 9 --bind --require null *.es  ;\
../../${CONFIG}/bin/ejsmod --require null --cslots ../../${CONFIG}/bin/ejs.mod ;\
if ! diff ejs.slots.h ../../${CONFIG}/inc/ejs.slots.h >/dev/null; then cp ejs.slots.h ../../${CONFIG}/inc; fi ;\
rm -f ejs.slots.h ;\
cd - >/dev/null 

rm -rf ${CONFIG}/bin/bit.es
cp -r src/jems/ejs.bit/bit.es ${CONFIG}/bin/bit.es

cd src/jems/ejs.bit >/dev/null ;\
rm -fr ../../../${CONFIG}/bin/bits ;\
cp -r bits ../../../${CONFIG}/bin ;\
cd - >/dev/null 

#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/ejs.zlib.mod
${CC} -c -o ${CONFIG}/obj/ejsZlib.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/jems/ejs.zlib/ejsZlib.c

${CC} -dynamiclib -o ${CONFIG}/bin/libejs.zlib.dylib -arch x86_64 ${LDFLAGS} -compatibility_version 2.3.0 -current_version 2.3.0 ${LIBPATHS} -install_name @rpath/libejs.zlib.dylib ${CONFIG}/obj/ejsZlib.o -lzlib -lejs ${LIBS} -lhttp -lpcre -lmpr

${CC} -o ${CONFIG}/bin/bit -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/ejsrun.o ${CONFIG}/obj/mprLib.o ${CONFIG}/obj/pcre.o ${CONFIG}/obj/httpLib.o ${CONFIG}/obj/ecAst.o ${CONFIG}/obj/ecCodeGen.o ${CONFIG}/obj/ecCompiler.o ${CONFIG}/obj/ecLex.o ${CONFIG}/obj/ecModuleWrite.o ${CONFIG}/obj/ecParser.o ${CONFIG}/obj/ecState.o ${CONFIG}/obj/dtoa.o ${CONFIG}/obj/ejsApp.o ${CONFIG}/obj/ejsArray.o ${CONFIG}/obj/ejsBlock.o ${CONFIG}/obj/ejsBoolean.o ${CONFIG}/obj/ejsByteArray.o ${CONFIG}/obj/ejsCache.o ${CONFIG}/obj/ejsCmd.o ${CONFIG}/obj/ejsConfig.o ${CONFIG}/obj/ejsDate.o ${CONFIG}/obj/ejsDebug.o ${CONFIG}/obj/ejsError.o ${CONFIG}/obj/ejsFile.o ${CONFIG}/obj/ejsFileSystem.o ${CONFIG}/obj/ejsFrame.o ${CONFIG}/obj/ejsFunction.o ${CONFIG}/obj/ejsGC.o ${CONFIG}/obj/ejsGlobal.o ${CONFIG}/obj/ejsHttp.o ${CONFIG}/obj/ejsIterator.o ${CONFIG}/obj/ejsJSON.o ${CONFIG}/obj/ejsLocalCache.o ${CONFIG}/obj/ejsMath.o ${CONFIG}/obj/ejsMemory.o ${CONFIG}/obj/ejsMprLog.o ${CONFIG}/obj/ejsNamespace.o ${CONFIG}/obj/ejsNull.o ${CONFIG}/obj/ejsNumber.o ${CONFIG}/obj/ejsObject.o ${CONFIG}/obj/ejsPath.o ${CONFIG}/obj/ejsPot.o ${CONFIG}/obj/ejsRegExp.o ${CONFIG}/obj/ejsSocket.o ${CONFIG}/obj/ejsString.o ${CONFIG}/obj/ejsSystem.o ${CONFIG}/obj/ejsTimer.o ${CONFIG}/obj/ejsType.o ${CONFIG}/obj/ejsUri.o ${CONFIG}/obj/ejsVoid.o ${CONFIG}/obj/ejsWebSocket.o ${CONFIG}/obj/ejsWorker.o ${CONFIG}/obj/ejsXML.o ${CONFIG}/obj/ejsXMLList.o ${CONFIG}/obj/ejsXMLLoader.o ${CONFIG}/obj/ejsByteCode.o ${CONFIG}/obj/ejsException.o ${CONFIG}/obj/ejsHelper.o ${CONFIG}/obj/ejsInterp.o ${CONFIG}/obj/ejsLoader.o ${CONFIG}/obj/ejsModule.o ${CONFIG}/obj/ejsScope.o ${CONFIG}/obj/ejsService.o ${CONFIG}/obj/zlib.o ${CONFIG}/obj/ejsZlib.o ${LIBS}

#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/ejs.unix.mod
#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/jem.es
${CC} -o ${CONFIG}/bin/jem -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/ejsrun.o -lejs ${LIBS} -lhttp -lpcre -lmpr

#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/ejs.db.mod
#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/ejs.db.mapper.mod
#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/ejs.db.sqlite.mod
${CC} -c -o ${CONFIG}/obj/ejsSqlite.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc src/jems/ejs.db.sqlite/ejsSqlite.c

${CC} -dynamiclib -o ${CONFIG}/bin/libejs.db.sqlite.dylib -arch x86_64 ${LDFLAGS} -compatibility_version 2.3.0 -current_version 2.3.0 ${LIBPATHS} -install_name @rpath/libejs.db.sqlite.dylib ${CONFIG}/obj/ejsSqlite.o -lsqlite3 -lejs -lmpr ${LIBS} -lhttp -lpcre

cd src/jems/ejs.mail >/dev/null ;\
../../../${CONFIG}/bin/ejsc --out ../../../${CONFIG}/bin/ejs.mail.mod --debug --optimize 9 *.es ;\
cd - >/dev/null 

cd src/jems/ejs.web >/dev/null ;\
../../../${CONFIG}/bin/ejsc --out ../../../${CONFIG}/bin/ejs.web.mod --debug --optimize 9 *.es ;\
../../../${CONFIG}/bin/ejsmod --cslots ../../../${CONFIG}/bin/ejs.web.mod ;\
if ! diff ejs.web.slots.h ../../../${CONFIG}/inc/ejs.web.slots.h >/dev/null; then cp ejs.web.slots.h ../../../${CONFIG}/inc; fi ;\
rm -f ejs.web.slots.h ;\
cd - >/dev/null 

rm -rf ${CONFIG}/inc/ejsWeb.h
cp -r src/jems/ejs.web/ejsWeb.h ${CONFIG}/inc/ejsWeb.h

${CC} -c -o ${CONFIG}/obj/ejsHttpServer.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc -Isrc/jems/ejs.web/src src/jems/ejs.web/ejsHttpServer.c

${CC} -c -o ${CONFIG}/obj/ejsRequest.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc -Isrc/jems/ejs.web/src src/jems/ejs.web/ejsRequest.c

${CC} -c -o ${CONFIG}/obj/ejsSession.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc -Isrc/jems/ejs.web/src src/jems/ejs.web/ejsSession.c

${CC} -c -o ${CONFIG}/obj/ejsWeb.o -arch x86_64 ${CFLAGS} ${DFLAGS} -I${CONFIG}/inc -Isrc/jems/ejs.web/src src/jems/ejs.web/ejsWeb.c

${CC} -dynamiclib -o ${CONFIG}/bin/libejs.web.dylib -arch x86_64 ${LDFLAGS} -compatibility_version 2.3.0 -current_version 2.3.0 ${LIBPATHS} -install_name @rpath/libejs.web.dylib ${CONFIG}/obj/ejsHttpServer.o ${CONFIG}/obj/ejsRequest.o ${CONFIG}/obj/ejsSession.o ${CONFIG}/obj/ejsWeb.o -lejs ${LIBS} -lhttp -lpcre -lmpr

cd src/jems/ejs.web >/dev/null ;\
rm -fr ../../../${CONFIG}/bin/www ;\
cp -r www ../../../${CONFIG}/bin ;\
cd - >/dev/null 

#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/ejs.template.mod
#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/ejs.tar.mod
#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/mvc.es
${CC} -o ${CONFIG}/bin/mvc -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/ejsrun.o -lejs ${LIBS} -lhttp -lpcre -lmpr

#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/ejs.mvc.mod
#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/utest.es
#  Omit build script /Users/mob/git/ejs/macosx-x64-debug/bin/utest.worker
${CC} -o ${CONFIG}/bin/utest -arch x86_64 ${LDFLAGS} ${LIBPATHS} ${CONFIG}/obj/ejsrun.o -lejs ${LIBS} -lhttp -lpcre -lmpr

