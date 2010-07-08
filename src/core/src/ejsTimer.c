/*
    ejsTimer.c -- Timer class

    Copyright (c) All Rights Reserved. See details at the end of the file.
 */

/********************************** Includes **********************************/

#include    "ejs.h"

/*********************************** Methods **********************************/
/*
    Create a new timer

    function Timer(period: Number, callback: Function, ...args)
 */
static EjsObj *timer_constructor(Ejs *ejs, EjsTimer *tp, int argc, EjsObj **argv)
{
    mprAssert(argc >= 2);
    mprAssert(ejsIsNumber(argv[0]));
    mprAssert(ejsIsFunction(argv[1]));
    mprAssert(ejsIsArray(argv[2]));

    tp->ejs = ejs;
    tp->period = ejsGetInt(ejs, argv[0]);
    tp->callback = (EjsFunction*) argv[1];
    tp->args = (EjsArray*) argv[2];
    tp->repeat = 0;
    tp->drift = 1;
    return 0;
}


/*
    function get drift(): Boolean
 */
static EjsObj *timer_get_drift(Ejs *ejs, EjsTimer *tp, int argc, EjsObj **argv)
{
    mprAssert(argc == 0);
    return (EjsObj*) ejsCreateBoolean(ejs, tp->drift);
}


/*
    function set drift(period: Boolean): Void
 */
static EjsObj *timer_set_drift(Ejs *ejs, EjsTimer *tp, int argc, EjsObj **argv)
{
    mprAssert(argc == 1 && ejsIsBoolean(argv[0]));
    tp->drift = ejsGetBoolean(ejs, argv[0]);
    return 0;
}


/*
    function get onerror(): Function
 */
static EjsObj *timer_get_onerror(Ejs *ejs, EjsTimer *tp, int argc, EjsObj **argv)
{
    mprAssert(argc == 0);
    return (EjsObj*) tp->onerror;
}


/*
    function set onerror(callback: Function): Void
 */
static EjsObj *timer_set_onerror(Ejs *ejs, EjsTimer *tp, int argc, EjsObj **argv)
{
    tp->onerror = (EjsFunction*) argv[0];
    return 0;
}


/*
    function get period(): Number
 */
static EjsObj *timer_get_period(Ejs *ejs, EjsTimer *tp, int argc, EjsObj **argv)
{
    mprAssert(argc == 0);
    return (EjsObj*) ejsCreateNumber(ejs, tp->period);
}


/*
    function set period(period: Number): Void
 */
static EjsObj *timer_set_period(Ejs *ejs, EjsTimer *tp, int argc, EjsObj **argv)
{
    mprAssert(argc == 1 && ejsIsNumber(argv[0]));

    tp->period = ejsGetInt(ejs, argv[0]);
    return 0;
}


/*
    function get repeat(): Boolean
 */
static EjsObj *timer_get_repeat(Ejs *ejs, EjsTimer *tp, int argc, EjsObj **argv)
{
    mprAssert(argc == 0);
    return (EjsObj*) ejsCreateBoolean(ejs, tp->repeat);
}


/*
    function set repeat(enable: Boolean): Void
 */
static EjsObj *timer_set_repeat(Ejs *ejs, EjsTimer *tp, int argc, EjsObj **argv)
{
    mprAssert(argc == 1 && ejsIsBoolean(argv[0]));

    tp->repeat = ejsGetBoolean(ejs, argv[0]);
    if (tp->event) {
        mprEnableContinuousEvent(tp->event, tp->repeat);
    }
    return 0;
}


static int timerCallback(EjsTimer *tp, MprEvent *e)
{
    Ejs         *ejs;
    EjsString   *msg;
    EjsObj      *thisObj;

    mprAssert(tp);
    mprAssert(tp->args);
    mprAssert(tp->callback);

    ejs = tp->ejs;
    thisObj = (tp->callback->boundThis) ? tp->callback->boundThis : (EjsObj*) tp;
    ejsRunFunction(tp->ejs, tp->callback, thisObj, tp->args->length, tp->args->data);
    if (ejs->exception) {
        if (tp->onerror) {
            msg = ejsCreateString(ejs, ejsGetErrorMsg(ejs, 1));
            ejsClearException(ejs);
            ejsRunFunction(tp->ejs, tp->onerror, thisObj, 1, (EjsObj**) &msg);
        }
    }
    return 0;
}


/*
    function start(): Void
 */
static EjsObj *timer_start(Ejs *ejs, EjsTimer *tp, int argc, EjsObj **argv)
{
    int     flags;

    if (tp->event == 0) {
        flags = tp->repeat ? MPR_EVENT_CONTINUOUS : 0;
        tp->event = mprCreateEvent(ejs->dispatcher, "timer", tp->period, (MprEventProc) timerCallback, tp, flags);
        if (tp->event == 0) {
            ejsThrowMemoryError(ejs);
            return 0;
        }
    }
    return 0;
}


/*
    function stop(): Void
 */
static EjsObj *timer_stop(Ejs *ejs, EjsTimer *tp, int argc, EjsObj **argv)
{
    if (tp->event) {
        mprRemoveEvent(tp->event);
    }
    return 0;
}

/*********************************** Factory **********************************/

void ejsConfigureTimerType(Ejs *ejs)
{
    EjsType     *type;
    EjsObj      *prototype;

    type = ejsGetTypeByName(ejs, "ejs", "Timer");
    type->instanceSize = sizeof(EjsTimer);
    prototype = type->prototype;

    ejsBindConstructor(ejs, type, (EjsProc) timer_constructor);
#if ES_Timer_start
    ejsBindMethod(ejs, prototype, ES_Timer_start, (EjsProc) timer_start);
#endif
    ejsBindMethod(ejs, prototype, ES_Timer_stop, (EjsProc) timer_stop);

    ejsBindAccess(ejs, prototype, ES_Timer_drift, (EjsProc) timer_get_drift, (EjsProc) timer_set_drift);
    ejsBindAccess(ejs, prototype, ES_Timer_period, (EjsProc) timer_get_period, (EjsProc) timer_set_period);
#if ES_Timer_onerror
    ejsBindAccess(ejs, prototype, ES_Timer_onerror, (EjsProc) timer_get_onerror, (EjsProc) timer_set_onerror);
#endif
#if ES_Timer_repeat
    ejsBindAccess(ejs, prototype, ES_Timer_repeat, (EjsProc) timer_get_repeat, (EjsProc) timer_set_repeat);
#endif
}

/*
    @copy   default

    Copyright (c) Embedthis Software LLC, 2003-2010. All Rights Reserved.
    Copyright (c) Michael O'Brien, 1993-2010. All Rights Reserved.

    This software is distributed under commercial and open source licenses.
    You may use the GPL open source license described below or you may acquire
    a commercial license from Embedthis Software. You agree to be fully bound
    by the terms of either license. Consult the LICENSE.TXT distributed with
    this software for full details.

    This software is open source; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the
    Free Software Foundation; either version 2 of the License, or (at your
    option) any later version. See the GNU General Public License for more
    details at: http://www.embedthis.com/downloads/gplLicense.html

    This program is distributed WITHOUT ANY WARRANTY; without even the
    implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

    This GPL license does NOT permit incorporating this software into
    proprietary programs. If you are unable to comply with the GPL, you must
    acquire a commercial license to use this software. Commercial licenses
    for this software and support services are available from Embedthis
    Software at http://www.embedthis.com

    @end
 */
