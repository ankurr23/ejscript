/*
    ejsConfig.c -- Config class
  
    Copyright (c) All Rights Reserved. See details at the end of the file.
 */

/********************************** Includes **********************************/

#include    "ejs.h"

/*********************************** Methods **********************************/

PUBLIC void ejsCreateConfigType(Ejs *ejs)
{
    /*
        The Config object may be used by conditional compilation, so the type must exist without loading ejs.mod
        The compiler will call ejsDefineConfigProperties if required.
     */
    ejsCreateCoreType(ejs, N("ejs", "Config"), sizeof(EjsPot), S_Config, ES_Config_NUM_CLASS_PROP, 
        ejsManagePot, EJS_TYPE_POT);
}


PUBLIC void ejsDefineConfigProperties(Ejs *ejs)
{
    EjsType     *type;
    char        version[16];
    int         att;

    if ((type = ejsFinalizeCoreType(ejs, N("ejs", "Config"))) == 0) {
        return;
    }
    /* Not mutable once initialized - Should have a Config instance instead */
    type->mutable = 0;

    /*
        Must use -1 for slotNumber as this function is called by the compiler when compiling ejs.mod. 
        There will still be a -Config- property in slot[0]
     */
    att = EJS_PROP_STATIC | EJS_PROP_ENUMERABLE;
    ejsDefineProperty(ejs, type, -1, N("public", "Debug"), 0, att, BIT_DEBUG ? ESV(true): ESV(false));

#if WINDOWS
{
    /* 
        Get the real system architecture, not whether this app is 32 or 64 bit.
        On native 64 bit systems, PA is amd64 for 64 bit apps and is PAW6432 is amd64 for 32 bit apps 
     */
    cchar   *cpu;
    if (smatch(getenv("PROCESSOR_ARCHITECTURE"), "AMD64") || getenv("PROCESSOR_ARCHITEW6432")) {
        cpu = "x64";
    } else {
        cpu = "x86";
    }
    ejsDefineProperty(ejs, type, -1, N("public", "CPU"), 0, att, ejsCreateStringFromAsc(ejs, cpu));
}
#else
    ejsDefineProperty(ejs, type, -1, N("public", "CPU"), 0, att, ejsCreateStringFromAsc(ejs, BIT_CPU));
#endif
    ejsDefineProperty(ejs, type, -1, N("public", "OS"), 0, att, ejsCreateStringFromAsc(ejs, BIT_OS));
    ejsDefineProperty(ejs, type, -1, N("public", "Product"), 0, att, 
        ejsCreateStringFromAsc(ejs, BIT_PRODUCT));
    ejsDefineProperty(ejs, type, -1, N("public", "Title"), 0, att, ejsCreateStringFromAsc(ejs, BIT_TITLE));
    fmt(version, sizeof(version), "%s-%s", BIT_VERSION, BIT_BUILD_NUMBER);
    ejsDefineProperty(ejs, type, -1, N("public", "Version"), 0, att, ejsCreateStringFromAsc(ejs, version));

    ejsDefineProperty(ejs, type, -1, N("public", "SSL"), 0, att, ejsCreateBoolean(ejs, BIT_PACK_SSL));
    ejsDefineProperty(ejs, type, -1, N("public", "SQLITE"), 0, att, ejsCreateBoolean(ejs, BIT_PACK_SQLITE));

    if (mprSamePath(mprGetAppDir(), BIT_BIN_PREFIX)) {
        ejsDefineProperty(ejs, type, -1, N("public", "Bin"), 0, att, ejsCreatePathFromAsc(ejs, BIT_BIN_PREFIX));
        ejsDefineProperty(ejs, type, -1, N("public", "Inc"), 0, att, ejsCreatePathFromAsc(ejs, BIT_INC_PREFIX));
    } else {
        ejsDefineProperty(ejs, type, -1, N("public", "Bin"), 0, att, ejsCreatePathFromAsc(ejs, mprGetAppDir()));
        ejsDefineProperty(ejs, type, -1, N("public", "Inc"), 0, att, 
            ejsCreatePathFromAsc(ejs, mprNormalizePath(mprJoinPath(mprGetAppDir(), "../inc"))));
    }
}


/*
    @copy   default
  
    Copyright (c) Embedthis Software LLC, 2003-2012. All Rights Reserved.
    Copyright (c) Michael O'Brien, 1993-2012. All Rights Reserved.
  
    This software is distributed under commercial and open source licenses.
    You may use the GPL open source license described below or you may acquire
    a commercial license from Embedthis Software. You agree to be fully bound
    by the terms of either license. Consult the LICENSE.md distributed with
    this software for full details.
  
    This software is open source; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the
    Free Software Foundation; either version 2 of the License, or (at your
    option) any later version. See the GNU General Public License for more
    details at: http://embedthis.com/downloads/gplLicense.html
  
    This program is distributed WITHOUT ANY WARRANTY; without even the
    implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  
    This GPL license does NOT permit incorporating this software into
    proprietary programs. If you are unable to comply with the GPL, you must
    acquire a commercial license to use this software. Commercial licenses
    for this software and support services are available from Embedthis
    Software at http://embedthis.com
  
    Local variables:
    tab-width: 4
    c-basic-offset: 4
    End:
    vim: sw=4 ts=4 expandtab

    @end
 */
