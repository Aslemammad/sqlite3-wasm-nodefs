/* BEGIN FILE: ./bld/sqlite3-license-version.js */
/*
** LICENSE for the sqlite3 WebAssembly/JavaScript APIs.
**
** This bundle (typically released as sqlite3.js or sqlite3-wasmfs.js)
** is an amalgamation of JavaScript source code from two projects:
**
** 1) https://emscripten.org: the Emscripten "glue code" is covered by
**    the terms of the MIT license and University of Illinois/NCSA
**    Open Source License, as described at:
**
**    https://emscripten.org/docs/introducing_emscripten/emscripten_license.html
**
** 2) https://sqlite.org: all code and documentation labeled as being
**    from this source are released under the same terms as the sqlite3
**    C library:
**
** 2022-10-16
**
** The author disclaims copyright to this source code.  In place of a
** legal notice, here is a blessing:
**
** *   May you do good and not evil.
** *   May you find forgiveness for yourself and forgive others.
** *   May you share freely, never taking more than you give.
*/
/*
** This code was built from sqlite3 version...
** 
** SQLITE_VERSION "3.40.0"
** SQLITE_VERSION_NUMBER 3040000
** SQLITE_SOURCE_ID "2022-11-02 14:08:59 70ee6ee014bc4e2c1daa9b4a8909cf76ccecf32de1eb39055f20d3d0b1daalt1"
*/
/* END FILE: ./bld/sqlite3-license-version.js */
/* BEGIN FILE: api/sqlite3-api-prologue.js */
/*
  2022-05-22

  The author disclaims copyright to this source code.  In place of a
  legal notice, here is a blessing:

  *   May you do good and not evil.
  *   May you find forgiveness for yourself and forgive others.
  *   May you share freely, never taking more than you give.

  ***********************************************************************

  This file is intended to be combined at build-time with other
  related code, most notably a header and footer which wraps this whole
  file into an Emscripten Module.postRun() handler which has a parameter
  named "Module" (the Emscripten Module object). The exact requirements,
  conventions, and build process are very much under construction and
  will be (re)documented once they've stopped fluctuating so much.

  Specific goals of this project:

  - Except where noted in the non-goals, provide a more-or-less
    feature-complete wrapper to the sqlite3 C API, insofar as WASM
    feature parity with C allows for. In fact, provide at least 3
    APIs...

    1) Bind a low-level sqlite3 API which is as close to the native
       one as feasible in terms of usage.

    2) A higher-level API, more akin to sql.js and node.js-style
       implementations. This one speaks directly to the low-level
       API. This API must be used from the same thread as the
       low-level API.

    3) A second higher-level API which speaks to the previous APIs via
       worker messages. This one is intended for use in the main
       thread, with the lower-level APIs installed in a Worker thread,
       and talking to them via Worker messages. Because Workers are
       asynchronouns and have only a single message channel, some
       acrobatics are needed here to feed async work results back to
       the client (as we cannot simply pass around callbacks between
       the main and Worker threads).

  - Insofar as possible, support client-side storage using JS
    filesystem APIs. As of this writing, such things are still very
    much under development.

  Specific non-goals of this project:

  - As WASM is a web-centric technology and UTF-8 is the King of
    Encodings in that realm, there are no currently plans to support
    the UTF16-related sqlite3 APIs. They would add a complication to
    the bindings for no appreciable benefit. Though web-related
    implementation details take priority, and the JavaScript
    components of the API specifically focus on browser clients, the
    lower-level WASM module "should" work in non-web WASM
    environments.

  - Supporting old or niche-market platforms. WASM is built for a
    modern web and requires modern platforms.

  - Though scalar User-Defined Functions (UDFs) may be created in
    JavaScript, there are currently no plans to add support for
    aggregate and window functions.

  Attribution:

  This project is endebted to the work of sql.js:

  https://github.com/sql-js/sql.js

  sql.js was an essential stepping stone in this code's development as
  it demonstrated how to handle some of the WASM-related voodoo (like
  handling pointers-to-pointers and adding JS implementations of
  C-bound callback functions). These APIs have a considerably
  different shape than sql.js's, however.
*/

/**
   sqlite3ApiBootstrap() is the only global symbol persistently
   exposed by this API. It is intended to be called one time at the
   end of the API amalgamation process, passed configuration details
   for the current environment, and then optionally be removed from
   the global object using `delete self.sqlite3ApiBootstrap`.

   This function expects a configuration object, intended to abstract
   away details specific to any given WASM environment, primarily so
   that it can be used without any _direct_ dependency on
   Emscripten. (Note the default values for the config object!) The
   config object is only honored the first time this is
   called. Subsequent calls ignore the argument and return the same
   (configured) object which gets initialized by the first call.

   The config object properties include:

   - `exports`[^1]: the "exports" object for the current WASM
     environment. In an Emscripten build, this should be set to
     `Module['asm']`.

   - `memory`[^1]: optional WebAssembly.Memory object, defaulting to
     `exports.memory`. In Emscripten environments this should be set
     to `Module.wasmMemory` if the build uses `-sIMPORT_MEMORY`, or be
     left undefined/falsy to default to `exports.memory` when using
     WASM-exported memory.

   - `bigIntEnabled`: true if BigInt support is enabled. Defaults to
     true if self.BigInt64Array is available, else false. Some APIs
     will throw exceptions if called without BigInt support, as BigInt
     is required for marshalling C-side int64 into and out of JS.

   - `allocExportName`: the name of the function, in `exports`, of the
     `malloc(3)`-compatible routine for the WASM environment. Defaults
     to `"malloc"`.

   - `deallocExportName`: the name of the function, in `exports`, of
     the `free(3)`-compatible routine for the WASM
     environment. Defaults to `"free"`.

   - `wasmfsOpfsDir`[^1]: if the environment supports persistent storage, this
     directory names the "mount point" for that directory. It must be prefixed
     by `/` and may currently contain only a single directory-name part. Using
     the root directory name is not supported by any current persistent backend.


   [^1] = This property may optionally be a function, in which case this
          function re-assigns it to the value returned from that function,
          enabling delayed evaluation.

*/
'use strict';
self.sqlite3ApiBootstrap = function sqlite3ApiBootstrap(
  apiConfig = (self.sqlite3ApiConfig || sqlite3ApiBootstrap.defaultConfig)
){
  if(sqlite3ApiBootstrap.sqlite3){ /* already initalized */
    console.warn("sqlite3ApiBootstrap() called multiple times.",
                 "Config and external initializers are ignored on calls after the first.");
    return sqlite3ApiBootstrap.sqlite3;
  }
  const config = Object.assign(Object.create(null),{
    exports: undefined,
    memory: undefined,
    bigIntEnabled: (()=>{
      if('undefined'!==typeof Module){
        /* Emscripten module will contain HEAPU64 when built with
           -sWASM_BIGINT=1, else it will not. */
        return !!Module.HEAPU64;
      }
      return !!self.BigInt64Array;
    })(),
    allocExportName: 'malloc',
    deallocExportName: 'free',
    wasmfsOpfsDir: '/opfs'
  }, apiConfig || {});

  [
    // If any of these config options are functions, replace them with
    // the result of calling that function...
    'exports', 'memory', 'wasmfsOpfsDir'
  ].forEach((k)=>{
    if('function' === typeof config[k]){
      config[k] = config[k]();
    }
  });

  /** 
      The main sqlite3 binding API gets installed into this object,
      mimicking the C API as closely as we can. The numerous members
      names with prefixes 'sqlite3_' and 'SQLITE_' behave, insofar as
      possible, identically to the C-native counterparts, as documented at:

      https://www.sqlite.org/c3ref/intro.html

      A very few exceptions require an additional level of proxy
      function or may otherwise require special attention in the WASM
      environment, and all such cases are documented somewhere below
      in this file or in sqlite3-api-glue.js. capi members which are
      not documented are installed as 1-to-1 proxies for their
      C-side counterparts.
  */
  const capi = Object.create(null);
  /**
     Holds state which are specific to the WASM-related
     infrastructure and glue code. It is not expected that client
     code will normally need these, but they're exposed here in case
     it does. These APIs are _not_ to be considered an
     official/stable part of the sqlite3 WASM API. They may change
     as the developers' experience suggests appropriate changes.

     Note that a number of members of this object are injected
     dynamically after the api object is fully constructed, so
     not all are documented in this file.
  */
  const wasm = Object.create(null);

  /** Internal helper for SQLite3Error ctor. */
  const __rcStr = (rc)=>{
    return (capi.sqlite3_js_rc_str && capi.sqlite3_js_rc_str(rc))
           || ("Unknown result code #"+rc);
  };

  /** Internal helper for SQLite3Error ctor. */
  const __isInt = (n)=>'number'===typeof n && n===(n | 0);

  /**
     An Error subclass specifically for reporting DB-level errors and
     enabling clients to unambiguously identify such exceptions.
     The C-level APIs never throw, but some of the higher-level
     C-style APIs do and the object-oriented APIs use exceptions
     exclusively to report errors.
  */
  class SQLite3Error extends Error {
    /**
       Constructs this object with a message depending on its arguments:

       - If it's passed only a single integer argument, it is assumed
       to be an sqlite3 C API result code. The message becomes the
       result of sqlite3.capi.sqlite3_js_rc_str() or (if that returns
       falsy) a synthesized string which contains that integer.

       - If passed 2 arguments and the 2nd is a object, it bevaves
       like the Error(string,object) constructor except that the first
       argument is subject to the is-integer semantics from the
       previous point.

       - Else all arguments are concatenated with a space between each
       one, using args.join(' '), to create the error message.
    */
    constructor(...args){
      if(1===args.length && __isInt(args[0])){
        super(__rcStr(args[0]));
      }else if(2===args.length && 'object'===typeof args){
        if(__isInt(args[0])) super(__rcStr(args[0]), args[1]);
        else super(...args);
      }else{
        super(args.join(' '));
      }
      this.name = 'SQLite3Error';
    }
  };

  /**
     Functionally equivalent to the SQLite3Error constructor but may
     be used as part of an expression, e.g.:

     ```
     return someFunction(x) || SQLite3Error.toss(...);
     ```
  */
  SQLite3Error.toss = (...args)=>{
    throw new SQLite3Error(...args);
  };
  const toss3 = SQLite3Error.toss;

  if(config.wasmfsOpfsDir && !/^\/[^/]+$/.test(config.wasmfsOpfsDir)){
    toss3("config.wasmfsOpfsDir must be falsy or in the form '/dir-name'.");
  }

  /**
     Returns true if n is a 32-bit (signed) integer, else
     false. This is used for determining when we need to switch to
     double-type DB operations for integer values in order to keep
     more precision.
  */
  const isInt32 = (n)=>{
    return ('bigint'!==typeof n /*TypeError: can't convert BigInt to number*/)
      && !!(n===(n|0) && n<=2147483647 && n>=-2147483648);
  };
  /**
     Returns true if the given BigInt value is small enough to fit
     into an int64 value, else false.
  */
  const bigIntFits64 = function f(b){
    if(!f._max){
      f._max = BigInt("0x7fffffffffffffff");
      f._min = ~f._max;
    }
    return b >= f._min && b <= f._max;
  };

  /**
     Returns true if the given BigInt value is small enough to fit
     into an int32, else false.
  */
  const bigIntFits32 = (b)=>(b >= (-0x7fffffffn - 1n) && b <= 0x7fffffffn);

  /**
     Returns true if the given BigInt value is small enough to fit
     into a double value without loss of precision, else false.
  */
  const bigIntFitsDouble = function f(b){
    if(!f._min){
      f._min = Number.MIN_SAFE_INTEGER;
      f._max = Number.MAX_SAFE_INTEGER;
    }
    return b >= f._min && b <= f._max;
  };

  /** Returns v if v appears to be a TypedArray, else false. */
  const isTypedArray = (v)=>{
    return (v && v.constructor && isInt32(v.constructor.BYTES_PER_ELEMENT)) ? v : false;
  };


  /** Internal helper to use in operations which need to distinguish
      between TypedArrays which are backed by a SharedArrayBuffer
      from those which are not. */
  const __SAB = ('undefined'===typeof SharedArrayBuffer)
        ? function(){} : SharedArrayBuffer;
  /** Returns true if the given TypedArray object is backed by a
      SharedArrayBuffer, else false. */
  const isSharedTypedArray = (aTypedArray)=>(aTypedArray.buffer instanceof __SAB);

  /**
     Returns either aTypedArray.slice(begin,end) (if
     aTypedArray.buffer is a SharedArrayBuffer) or
     aTypedArray.subarray(begin,end) (if it's not).

     This distinction is important for APIs which don't like to
     work on SABs, e.g. TextDecoder, and possibly for our
     own APIs which work on memory ranges which "might" be
     modified by other threads while they're working.
  */
  const typedArrayPart = (aTypedArray, begin, end)=>{
    return isSharedTypedArray(aTypedArray)
      ? aTypedArray.slice(begin, end)
      : aTypedArray.subarray(begin, end);
  };

  /**
     Returns true if v appears to be one of our bind()-able
     TypedArray types: Uint8Array or Int8Array. Support for
     TypedArrays with element sizes >1 is TODO.
  */
  const isBindableTypedArray = (v)=>{
    return v && v.constructor && (1===v.constructor.BYTES_PER_ELEMENT);
  };

  /**
     Returns true if v appears to be one of the TypedArray types
     which is legal for holding SQL code (as opposed to binary blobs).

     Currently this is the same as isBindableTypedArray() but it
     seems likely that we'll eventually want to add Uint32Array
     and friends to the isBindableTypedArray() list but not to the
     isSQLableTypedArray() list.
  */
  const isSQLableTypedArray = (v)=>{
    return v && v.constructor && (1===v.constructor.BYTES_PER_ELEMENT);
  };

  /** Returns true if isBindableTypedArray(v) does, else throws with a message
      that v is not a supported TypedArray value. */
  const affirmBindableTypedArray = (v)=>{
    return isBindableTypedArray(v)
      || toss3("Value is not of a supported TypedArray type.");
  };

  const utf8Decoder = new TextDecoder('utf-8');

  /**
     Uses TextDecoder to decode the given half-open range of the
     given TypedArray to a string. This differs from a simple
     call to TextDecoder in that it accounts for whether the
     first argument is backed by a SharedArrayBuffer or not,
     and can work more efficiently if it's not (TextDecoder
     refuses to act upon an SAB).
  */
  const typedArrayToString = function(typedArray, begin, end){
    return utf8Decoder.decode(typedArrayPart(typedArray, begin,end));
  };

  /**
     If v is-a Array, its join('') result is returned.  If
     isSQLableTypedArray(v) is true then typedArrayToString(v) is
     returned. If it looks like a WASM pointer, wasm.cstringToJs(v) is
     returned. Else v is returned as-is.
  */
  const flexibleString = function(v){
    if(isSQLableTypedArray(v)) return typedArrayToString(v);
    else if(Array.isArray(v)) return v.join('');
    else if(wasm.isPtr(v)) v = wasm.cstringToJs(v);
    return v;
  };

  /**
     An Error subclass specifically for reporting Wasm-level malloc()
     failure and enabling clients to unambiguously identify such
     exceptions.
  */
  class WasmAllocError extends Error {
    constructor(...args){
      super(...args);
      this.name = 'WasmAllocError';
    }
  };
  /**
     Functionally equivalent to the WasmAllocError constructor but may
     be used as part of an expression, e.g.:

     ```
     return someAllocatingFunction(x) || WasmAllocError.toss(...);
     ```
  */
  WasmAllocError.toss = (...args)=>{
    throw new WasmAllocError(...args);
  };

  Object.assign(capi, {
    /**
       sqlite3_create_function_v2() differs from its native
       counterpart only in the following ways:

       1) The fourth argument (`eTextRep`) argument must not specify
       any encoding other than sqlite3.SQLITE_UTF8. The JS API does not
       currently support any other encoding and likely never
       will. This function does not replace that argument on its own
       because it may contain other flags.

       2) Any of the four final arguments may be either WASM pointers
       (assumed to be function pointers) or JS Functions. In the
       latter case, each gets bound to WASM using
       sqlite3.capi.wasm.installFunction() and that wrapper is passed
       on to the native implementation.

       The semantics of JS functions are:

       xFunc: is passed `(pCtx, ...values)`. Its return value becomes
       the new SQL function's result.

       xStep: is passed `(pCtx, ...values)`. Its return value is
       ignored.

       xFinal: is passed `(pCtx)`. Its return value becomes the new
       aggregate SQL function's result.

       xDestroy: is passed `(void*)`. Its return value is ignored. The
       pointer passed to it is the one from the 5th argument to
       sqlite3_create_function_v2().

       Note that:

       - `pCtx` in the above descriptions is a `sqlite3_context*`. At
         least 99 times out of a hundred, that initial argument will
         be irrelevant for JS UDF bindings, but it needs to be there
         so that the cases where it _is_ relevant, in particular with
         window and aggregate functions, have full access to the
         lower-level sqlite3 APIs.

       - When wrapping JS functions, the remaining arguments are passd
         to them as positional arguments, not as an array of
         arguments, because that allows callback definitions to be
         more JS-idiomatic than C-like. For example `(pCtx,a,b)=>a+b`
         is more intuitive and legible than
         `(pCtx,args)=>args[0]+args[1]`. For cases where an array of
         arguments would be more convenient, the callbacks simply need
         to be declared like `(pCtx,...args)=>{...}`, in which case
         `args` will be an array.

       - If a JS wrapper throws, it gets translated to
         sqlite3_result_error() or sqlite3_result_error_nomem(),
         depending on whether the exception is an
         sqlite3.WasmAllocError object or not.

       - When passing on WASM function pointers, arguments are _not_
         converted or reformulated. They are passed on as-is in raw
         pointer form using their native C signatures. Only JS
         functions passed in to this routine, and thus wrapped by this
         routine, get automatic conversions of arguments and result
         values. The routines which perform those conversions are
         exposed for client-side use as
         sqlite3_create_function_v2.convertUdfArgs() and
         sqlite3_create_function_v2.setUdfResult(). sqlite3_create_function()
         and sqlite3_create_window_function() have those same methods.

       For xFunc(), xStep(), and xFinal():

       - When called from SQL, arguments to the UDF, and its result,
         will be converted between JS and SQL with as much fidelity as
         is feasible, triggering an exception if a type conversion
         cannot be determined. Some freedom is afforded to numeric
         conversions due to friction between the JS and C worlds:
         integers which are larger than 32 bits may be treated as
         doubles or BigInts.

       If any JS-side bound functions throw, those exceptions are
       intercepted and converted to database-side errors with the
       exception of xDestroy(): any exception from it is ignored,
       possibly generating a console.error() message.  Destructors
       must not throw.

       Once installed, there is currently no way to uninstall the
       automatically-converted WASM-bound JS functions from WASM. They
       can be uninstalled from the database as documented in the C
       API, but this wrapper currently has no infrastructure in place
       to also free the WASM-bound JS wrappers, effectively resulting
       in a memory leak if the client uninstalls the UDF. Improving that
       is a potential TODO, but removing client-installed UDFs is rare
       in practice. If this factor is relevant for a given client,
       they can create WASM-bound JS functions themselves, hold on to their
       pointers, and pass the pointers in to here. Later on, they can
       free those pointers (using `wasm.uninstallFunction()` or
       equivalent).

       C reference: https://www.sqlite.org/c3ref/create_function.html

       Maintenance reminder: the ability to add new
       WASM-accessible functions to the runtime requires that the
       WASM build is compiled with emcc's `-sALLOW_TABLE_GROWTH`
       flag.
    */
    sqlite3_create_function_v2: function(
      pDb, funcName, nArg, eTextRep, pApp,
      xFunc, xStep, xFinal, xDestroy
    ){/*installed later*/},
    /**
       Equivalent to passing the same arguments to
       sqlite3_create_function_v2(), with 0 as the final argument.
    */
    sqlite3_create_function:function(
      pDb, funcName, nArg, eTextRep, pApp,
      xFunc, xStep, xFinal
    ){/*installed later*/},
    /**
       The sqlite3_create_window_function() JS wrapper differs from
       its native implementation in the exact same way that
       sqlite3_create_function_v2() does. The additional function,
       xInverse(), is treated identically to xStep() by the wrapping
       layer.
    */
    sqlite3_create_window_function: function(
      pDb, funcName, nArg, eTextRep, pApp,
      xStep, xFinal, xValue, xInverse, xDestroy
    ){/*installed later*/},
    /**
       The sqlite3_prepare_v3() binding handles two different uses
       with differing JS/WASM semantics:

       1) sqlite3_prepare_v3(pDb, sqlString, -1, prepFlags, ppStmt , null)

       2) sqlite3_prepare_v3(pDb, sqlPointer, sqlByteLen, prepFlags, ppStmt, sqlPointerToPointer)

       Note that the SQL length argument (the 3rd argument) must, for
       usage (1), always be negative because it must be a byte length
       and that value is expensive to calculate from JS (where only
       the character length of strings is readily available). It is
       retained in this API's interface for code/documentation
       compatibility reasons but is currently _always_ ignored. With
       usage (2), the 3rd argument is used as-is but is is still
       critical that the C-style input string (2nd argument) be
       terminated with a 0 byte.

       In usage (1), the 2nd argument must be of type string,
       Uint8Array, or Int8Array (either of which is assumed to
       hold SQL). If it is, this function assumes case (1) and
       calls the underyling C function with the equivalent of:

       (pDb, sqlAsString, -1, prepFlags, ppStmt, null)

       The `pzTail` argument is ignored in this case because its
       result is meaningless when a string-type value is passed
       through: the string goes through another level of internal
       conversion for WASM's sake and the result pointer would refer
       to that transient conversion's memory, not the passed-in
       string.

       If the sql argument is not a string, it must be a _pointer_ to
       a NUL-terminated string which was allocated in the WASM memory
       (e.g. using capi.wasm.alloc() or equivalent). In that case,
       the final argument may be 0/null/undefined or must be a pointer
       to which the "tail" of the compiled SQL is written, as
       documented for the C-side sqlite3_prepare_v3(). In case (2),
       the underlying C function is called with the equivalent of:

       (pDb, sqlAsPointer, sqlByteLen, prepFlags, ppStmt, pzTail)

       It returns its result and compiled statement as documented in
       the C API. Fetching the output pointers (5th and 6th
       parameters) requires using `capi.wasm.getMemValue()` (or
       equivalent) and the `pzTail` will point to an address relative to
       the `sqlAsPointer` value.

       If passed an invalid 2nd argument type, this function will
       return SQLITE_MISUSE and sqlite3_errmsg() will contain a string
       describing the problem.

       Side-note: if given an empty string, or one which contains only
       comments or an empty SQL expression, 0 is returned but the result
       output pointer will be NULL.
    */
    sqlite3_prepare_v3: (dbPtr, sql, sqlByteLen, prepFlags,
                         stmtPtrPtr, strPtrPtr)=>{}/*installed later*/,

    /**
       Equivalent to calling sqlite3_prapare_v3() with 0 as its 4th argument.
    */
    sqlite3_prepare_v2: (dbPtr, sql, sqlByteLen,
                         stmtPtrPtr,strPtrPtr)=>{}/*installed later*/,

    /**
       This binding enables the callback argument to be a JavaScript.

       If the callback is a function, then for the duration of the
       sqlite3_exec() call, it installs a WASM-bound function which
       acts as a proxy for the given callback. That proxy will also
       perform a conversion of the callback's arguments from
       `(char**)` to JS arrays of strings. However, for API
       consistency's sake it will still honor the C-level callback
       parameter order and will call it like:

       `callback(pVoid, colCount, listOfValues, listOfColNames)`

       If the callback is not a JS function then this binding performs
       no translation of the callback, but the sql argument is still
       converted to a WASM string for the call using the
       "flexible-string" argument converter.
    */
    sqlite3_exec: (pDb, sql, callback, pVoid, pErrMsg)=>{}/*installed later*/,

    /**
       If passed a single argument which appears to be a byte-oriented
       TypedArray (Int8Array or Uint8Array), this function treats that
       TypedArray as an output target, fetches `theArray.byteLength`
       bytes of randomness, and populates the whole array with it. As
       a special case, if the array's length is 0, this function
       behaves as if it were passed (0,0). When called this way, it
       returns its argument, else it returns the `undefined` value.

       If called with any other arguments, they are passed on as-is
       to the C API. Results are undefined if passed any incompatible
       values.
     */
    sqlite3_randomness: (n, outPtr)=>{/*installed later*/},
  }/*capi*/);

  /**
     Various internal-use utilities are added here as needed. They
     are bound to an object only so that we have access to them in
     the differently-scoped steps of the API bootstrapping
     process. At the end of the API setup process, this object gets
     removed. These are NOT part of the public API.
  */
  const util = {
    affirmBindableTypedArray, flexibleString,
    bigIntFits32, bigIntFits64, bigIntFitsDouble,
    isBindableTypedArray,
    isInt32, isSQLableTypedArray, isTypedArray, 
    typedArrayToString,
    isUIThread: ()=>'undefined'===typeof WorkerGlobalScope,
    isSharedTypedArray,
    typedArrayPart
  };
    
  Object.assign(wasm, {
    /**
       Emscripten APIs have a deep-seated assumption that all pointers
       are 32 bits. We'll remain optimistic that that won't always be
       the case and will use this constant in places where we might
       otherwise use a hard-coded 4.
    */
    ptrSizeof: config.wasmPtrSizeof || 4,
    /**
       The WASM IR (Intermediate Representation) value for
       pointer-type values. It MUST refer to a value type of the
       size described by this.ptrSizeof _or_ it may be any value
       which ends in '*', which Emscripten's glue code internally
       translates to i32.
    */
    ptrIR: config.wasmPtrIR || "i32",
    /**
       True if BigInt support was enabled via (e.g.) the
       Emscripten -sWASM_BIGINT flag, else false. When
       enabled, certain 64-bit sqlite3 APIs are enabled which
       are not otherwise enabled due to JS/WASM int64
       impedence mismatches.
    */
    bigIntEnabled: !!config.bigIntEnabled,
    /**
       The symbols exported by the WASM environment.
    */
    exports: config.exports
      || toss3("Missing API config.exports (WASM module exports)."),

    /**
       When Emscripten compiles with `-sIMPORT_MEMORY`, it
       initalizes the heap and imports it into wasm, as opposed to
       the other way around. In this case, the memory is not
       available via this.exports.memory.
    */
    memory: config.memory || config.exports['memory']
      || toss3("API config object requires a WebAssembly.Memory object",
              "in either config.exports.memory (exported)",
              "or config.memory (imported)."),

    /**
       The API's one single point of access to the WASM-side memory
       allocator. Works like malloc(3) (and is likely bound to
       malloc()) but throws an WasmAllocError if allocation fails. It is
       important that any code which might pass through the sqlite3 C
       API NOT throw and must instead return SQLITE_NOMEM (or
       equivalent, depending on the context).

       That said, very few cases in the API can result in
       client-defined functions propagating exceptions via the C-style
       API. Most notably, this applies ot User-defined SQL Functions
       (UDFs) registered via sqlite3_create_function_v2(). For that
       specific case it is recommended that all UDF creation be
       funneled through a utility function and that a wrapper function
       be added around the UDF which catches any exception and sets
       the error state to OOM. (The overall complexity of registering
       UDFs essentially requires a helper for doing so!)
    */
    alloc: undefined/*installed later*/,
    /**
       The API's one single point of access to the WASM-side memory
       deallocator. Works like free(3) (and is likely bound to
       free()).
    */
    dealloc: undefined/*installed later*/

    /* Many more wasm-related APIs get installed later on. */
  }/*wasm*/);

  /**
     wasm.alloc()'s srcTypedArray.byteLength bytes,
     populates them with the values from the source
     TypedArray, and returns the pointer to that memory. The
     returned pointer must eventually be passed to
     wasm.dealloc() to clean it up.

     As a special case, to avoid further special cases where
     this is used, if srcTypedArray.byteLength is 0, it
     allocates a single byte and sets it to the value
     0. Even in such cases, calls must behave as if the
     allocated memory has exactly srcTypedArray.byteLength
     bytes.

     ACHTUNG: this currently only works for Uint8Array and
     Int8Array types and will throw if srcTypedArray is of
     any other type.
  */
  wasm.allocFromTypedArray = function(srcTypedArray){
    affirmBindableTypedArray(srcTypedArray);
    const pRet = wasm.alloc(srcTypedArray.byteLength || 1);
    wasm.heapForSize(srcTypedArray.constructor).set(srcTypedArray.byteLength ? srcTypedArray : [0], pRet);
    return pRet;
  };

  const keyAlloc = config.allocExportName || 'malloc',
        keyDealloc =  config.deallocExportName || 'free';
  for(const key of [keyAlloc, keyDealloc]){
    const f = wasm.exports[key];
    if(!(f instanceof Function)) toss3("Missing required exports[",key,"] function.");
  }

  wasm.alloc = function(n){
    const m = wasm.exports[keyAlloc](n);
    if(!m) throw new WasmAllocError("Failed to allocate "+n+" bytes.");
    return m;
  };

  wasm.dealloc = (m)=>wasm.exports[keyDealloc](m);

  /**
     Reports info about compile-time options using
     sqlite_compileoption_get() and sqlite3_compileoption_used(). It
     has several distinct uses:

     If optName is an array then it is expected to be a list of
     compilation options and this function returns an object
     which maps each such option to true or false, indicating
     whether or not the given option was included in this
     build. That object is returned.

     If optName is an object, its keys are expected to be compilation
     options and this function sets each entry to true or false,
     indicating whether the compilation option was used or not. That
     object is returned.

     If passed no arguments then it returns an object mapping
     all known compilation options to their compile-time values,
     or boolean true if they are defined with no value. This
     result, which is relatively expensive to compute, is cached
     and returned for future no-argument calls.

     In all other cases it returns true if the given option was
     active when when compiling the sqlite3 module, else false.

     Compile-time option names may optionally include their
     "SQLITE_" prefix. When it returns an object of all options,
     the prefix is elided.
  */
  wasm.compileOptionUsed = function f(optName){
    if(!arguments.length){
      if(f._result) return f._result;
      else if(!f._opt){
        f._rx = /^([^=]+)=(.+)/;
        f._rxInt = /^-?\d+$/;
        f._opt = function(opt, rv){
          const m = f._rx.exec(opt);
          rv[0] = (m ? m[1] : opt);
          rv[1] = m ? (f._rxInt.test(m[2]) ? +m[2] : m[2]) : true;
        };                    
      }
      const rc = {}, ov = [0,0];
      let i = 0, k;
      while((k = capi.sqlite3_compileoption_get(i++))){
        f._opt(k,ov);
        rc[ov[0]] = ov[1];
      }
      return f._result = rc;
    }else if(Array.isArray(optName)){
      const rc = {};
      optName.forEach((v)=>{
        rc[v] = capi.sqlite3_compileoption_used(v);
      });
      return rc;
    }else if('object' === typeof optName){
      Object.keys(optName).forEach((k)=> {
        optName[k] = capi.sqlite3_compileoption_used(k);
      });
      return optName;
    }
    return (
      'string'===typeof optName
    ) ? !!capi.sqlite3_compileoption_used(optName) : false;
  }/*compileOptionUsed()*/;

  /**
     Signatures for the WASM-exported C-side functions. Each entry
     is an array with 2+ elements:

     [ "c-side name",
       "result type" (wasm.xWrap() syntax),
       [arg types in xWrap() syntax]
       // ^^^ this needn't strictly be an array: it can be subsequent
       // elements instead: [x,y,z] is equivalent to x,y,z
     ]

     Note that support for the API-specific data types in the
     result/argument type strings gets plugged in at a later phase in
     the API initialization process.
  */
  wasm.bindingSignatures = [
    // Please keep these sorted by function name!
    ["sqlite3_aggregate_context","void*", "sqlite3_context*", "int"],
    ["sqlite3_bind_blob","int", "sqlite3_stmt*", "int", "*", "int", "*"
     /* TODO: we should arguably write a custom wrapper which knows
        how to handle Blob, TypedArrays, and JS strings. */
    ],
    ["sqlite3_bind_double","int", "sqlite3_stmt*", "int", "f64"],
    ["sqlite3_bind_int","int", "sqlite3_stmt*", "int", "int"],
    ["sqlite3_bind_null",undefined, "sqlite3_stmt*", "int"],
    ["sqlite3_bind_parameter_count", "int", "sqlite3_stmt*"],
    ["sqlite3_bind_parameter_index","int", "sqlite3_stmt*", "string"],
    ["sqlite3_bind_text","int", "sqlite3_stmt*", "int", "string", "int", "int"
     /* We should arguably create a hand-written binding of
        bind_text() which does more flexible text conversion, along
        the lines of sqlite3_prepare_v3(). The slightly problematic
        part is the final argument (text destructor). */
    ],
    ["sqlite3_close_v2", "int", "sqlite3*"],
    ["sqlite3_changes", "int", "sqlite3*"],
    ["sqlite3_clear_bindings","int", "sqlite3_stmt*"],
    ["sqlite3_column_blob","*", "sqlite3_stmt*", "int"],
    ["sqlite3_column_bytes","int", "sqlite3_stmt*", "int"],
    ["sqlite3_column_count", "int", "sqlite3_stmt*"],
    ["sqlite3_column_double","f64", "sqlite3_stmt*", "int"],
    ["sqlite3_column_int","int", "sqlite3_stmt*", "int"],
    ["sqlite3_column_name","string", "sqlite3_stmt*", "int"],
    ["sqlite3_column_text","string", "sqlite3_stmt*", "int"],
    ["sqlite3_column_type","int", "sqlite3_stmt*", "int"],
    ["sqlite3_compileoption_get", "string", "int"],
    ["sqlite3_compileoption_used", "int", "string"],
    /* sqlite3_create_function(), sqlite3_create_function_v2(), and
       sqlite3_create_window_function() use hand-written bindings to
       simplify handling of their function-type arguments. */
    ["sqlite3_data_count", "int", "sqlite3_stmt*"],
    ["sqlite3_db_filename", "string", "sqlite3*", "string"],
    ["sqlite3_db_handle", "sqlite3*", "sqlite3_stmt*"],
    ["sqlite3_db_name", "string", "sqlite3*", "int"],
    ["sqlite3_deserialize", "int", "sqlite3*", "string", "*", "i64", "i64", "int"]
    /* Careful! Short version: de/serialize() are problematic because they
       might use a different allocator than the user for managing the
       deserialized block. de/serialize() are ONLY safe to use with
       sqlite3_malloc(), sqlite3_free(), and its 64-bit variants. */,
    ["sqlite3_errmsg", "string", "sqlite3*"],
    ["sqlite3_error_offset", "int", "sqlite3*"],
    ["sqlite3_errstr", "string", "int"],
    /*["sqlite3_exec", "int", "sqlite3*", "string", "*", "*", "**"
      Handled seperately to perform translation of the callback
      into a WASM-usable one. ],*/
    ["sqlite3_expanded_sql", "string", "sqlite3_stmt*"],
    ["sqlite3_extended_errcode", "int", "sqlite3*"],
    ["sqlite3_extended_result_codes", "int", "sqlite3*", "int"],
    ["sqlite3_file_control", "int", "sqlite3*", "string", "int", "*"],
    ["sqlite3_finalize", "int", "sqlite3_stmt*"],
    ["sqlite3_free", undefined,"*"],
    ["sqlite3_initialize", undefined],
    /*["sqlite3_interrupt", undefined, "sqlite3*"
       ^^^ we cannot actually currently support this because JS is
        single-threaded and we don't have a portable way to access a DB
        from 2 SharedWorkers concurrently. ],*/
    ["sqlite3_libversion", "string"],
    ["sqlite3_libversion_number", "int"],
    ["sqlite3_malloc", "*","int"],
    ["sqlite3_open", "int", "string", "*"],
    ["sqlite3_open_v2", "int", "string", "*", "int", "string"],
    /* sqlite3_prepare_v2() and sqlite3_prepare_v3() are handled
       separately due to us requiring two different sets of semantics
       for those, depending on how their SQL argument is provided. */
    /* sqlite3_randomness() uses a hand-written wrapper to extend
       the range of supported argument types. */
    ["sqlite3_realloc", "*","*","int"],
    ["sqlite3_reset", "int", "sqlite3_stmt*"],
    ["sqlite3_result_blob",undefined, "*", "*", "int", "*"],
    ["sqlite3_result_double",undefined, "*", "f64"],
    ["sqlite3_result_error",undefined, "*", "string", "int"],
    ["sqlite3_result_error_code", undefined, "*", "int"],
    ["sqlite3_result_error_nomem", undefined, "*"],
    ["sqlite3_result_error_toobig", undefined, "*"],
    ["sqlite3_result_int",undefined, "*", "int"],
    ["sqlite3_result_null",undefined, "*"],
    ["sqlite3_result_text",undefined, "*", "string", "int", "*"],
    ["sqlite3_serialize","*", "sqlite3*", "string", "*", "int"],
    ["sqlite3_shutdown", undefined],
    ["sqlite3_sourceid", "string"],
    ["sqlite3_sql", "string", "sqlite3_stmt*"],
    ["sqlite3_step", "int", "sqlite3_stmt*"],
    ["sqlite3_strglob", "int", "string","string"],
    ["sqlite3_strlike", "int", "string","string","int"],
    ["sqlite3_trace_v2", "int", "sqlite3*", "int", "*", "*"],
    ["sqlite3_total_changes", "int", "sqlite3*"],
    ["sqlite3_uri_boolean", "int", "string", "string", "int"],
    ["sqlite3_uri_key", "string", "string", "int"],
    ["sqlite3_uri_parameter", "string", "string", "string"],
    ["sqlite3_user_data","void*", "sqlite3_context*"],
    ["sqlite3_value_blob", "*", "sqlite3_value*"],
    ["sqlite3_value_bytes","int", "sqlite3_value*"],
    ["sqlite3_value_double","f64", "sqlite3_value*"],
    ["sqlite3_value_int","int", "sqlite3_value*"],
    ["sqlite3_value_text", "string", "sqlite3_value*"],
    ["sqlite3_value_type", "int", "sqlite3_value*"],
    ["sqlite3_vfs_find", "*", "string"],
    ["sqlite3_vfs_register", "int", "sqlite3_vfs*", "int"],
    ["sqlite3_vfs_unregister", "int", "sqlite3_vfs*"]
  ]/*wasm.bindingSignatures*/;

  if(false && wasm.compileOptionUsed('SQLITE_ENABLE_NORMALIZE')){
    /* ^^^ "the problem" is that this is an option feature and the
       build-time function-export list does not currently take
       optional features into account. */
    wasm.bindingSignatures.push(["sqlite3_normalized_sql", "string", "sqlite3_stmt*"]);
  }
  
  /**
     Functions which require BigInt (int64) support are separated from
     the others because we need to conditionally bind them or apply
     dummy impls, depending on the capabilities of the environment.
  */
  wasm.bindingSignatures.int64 = [
    ["sqlite3_bind_int64","int", ["sqlite3_stmt*", "int", "i64"]],
    ["sqlite3_changes64","i64", ["sqlite3*"]],
    ["sqlite3_column_int64","i64", ["sqlite3_stmt*", "int"]],
    ["sqlite3_malloc64", "*","i64"],
    ["sqlite3_msize", "i64", "*"],
    ["sqlite3_realloc64", "*","*", "i64"],
    ["sqlite3_result_int64",undefined, "*", "i64"],
    ["sqlite3_total_changes64", "i64", ["sqlite3*"]],
    ["sqlite3_uri_int64", "i64", ["string", "string", "i64"]],
    ["sqlite3_value_int64","i64", "sqlite3_value*"],
  ];

  /**
     Functions which are intended solely for API-internal use by the
     WASM components, not client code. These get installed into
     sqlite3.wasm.
  */
  wasm.bindingSignatures.wasm = [
    ["sqlite3_wasm_db_reset", "int", "sqlite3*"],
    ["sqlite3_wasm_db_vfs", "sqlite3_vfs*", "sqlite3*","string"],
    ["sqlite3_wasm_vfs_create_file", "int",
     "sqlite3_vfs*","string","*", "int"],
    ["sqlite3_wasm_vfs_unlink", "int", "sqlite3_vfs*","string"]
  ];


  /**
     sqlite3.wasm.pstack (pseudo-stack) holds a special-case
     stack-style allocator intended only for use with _small_ data of
     not more than (in total) a few kb in size, managed as if it were
     stack-based.

     It has only a single intended usage:

     ```
     const stackPos = pstack.pointer;
     try{
       const ptr = pstack.alloc(8);
       // ==> pstack.pointer === ptr
       const otherPtr = pstack.alloc(8);
       // ==> pstack.pointer === otherPtr
       ...
     }finally{
       pstack.restore(stackPos);
       // ==> pstack.pointer === stackPos
     }
     ```

     This allocator is much faster than a general-purpose one but is
     limited to usage patterns like the one shown above.

     It operates from a static range of memory which lives outside of
     space managed by Emscripten's stack-management, so does not
     collide with Emscripten-provided stack allocation APIs. The
     memory lives in the WASM heap and can be used with routines such
     as wasm.setMemValue() and any wasm.heap8u().slice().
  */
  wasm.pstack = Object.assign(Object.create(null),{
    /**
       Sets the current pstack position to the given pointer. Results
       are undefined if the passed-in value did not come from
       this.pointer.
    */
    restore: wasm.exports.sqlite3_wasm_pstack_restore,
    /**
       Attempts to allocate the given number of bytes from the
       pstack. On success, it zeroes out a block of memory of the
       given size, adjusts the pstack pointer, and returns a pointer
       to the memory. On error, returns throws a WasmAllocError. The
       memory must eventually be released using restore().

       This method always adjusts the given value to be a multiple
       of 8 bytes because failing to do so can lead to incorrect
       results when reading and writing 64-bit values from/to the WASM
       heap. Similarly, the returned address is always 8-byte aligned.
    */
    alloc: (n)=>{
      return wasm.exports.sqlite3_wasm_pstack_alloc(n)
        || WasmAllocError.toss("Could not allocate",n,
                               "bytes from the pstack.");
    },
    /**
       alloc()'s n chunks, each sz bytes, as a single memory block and
       returns the addresses as an array of n element, each holding
       the address of one chunk.

       Throws a WasmAllocError if allocation fails.

       Example:

       ```
       const [p1, p2, p3] = wasm.pstack.allocChunks(3,4);
       ```
    */
    allocChunks: (n,sz)=>{
      const mem = wasm.pstack.alloc(n * sz);
      const rc = [];
      let i = 0, offset = 0;
      for(; i < n; offset = (sz * ++i)){
        rc.push(mem + offset);
      }
      return rc;
    },
    /**
       A convenience wrapper for allocChunks() which sizes each chunk
       as either 8 bytes (safePtrSize is truthy) or wasm.ptrSizeof (if
       safePtrSize is falsy).

       How it returns its result differs depending on its first
       argument: if it's 1, it returns a single pointer value. If it's
       more than 1, it returns the same as allocChunks().

       When a returned pointers will refer to a 64-bit value, e.g. a
       double or int64, and that value must be written or fetched,
       e.g. using wasm.setMemValue() or wasm.getMemValue(), it is
       important that the pointer in question be aligned to an 8-byte
       boundary or else it will not be fetched or written properly and
       will corrupt or read neighboring memory.

       However, when all pointers involved point to "small" data, it
       is safe to pass a falsy value to save a tiny bit of memory.
    */
    allocPtr: (n=1,safePtrSize=true)=>{
      return 1===n
        ? wasm.pstack.alloc(safePtrSize ? 8 : wasm.ptrSizeof)
        : wasm.pstack.allocChunks(n, safePtrSize ? 8 : wasm.ptrSizeof);
    }
  })/*wasm.pstack*/;
  Object.defineProperties(wasm.pstack, {
    /**
       sqlite3.wasm.pstack.pointer resolves to the current pstack
       position pointer. This value is intended _only_ to be saved
       for passing to restore(). Writing to this memory, without
       first reserving it via wasm.pstack.alloc() and friends, leads
       to undefined results.
    */
    pointer: {
      configurable: false, iterable: true, writeable: false,
      get: wasm.exports.sqlite3_wasm_pstack_ptr
      //Whether or not a setter as an alternative to restore() is
      //clearer or would just lead to confusion is unclear.
      //set: wasm.exports.sqlite3_wasm_pstack_restore
    },
    /**
       sqlite3.wasm.pstack.quota to the total number of bytes
       available in the pstack, including any space which is currently
       allocated. This value is a compile-time constant.
    */
    quota: {
      configurable: false, iterable: true, writeable: false,
      get: wasm.exports.sqlite3_wasm_pstack_quota
    },
    /**
       sqlite3.wasm.pstack.remaining resolves to the amount of space
       remaining in the pstack.
    */
    remaining: {
      configurable: false, iterable: true, writeable: false,
      get: wasm.exports.sqlite3_wasm_pstack_remaining
    }
  })/*wasm.pstack properties*/;

  capi.sqlite3_randomness = (...args)=>{
    if(1===args.length && util.isTypedArray(args[0])
      && 1===args[0].BYTES_PER_ELEMENT){
      const ta = args[0];
      if(0===ta.byteLength){
        wasm.exports.sqlite3_randomness(0,0);
        return ta;
      }
      const stack = wasm.pstack.pointer;
      try {
        let n = ta.byteLength, offset = 0;
        const r = wasm.exports.sqlite3_randomness;
        const heap = wasm.heap8u();
        const nAlloc = n < 512 ? n : 512;
        const ptr = wasm.pstack.alloc(nAlloc);
        do{
          const j = (n>nAlloc ? nAlloc : n);
          r(j, ptr);
          ta.set(typedArrayPart(heap, ptr, ptr+j), offset);
          n -= j;
          offset += j;
        } while(n > 0);
      }catch(e){
        console.error("Highly unexpected (and ignored!) "+
                      "exception in sqlite3_randomness():",e);
      }finally{
        wasm.pstack.restore(stack);
      }
      return ta;
    }
    wasm.exports.sqlite3_randomness(...args);
  };

  /** State for sqlite3_wasmfs_opfs_dir(). */
  let __wasmfsOpfsDir = undefined;
  /**
     If the wasm environment has a WASMFS/OPFS-backed persistent
     storage directory, its path is returned by this function. If it
     does not then it returns "" (noting that "" is a falsy value).

     The first time this is called, this function inspects the current
     environment to determine whether persistence support is available
     and, if it is, enables it (if needed).

     This function currently only recognizes the WASMFS/OPFS storage
     combination and its path refers to storage rooted in the
     Emscripten-managed virtual filesystem.
  */
  capi.sqlite3_wasmfs_opfs_dir = function(){
    if(undefined !== __wasmfsOpfsDir) return __wasmfsOpfsDir;
    // If we have no OPFS, there is no persistent dir
    const pdir = config.wasmfsOpfsDir;
    if(!pdir
       || !self.FileSystemHandle
       || !self.FileSystemDirectoryHandle
       || !self.FileSystemFileHandle){
      return __wasmfsOpfsDir = "";
    }
    try{
      if(pdir && 0===wasm.xCallWrapped(
        'sqlite3_wasm_init_wasmfs', 'i32', ['string'], pdir
      )){
        return __wasmfsOpfsDir = pdir;
      }else{
        return __wasmfsOpfsDir = "";
      }
    }catch(e){
      // sqlite3_wasm_init_wasmfs() is not available
      return __wasmfsOpfsDir = "";
    }
  };

  /**
     Experimental and subject to change or removal.

     Returns true if sqlite3.capi.sqlite3_wasmfs_opfs_dir() is a
     non-empty string and the given name starts with (that string +
     '/'), else returns false.
  */
  capi.sqlite3_wasmfs_filename_is_persistent = function(name){
    const p = capi.sqlite3_wasmfs_opfs_dir();
    return (p && name) ? name.startsWith(p+'/') : false;
  };

  // This bit is highly arguable and is incompatible with the fiddle shell.
  if(false && 0===wasm.exports.sqlite3_vfs_find(0)){
    /* Assume that sqlite3_initialize() has not yet been called.
       This will be the case in an SQLITE_OS_KV build. */
    wasm.exports.sqlite3_initialize();
  }

  /**
     Given an `sqlite3*`, an sqlite3_vfs name, and an optional db name
     (defaulting to "main"), returns a truthy value (see below) if
     that db uses that VFS, else returns false. If pDb is falsy then
     the 3rd argument is ignored and this function returns a truthy
     value if the default VFS name matches that of the 2nd
     argument. Results are undefined if pDb is truthy but refers to an
     invalid pointer. The 3rd argument specifies the database name of
     the given database connection to check, defaulting to the main
     db.

     The 2nd and 3rd arguments may either be a JS string or a WASM
     C-string. If the 2nd argument is a NULL WASM pointer, the default
     VFS is assumed. If the 3rd is a NULL WASM pointer, "main" is
     assumed.

     The truthy value it returns is a pointer to the `sqlite3_vfs`
     object.

     To permit safe use of this function from APIs which may be called
     via the C stack (like SQL UDFs), this function does not throw: if
     bad arguments cause a conversion error when passing into
     wasm-space, false is returned.
  */
  capi.sqlite3_js_db_uses_vfs = function(pDb,vfsName,dbName=0){
    try{
      const pK = capi.sqlite3_vfs_find(vfsName);
      if(!pK) return false;
      else if(!pDb){
        return pK===capi.sqlite3_vfs_find(0) ? pK : false;
      }else{
        return pK===capi.sqlite3_js_db_vfs(pDb,dbName) ? pK : false;
      }
    }catch(e){
      /* Ignore - probably bad args to a wasm-bound function. */
      return false;
    }
  };

  /**
     Returns an array of the names of all currently-registered sqlite3
     VFSes.
  */
  capi.sqlite3_js_vfs_list = function(){
    const rc = [];
    let pVfs = capi.sqlite3_vfs_find(0);
    while(pVfs){
      const oVfs = new capi.sqlite3_vfs(pVfs);
      rc.push(wasm.cstringToJs(oVfs.$zName));
      pVfs = oVfs.$pNext;
      oVfs.dispose();
    }
    return rc;
  };

  /**
     Serializes the given `sqlite3*` pointer to a Uint8Array, as per
     sqlite3_serialize(). On success it returns a Uint8Array. On
     error it throws with a description of the problem.
  */
  capi.sqlite3_js_db_export = function(pDb){
    if(!pDb) toss3('Invalid sqlite3* argument.');
    if(!wasm.bigIntEnabled) toss3('BigInt64 support is not enabled.');
    const stack = wasm.pstack.pointer;
    let pOut;
    try{
      const pSize = wasm.pstack.alloc(8/*i64*/ + wasm.ptrSizeof);
      const ppOut = pSize + 8;
      /**
         Maintenance reminder, since this cost a full hour of grief
         and confusion: if the order of pSize/ppOut are reversed in
         that memory block, fetching the value of pSize after the
         export reads a garbage size because it's not on an 8-byte
         memory boundary!
      */
      let rc = wasm.exports.sqlite3_wasm_db_serialize(
        pDb, ppOut, pSize, 0
      );
      if(rc){
        toss3("Database serialization failed with code",
             sqlite3.capi.sqlite3_js_rc_str(rc));
      }
      pOut = wasm.getPtrValue(ppOut);
      const nOut = wasm.getMemValue(pSize, 'i64');
      rc = nOut
        ? wasm.heap8u().slice(pOut, pOut + Number(nOut))
        : new Uint8Array();
      return rc;
    }finally{
      if(pOut) wasm.exports.sqlite3_free(pOut);
      wasm.pstack.restore(stack);
    }
  };

  /**
     Given a `sqlite3*` and a database name (JS string or WASM
     C-string pointer, which may be 0), returns a pointer to the
     sqlite3_vfs responsible for it. If the given db name is null/0,
     or not provided, then "main" is assumed.
  */
  capi.sqlite3_js_db_vfs =
    (dbPointer, dbName=0)=>wasm.sqlite3_wasm_db_vfs(dbPointer, dbName);

  /**
     A thin wrapper around capi.sqlite3_aggregate_context() which
     behaves the same except that it throws a WasmAllocError if that
     function returns 0. As a special case, if n is falsy it does
     _not_ throw if that function returns 0. That special case is
     intended for use with xFinal() implementations.
  */
  capi.sqlite3_js_aggregate_context = (pCtx, n)=>{
    return capi.sqlite3_aggregate_context(pCtx, n)
      || (n ? WasmAllocError.toss("Cannot allocate",n,
                                  "bytes for sqlite3_aggregate_context()")
          : 0);
  };
  
  if( util.isUIThread() ){
    /* Features specific to the main window thread... */

    /**
       Internal helper for sqlite3_js_kvvfs_clear() and friends.
       Its argument should be one of ('local','session','').
    */
    const __kvvfsInfo = function(which){
      const rc = Object.create(null);
      rc.prefix = 'kvvfs-'+which;
      rc.stores = [];
      if('session'===which || ''===which) rc.stores.push(self.sessionStorage);
      if('local'===which || ''===which) rc.stores.push(self.localStorage);
      return rc;
    };

    /**
       Clears all storage used by the kvvfs DB backend, deleting any
       DB(s) stored there. Its argument must be either 'session',
       'local', or ''. In the first two cases, only sessionStorage
       resp. localStorage is cleared. If it's an empty string (the
       default) then both are cleared. Only storage keys which match
       the pattern used by kvvfs are cleared: any other client-side
       data are retained.

       This function is only available in the main window thread.

       Returns the number of entries cleared.
    */
    capi.sqlite3_js_kvvfs_clear = function(which=''){
      let rc = 0;
      const kvinfo = __kvvfsInfo(which);
      kvinfo.stores.forEach((s)=>{
        const toRm = [] /* keys to remove */;
        let i;
        for( i = 0; i < s.length; ++i ){
          const k = s.key(i);
          if(k.startsWith(kvinfo.prefix)) toRm.push(k);
        }
        toRm.forEach((kk)=>s.removeItem(kk));
        rc += toRm.length;
      });
      return rc;
    };

    /**
       This routine guesses the approximate amount of
       window.localStorage and/or window.sessionStorage in use by the
       kvvfs database backend. Its argument must be one of
       ('session', 'local', ''). In the first two cases, only
       sessionStorage resp. localStorage is counted. If it's an empty
       string (the default) then both are counted. Only storage keys
       which match the pattern used by kvvfs are counted. The returned
       value is the "length" value of every matching key and value,
       noting that JavaScript stores each character in 2 bytes.

       Note that the returned size is not authoritative from the
       perspective of how much data can fit into localStorage and
       sessionStorage, as the precise algorithms for determining
       those limits are unspecified and may include per-entry
       overhead invisible to clients.
    */
    capi.sqlite3_js_kvvfs_size = function(which=''){
      let sz = 0;
      const kvinfo = __kvvfsInfo(which);
      kvinfo.stores.forEach((s)=>{
        let i;
        for(i = 0; i < s.length; ++i){
          const k = s.key(i);
          if(k.startsWith(kvinfo.prefix)){
            sz += k.length;
            sz += s.getItem(k).length;
          }
        }
      });
      return sz * 2 /* because JS uses 2-byte char encoding */;
    };

  }/* main-window-only bits */


  /* The remainder of the API will be set up in later steps. */
  const sqlite3 = {
    WasmAllocError: WasmAllocError,
    SQLite3Error: SQLite3Error,
    capi,
    util,
    wasm,
    config,
    /**
       Holds the version info of the sqlite3 source tree from which
       the generated sqlite3-api.js gets built. Note that its version
       may well differ from that reported by sqlite3_libversion(), but
       that should be considered a source file mismatch, as the JS and
       WASM files are intended to be built and distributed together.

       This object is initially a placeholder which gets replaced by a
       build-generated object.
    */
    version: Object.create(null),
    /**
       Performs any optional asynchronous library-level initialization
       which might be required. This function returns a Promise which
       resolves to the sqlite3 namespace object. Any error in the
       async init will be fatal to the init as a whole, but init
       routines are themselves welcome to install dummy catch()
       handlers which are not fatal if their failure should be
       considered non-fatal. If called more than once, the second and
       subsequent calls are no-ops which return a pre-resolved
       Promise.

       Ideally this function is called as part of the Promise chain
       which handles the loading and bootstrapping of the API.  If not
       then it must be called by client-level code, which must not use
       the library until the returned promise resolves.

       Bug: if called while a prior call is still resolving, the 2nd
       call will resolve prematurely, before the 1st call has finished
       resolving. The current build setup precludes that possibility,
       so it's only a hypothetical problem if/when this function
       ever needs to be invoked by clients.

       In Emscripten-based builds, this function is called
       automatically and deleted from this object.
    */
    asyncPostInit: async function(){
      let lip = sqlite3ApiBootstrap.initializersAsync;
      delete sqlite3ApiBootstrap.initializersAsync;
      if(!lip || !lip.length) return Promise.resolve(sqlite3);
      // Is it okay to resolve these in parallel or do we need them
      // to resolve in order? We currently only have 1, so it
      // makes no difference.
      lip = lip.map((f)=>{
        const p = (f instanceof Promise) ? f : f(sqlite3);
        return p.catch((e)=>{
          console.error("an async sqlite3 initializer failed:",e);
          throw e;
        });
      });
      //let p = lip.shift();
      //while(lip.length) p = p.then(lip.shift());
      //return p.then(()=>sqlite3);
      return Promise.all(lip).then(()=>sqlite3);
    },
    /**
       scriptInfo ideally gets injected into this object by the
       infrastructure which assembles the JS/WASM module. It contains
       state which must be collected before sqlite3ApiBootstrap() can
       be declared. It is not necessarily available to any
       sqlite3ApiBootstrap.initializers but "should" be in place (if
       it's added at all) by the time that
       sqlite3ApiBootstrap.initializersAsync is processed.

       This state is not part of the public API, only intended for use
       with the sqlite3 API bootstrapping and wasm-loading process.
    */
    scriptInfo: undefined
  };
  try{
    sqlite3ApiBootstrap.initializers.forEach((f)=>{
      f(sqlite3);
    });
  }catch(e){
    /* If we don't report this here, it can get completely swallowed
       up and disappear into the abyss of Promises and Workers. */
    console.error("sqlite3 bootstrap initializer threw:",e);
    throw e;
  }
  delete sqlite3ApiBootstrap.initializers;
  sqlite3ApiBootstrap.sqlite3 = sqlite3;
  return sqlite3;
}/*sqlite3ApiBootstrap()*/;
/**
  self.sqlite3ApiBootstrap.initializers is an internal detail used by
  the various pieces of the sqlite3 API's amalgamation process. It
  must not be modified by client code except when plugging such code
  into the amalgamation process.

  Each component of the amalgamation is expected to append a function
  to this array. When sqlite3ApiBootstrap() is called for the first
  time, each such function will be called (in their appended order)
  and passed the sqlite3 namespace object, into which they can install
  their features (noting that most will also require that certain
  features alread have been installed).  At the end of that process,
  this array is deleted.

  Note that the order of insertion into this array is significant for
  some pieces. e.g. sqlite3.capi and sqlite3.wasm cannot be fully
  utilized until the whwasmutil.js part is plugged in via
  sqlite3-api-glue.js.
*/
self.sqlite3ApiBootstrap.initializers = [];
/**
  self.sqlite3ApiBootstrap.initializersAsync is an internal detail
  used by the sqlite3 API's amalgamation process. It must not be
  modified by client code except when plugging such code into the
  amalgamation process.

  The counterpart of self.sqlite3ApiBootstrap.initializers,
  specifically for initializers which are asynchronous. All entries in
  this list must be either async functions, non-async functions which
  return a Promise, or a Promise. Each function in the list is called
  with the sqlite3 ojbect as its only argument.

  The resolved value of any Promise is ignored and rejection will kill
  the asyncPostInit() process (at an indeterminate point because all
  of them are run asynchronously in parallel).

  This list is not processed until the client calls
  sqlite3.asyncPostInit(). This means, for example, that intializers
  added to self.sqlite3ApiBootstrap.initializers may push entries to
  this list.
*/
self.sqlite3ApiBootstrap.initializersAsync = [];
/**
   Client code may assign sqlite3ApiBootstrap.defaultConfig an
   object-type value before calling sqlite3ApiBootstrap() (without
   arguments) in order to tell that call to use this object as its
   default config value. The intention of this is to provide
   downstream clients with a reasonably flexible approach for plugging in
   an environment-suitable configuration without having to define a new
   global-scope symbol.
*/
self.sqlite3ApiBootstrap.defaultConfig = Object.create(null);
/**
   Placeholder: gets installed by the first call to
   self.sqlite3ApiBootstrap(). However, it is recommended that the
   caller of sqlite3ApiBootstrap() capture its return value and delete
   self.sqlite3ApiBootstrap after calling it. It returns the same
   value which will be stored here.
*/
self.sqlite3ApiBootstrap.sqlite3 = undefined;

/* END FILE: api/sqlite3-api-prologue.js */
/* BEGIN FILE: common/whwasmutil.js */
/**
  2022-07-08

  The author disclaims copyright to this source code.  In place of a
  legal notice, here is a blessing:

  *   May you do good and not evil.
  *   May you find forgiveness for yourself and forgive others.
  *   May you share freely, never taking more than you give.

  ***********************************************************************

  The whwasmutil is developed in conjunction with the Jaccwabyt
  project:

  https://fossil.wanderinghorse.net/r/jaccwabyt

  and sqlite3:

  https://sqlite.org

  This file is kept in sync between both of those trees.

  Maintenance reminder: If you're reading this in a tree other than
  one of those listed above, note that this copy may be replaced with
  upstream copies of that one from time to time. Thus the code
  installed by this function "should not" be edited outside of those
  projects, else it risks getting overwritten.
*/
/**
   This function is intended to simplify porting around various bits
   of WASM-related utility code from project to project.

   The primary goal of this code is to replace, where possible,
   Emscripten-generated glue code with equivalent utility code which
   can be used in arbitrary WASM environments built with toolchains
   other than Emscripten. As of this writing, this code is capable of
   acting as a replacement for Emscripten's generated glue code
   _except_ that the latter installs handlers for Emscripten-provided
   APIs such as its "FS" (virtual filesystem) API. Loading of such
   things still requires using Emscripten's glue, but the post-load
   utility APIs provided by this code are still usable as replacements
   for their sub-optimally-documented Emscripten counterparts.

   Intended usage:

   ```
   self.WhWasmUtilInstaller(appObject);
   delete self.WhWasmUtilInstaller;
   ```

   Its global-scope symbol is intended only to provide an easy way to
   make it available to 3rd-party scripts and "should" be deleted
   after calling it. That symbols is _not_ used within the library.

   Forewarning: this API explicitly targets only browser
   environments. If a given non-browser environment has the
   capabilities needed for a given feature (e.g. TextEncoder), great,
   but it does not go out of its way to account for them and does not
   provide compatibility crutches for them.

   It currently offers alternatives to the following
   Emscripten-generated APIs:

   - OPTIONALLY memory allocation, but how this gets imported is
     environment-specific.  Most of the following features only work
     if allocation is available.

   - WASM-exported "indirect function table" access and
     manipulation. e.g.  creating new WASM-side functions using JS
     functions, analog to Emscripten's addFunction() and
     uninstallFunction() but slightly different.

   - Get/set specific heap memory values, analog to Emscripten's
     getValue() and setValue().

   - String length counting in UTF-8 bytes (C-style and JS strings).

   - JS string to C-string conversion and vice versa, analog to
     Emscripten's stringToUTF8Array() and friends, but with slighter
     different interfaces.

   - JS string to Uint8Array conversion, noting that browsers actually
     already have this built in via TextEncoder.

   - "Scoped" allocation, such that allocations made inside of a given
     explicit scope will be automatically cleaned up when the scope is
     closed. This is fundamentally similar to Emscripten's
     stackAlloc() and friends but uses the heap instead of the stack
     because access to the stack requires C code.

   - Create JS wrappers for WASM functions, analog to Emscripten's
     ccall() and cwrap() functions, except that the automatic
     conversions for function arguments and return values can be
     easily customized by the client by assigning custom function
     signature type names to conversion functions. Essentially,
     it's ccall() and cwrap() on steroids.

   How to install...

   Passing an object to this function will install the functionality
   into that object. Afterwards, client code "should" delete the global
   symbol.

   This code requires that the target object have the following
   properties, noting that they needn't be available until the first
   time one of the installed APIs is used (as opposed to when this
   function is called) except where explicitly noted:

   - `exports` must be a property of the target object OR a property
     of `target.instance` (a WebAssembly.Module instance) and it must
     contain the symbols exported by the WASM module associated with
     this code. In an Enscripten environment it must be set to
     `Module['asm']`. The exports object must contain a minimum of the
     following symbols:

     - `memory`: a WebAssembly.Memory object representing the WASM
       memory. _Alternately_, the `memory` property can be set as
       `target.memory`, in particular if the WASM heap memory is
       initialized in JS an _imported_ into WASM, as opposed to being
       initialized in WASM and exported to JS.

     - `__indirect_function_table`: the WebAssembly.Table object which
       holds WASM-exported functions. This API does not strictly
       require that the table be able to grow but it will throw if its
       `installFunction()` is called and the table cannot grow.

   In order to simplify downstream usage, if `target.exports` is not
   set when this is called then a property access interceptor
   (read-only, configurable, enumerable) gets installed as `exports`
   which resolves to `target.instance.exports`, noting that the latter
   property need not exist until the first time `target.exports` is
   accessed.

   Some APIs _optionally_ make use of the `bigIntEnabled` property of
   the target object. It "should" be set to true if the WASM
   environment is compiled with BigInt support, else it must be
   false. If it is false, certain BigInt-related features will trigger
   an exception if invoked. This property, if not set when this is
   called, will get a default value of true only if the BigInt64Array
   constructor is available, else it will default to false. Note that
   having the BigInt type is not sufficient for full int64 integration
   with WASM: the target WASM file must also have been built with
   that support. In Emscripten that's done using the `-sWASM_BIGINT`
   flag.

   Some optional APIs require that the target have the following
   methods:

   - 'alloc()` must behave like C's `malloc()`, allocating N bytes of
     memory and returning its pointer. In Emscripten this is
     conventionally made available via `Module['_malloc']`. This API
     requires that the alloc routine throw on allocation error, as
     opposed to returning null or 0.

   - 'dealloc()` must behave like C's `free()`, accepting either a
     pointer returned from its allocation counterpart or the values
     null/0 (for which it must be a no-op). allocating N bytes of
     memory and returning its pointer. In Emscripten this is
     conventionally made available via `Module['_free']`.

   APIs which require allocation routines are explicitly documented as
   such and/or have "alloc" in their names.

   This code is developed and maintained in conjunction with the
   Jaccwabyt project:

   https://fossil.wanderinghorse.net/r/jaccwabbyt

   More specifically:

   https://fossil.wanderinghorse.net/r/jaccwabbyt/file/common/whwasmutil.js
*/
self.WhWasmUtilInstaller = function(target){
  'use strict';
  if(undefined===target.bigIntEnabled){
    target.bigIntEnabled = !!self['BigInt64Array'];
  }

  /** Throws a new Error, the message of which is the concatenation of
      all args with a space between each. */
  const toss = (...args)=>{throw new Error(args.join(' '))};

  if(!target.exports){
    Object.defineProperty(target, 'exports', {
      enumerable: true, configurable: true,
      get: ()=>(target.instance && target.instance.exports)
    });
  }

  /*********
    alloc()/dealloc() auto-install...

    This would be convenient but it can also cause us to pick up
    malloc() even when the client code is using a different exported
    allocator (who, me?), which is bad. malloc() may be exported even
    if we're not explicitly using it and overriding the malloc()
    function, linking ours first, is not always feasible when using a
    malloc() proxy, as it can lead to recursion and stack overflow
    (who, me?). So... we really need the downstream code to set up
    target.alloc/dealloc() itself.
  ******/
  /******
  if(target.exports){
    //Maybe auto-install alloc()/dealloc()...
    if(!target.alloc && target.exports.malloc){
      target.alloc = function(n){
        const m = this(n);
        return m || toss("Allocation of",n,"byte(s) failed.");
      }.bind(target.exports.malloc);
    }

    if(!target.dealloc && target.exports.free){
      target.dealloc = function(ptr){
        if(ptr) this(ptr);
      }.bind(target.exports.free);
    }
  }*******/

  /**
     Pointers in WASM are currently assumed to be 32-bit, but someday
     that will certainly change.
  */
  const ptrIR = target.pointerIR || 'i32';
  const ptrSizeof = target.ptrSizeof =
        ('i32'===ptrIR ? 4
         : ('i64'===ptrIR
            ? 8 : toss("Unhandled ptrSizeof:",ptrIR)));
  /** Stores various cached state. */
  const cache = Object.create(null);
  /** Previously-recorded size of cache.memory.buffer, noted so that
      we can recreate the view objects if the heap grows. */
  cache.heapSize = 0;
  /** WebAssembly.Memory object extracted from target.memory or
      target.exports.memory the first time heapWrappers() is
      called. */
  cache.memory = null;
  /** uninstallFunction() puts table indexes in here for reuse and
      installFunction() extracts them. */
  cache.freeFuncIndexes = [];
  /**
     Used by scopedAlloc() and friends.
  */
  cache.scopedAlloc = [];

  cache.utf8Decoder = new TextDecoder();
  cache.utf8Encoder = new TextEncoder('utf-8');

  /**
     If (cache.heapSize !== cache.memory.buffer.byteLength), i.e. if
     the heap has grown since the last call, updates cache.HEAPxyz.
     Returns the cache object.
  */
  const heapWrappers = function(){
    if(!cache.memory){
      cache.memory = (target.memory instanceof WebAssembly.Memory)
        ? target.memory : target.exports.memory;
    }else if(cache.heapSize === cache.memory.buffer.byteLength){
      return cache;
    }
    // heap is newly-acquired or has been resized....
    const b = cache.memory.buffer;
    cache.HEAP8 = new Int8Array(b); cache.HEAP8U = new Uint8Array(b);
    cache.HEAP16 = new Int16Array(b); cache.HEAP16U = new Uint16Array(b);
    cache.HEAP32 = new Int32Array(b); cache.HEAP32U = new Uint32Array(b);
    if(target.bigIntEnabled){
      cache.HEAP64 = new BigInt64Array(b); cache.HEAP64U = new BigUint64Array(b);
    }
    cache.HEAP32F = new Float32Array(b); cache.HEAP64F = new Float64Array(b);
    cache.heapSize = b.byteLength;
    return cache;
  };

  /** Convenience equivalent of this.heapForSize(8,false). */
  target.heap8 = ()=>heapWrappers().HEAP8;

  /** Convenience equivalent of this.heapForSize(8,true). */
  target.heap8u = ()=>heapWrappers().HEAP8U;

  /** Convenience equivalent of this.heapForSize(16,false). */
  target.heap16 = ()=>heapWrappers().HEAP16;

  /** Convenience equivalent of this.heapForSize(16,true). */
  target.heap16u = ()=>heapWrappers().HEAP16U;

  /** Convenience equivalent of this.heapForSize(32,false). */
  target.heap32 = ()=>heapWrappers().HEAP32;

  /** Convenience equivalent of this.heapForSize(32,true). */
  target.heap32u = ()=>heapWrappers().HEAP32U;

  /**
     Requires n to be one of:

     - integer 8, 16, or 32.
     - A integer-type TypedArray constructor: Int8Array, Int16Array,
     Int32Array, or their Uint counterparts.

     If this.bigIntEnabled is true, it also accepts the value 64 or a
     BigInt64Array/BigUint64Array, else it throws if passed 64 or one
     of those constructors.

     Returns an integer-based TypedArray view of the WASM heap
     memory buffer associated with the given block size. If passed
     an integer as the first argument and unsigned is truthy then
     the "U" (unsigned) variant of that view is returned, else the
     signed variant is returned. If passed a TypedArray value, the
     2nd argument is ignored. Note that Float32Array and
     Float64Array views are not supported by this function.

     Note that growth of the heap will invalidate any references to
     this heap, so do not hold a reference longer than needed and do
     not use a reference after any operation which may
     allocate. Instead, re-fetch the reference by calling this
     function again.

     Throws if passed an invalid n.

     Pedantic side note: the name "heap" is a bit of a misnomer. In an
     Emscripten environment, the memory managed via the stack
     allocation API is in the same Memory object as the heap (which
     makes sense because otherwise arbitrary pointer X would be
     ambiguous: is it in the heap or the stack?).
  */
  target.heapForSize = function(n,unsigned = false){
    let ctor;
    const c = (cache.memory && cache.heapSize === cache.memory.buffer.byteLength)
          ? cache : heapWrappers();
    switch(n){
        case Int8Array: return c.HEAP8; case Uint8Array: return c.HEAP8U;
        case Int16Array: return c.HEAP16; case Uint16Array: return c.HEAP16U;
        case Int32Array: return c.HEAP32; case Uint32Array: return c.HEAP32U;
        case 8:  return unsigned ? c.HEAP8U : c.HEAP8;
        case 16: return unsigned ? c.HEAP16U : c.HEAP16;
        case 32: return unsigned ? c.HEAP32U : c.HEAP32;
        case 64:
          if(c.HEAP64) return unsigned ? c.HEAP64U : c.HEAP64;
          break;
        default:
          if(target.bigIntEnabled){
            if(n===self['BigUint64Array']) return c.HEAP64U;
            else if(n===self['BigInt64Array']) return c.HEAP64;
            break;
          }
    }
    toss("Invalid heapForSize() size: expecting 8, 16, 32,",
         "or (if BigInt is enabled) 64.");
  };

  /**
     Returns the WASM-exported "indirect function table."
  */
  target.functionTable = function(){
    return target.exports.__indirect_function_table;
    /** -----------------^^^^^ "seems" to be a standardized export name.
        From Emscripten release notes from 2020-09-10:
        - Use `__indirect_function_table` as the import name for the
        table, which is what LLVM does.
    */
  };

  /**
     Given a function pointer, returns the WASM function table entry
     if found, else returns a falsy value.
  */
  target.functionEntry = function(fptr){
    const ft = target.functionTable();
    return fptr < ft.length ? ft.get(fptr) : undefined;
  };

  /**
     Creates a WASM function which wraps the given JS function and
     returns the JS binding of that WASM function. The signature
     string must be the Jaccwabyt-format or Emscripten
     addFunction()-format function signature string. In short: in may
     have one of the following formats:

     - Emscripten: `"x..."`, where the first x is a letter representing
       the result type and subsequent letters represent the argument
       types. Functions with no arguments have only a single
       letter. See below.

     - Jaccwabyt: `"x(...)"` where `x` is the letter representing the
       result type and letters in the parens (if any) represent the
       argument types. Functions with no arguments use `x()`. See
       below.

     Supported letters:

     - `i` = int32
     - `p` = int32 ("pointer")
     - `j` = int64
     - `f` = float32
     - `d` = float64
     - `v` = void, only legal for use as the result type

     It throws if an invalid signature letter is used.

     Jaccwabyt-format signatures support some additional letters which
     have no special meaning here but (in this context) act as aliases
     for other letters:

     - `s`, `P`: same as `p`

     Sidebar: this code is developed together with Jaccwabyt, thus the
     support for its signature format.

     The arguments may be supplied in either order: (func,sig) or
     (sig,func).
  */
  target.jsFuncToWasm = function f(func, sig){
    /** Attribution: adapted up from Emscripten-generated glue code,
        refactored primarily for efficiency's sake, eliminating
        call-local functions and superfluous temporary arrays. */
    if(!f._){/*static init...*/
      f._ = {
        // Map of signature letters to type IR values
        sigTypes: Object.assign(Object.create(null),{
          i: 'i32', p: 'i32', P: 'i32', s: 'i32',
          j: 'i64', f: 'f32', d: 'f64'
        }),
        // Map of type IR values to WASM type code values
        typeCodes: Object.assign(Object.create(null),{
          f64: 0x7c, f32: 0x7d, i64: 0x7e, i32: 0x7f
        }),
        /** Encodes n, which must be <2^14 (16384), into target array
            tgt, as a little-endian value, using the given method
            ('push' or 'unshift'). */
        uleb128Encode: function(tgt, method, n){
          if(n<128) tgt[method](n);
          else tgt[method]( (n % 128) | 128, n>>7);
        },
        /** Intentionally-lax pattern for Jaccwabyt-format function
            pointer signatures, the intent of which is simply to
            distinguish them from Emscripten-format signatures. The
            downstream checks are less lax. */
        rxJSig: /^(\w)\((\w*)\)$/,
        /** Returns the parameter-value part of the given signature
            string. */
        sigParams: function(sig){
          const m = f._.rxJSig.exec(sig);
          return m ? m[2] : sig.substr(1);
        },
        /** Returns the IR value for the given letter or throws
            if the letter is invalid. */
        letterType: (x)=>f._.sigTypes[x] || toss("Invalid signature letter:",x),
        /** Returns an object describing the result type and parameter
            type(s) of the given function signature, or throws if the
            signature is invalid. */
        /******** // only valid for use with the WebAssembly.Function ctor, which
                  // is not yet documented on MDN. 
        sigToWasm: function(sig){
          const rc = {parameters:[], results: []};
          if('v'!==sig[0]) rc.results.push(f.sigTypes(sig[0]));
          for(const x of f._.sigParams(sig)){
            rc.parameters.push(f._.typeCodes(x));
          }
          return rc;
        },************/
        /** Pushes the WASM data type code for the given signature
            letter to the given target array. Throws if letter is
            invalid. */
        pushSigType: (dest, letter)=>dest.push(f._.typeCodes[f._.letterType(letter)])
      };
    }/*static init*/
    if('string'===typeof func){
      const x = sig;
      sig = func;
      func = x;
    }
    const sigParams = f._.sigParams(sig);
    const wasmCode = [0x01/*count: 1*/, 0x60/*function*/];
    f._.uleb128Encode(wasmCode, 'push', sigParams.length);
    for(const x of sigParams) f._.pushSigType(wasmCode, x);
    if('v'===sig[0]) wasmCode.push(0);
    else{
      wasmCode.push(1);
      f._.pushSigType(wasmCode, sig[0]);
    }
    f._.uleb128Encode(wasmCode, 'unshift', wasmCode.length)/* type section length */;
    wasmCode.unshift(
      0x00, 0x61, 0x73, 0x6d, /* magic: "\0asm" */
      0x01, 0x00, 0x00, 0x00, /* version: 1 */
      0x01 /* type section code */
    );
    wasmCode.push(
      /* import section: */ 0x02, 0x07,
      /* (import "e" "f" (func 0 (type 0))): */
      0x01, 0x01, 0x65, 0x01, 0x66, 0x00, 0x00,
      /* export section: */ 0x07, 0x05,
      /* (export "f" (func 0 (type 0))): */
      0x01, 0x01, 0x66, 0x00, 0x00
    );
    return (new WebAssembly.Instance(
      new WebAssembly.Module(new Uint8Array(wasmCode)), {
        e: { f: func }
      })).exports['f'];
  }/*jsFuncToWasm()*/;
  
  /**
     Expects a JS function and signature, exactly as for
     this.jsFuncToWasm(). It uses that function to create a
     WASM-exported function, installs that function to the next
     available slot of this.functionTable(), and returns the
     function's index in that table (which acts as a pointer to that
     function). The returned pointer can be passed to
     uninstallFunction() to uninstall it and free up the table slot for
     reuse.

     If passed (string,function) arguments then it treats the first
     argument as the signature and second as the function.

     As a special case, if the passed-in function is a WASM-exported
     function then the signature argument is ignored and func is
     installed as-is, without requiring re-compilation/re-wrapping.

     This function will propagate an exception if
     WebAssembly.Table.grow() throws or this.jsFuncToWasm() throws.
     The former case can happen in an Emscripten-compiled
     environment when building without Emscripten's
     `-sALLOW_TABLE_GROWTH` flag.

     Sidebar: this function differs from Emscripten's addFunction()
     _primarily_ in that it does not share that function's
     undocumented behavior of reusing a function if it's passed to
     addFunction() more than once, which leads to uninstallFunction()
     breaking clients which do not take care to avoid that case:

     https://github.com/emscripten-core/emscripten/issues/17323
  */
  target.installFunction = function f(func, sig){
    if(2!==arguments.length){
      toss("installFunction() requires exactly 2 arguments");
    }
    if('string'===typeof func){
      const x = sig;
      sig = func;
      func = x;
    }
    const ft = target.functionTable();
    const oldLen = ft.length;
    let ptr;
    while(cache.freeFuncIndexes.length){
      ptr = cache.freeFuncIndexes.pop();
      if(ft.get(ptr)){ /* Table was modified via a different API */
        ptr = null;
        continue;
      }else{
        break;
      }
    }
    if(!ptr){
      ptr = oldLen;
      ft.grow(1);
    }
    try{
      /*this will only work if func is a WASM-exported function*/
      ft.set(ptr, func);
      return ptr;
    }catch(e){
      if(!(e instanceof TypeError)){
        if(ptr===oldLen) cache.freeFuncIndexes.push(oldLen);
        throw e;
      }
    }
    // It's not a WASM-exported function, so compile one...
    try {
      ft.set(ptr, target.jsFuncToWasm(func, sig));
    }catch(e){
      if(ptr===oldLen) cache.freeFuncIndexes.push(oldLen);
      throw e;
    }
    return ptr;      
  };

  /**
     Requires a pointer value previously returned from
     this.installFunction(). Removes that function from the WASM
     function table, marks its table slot as free for re-use, and
     returns that function. It is illegal to call this before
     installFunction() has been called and results are undefined if
     ptr was not returned by that function. The returned function
     may be passed back to installFunction() to reinstall it.
  */
  target.uninstallFunction = function(ptr){
    const fi = cache.freeFuncIndexes;
    const ft = target.functionTable();
    fi.push(ptr);
    const rc = ft.get(ptr);
    ft.set(ptr, null);
    return rc;
  };

  /**
     Given a WASM heap memory address and a data type name in the form
     (i8, i16, i32, i64, float (or f32), double (or f64)), this
     fetches the numeric value from that address and returns it as a
     number or, for the case of type='i64', a BigInt (noting that that
     type triggers an exception if this.bigIntEnabled is
     falsy). Throws if given an invalid type.

     As a special case, if type ends with a `*`, it is considered to
     be a pointer type and is treated as the WASM numeric type
     appropriate for the pointer size (`i32`).

     While likely not obvious, this routine and its setMemValue()
     counterpart are how pointer-to-value _output_ parameters
     in WASM-compiled C code can be interacted with:

     ```
     const ptr = alloc(4);
     setMemValue(ptr, 0, 'i32'); // clear the ptr's value
     aCFuncWithOutputPtrToInt32Arg( ptr ); // e.g. void foo(int *x);
     const result = getMemValue(ptr, 'i32'); // fetch ptr's value
     dealloc(ptr);
     ```

     scopedAlloc() and friends can be used to make handling of
     `ptr` safe against leaks in the case of an exception:

     ```
     let result;
     const scope = scopedAllocPush();
     try{
       const ptr = scopedAlloc(4);
       setMemValue(ptr, 0, 'i32');
       aCFuncWithOutputPtrArg( ptr );
       result = getMemValue(ptr, 'i32');
     }finally{
       scopedAllocPop(scope);
     }
     ```

     As a rule setMemValue() must be called to set (typically zero
     out) the pointer's value, else it will contain an essentially
     random value.

     ACHTUNG: calling this often, e.g. in a loop, can have a noticably
     painful impact on performance. Rather than doing so, use
     heapForSize() to fetch the heap object and read directly from it.

     See: setMemValue()
  */
  target.getMemValue = function(ptr, type='i8'){
    if(type.endsWith('*')) type = ptrIR;
    const c = (cache.memory && cache.heapSize === cache.memory.buffer.byteLength)
          ? cache : heapWrappers();
    switch(type){
        case 'i1':
        case 'i8': return c.HEAP8[ptr>>0];
        case 'i16': return c.HEAP16[ptr>>1];
        case 'i32': return c.HEAP32[ptr>>2];
        case 'i64':
          if(target.bigIntEnabled) return BigInt(c.HEAP64[ptr>>3]);
          break;
        case 'float': case 'f32': return c.HEAP32F[ptr>>2];
        case 'double': case 'f64': return Number(c.HEAP64F[ptr>>3]);
        default: break;
    }
    toss('Invalid type for getMemValue():',type);
  };

  /**
     The counterpart of getMemValue(), this sets a numeric value at
     the given WASM heap address, using the type to define how many
     bytes are written. Throws if given an invalid type. See
     getMemValue() for details about the type argument. If the 3rd
     argument ends with `*` then it is treated as a pointer type and
     this function behaves as if the 3rd argument were `i32`.

     This function returns itself.

     ACHTUNG: calling this often, e.g. in a loop, can have a noticably
     painful impact on performance. Rather than doing so, use
     heapForSize() to fetch the heap object and assign directly to it.
  */
  target.setMemValue = function f(ptr, value, type='i8'){
    if (type.endsWith('*')) type = ptrIR;
    const c = (cache.memory && cache.heapSize === cache.memory.buffer.byteLength)
          ? cache : heapWrappers();
    switch (type) {
        case 'i1': 
        case 'i8': c.HEAP8[ptr>>0] = value; return f;
        case 'i16': c.HEAP16[ptr>>1] = value; return f;
        case 'i32': c.HEAP32[ptr>>2] = value; return f;
        case 'i64':
          if(c.HEAP64){
            c.HEAP64[ptr>>3] = BigInt(value);
            return f;
          }
          break;
        case 'float': case 'f32': c.HEAP32F[ptr>>2] = value; return f;
        case 'double': case 'f64': c.HEAP64F[ptr>>3] = value; return f;
    }
    toss('Invalid type for setMemValue(): ' + type);
  };


  /** Convenience form of getMemValue() intended for fetching
      pointer-to-pointer values. */
  target.getPtrValue = (ptr)=>target.getMemValue(ptr, ptrIR);

  /** Convenience form of setMemValue() intended for setting
      pointer-to-pointer values. */
  target.setPtrValue = (ptr, value)=>target.setMemValue(ptr, value, ptrIR);

  /**
     Returns true if the given value appears to be legal for use as
     a WASM pointer value. Its _range_ of values is not (cannot be)
     validated except to ensure that it is a 32-bit integer with a
     value of 0 or greater. Likewise, it cannot verify whether the
     value actually refers to allocated memory in the WASM heap.
  */
  target.isPtr32 = (ptr)=>('number'===typeof ptr && (ptr===(ptr|0)) && ptr>=0);

  /**
     isPtr() is an alias for isPtr32(). If/when 64-bit WASM pointer
     support becomes widespread, it will become an alias for either
     isPtr32() or the as-yet-hypothetical isPtr64(), depending on a
     configuration option.
  */
  target.isPtr = target.isPtr32;

  /**
     Expects ptr to be a pointer into the WASM heap memory which
     refers to a NUL-terminated C-style string encoded as UTF-8.
     Returns the length, in bytes, of the string, as for `strlen(3)`.
     As a special case, if !ptr then it it returns `null`. Throws if
     ptr is out of range for target.heap8u().
  */
  target.cstrlen = function(ptr){
    if(!ptr) return null;
    const h = heapWrappers().HEAP8U;
    let pos = ptr;
    for( ; h[pos] !== 0; ++pos ){}
    return pos - ptr;
  };

  /** Internal helper to use in operations which need to distinguish
      between SharedArrayBuffer heap memory and non-shared heap. */
  const __SAB = ('undefined'===typeof SharedArrayBuffer)
        ? function(){} : SharedArrayBuffer;
  const __utf8Decode = function(arrayBuffer, begin, end){
    return cache.utf8Decoder.decode(
      (arrayBuffer.buffer instanceof __SAB)
        ? arrayBuffer.slice(begin, end)
        : arrayBuffer.subarray(begin, end)
    );
  };

  /**
     Expects ptr to be a pointer into the WASM heap memory which
     refers to a NUL-terminated C-style string encoded as UTF-8. This
     function counts its byte length using cstrlen() then returns a
     JS-format string representing its contents. As a special case, if
     ptr is falsy, `null` is returned.
  */
  target.cstringToJs = function(ptr){
    const n = target.cstrlen(ptr);
    return n ? __utf8Decode(heapWrappers().HEAP8U, ptr, ptr+n) : (null===n ? n : "");
  };

  /**
     Given a JS string, this function returns its UTF-8 length in
     bytes. Returns null if str is not a string.
  */
  target.jstrlen = function(str){
    /** Attribution: derived from Emscripten's lengthBytesUTF8() */
    if('string'!==typeof str) return null;
    const n = str.length;
    let len = 0;
    for(let i = 0; i < n; ++i){
      let u = str.charCodeAt(i);
      if(u>=0xd800 && u<=0xdfff){
        u = 0x10000 + ((u & 0x3FF) << 10) | (str.charCodeAt(++i) & 0x3FF);
      }
      if(u<=0x7f) ++len;
      else if(u<=0x7ff) len += 2;
      else if(u<=0xffff) len += 3;
      else len += 4;
    }
    return len;
  };

  /**
     Encodes the given JS string as UTF8 into the given TypedArray
     tgt, starting at the given offset and writing, at most, maxBytes
     bytes (including the NUL terminator if addNul is true, else no
     NUL is added). If it writes any bytes at all and addNul is true,
     it always NUL-terminates the output, even if doing so means that
     the NUL byte is all that it writes.

     If maxBytes is negative (the default) then it is treated as the
     remaining length of tgt, starting at the given offset.

     If writing the last character would surpass the maxBytes count
     because the character is multi-byte, that character will not be
     written (as opposed to writing a truncated multi-byte character).
     This can lead to it writing as many as 3 fewer bytes than
     maxBytes specifies.

     Returns the number of bytes written to the target, _including_
     the NUL terminator (if any). If it returns 0, it wrote nothing at
     all, which can happen if:

     - str is empty and addNul is false.
     - offset < 0.
     - maxBytes == 0.
     - maxBytes is less than the byte length of a multi-byte str[0].

     Throws if tgt is not an Int8Array or Uint8Array.

     Design notes:

     - In C's strcpy(), the destination pointer is the first
       argument. That is not the case here primarily because the 3rd+
       arguments are all referring to the destination, so it seems to
       make sense to have them grouped with it.

     - Emscripten's counterpart of this function (stringToUTF8Array())
       returns the number of bytes written sans NUL terminator. That
       is, however, ambiguous: str.length===0 or maxBytes===(0 or 1)
       all cause 0 to be returned.
  */
  target.jstrcpy = function(jstr, tgt, offset = 0, maxBytes = -1, addNul = true){
    /** Attribution: the encoding bits are taken from Emscripten's
        stringToUTF8Array(). */
    if(!tgt || (!(tgt instanceof Int8Array) && !(tgt instanceof Uint8Array))){
      toss("jstrcpy() target must be an Int8Array or Uint8Array.");
    }
    if(maxBytes<0) maxBytes = tgt.length - offset;
    if(!(maxBytes>0) || !(offset>=0)) return 0;
    let i = 0, max = jstr.length;
    const begin = offset, end = offset + maxBytes - (addNul ? 1 : 0);
    for(; i < max && offset < end; ++i){
      let u = jstr.charCodeAt(i);
      if(u>=0xd800 && u<=0xdfff){
        u = 0x10000 + ((u & 0x3FF) << 10) | (jstr.charCodeAt(++i) & 0x3FF);
      }
      if(u<=0x7f){
        if(offset >= end) break;
        tgt[offset++] = u;
      }else if(u<=0x7ff){
        if(offset + 1 >= end) break;
        tgt[offset++] = 0xC0 | (u >> 6);
        tgt[offset++] = 0x80 | (u & 0x3f);
      }else if(u<=0xffff){
        if(offset + 2 >= end) break;
        tgt[offset++] = 0xe0 | (u >> 12);
        tgt[offset++] = 0x80 | ((u >> 6) & 0x3f);
        tgt[offset++] = 0x80 | (u & 0x3f);
      }else{
        if(offset + 3 >= end) break;
        tgt[offset++] = 0xf0 | (u >> 18);
        tgt[offset++] = 0x80 | ((u >> 12) & 0x3f);
        tgt[offset++] = 0x80 | ((u >> 6) & 0x3f);
        tgt[offset++] = 0x80 | (u & 0x3f);
      }
    }
    if(addNul) tgt[offset++] = 0;
    return offset - begin;
  };

  /**
     Works similarly to C's strncpy(), copying, at most, n bytes (not
     characters) from srcPtr to tgtPtr. It copies until n bytes have
     been copied or a 0 byte is reached in src. _Unlike_ strncpy(), it
     returns the number of bytes it assigns in tgtPtr, _including_ the
     NUL byte (if any). If n is reached before a NUL byte in srcPtr,
     tgtPtr will _not_ be NULL-terminated. If a NUL byte is reached
     before n bytes are copied, tgtPtr will be NUL-terminated.

     If n is negative, cstrlen(srcPtr)+1 is used to calculate it, the
     +1 being for the NUL byte.

     Throws if tgtPtr or srcPtr are falsy. Results are undefined if:

     - either is not a pointer into the WASM heap or

     - srcPtr is not NUL-terminated AND n is less than srcPtr's
       logical length.

     ACHTUNG: it is possible to copy partial multi-byte characters
     this way, and converting such strings back to JS strings will
     have undefined results.
  */
  target.cstrncpy = function(tgtPtr, srcPtr, n){
    if(!tgtPtr || !srcPtr) toss("cstrncpy() does not accept NULL strings.");
    if(n<0) n = target.cstrlen(strPtr)+1;
    else if(!(n>0)) return 0;
    const heap = target.heap8u();
    let i = 0, ch;
    for(; i < n && (ch = heap[srcPtr+i]); ++i){
      heap[tgtPtr+i] = ch;
    }
    if(i<n) heap[tgtPtr + i++] = 0;
    return i;
  };

  /**
     For the given JS string, returns a Uint8Array of its contents
     encoded as UTF-8. If addNul is true, the returned array will have
     a trailing 0 entry, else it will not.
  */
  target.jstrToUintArray = (str, addNul=false)=>{
    return cache.utf8Encoder.encode(addNul ? (str+"\0") : str);
    // Or the hard way...
    /** Attribution: derived from Emscripten's stringToUTF8Array() */
    //const a = [], max = str.length;
    //let i = 0, pos = 0;
    //for(; i < max; ++i){
    //  let u = str.charCodeAt(i);
    //  if(u>=0xd800 && u<=0xdfff){
    //    u = 0x10000 + ((u & 0x3FF) << 10) | (str.charCodeAt(++i) & 0x3FF);
    //  }
    //  if(u<=0x7f) a[pos++] = u;
    //  else if(u<=0x7ff){
    //    a[pos++] = 0xC0 | (u >> 6);
    //    a[pos++] = 0x80 | (u & 63);
    //  }else if(u<=0xffff){
    //    a[pos++] = 0xe0 | (u >> 12);
    //    a[pos++] = 0x80 | ((u >> 6) & 63);
    //    a[pos++] = 0x80 | (u & 63);
    //  }else{
    //    a[pos++] = 0xf0 | (u >> 18);
    //    a[pos++] = 0x80 | ((u >> 12) & 63);
    //    a[pos++] = 0x80 | ((u >> 6) & 63);
    //    a[pos++] = 0x80 | (u & 63);
    //  }
    // }
    // return new Uint8Array(a);
  };

  const __affirmAlloc = (obj,funcName)=>{
    if(!(obj.alloc instanceof Function) ||
       !(obj.dealloc instanceof Function)){
      toss("Object is missing alloc() and/or dealloc() function(s)",
           "required by",funcName+"().");
    }
  };

  const __allocCStr = function(jstr, returnWithLength, allocator, funcName){
    __affirmAlloc(target, funcName);
    if('string'!==typeof jstr) return null;
    const n = target.jstrlen(jstr),
          ptr = allocator(n+1);
    target.jstrcpy(jstr, target.heap8u(), ptr, n+1, true);
    return returnWithLength ? [ptr, n] : ptr;
  };

  /**
     Uses target.alloc() to allocate enough memory for jstrlen(jstr)+1
     bytes of memory, copies jstr to that memory using jstrcpy(),
     NUL-terminates it, and returns the pointer to that C-string.
     Ownership of the pointer is transfered to the caller, who must
     eventually pass the pointer to dealloc() to free it.

     If passed a truthy 2nd argument then its return semantics change:
     it returns [ptr,n], where ptr is the C-string's pointer and n is
     its cstrlen().

     Throws if `target.alloc` or `target.dealloc` are not functions.
  */
  target.allocCString =
    (jstr, returnWithLength=false)=>__allocCStr(jstr, returnWithLength,
                                                target.alloc, 'allocCString()');

  /**
     Starts an "allocation scope." All allocations made using
     scopedAlloc() are recorded in this scope and are freed when the
     value returned from this function is passed to
     scopedAllocPop().

     This family of functions requires that the API's object have both
     `alloc()` and `dealloc()` methods, else this function will throw.

     Intended usage:

     ```
     const scope = scopedAllocPush();
     try {
       const ptr1 = scopedAlloc(100);
       const ptr2 = scopedAlloc(200);
       const ptr3 = scopedAlloc(300);
       ...
       // Note that only allocations made via scopedAlloc()
       // are managed by this allocation scope.
     }finally{
       scopedAllocPop(scope);
     }
     ```

     The value returned by this function must be treated as opaque by
     the caller, suitable _only_ for passing to scopedAllocPop().
     Its type and value are not part of this function's API and may
     change in any given version of this code.

     `scopedAlloc.level` can be used to determine how many scoped
     alloc levels are currently active.
   */
  target.scopedAllocPush = function(){
    __affirmAlloc(target, 'scopedAllocPush');
    const a = [];
    cache.scopedAlloc.push(a);
    return a;
  };

  /**
     Cleans up all allocations made using scopedAlloc() in the context
     of the given opaque state object, which must be a value returned
     by scopedAllocPush(). See that function for an example of how to
     use this function.

     Though scoped allocations are managed like a stack, this API
     behaves properly if allocation scopes are popped in an order
     other than the order they were pushed.

     If called with no arguments, it pops the most recent
     scopedAllocPush() result:

     ```
     scopedAllocPush();
     try{ ... } finally { scopedAllocPop(); }
     ```

     It's generally recommended that it be passed an explicit argument
     to help ensure that push/push are used in matching pairs, but in
     trivial code that may be a non-issue.
  */
  target.scopedAllocPop = function(state){
    __affirmAlloc(target, 'scopedAllocPop');
    const n = arguments.length
          ? cache.scopedAlloc.indexOf(state)
          : cache.scopedAlloc.length-1;
    if(n<0) toss("Invalid state object for scopedAllocPop().");
    if(0===arguments.length) state = cache.scopedAlloc[n];
    cache.scopedAlloc.splice(n,1);
    for(let p; (p = state.pop()); ) target.dealloc(p);
  };

  /**
     Allocates n bytes of memory using this.alloc() and records that
     fact in the state for the most recent call of scopedAllocPush().
     Ownership of the memory is given to scopedAllocPop(), which
     will clean it up when it is called. The memory _must not_ be
     passed to this.dealloc(). Throws if this API object is missing
     the required `alloc()` or `dealloc()` functions or no scoped
     alloc is active.

     See scopedAllocPush() for an example of how to use this function.

     The `level` property of this function can be queried to query how
     many scoped allocation levels are currently active.

     See also: scopedAllocPtr(), scopedAllocCString()
  */
  target.scopedAlloc = function(n){
    if(!cache.scopedAlloc.length){
      toss("No scopedAllocPush() scope is active.");
    }
    const p = target.alloc(n);
    cache.scopedAlloc[cache.scopedAlloc.length-1].push(p);
    return p;
  };

  Object.defineProperty(target.scopedAlloc, 'level', {
    configurable: false, enumerable: false,
    get: ()=>cache.scopedAlloc.length,
    set: ()=>toss("The 'active' property is read-only.")
  });

  /**
     Works identically to allocCString() except that it allocates the
     memory using scopedAlloc().

     Will throw if no scopedAllocPush() call is active.
  */
  target.scopedAllocCString =
    (jstr, returnWithLength=false)=>__allocCStr(jstr, returnWithLength,
                                                target.scopedAlloc, 'scopedAllocCString()');

  // impl for allocMainArgv() and scopedAllocMainArgv().
  const __allocMainArgv = function(isScoped, list){
    if(!list.length) toss("Cannot allocate empty array.");
    const pList = target[
      isScoped ? 'scopedAlloc' : 'alloc'
    ](list.length * target.ptrSizeof);
    let i = 0;
    list.forEach((e)=>{
      target.setPtrValue(pList + (target.ptrSizeof * i++),
                         target[
                           isScoped ? 'scopedAllocCString' : 'allocCString'
                         ](""+e));
    });
    return pList;
  };

  /**
     Creates an array, using scopedAlloc(), suitable for passing to a
     C-level main() routine. The input is a collection with a length
     property and a forEach() method. A block of memory list.length
     entries long is allocated and each pointer-sized block of that
     memory is populated with a scopedAllocCString() conversion of the
     (''+value) of each element. Returns a pointer to the start of the
     list, suitable for passing as the 2nd argument to a C-style
     main() function.

     Throws if list.length is falsy or scopedAllocPush() is not active.
  */
  target.scopedAllocMainArgv = (list)=>__allocMainArgv(true, list);

  /**
     Identical to scopedAllocMainArgv() but uses alloc() instead of
     scopedAllocMainArgv
  */
  target.allocMainArgv = (list)=>__allocMainArgv(false, list);

  /**
     Wraps function call func() in a scopedAllocPush() and
     scopedAllocPop() block, such that all calls to scopedAlloc() and
     friends from within that call will have their memory freed
     automatically when func() returns. If func throws or propagates
     an exception, the scope is still popped, otherwise it returns the
     result of calling func().
  */
  target.scopedAllocCall = function(func){
    target.scopedAllocPush();
    try{ return func() } finally{ target.scopedAllocPop() }
  };

  /** Internal impl for allocPtr() and scopedAllocPtr(). */
  const __allocPtr = function(howMany, safePtrSize, method){
    __affirmAlloc(target, method);
    const pIr = safePtrSize ? 'i64' : ptrIR;
    let m = target[method](howMany * (safePtrSize ? 8 : ptrSizeof));
    target.setMemValue(m, 0, pIr)
    if(1===howMany){
      return m;
    }
    const a = [m];
    for(let i = 1; i < howMany; ++i){
      m += (safePtrSize ? 8 : ptrSizeof);
      a[i] = m;
      target.setMemValue(m, 0, pIr);
    }
    return a;
  };

  /**
     Allocates one or more pointers as a single chunk of memory and
     zeroes them out.

     The first argument is the number of pointers to allocate. The
     second specifies whether they should use a "safe" pointer size (8
     bytes) or whether they may use the default pointer size
     (typically 4 but also possibly 8).

     How the result is returned depends on its first argument: if
     passed 1, it returns the allocated memory address. If passed more
     than one then an array of pointer addresses is returned, which
     can optionally be used with "destructuring assignment" like this:

     ```
     const [p1, p2, p3] = allocPtr(3);
     ```

     ACHTUNG: when freeing the memory, pass only the _first_ result
     value to dealloc(). The others are part of the same memory chunk
     and must not be freed separately.

     The reason for the 2nd argument is..

     When one of the returned pointers will refer to a 64-bit value,
     e.g. a double or int64, an that value must be written or fetched,
     e.g. using setMemValue() or getMemValue(), it is important that
     the pointer in question be aligned to an 8-byte boundary or else
     it will not be fetched or written properly and will corrupt or
     read neighboring memory. It is only safe to pass false when the
     client code is certain that it will only get/fetch 4-byte values
     (or smaller).
  */
  target.allocPtr =
    (howMany=1, safePtrSize=true)=>__allocPtr(howMany, safePtrSize, 'alloc');

  /**
     Identical to allocPtr() except that it allocates using scopedAlloc()
     instead of alloc().
  */
  target.scopedAllocPtr =
    (howMany=1, safePtrSize=true)=>__allocPtr(howMany, safePtrSize, 'scopedAlloc');

  /**
     If target.exports[name] exists, it is returned, else an
     exception is thrown.
  */
  target.xGet = function(name){
    return target.exports[name] || toss("Cannot find exported symbol:",name);
  };

  const __argcMismatch =
        (f,n)=>toss(f+"() requires",n,"argument(s).");
  
  /**
     Looks up a WASM-exported function named fname from
     target.exports. If found, it is called, passed all remaining
     arguments, and its return value is returned to xCall's caller. If
     not found, an exception is thrown. This function does no
     conversion of argument or return types, but see xWrap() and
     xCallWrapped() for variants which do.

     As a special case, if passed only 1 argument after the name and
     that argument in an Array, that array's entries become the
     function arguments. (This is not an ambiguous case because it's
     not legal to pass an Array object to a WASM function.)
  */
  target.xCall = function(fname, ...args){
    const f = target.xGet(fname);
    if(!(f instanceof Function)) toss("Exported symbol",fname,"is not a function.");
    if(f.length!==args.length) __argcMismatch(fname,f.length)
    /* This is arguably over-pedantic but we want to help clients keep
       from shooting themselves in the foot when calling C APIs. */;
    return (2===arguments.length && Array.isArray(arguments[1]))
      ? f.apply(null, arguments[1])
      : f.apply(null, args);
  };

  /**
     State for use with xWrap()
  */
  cache.xWrap = Object.create(null);
  const xcv = cache.xWrap.convert = Object.create(null);
  /** Map of type names to argument conversion functions. */
  cache.xWrap.convert.arg = Object.create(null);
  /** Map of type names to return result conversion functions. */
  cache.xWrap.convert.result = Object.create(null);

  if(target.bigIntEnabled){
    xcv.arg.i64 = (i)=>BigInt(i);
  }
  xcv.arg.i32 = (i)=>(i | 0);
  xcv.arg.i16 = (i)=>((i | 0) & 0xFFFF);
  xcv.arg.i8  = (i)=>((i | 0) & 0xFF);
  xcv.arg.f32 = xcv.arg.float = (i)=>Number(i).valueOf();
  xcv.arg.f64 = xcv.arg.double = xcv.arg.f32;
  xcv.arg.int = xcv.arg.i32;
  xcv.result['*'] = xcv.result['pointer'] = xcv.arg['**'] = xcv.arg[ptrIR];
  xcv.result['number'] = (v)=>Number(v);

  { /* Copy certain xcv.arg[...] handlers to xcv.result[...] and
       add pointer-style variants of them. */
    const copyToResult = ['i8', 'i16', 'i32', 'int',
                          'f32', 'float', 'f64', 'double'];
    if(target.bigIntEnabled) copyToResult.push('i64');
    for(const t of copyToResult){
      xcv.arg[t+'*'] = xcv.result[t+'*'] = xcv.arg[ptrIR];
      xcv.result[t] = xcv.arg[t] || toss("Missing arg converter:",t);
    }
  }

  /**
     In order for args of type string to work in various contexts in
     the sqlite3 API, we need to pass them on as, variably, a C-string
     or a pointer value. Thus for ARGs of type 'string' and
     '*'/'pointer' we behave differently depending on whether the
     argument is a string or not:

     - If v is a string, scopeAlloc() a new C-string from it and return
       that temp string's pointer.

     - Else return the value from the arg adaptor defined for ptrIR.

     TODO? Permit an Int8Array/Uint8Array and convert it to a string?
     Would that be too much magic concentrated in one place, ready to
     backfire?
  */
  xcv.arg.string = xcv.arg.utf8 = xcv.arg['pointer'] = xcv.arg['*']
    = function(v){
      if('string'===typeof v) return target.scopedAllocCString(v);
      return v ? xcv.arg[ptrIR](v) : null;
    };
  xcv.result.string = xcv.result.utf8 = (i)=>target.cstringToJs(i);
  xcv.result['string:free'] = xcv.result['utf8:free'] = (i)=>{
    try { return i ? target.cstringToJs(i) : null }
    finally{ target.dealloc(i) }
  };
  xcv.result.json = (i)=>JSON.parse(target.cstringToJs(i));
  xcv.result['json:free'] = (i)=>{
    try{ return i ? JSON.parse(target.cstringToJs(i)) : null }
    finally{ target.dealloc(i) }
  }
  xcv.result['void'] = (v)=>undefined;
  xcv.result['null'] = (v)=>v;

  if(0){
    /***
        This idea can't currently work because we don't know the
        signature for the func and don't have a way for the user to
        convey it. To do this we likely need to be able to match
        arg/result handlers by a regex, but that would incur an O(N)
        cost as we check the regex one at a time. Another use case for
        such a thing would be pseudotypes like "int:-1" to say that
        the value will always be treated like -1 (which has a useful
        case in the sqlite3 bindings).
    */
    xcv.arg['func-ptr'] = function(v){
      if(!(v instanceof Function)) return xcv.arg[ptrIR];
      const f = target.jsFuncToWasm(v, WHAT_SIGNATURE);
    };
  }

  const __xArgAdapterCheck =
        (t)=>xcv.arg[t] || toss("Argument adapter not found:",t);

  const __xResultAdapterCheck =
        (t)=>xcv.result[t] || toss("Result adapter not found:",t);
  
  cache.xWrap.convertArg = (t,v)=>__xArgAdapterCheck(t)(v);
  cache.xWrap.convertResult =
    (t,v)=>(null===t ? v : (t ? __xResultAdapterCheck(t)(v) : undefined));

  /**
     Creates a wrapper for the WASM-exported function fname. Uses
     xGet() to fetch the exported function (which throws on
     error) and returns either that function or a wrapper for that
     function which converts the JS-side argument types into WASM-side
     types and converts the result type. If the function takes no
     arguments and resultType is `null` then the function is returned
     as-is, else a wrapper is created for it to adapt its arguments
     and result value, as described below.

     (If you're familiar with Emscripten's ccall() and cwrap(), this
     function is essentially cwrap() on steroids.)

     This function's arguments are:

     - fname: the exported function's name. xGet() is used to fetch
       this, so will throw if no exported function is found with that
       name.

     - resultType: the name of the result type. A literal `null` means
       to return the original function's value as-is (mnemonic: there
       is "null" conversion going on). Literal `undefined` or the
       string `"void"` mean to ignore the function's result and return
       `undefined`. Aside from those two special cases, it may be one
       of the values described below or any mapping installed by the
       client using xWrap.resultAdapter().

     If passed 3 arguments and the final one is an array, that array
     must contain a list of type names (see below) for adapting the
     arguments from JS to WASM.  If passed 2 arguments, more than 3,
     or the 3rd is not an array, all arguments after the 2nd (if any)
     are treated as type names. i.e.:

     ```
     xWrap('funcname', 'i32', 'string', 'f64');
     // is equivalent to:
     xWrap('funcname', 'i32', ['string', 'f64']);
     ```

     Type names are symbolic names which map the arguments to an
     adapter function to convert, if needed, the value before passing
     it on to WASM or to convert a return result from WASM. The list
     of built-in names:

     - `i8`, `i16`, `i32` (args and results): all integer conversions
       which convert their argument to an integer and truncate it to
       the given bit length.

     - `N*` (args): a type name in the form `N*`, where N is a numeric
       type name, is treated the same as WASM pointer.

     - `*` and `pointer` (args): have multple semantics. They
       behave exactly as described below for `string` args.

     - `*` and `pointer` (results): are aliases for the current
       WASM pointer numeric type.

     - `**` (args): is simply a descriptive alias for the WASM pointer
       type. It's primarily intended to mark output-pointer arguments.

     - `i64` (args and results): passes the value to BigInt() to
       convert it to an int64. Only available if bigIntEnabled is
       true.

     - `f32` (`float`), `f64` (`double`) (args and results): pass
       their argument to Number(). i.e. the adaptor does not currently
       distinguish between the two types of floating-point numbers.

     - `number` (results): converts the result to a JS Number using
       Number(theValue).valueOf(). Note that this is for result
       conversions only, as it's not possible to generically know
       which type of number to convert arguments to.

     Non-numeric conversions include:

     - `string` or `utf8` (args): has two different semantics in order
       to accommodate various uses of certain C APIs
       (e.g. output-style strings)...

       - If the arg is a string, it creates a _temporary_
         UTF-8-encoded C-string to pass to the exported function,
         cleaning it up before the wrapper returns. If a long-lived
         C-string pointer is required, that requires client-side code
         to create the string, then pass its pointer to the function.

       - Else the arg is assumed to be a pointer to a string the
         client has already allocated and it's passed on as
         a WASM pointer.

       - `string` or `utf8` (results): treats the result value as a
         const C-string, encoded as UTF-8, copies it to a JS string,
         and returns that JS string.

     - `string:free` or `utf8:free) (results): treats the result value
       as a non-const UTF-8 C-string, ownership of which has just been
       transfered to the caller. It copies the C-string to a JS
       string, frees the C-string, and returns the JS string. If such
       a result value is NULL, the JS result is `null`. Achtung: when
       using an API which returns results from a specific allocator,
       e.g. `my_malloc()`, this conversion _is not legal_. Instead, an
       equivalent conversion which uses the appropriate deallocator is
       required. For example:

```js
   target.xWrap.resultAdaptor('string:my_free',(i)=>{
      try { return i ? target.cstringToJs(i) : null }
      finally{ target.exports.my_free(i) }
   };
```

     - `json` (results): treats the result as a const C-string and
       returns the result of passing the converted-to-JS string to
       JSON.parse(). Returns `null` if the C-string is a NULL pointer.

     - `json:free` (results): works exactly like `string:free` but
       returns the same thing as the `json` adapter. Note the
       warning in `string:free` regarding maching allocators and
       deallocators.

     The type names for results and arguments are validated when
     xWrap() is called and any unknown names will trigger an
     exception.

     Clients may map their own result and argument adapters using
     xWrap.resultAdapter() and xWrap.argAdaptor(), noting that not all
     type conversions are valid for both arguments _and_ result types
     as they often have different memory ownership requirements.

     TODOs:

     - Figure out how/whether we can (semi-)transparently handle
       pointer-type _output_ arguments. Those currently require
       explicit handling by allocating pointers, assigning them before
       the call using setMemValue(), and fetching them with
       getMemValue() after the call. We may be able to automate some
       or all of that.

     - Figure out whether it makes sense to extend the arg adapter
       interface such that each arg adapter gets an array containing
       the results of the previous arguments in the current call. That
       might allow some interesting type-conversion feature. Use case:
       handling of the final argument to sqlite3_prepare_v2() depends
       on the type (pointer vs JS string) of its 2nd
       argument. Currently that distinction requires hand-writing a
       wrapper for that function. That case is unusual enough that
       abstracting it into this API (and taking on the associated
       costs) may well not make good sense.
  */
  target.xWrap = function(fname, resultType, ...argTypes){
    if(3===arguments.length && Array.isArray(arguments[2])){
      argTypes = arguments[2];
    }
    const xf = target.xGet(fname);
    if(argTypes.length!==xf.length) __argcMismatch(fname, xf.length);
    if((null===resultType) && 0===xf.length){
      /* Func taking no args with an as-is return. We don't need a wrapper. */
      return xf;
    }
    /*Verify the arg type conversions are valid...*/;
    if(undefined!==resultType && null!==resultType) __xResultAdapterCheck(resultType);
    argTypes.forEach(__xArgAdapterCheck);
    if(0===xf.length){
      // No args to convert, so we can create a simpler wrapper...
      return (...args)=>(args.length
                         ? __argcMismatch(fname, xf.length)
                         : cache.xWrap.convertResult(resultType, xf.call(null)));
    }
    return function(...args){
      if(args.length!==xf.length) __argcMismatch(fname, xf.length);
      const scope = target.scopedAllocPush();
      try{
        const rc = xf.apply(null,args.map((v,i)=>cache.xWrap.convertArg(argTypes[i], v)));
        return cache.xWrap.convertResult(resultType, rc);
      }finally{
        target.scopedAllocPop(scope);
      }
    };
  }/*xWrap()*/;

  /** Internal impl for xWrap.resultAdapter() and argAdaptor(). */
  const __xAdapter = function(func, argc, typeName, adapter, modeName, xcvPart){
    if('string'===typeof typeName){
      if(1===argc) return xcvPart[typeName];
      else if(2===argc){
        if(!adapter){
          delete xcvPart[typeName];
          return func;
        }else if(!(adapter instanceof Function)){
          toss(modeName,"requires a function argument.");
        }
        xcvPart[typeName] = adapter;
        return func;
      }
    }
    toss("Invalid arguments to",modeName);
  };

  /**
     Gets, sets, or removes a result value adapter for use with
     xWrap(). If passed only 1 argument, the adapter function for the
     given type name is returned.  If the second argument is explicit
     falsy (as opposed to defaulted), the adapter named by the first
     argument is removed. If the 2nd argument is not falsy, it must be
     a function which takes one value and returns a value appropriate
     for the given type name. The adapter may throw if its argument is
     not of a type it can work with. This function throws for invalid
     arguments.

     Example:

     ```
     xWrap.resultAdapter('twice',(v)=>v+v);
     ```

     xWrap.resultAdapter() MUST NOT use the scopedAlloc() family of
     APIs to allocate a result value. xWrap()-generated wrappers run
     in the context of scopedAllocPush() so that argument adapters can
     easily convert, e.g., to C-strings, and have them cleaned up
     automatically before the wrapper returns to the caller. Likewise,
     if a _result_ adapter uses scoped allocation, the result will be
     freed before because they would be freed before the wrapper
     returns, leading to chaos and undefined behavior.

     Except when called as a getter, this function returns itself.
  */
  target.xWrap.resultAdapter = function f(typeName, adapter){
    return __xAdapter(f, arguments.length, typeName, adapter,
                      'resultAdaptor()', xcv.result);
  };

  /**
     Functions identically to xWrap.resultAdapter() but applies to
     call argument conversions instead of result value conversions.

     xWrap()-generated wrappers perform argument conversion in the
     context of a scopedAllocPush(), so any memory allocation
     performed by argument adapters really, really, really should be
     made using the scopedAlloc() family of functions unless
     specifically necessary. For example:

     ```
     xWrap.argAdapter('my-string', function(v){
       return ('string'===typeof v)
         ? myWasmObj.scopedAllocCString(v) : null;
     };
     ```

     Contrariwise, xWrap.resultAdapter() must _not_ use scopedAlloc()
     to allocate its results because they would be freed before the
     xWrap()-created wrapper returns.

     Note that it is perfectly legitimate to use these adapters to
     perform argument validation, as opposed (or in addition) to
     conversion.
  */
  target.xWrap.argAdapter = function f(typeName, adapter){
    return __xAdapter(f, arguments.length, typeName, adapter,
                      'argAdaptor()', xcv.arg);
  };

  /**
     Functions like xCall() but performs argument and result type
     conversions as for xWrap(). The first argument is the name of the
     exported function to call. The 2nd its the name of its result
     type, as documented for xWrap(). The 3rd is an array of argument
     type name, as documented for xWrap() (use a falsy value or an
     empty array for nullary functions). The 4th+ arguments are
     arguments for the call, with the special case that if the 4th
     argument is an array, it is used as the arguments for the
     call. Returns the converted result of the call.

     This is just a thin wrapper around xWrap(). If the given function
     is to be called more than once, it's more efficient to use
     xWrap() to create a wrapper, then to call that wrapper as many
     times as needed. For one-shot calls, however, this variant is
     arguably more efficient because it will hypothetically free the
     wrapper function quickly.
  */
  target.xCallWrapped = function(fname, resultType, argTypes, ...args){
    if(Array.isArray(arguments[3])) args = arguments[3];
    return target.xWrap(fname, resultType, argTypes||[]).apply(null, args||[]);
  };

  return target;
};

/**
   yawl (Yet Another Wasm Loader) provides very basic wasm loader.
   It requires a config object:

   - `uri`: required URI of the WASM file to load.

   - `onload(loadResult,config)`: optional callback. The first
     argument is the result object from
     WebAssembly.instantiate[Streaming](). The 2nd is the config
     object passed to this function. Described in more detail below.

   - `imports`: optional imports object for
     WebAssembly.instantiate[Streaming](). The default is an empty set
     of imports. If the module requires any imports, this object
     must include them.

   - `wasmUtilTarget`: optional object suitable for passing to
     WhWasmUtilInstaller(). If set, it gets passed to that function
     after the promise resolves. This function sets several properties
     on it before passing it on to that function (which sets many
     more):

     - `module`, `instance`: the properties from the
       instantiate[Streaming]() result.

     - If `instance.exports.memory` is _not_ set then it requires that
       `config.imports.env.memory` be set (else it throws), and
       assigns that to `target.memory`.

     - If `wasmUtilTarget.alloc` is not set and
       `instance.exports.malloc` is, it installs
       `wasmUtilTarget.alloc()` and `wasmUtilTarget.dealloc()`
       wrappers for the exports `malloc` and `free` functions.

   It returns a function which, when called, initiates loading of the
   module and returns a Promise. When that Promise resolves, it calls
   the `config.onload` callback (if set) and passes it
   `(loadResult,config)`, where `loadResult` is the result of
   WebAssembly.instantiate[Streaming](): an object in the form:

   ```
   {
     module: a WebAssembly.Module,
     instance: a WebAssembly.Instance
   }
   ```

   (Note that the initial `then()` attached to the promise gets only
   that object, and not the `config` one.)

   Error handling is up to the caller, who may attach a `catch()` call
   to the promise.
*/
self.WhWasmUtilInstaller.yawl = function(config){
  const wfetch = ()=>fetch(config.uri, {credentials: 'same-origin'});
  const wui = this;
  const finalThen = function(arg){
    //log("finalThen()",arg);
    if(config.wasmUtilTarget){
      const toss = (...args)=>{throw new Error(args.join(' '))};
      const tgt = config.wasmUtilTarget;
      tgt.module = arg.module;
      tgt.instance = arg.instance;
      //tgt.exports = tgt.instance.exports;
      if(!tgt.instance.exports.memory){
        /**
           WhWasmUtilInstaller requires either tgt.exports.memory
           (exported from WASM) or tgt.memory (JS-provided memory
           imported into WASM).
        */
        tgt.memory = (config.imports && config.imports.env
                      && config.imports.env.memory)
          || toss("Missing 'memory' object!");
      }
      if(!tgt.alloc && arg.instance.exports.malloc){
        const exports = arg.instance.exports;
        tgt.alloc = function(n){
          return exports.malloc(n) || toss("Allocation of",n,"bytes failed.");
        };
        tgt.dealloc = function(m){exports.free(m)};
      }
      wui(tgt);
    }
    if(config.onload) config.onload(arg,config);
    return arg /* for any then() handler attached to
                  yetAnotherWasmLoader()'s return value */;
  };
  const loadWasm = WebAssembly.instantiateStreaming
        ? function loadWasmStreaming(){
          return WebAssembly.instantiateStreaming(wfetch(), config.imports||{})
            .then(finalThen);
        }
        : function loadWasmOldSchool(){ // Safari < v15
          return wfetch()
            .then(response => response.arrayBuffer())
            .then(bytes => WebAssembly.instantiate(bytes, config.imports||{}))
            .then(finalThen);
        };
  return loadWasm;
}.bind(self.WhWasmUtilInstaller)/*yawl()*/;
/* END FILE: common/whwasmutil.js */
/* BEGIN FILE: jaccwabyt/jaccwabyt.js */
/**
  2022-06-30

  The author disclaims copyright to this source code.  In place of a
  legal notice, here is a blessing:

  *   May you do good and not evil.
  *   May you find forgiveness for yourself and forgive others.
  *   May you share freely, never taking more than you give.

  ***********************************************************************

  The Jaccwabyt API is documented in detail in an external file.

  Project home: https://fossil.wanderinghorse.net/r/jaccwabyt

*/
'use strict';
self.Jaccwabyt = function StructBinderFactory(config){
/* ^^^^ it is recommended that clients move that object into wherever
   they'd like to have it and delete the self-held copy ("self" being
   the global window or worker object).  This API does not require the
   global reference - it is simply installed as a convenience for
   connecting these bits to other co-developed code before it gets
   removed from the global namespace.
*/

  /** Throws a new Error, the message of which is the concatenation
      all args with a space between each. */
  const toss = (...args)=>{throw new Error(args.join(' '))};

  /**
     Implementing function bindings revealed significant
     shortcomings in Emscripten's addFunction()/removeFunction()
     interfaces:

     https://github.com/emscripten-core/emscripten/issues/17323

     Until those are resolved, or a suitable replacement can be
     implemented, our function-binding API will be more limited
     and/or clumsier to use than initially hoped.
  */
  if(!(config.heap instanceof WebAssembly.Memory)
     && !(config.heap instanceof Function)){
    toss("config.heap must be WebAssembly.Memory instance or a function.");
  }
  ['alloc','dealloc'].forEach(function(k){
    (config[k] instanceof Function) ||
      toss("Config option '"+k+"' must be a function.");
  });
  const SBF = StructBinderFactory;
  const heap = (config.heap instanceof Function)
        ? config.heap : (()=>new Uint8Array(config.heap.buffer)),
        alloc = config.alloc,
        dealloc = config.dealloc,
        log = config.log || console.log.bind(console),
        memberPrefix = (config.memberPrefix || ""),
        memberSuffix = (config.memberSuffix || ""),
        bigIntEnabled = (undefined===config.bigIntEnabled
                         ? !!self['BigInt64Array'] : !!config.bigIntEnabled),
        BigInt = self['BigInt'],
        BigInt64Array = self['BigInt64Array'],
        /* Undocumented (on purpose) config options: */
        functionTable = config.functionTable/*EXPERIMENTAL, undocumented*/,
        ptrSizeof = config.ptrSizeof || 4,
        ptrIR = config.ptrIR || 'i32'
  ;

  if(!SBF.debugFlags){
    SBF.__makeDebugFlags = function(deriveFrom=null){
      /* This is disgustingly overengineered. :/ */
      if(deriveFrom && deriveFrom.__flags) deriveFrom = deriveFrom.__flags;
      const f = function f(flags){
        if(0===arguments.length){
          return f.__flags;
        }
        if(flags<0){
          delete f.__flags.getter; delete f.__flags.setter;
          delete f.__flags.alloc; delete f.__flags.dealloc;
        }else{
          f.__flags.getter  = 0!==(0x01 & flags);
          f.__flags.setter  = 0!==(0x02 & flags);
          f.__flags.alloc   = 0!==(0x04 & flags);
          f.__flags.dealloc = 0!==(0x08 & flags);
        }
        return f._flags;
      };
      Object.defineProperty(f,'__flags', {
        iterable: false, writable: false,
        value: Object.create(deriveFrom)
      });
      if(!deriveFrom) f(0);
      return f;
    };
    SBF.debugFlags = SBF.__makeDebugFlags();
  }/*static init*/

  const isLittleEndian = (function() {
    const buffer = new ArrayBuffer(2);
    new DataView(buffer).setInt16(0, 256, true /* littleEndian */);
    // Int16Array uses the platform's endianness.
    return new Int16Array(buffer)[0] === 256;
  })();
  /**
     Some terms used in the internal docs:

     StructType: a struct-wrapping class generated by this
     framework.
     DEF: struct description object.
     SIG: struct member signature string.
  */

  /** True if SIG s looks like a function signature, else
      false. */
  const isFuncSig = (s)=>'('===s[1];
  /** True if SIG s is-a pointer signature. */
  const isPtrSig = (s)=>'p'===s || 'P'===s;
  const isAutoPtrSig = (s)=>'P'===s /*EXPERIMENTAL*/;
  const sigLetter = (s)=>isFuncSig(s) ? 'p' : s[0];
  /** Returns the WASM IR form of the Emscripten-conventional letter
      at SIG s[0]. Throws for an unknown SIG. */
  const sigIR = function(s){
    switch(sigLetter(s)){
        case 'i': return 'i32';
        case 'p': case 'P': case 's': return ptrIR;
        case 'j': return 'i64';
        case 'f': return 'float';
        case 'd': return 'double';
    }
    toss("Unhandled signature IR:",s);
  };
  /** Returns the sizeof value for the given SIG. Throws for an
      unknown SIG. */
  const sigSizeof = function(s){
    switch(sigLetter(s)){
        case 'i': return 4;
        case 'p': case 'P': case 's': return ptrSizeof;
        case 'j': return 8;
        case 'f': return 4 /* C-side floats, not JS-side */;
        case 'd': return 8;
    }
    toss("Unhandled signature sizeof:",s);
  };
  const affirmBigIntArray = BigInt64Array
        ? ()=>true : ()=>toss('BigInt64Array is not available.');
  /** Returns the (signed) TypedArray associated with the type
      described by the given SIG. Throws for an unknown SIG. */
  /**********
  const sigTypedArray = function(s){
    switch(sigIR(s)) {
        case 'i32': return Int32Array;
        case 'i64': return affirmBigIntArray() && BigInt64Array;
        case 'float': return Float32Array;
        case 'double': return Float64Array;
    }
    toss("Unhandled signature TypedArray:",s);
  };
  **************/
  /** Returns the name of a DataView getter method corresponding
      to the given SIG. */
  const sigDVGetter = function(s){
    switch(sigLetter(s)) {
        case 'p': case 'P': case 's': {
          switch(ptrSizeof){
              case 4: return 'getInt32';
              case 8: return affirmBigIntArray() && 'getBigInt64';
          }
          break;
        }
        case 'i': return 'getInt32';
        case 'j': return affirmBigIntArray() && 'getBigInt64';
        case 'f': return 'getFloat32';
        case 'd': return 'getFloat64';
    }
    toss("Unhandled DataView getter for signature:",s);
  };
  /** Returns the name of a DataView setter method corresponding
      to the given SIG. */
  const sigDVSetter = function(s){
    switch(sigLetter(s)){
        case 'p': case 'P': case 's': {
          switch(ptrSizeof){
              case 4: return 'setInt32';
              case 8: return affirmBigIntArray() && 'setBigInt64';
          }
          break;
        }
        case 'i': return 'setInt32';
        case 'j': return affirmBigIntArray() && 'setBigInt64';
        case 'f': return 'setFloat32';
        case 'd': return 'setFloat64';
    }
    toss("Unhandled DataView setter for signature:",s);
  };
  /**
     Returns either Number of BigInt, depending on the given
     SIG. This constructor is used in property setters to coerce
     the being-set value to the correct size.
  */
  const sigDVSetWrapper = function(s){
    switch(sigLetter(s)) {
        case 'i': case 'f': case 'd': return Number;
        case 'j': return affirmBigIntArray() && BigInt;
        case 'p': case 'P': case 's':
          switch(ptrSizeof){
              case 4: return Number;
              case 8: return affirmBigIntArray() && BigInt;
          }
          break;
    }
    toss("Unhandled DataView set wrapper for signature:",s);
  };

  const sPropName = (s,k)=>s+'::'+k;

  const __propThrowOnSet = function(structName,propName){
    return ()=>toss(sPropName(structName,propName),"is read-only.");
  };

  /**
     When C code passes a pointer of a bound struct to back into
     a JS function via a function pointer struct member, it
     arrives in JS as a number (pointer).
     StructType.instanceForPointer(ptr) can be used to get the
     instance associated with that pointer, and __ptrBacklinks
     holds that mapping. WeakMap keys must be objects, so we
     cannot use a weak map to map pointers to instances. We use
     the StructType constructor as the WeakMap key, mapped to a
     plain, prototype-less Object which maps the pointers to
     struct instances. That arrangement gives us a
     per-StructType type-safe way to resolve pointers.
  */
  const __ptrBacklinks = new WeakMap();
  /**
     Similar to __ptrBacklinks but is scoped at the StructBinder
     level and holds pointer-to-object mappings for all struct
     instances created by any struct from any StructFactory
     which this specific StructBinder has created. The intention
     of this is to help implement more transparent handling of
     pointer-type property resolution.
  */
  const __ptrBacklinksGlobal = Object.create(null);

  /**
     In order to completely hide StructBinder-bound struct
     pointers from JS code, we store them in a scope-local
     WeakMap which maps the struct-bound objects to their WASM
     pointers. The pointers are accessible via
     boundObject.pointer, which is gated behind an accessor
     function, but are not exposed anywhere else in the
     object. The main intention of that is to make it impossible
     for stale copies to be made.
  */
  const __instancePointerMap = new WeakMap();

  /** Property name for the pointer-is-external marker. */
  const xPtrPropName = '(pointer-is-external)';

  /** Frees the obj.pointer memory and clears the pointer
      property. */
  const __freeStruct = function(ctor, obj, m){
    if(!m) m = __instancePointerMap.get(obj);
    if(m) {
      if(obj.ondispose instanceof Function){
        try{obj.ondispose()}
        catch(e){
          /*do not rethrow: destructors must not throw*/
          console.warn("ondispose() for",ctor.structName,'@',
                       m,'threw. NOT propagating it.',e);
        }
      }else if(Array.isArray(obj.ondispose)){
        obj.ondispose.forEach(function(x){
          try{
            if(x instanceof Function) x.call(obj);
            else if('number' === typeof x) dealloc(x);
            // else ignore. Strings are permitted to annotate entries
            // to assist in debugging.
          }catch(e){
            console.warn("ondispose() for",ctor.structName,'@',
                         m,'threw. NOT propagating it.',e);
          }
        });
      }
      delete obj.ondispose;
      delete __ptrBacklinks.get(ctor)[m];
      delete __ptrBacklinksGlobal[m];
      __instancePointerMap.delete(obj);
      if(ctor.debugFlags.__flags.dealloc){
        log("debug.dealloc:",(obj[xPtrPropName]?"EXTERNAL":""),
            ctor.structName,"instance:",
            ctor.structInfo.sizeof,"bytes @"+m);
      }
      if(!obj[xPtrPropName]) dealloc(m);
    }
  };

  /** Returns a skeleton for a read-only property accessor wrapping
      value v. */
  const rop = (v)=>{return {configurable: false, writable: false,
                            iterable: false, value: v}};

  /** Allocates obj's memory buffer based on the size defined in
      DEF.sizeof. */
  const __allocStruct = function(ctor, obj, m){
    let fill = !m;
    if(m) Object.defineProperty(obj, xPtrPropName, rop(m));
    else{
      m = alloc(ctor.structInfo.sizeof);
      if(!m) toss("Allocation of",ctor.structName,"structure failed.");
    }
    try {
      if(ctor.debugFlags.__flags.alloc){
        log("debug.alloc:",(fill?"":"EXTERNAL"),
            ctor.structName,"instance:",
            ctor.structInfo.sizeof,"bytes @"+m);
      }
      if(fill) heap().fill(0, m, m + ctor.structInfo.sizeof);
      __instancePointerMap.set(obj, m);
      __ptrBacklinks.get(ctor)[m] = obj;
      __ptrBacklinksGlobal[m] = obj;
    }catch(e){
      __freeStruct(ctor, obj, m);
      throw e;
    }
  };
  /** Gets installed as the memoryDump() method of all structs. */
  const __memoryDump = function(){
    const p = this.pointer;
    return p
      ? new Uint8Array(heap().slice(p, p+this.structInfo.sizeof))
      : null;
  };

  const __memberKey = (k)=>memberPrefix + k + memberSuffix;
  const __memberKeyProp = rop(__memberKey);

  /**
     Looks up a struct member in structInfo.members. Throws if found
     if tossIfNotFound is true, else returns undefined if not
     found. The given name may be either the name of the
     structInfo.members key (faster) or the key as modified by the
     memberPrefix/memberSuffix settings.
  */
  const __lookupMember = function(structInfo, memberName, tossIfNotFound=true){
    let m = structInfo.members[memberName];
    if(!m && (memberPrefix || memberSuffix)){
      // Check for a match on members[X].key
      for(const v of Object.values(structInfo.members)){
        if(v.key===memberName){ m = v; break; }
      }
      if(!m && tossIfNotFound){
        toss(sPropName(structInfo.name,memberName),'is not a mapped struct member.');
      }
    }
    return m;
  };

  /**
     Uses __lookupMember(obj.structInfo,memberName) to find a member,
     throwing if not found. Returns its signature, either in this
     framework's native format or in Emscripten format.
  */
  const __memberSignature = function f(obj,memberName,emscriptenFormat=false){
    if(!f._) f._ = (x)=>x.replace(/[^vipPsjrd]/g,'').replace(/[pPs]/g,'i');
    const m = __lookupMember(obj.structInfo, memberName, true);
    return emscriptenFormat ? f._(m.signature) : m.signature;
  };

  /**
     Returns the instanceForPointer() impl for the given
     StructType constructor.
  */
  const __instanceBacklinkFactory = function(ctor){
    const b = Object.create(null);
    __ptrBacklinks.set(ctor, b);
    return (ptr)=>b[ptr];
  };

  const __ptrPropDescriptor = {
    configurable: false, enumerable: false,
    get: function(){return __instancePointerMap.get(this)},
    set: ()=>toss("Cannot assign the 'pointer' property of a struct.")
    // Reminder: leaving `set` undefined makes assignments
    // to the property _silently_ do nothing. Current unit tests
    // rely on it throwing, though.
  };

  /** Impl of X.memberKeys() for StructType and struct ctors. */
  const __structMemberKeys = rop(function(){
    const a = [];
    Object.keys(this.structInfo.members).forEach((k)=>a.push(this.memberKey(k)));
    return a;
  });

  const __utf8Decoder = new TextDecoder('utf-8');
  const __utf8Encoder = new TextEncoder();
  /** Internal helper to use in operations which need to distinguish
      between SharedArrayBuffer heap memory and non-shared heap. */
  const __SAB = ('undefined'===typeof SharedArrayBuffer)
        ? function(){} : SharedArrayBuffer;
  const __utf8Decode = function(arrayBuffer, begin, end){
    return __utf8Decoder.decode(
      (arrayBuffer.buffer instanceof __SAB)
        ? arrayBuffer.slice(begin, end)
        : arrayBuffer.subarray(begin, end)
    );
  };
  /**
     Uses __lookupMember() to find the given obj.structInfo key.
     Returns that member if it is a string, else returns false. If the
     member is not found, throws if tossIfNotFound is true, else
     returns false.
   */
  const __memberIsString = function(obj,memberName, tossIfNotFound=false){
    const m = __lookupMember(obj.structInfo, memberName, tossIfNotFound);
    return (m && 1===m.signature.length && 's'===m.signature[0]) ? m : false;
  };

  /**
     Given a member description object, throws if member.signature is
     not valid for assigning to or interpretation as a C-style string.
     It optimistically assumes that any signature of (i,p,s) is
     C-string compatible.
  */
  const __affirmCStringSignature = function(member){
    if('s'===member.signature) return;
    toss("Invalid member type signature for C-string value:",
         JSON.stringify(member));
  };

  /**
     Looks up the given member in obj.structInfo. If it has a
     signature of 's' then it is assumed to be a C-style UTF-8 string
     and a decoded copy of the string at its address is returned. If
     the signature is of any other type, it throws. If an s-type
     member's address is 0, `null` is returned.
  */
  const __memberToJsString = function f(obj,memberName){
    const m = __lookupMember(obj.structInfo, memberName, true);
    __affirmCStringSignature(m);
    const addr = obj[m.key];
    //log("addr =",addr,memberName,"m =",m);
    if(!addr) return null;
    let pos = addr;
    const mem = heap();
    for( ; mem[pos]!==0; ++pos ) {
      //log("mem[",pos,"]",mem[pos]);
    };
    //log("addr =",addr,"pos =",pos);
    return (addr===pos) ? "" : __utf8Decode(mem, addr, pos);
  };

  /**
     Adds value v to obj.ondispose, creating ondispose,
     or converting it to an array, if needed.
  */
  const __addOnDispose = function(obj, v){
    if(obj.ondispose){
      if(obj.ondispose instanceof Function){
        obj.ondispose = [obj.ondispose];
      }/*else assume it's an array*/
    }else{
      obj.ondispose = [];
    }
    obj.ondispose.push(v);
  };

  /**
     Allocates a new UTF-8-encoded, NUL-terminated copy of the given
     JS string and returns its address relative to heap(). If
     allocation returns 0 this function throws. Ownership of the
     memory is transfered to the caller, who must eventually pass it
     to the configured dealloc() function.
  */
  const __allocCString = function(str){
    const u = __utf8Encoder.encode(str);
    const mem = alloc(u.length+1);
    if(!mem) toss("Allocation error while duplicating string:",str);
    const h = heap();
    let i = 0;
    for( ; i < u.length; ++i ) h[mem + i] = u[i];
    h[mem + u.length] = 0;
    //log("allocCString @",mem," =",u);
    return mem;
  };

  /**
     Sets the given struct member of obj to a dynamically-allocated,
     UTF-8-encoded, NUL-terminated copy of str. It is up to the caller
     to free any prior memory, if appropriate. The newly-allocated
     string is added to obj.ondispose so will be freed when the object
     is disposed.
  */
  const __setMemberCString = function(obj, memberName, str){
    const m = __lookupMember(obj.structInfo, memberName, true);
    __affirmCStringSignature(m);
    /* Potential TODO: if obj.ondispose contains obj[m.key] then
       dealloc that value and clear that ondispose entry */
    const mem = __allocCString(str);
    obj[m.key] = mem;
    __addOnDispose(obj, mem);
    return obj;
  };

  /**
     Prototype for all StructFactory instances (the constructors
     returned from StructBinder).
  */
  const StructType = function ctor(structName, structInfo){
    if(arguments[2]!==rop){
      toss("Do not call the StructType constructor",
           "from client-level code.");
    }
    Object.defineProperties(this,{
      //isA: rop((v)=>v instanceof ctor),
      structName: rop(structName),
      structInfo: rop(structInfo)
    });
  };

  /**
     Properties inherited by struct-type-specific StructType instances
     and (indirectly) concrete struct-type instances.
  */
  StructType.prototype = Object.create(null, {
    dispose: rop(function(){__freeStruct(this.constructor, this)}),
    lookupMember: rop(function(memberName, tossIfNotFound=true){
      return __lookupMember(this.structInfo, memberName, tossIfNotFound);
    }),
    memberToJsString: rop(function(memberName){
      return __memberToJsString(this, memberName);
    }),
    memberIsString: rop(function(memberName, tossIfNotFound=true){
      return __memberIsString(this, memberName, tossIfNotFound);
    }),
    memberKey: __memberKeyProp,
    memberKeys: __structMemberKeys,
    memberSignature: rop(function(memberName, emscriptenFormat=false){
      return __memberSignature(this, memberName, emscriptenFormat);
    }),
    memoryDump: rop(__memoryDump),
    pointer: __ptrPropDescriptor,
    setMemberCString: rop(function(memberName, str){
      return __setMemberCString(this, memberName, str);
    })
  });

  /**
     "Static" properties for StructType.
  */
  Object.defineProperties(StructType, {
    allocCString: rop(__allocCString),
    instanceForPointer: rop((ptr)=>__ptrBacklinksGlobal[ptr]),
    isA: rop((v)=>v instanceof StructType),
    hasExternalPointer: rop((v)=>(v instanceof StructType) && !!v[xPtrPropName]),
    memberKey: __memberKeyProp
  });

  const isNumericValue = (v)=>Number.isFinite(v) || (v instanceof (BigInt || Number));

  /**
     Pass this a StructBinder-generated prototype, and the struct
     member description object. It will define property accessors for
     proto[memberKey] which read from/write to memory in
     this.pointer. It modifies descr to make certain downstream
     operations much simpler.
  */
  const makeMemberWrapper = function f(ctor,name, descr){
    if(!f._){
      /*cache all available getters/setters/set-wrappers for
        direct reuse in each accessor function. */
      f._ = {getters: {}, setters: {}, sw:{}};
      const a = ['i','p','P','s','f','d','v()'];
      if(bigIntEnabled) a.push('j');
      a.forEach(function(v){
        //const ir = sigIR(v);
        f._.getters[v] = sigDVGetter(v) /* DataView[MethodName] values for GETTERS */;
        f._.setters[v] = sigDVSetter(v) /* DataView[MethodName] values for SETTERS */;
        f._.sw[v] = sigDVSetWrapper(v)  /* BigInt or Number ctor to wrap around values
                                           for conversion */;
      });
      const rxSig1 = /^[ipPsjfd]$/,
            rxSig2 = /^[vipPsjfd]\([ipPsjfd]*\)$/;
      f.sigCheck = function(obj, name, key,sig){
        if(Object.prototype.hasOwnProperty.call(obj, key)){
          toss(obj.structName,'already has a property named',key+'.');
        }
        rxSig1.test(sig) || rxSig2.test(sig)
          || toss("Malformed signature for",
                  sPropName(obj.structName,name)+":",sig);
      };
    }
    const key = ctor.memberKey(name);
    f.sigCheck(ctor.prototype, name, key, descr.signature);
    descr.key = key;
    descr.name = name;
    const sizeOf = sigSizeof(descr.signature);
    const sigGlyph = sigLetter(descr.signature);
    const xPropName = sPropName(ctor.prototype.structName,key);
    const dbg = ctor.prototype.debugFlags.__flags;
    /*
      TODO?: set prototype of descr to an object which can set/fetch
      its prefered representation, e.g. conversion to string or mapped
      function. Advantage: we can avoid doing that via if/else if/else
      in the get/set methods.
    */
    const prop = Object.create(null);
    prop.configurable = false;
    prop.enumerable = false;
    prop.get = function(){
      if(dbg.getter){
        log("debug.getter:",f._.getters[sigGlyph],"for", sigIR(sigGlyph),
            xPropName,'@', this.pointer,'+',descr.offset,'sz',sizeOf);
      }
      let rc = (
        new DataView(heap().buffer, this.pointer + descr.offset, sizeOf)
      )[f._.getters[sigGlyph]](0, isLittleEndian);
      if(dbg.getter) log("debug.getter:",xPropName,"result =",rc);
      if(rc && isAutoPtrSig(descr.signature)){
        rc = StructType.instanceForPointer(rc) || rc;
        if(dbg.getter) log("debug.getter:",xPropName,"resolved =",rc);
      }                
      return rc;
    };
    if(descr.readOnly){
      prop.set = __propThrowOnSet(ctor.prototype.structName,key);
    }else{
      prop.set = function(v){
        if(dbg.setter){
          log("debug.setter:",f._.setters[sigGlyph],"for", sigIR(sigGlyph),
              xPropName,'@', this.pointer,'+',descr.offset,'sz',sizeOf, v);
        }
        if(!this.pointer){
          toss("Cannot set struct property on disposed instance.");
        }
        if(null===v) v = 0;
        else while(!isNumericValue(v)){
          if(isAutoPtrSig(descr.signature) && (v instanceof StructType)){
            // It's a struct instance: let's store its pointer value!
            v = v.pointer || 0;
            if(dbg.setter) log("debug.setter:",xPropName,"resolved to",v);
            break;
          }
          toss("Invalid value for pointer-type",xPropName+'.');
        }
        (
          new DataView(heap().buffer, this.pointer + descr.offset, sizeOf)
        )[f._.setters[sigGlyph]](0, f._.sw[sigGlyph](v), isLittleEndian);
      };
    }
    Object.defineProperty(ctor.prototype, key, prop);
  }/*makeMemberWrapper*/;
  
  /**
     The main factory function which will be returned to the
     caller.
  */
  const StructBinder = function StructBinder(structName, structInfo){
    if(1===arguments.length){
      structInfo = structName;
      structName = structInfo.name;
    }else if(!structInfo.name){
      structInfo.name = structName;
    }
    if(!structName) toss("Struct name is required.");
    let lastMember = false;
    Object.keys(structInfo.members).forEach((k)=>{
      const m = structInfo.members[k];
      if(!m.sizeof) toss(structName,"member",k,"is missing sizeof.");
      else if(0!==(m.sizeof%4)){
        toss(structName,"member",k,"sizeof is not aligned.");
      }
      else if(0!==(m.offset%4)){
        toss(structName,"member",k,"offset is not aligned.");
      }
      if(!lastMember || lastMember.offset < m.offset) lastMember = m;
    });
    if(!lastMember) toss("No member property descriptions found.");
    else if(structInfo.sizeof < lastMember.offset+lastMember.sizeof){
      toss("Invalid struct config:",structName,
           "max member offset ("+lastMember.offset+") ",
           "extends past end of struct (sizeof="+structInfo.sizeof+").");
    }
    const debugFlags = rop(SBF.__makeDebugFlags(StructBinder.debugFlags));
    /** Constructor for the StructCtor. */
    const StructCtor = function StructCtor(externalMemory){
      if(!(this instanceof StructCtor)){
        toss("The",structName,"constructor may only be called via 'new'.");
      }else if(arguments.length){
        if(externalMemory!==(externalMemory|0) || externalMemory<=0){
          toss("Invalid pointer value for",structName,"constructor.");
        }
        __allocStruct(StructCtor, this, externalMemory);
      }else{
        __allocStruct(StructCtor, this);
      }
    };
    Object.defineProperties(StructCtor,{
      debugFlags: debugFlags,
      disposeAll: rop(function(){
        const map = __ptrBacklinks.get(StructCtor);
        Object.keys(map).forEach(function(ptr){
          const b = map[ptr];
          if(b) __freeStruct(StructCtor, b, ptr);
        });
        __ptrBacklinks.set(StructCtor, Object.create(null));
        return StructCtor;
      }),
      instanceForPointer: rop(__instanceBacklinkFactory(StructCtor)),
      isA: rop((v)=>v instanceof StructCtor),
      memberKey: __memberKeyProp,
      memberKeys: __structMemberKeys,
      resolveToInstance: rop(function(v, throwIfNot=false){
        if(!(v instanceof StructCtor)){
          v = Number.isSafeInteger(v)
            ? StructCtor.instanceForPointer(v) : undefined;
        }
        if(!v && throwIfNot) toss("Value is-not-a",StructCtor.structName);
        return v;
      }),
      methodInfoForKey: rop(function(mKey){
      }),
      structInfo: rop(structInfo),
      structName: rop(structName)
    });
    StructCtor.prototype = new StructType(structName, structInfo, rop);
    Object.defineProperties(StructCtor.prototype,{
      debugFlags: debugFlags,
      constructor: rop(StructCtor)
      /*if we assign StructCtor.prototype and don't do
        this then StructCtor!==instance.constructor!*/
    });
    Object.keys(structInfo.members).forEach(
      (name)=>makeMemberWrapper(StructCtor, name, structInfo.members[name])
    );
    return StructCtor;
  };
  StructBinder.instanceForPointer = StructType.instanceForPointer;
  StructBinder.StructType = StructType;
  StructBinder.config = config;
  StructBinder.allocCString = __allocCString;
  if(!StructBinder.debugFlags){
    StructBinder.debugFlags = SBF.__makeDebugFlags(SBF.debugFlags);
  }
  return StructBinder;
}/*StructBinderFactory*/;
/* END FILE: jaccwabyt/jaccwabyt.js */
/* BEGIN FILE: api/sqlite3-api-glue.js */
/*
  2022-07-22

  The author disclaims copyright to this source code.  In place of a
  legal notice, here is a blessing:

  *   May you do good and not evil.
  *   May you find forgiveness for yourself and forgive others.
  *   May you share freely, never taking more than you give.

  ***********************************************************************

  This file glues together disparate pieces of JS which are loaded in
  previous steps of the sqlite3-api.js bootstrapping process:
  sqlite3-api-prologue.js, whwasmutil.js, and jaccwabyt.js. It
  initializes the main API pieces so that the downstream components
  (e.g. sqlite3-api-oo1.js) have all that they need.
*/
self.sqlite3ApiBootstrap.initializers.push(function(sqlite3){
  'use strict';
  const toss = (...args)=>{throw new Error(args.join(' '))};
  const toss3 = sqlite3.SQLite3Error.toss;
  const capi = sqlite3.capi, wasm = sqlite3.wasm, util = sqlite3.util;
  self.WhWasmUtilInstaller(wasm);
  delete self.WhWasmUtilInstaller;

  /**
     Install JS<->C struct bindings for the non-opaque struct types we
     need... */
  sqlite3.StructBinder = self.Jaccwabyt({
    heap: 0 ? wasm.memory : wasm.heap8u,
    alloc: wasm.alloc,
    dealloc: wasm.dealloc,
    functionTable: wasm.functionTable,
    bigIntEnabled: wasm.bigIntEnabled,
    memberPrefix: '$'
  });
  delete self.Jaccwabyt;

  if(0){
    /*  "The problem" is that the following isn't even remotely
        type-safe. OTOH, nothing about WASM pointers is. */
    const argPointer = wasm.xWrap.argAdapter('*');
    wasm.xWrap.argAdapter('StructType', (v)=>{
      if(v && v.constructor && v instanceof StructBinder.StructType){
        v = v.pointer;
      }
      return wasm.isPtr(v)
        ? argPointer(v)
        : toss("Invalid (object) type for StructType-type argument.");
    });
  }

  {/* Convert Arrays and certain TypedArrays to strings for
      'flexible-string'-type arguments */
    const xString = wasm.xWrap.argAdapter('string');
    wasm.xWrap.argAdapter(
      'flexible-string', (v)=>xString(util.flexibleString(v))
    );
  }
  
  if(1){// WhWasmUtil.xWrap() bindings...
    /**
       Add some descriptive xWrap() aliases for '*' intended to (A)
       initially improve readability/correctness of capi.signatures
       and (B) eventually perhaps provide automatic conversion from
       higher-level representations, e.g. capi.sqlite3_vfs to
       `sqlite3_vfs*` via capi.sqlite3_vfs.pointer.
    */
    const aPtr = wasm.xWrap.argAdapter('*');
    wasm.xWrap.argAdapter('sqlite3*', aPtr)
    ('sqlite3_stmt*', aPtr)
    ('sqlite3_context*', aPtr)
    ('sqlite3_value*', aPtr)
    ('sqlite3_vfs*', aPtr)
    ('void*', aPtr);
    wasm.xWrap.resultAdapter('sqlite3*', aPtr)
    ('sqlite3_context*', aPtr)
    ('sqlite3_stmt*', aPtr)
    ('sqlite3_vfs*', aPtr)
    ('void*', aPtr);

    /**
       Populate api object with sqlite3_...() by binding the "raw" wasm
       exports into type-converting proxies using wasm.xWrap().
    */
    for(const e of wasm.bindingSignatures){
      capi[e[0]] = wasm.xWrap.apply(null, e);
    }
    for(const e of wasm.bindingSignatures.wasm){
      wasm[e[0]] = wasm.xWrap.apply(null, e);
    }

    /* For C API functions which cannot work properly unless
       wasm.bigIntEnabled is true, install a bogus impl which
       throws if called when bigIntEnabled is false. */
    const fI64Disabled = function(fname){
      return ()=>toss(fname+"() disabled due to lack",
                      "of BigInt support in this build.");
    };
    for(const e of wasm.bindingSignatures.int64){
      capi[e[0]] = wasm.bigIntEnabled
        ? wasm.xWrap.apply(null, e)
        : fI64Disabled(e[0]);
    }

    /* There's no(?) need to expose bindingSignatures to clients,
       implicitly making it part of the public interface. */
    delete wasm.bindingSignatures;

    if(wasm.exports.sqlite3_wasm_db_error){
      util.sqlite3_wasm_db_error = wasm.xWrap(
        'sqlite3_wasm_db_error', 'int', 'sqlite3*', 'int', 'string'
      );
    }else{
      util.sqlite3_wasm_db_error = function(pDb,errCode,msg){
        console.warn("sqlite3_wasm_db_error() is not exported.",arguments);
        return errCode;
      };
    }

  }/*xWrap() bindings*/;

  /**
     When registering a VFS and its related components it may be
     necessary to ensure that JS keeps a reference to them to keep
     them from getting garbage collected. Simply pass each such value
     to this function and a reference will be held to it for the life
     of the app.
  */
  capi.sqlite3_vfs_register.addReference = function f(...args){
    if(!f._) f._ = [];
    f._.push(...args);
  };

  /**
     Internal helper to assist in validating call argument counts in
     the hand-written sqlite3_xyz() wrappers. We do this only for
     consistency with non-special-case wrappings.
  */
  const __dbArgcMismatch = (pDb,f,n)=>{
    return sqlite3.util.sqlite3_wasm_db_error(pDb, capi.SQLITE_MISUSE,
                                              f+"() requires "+n+" argument"+
                                              (1===n?'':'s')+".");
  };

  /**
     Helper for flexible-string conversions which require a
     byte-length counterpart argument. Passed a value and its
     ostensible length, this function returns [V,N], where V
     is either v or a transformed copy of v and N is either n,
     -1, or the byte length of v (if it's a byte array).
  */
  const __flexiString = function(v,n){
    if('string'===typeof v){
      n = -1;
    }else if(util.isSQLableTypedArray(v)){
      n = v.byteLength;
      v = util.typedArrayToString(v);
    }else if(Array.isArray(v)){
      v = v.join('');
      n = -1;
    }
    return [v, n];
  };

  if(1){/* Special-case handling of sqlite3_exec() */
    const __exec = wasm.xWrap("sqlite3_exec", "int",
                              ["sqlite3*", "flexible-string", "*", "*", "**"]);
    /* Documented in the api object's initializer. */
    capi.sqlite3_exec = function f(pDb, sql, callback, pVoid, pErrMsg){
      if(f.length!==arguments.length){
        return __dbArgcMismatch(pDb,"sqlite3_exec",f.length);
      }else if('function' !== typeof callback){
        return __exec(pDb, sql, callback, pVoid, pErrMsg);
      }
      /* Wrap the callback in a WASM-bound function and convert the callback's
         `(char**)` arguments to arrays of strings... */
      const cbwrap = function(pVoid, nCols, pColVals, pColNames){
        let rc = capi.SQLITE_ERROR;
        try {
          let aVals = [], aNames = [], i = 0, offset = 0;
          for( ; i < nCols; offset += (wasm.ptrSizeof * ++i) ){
            aVals.push( wasm.cstringToJs(wasm.getPtrValue(pColVals + offset)) );
            aNames.push( wasm.cstringToJs(wasm.getPtrValue(pColNames + offset)) );
          }
          rc = callback(pVoid, nCols, aVals, aNames) | 0;
          /* The first 2 args of the callback are useless for JS but
             we want the JS mapping of the C API to be as close to the
             C API as possible. */
        }catch(e){
          /* If we set the db error state here, the higher-level exec() call
             replaces it with its own, so we have no way of reporting the
             exception message except the console. We must not propagate
             exceptions through the C API. */
        }
        return rc;
      };
      let pFunc, rc;
      try{
        pFunc = wasm.installFunction("ipipp", cbwrap);
        rc = __exec(pDb, sql, pFunc, pVoid, pErrMsg);
      }catch(e){
        rc = util.sqlite3_wasm_db_error(pDb, capi.SQLITE_ERROR,
                                        "Error running exec(): "+e.message);
      }finally{
        if(pFunc) wasm.uninstallFunction(pFunc);
      }
      return rc;
    };
  }/*sqlite3_exec() proxy*/;

  if(1){/* Special-case handling of sqlite3_create_function_v2()
           and sqlite3_create_window_function() */
    const sqlite3CreateFunction = wasm.xWrap(
      "sqlite3_create_function_v2", "int",
      ["sqlite3*", "string"/*funcName*/, "int"/*nArg*/,
       "int"/*eTextRep*/, "*"/*pApp*/,
       "*"/*xStep*/,"*"/*xFinal*/, "*"/*xValue*/, "*"/*xDestroy*/]
    );
    const sqlite3CreateWindowFunction = wasm.xWrap(
      "sqlite3_create_window_function", "int",
      ["sqlite3*", "string"/*funcName*/, "int"/*nArg*/,
       "int"/*eTextRep*/, "*"/*pApp*/,
       "*"/*xStep*/,"*"/*xFinal*/, "*"/*xValue*/,
       "*"/*xInverse*/, "*"/*xDestroy*/]
    );

    const __udfSetResult = function(pCtx, val){
      //console.warn("udfSetResult",typeof val, val);
      switch(typeof val) {
          case 'undefined':
            /* Assume that the client already called sqlite3_result_xxx(). */
            break;
          case 'boolean':
            capi.sqlite3_result_int(pCtx, val ? 1 : 0);
            break;
          case 'bigint':
            if(wasm.bigIntEnabled){
              if(util.bigIntFits64(val)) capi.sqlite3_result_int64(pCtx, val);
              else toss3("BigInt value",val.toString(),"is too BigInt for int64.");
            }else if(util.bigIntFits32(val)){
              capi.sqlite3_result_int(pCtx, Number(val));
            }else if(util.bigIntFitsDouble(val)){
              capi.sqlite3_result_double(pCtx, Number(val));
            }else{
              toss3("BigInt value",val.toString(),"is too BigInt.");
            }
            break;
          case 'number': {
            (util.isInt32(val)
             ? capi.sqlite3_result_int
             : capi.sqlite3_result_double)(pCtx, val);
            break;
          }
          case 'string':
            capi.sqlite3_result_text(pCtx, val, -1, capi.SQLITE_TRANSIENT);
            break;
          case 'object':
            if(null===val/*yes, typeof null === 'object'*/) {
              capi.sqlite3_result_null(pCtx);
              break;
            }else if(util.isBindableTypedArray(val)){
              const pBlob = wasm.allocFromTypedArray(val);
              capi.sqlite3_result_blob(
                pCtx, pBlob, val.byteLength,
                wasm.exports[sqlite3.config.deallocExportName]
              );
              break;
            }
            // else fall through
          default:
          toss3("Don't not how to handle this UDF result value:",(typeof val), val);
      };
    }/*__udfSetResult()*/;

    const __udfConvertArgs = function(argc, pArgv){
      let i, pVal, valType, arg;
      const tgt = [];
      for(i = 0; i < argc; ++i){
        pVal = wasm.getPtrValue(pArgv + (wasm.ptrSizeof * i));
        /**
           Curiously: despite ostensibly requiring 8-byte
           alignment, the pArgv array is parcelled into chunks of
           4 bytes (1 pointer each). The values those point to
           have 8-byte alignment but the individual argv entries
           do not.
        */            
        valType = capi.sqlite3_value_type(pVal);
        switch(valType){
            case capi.SQLITE_INTEGER:
              if(wasm.bigIntEnabled){
                arg = capi.sqlite3_value_int64(pVal);
                if(util.bigIntFitsDouble(arg)) arg = Number(arg);
              }
              else arg = capi.sqlite3_value_double(pVal)/*yes, double, for larger integers*/;
              break;
            case capi.SQLITE_FLOAT:
              arg = capi.sqlite3_value_double(pVal);
              break;
            case capi.SQLITE_TEXT:
              arg = capi.sqlite3_value_text(pVal);
              break;
            case capi.SQLITE_BLOB:{
              const n = capi.sqlite3_value_bytes(pVal);
              const pBlob = capi.sqlite3_value_blob(pVal);
              if(n && !pBlob) sqlite3.WasmAllocError.toss(
                "Cannot allocate memory for blob argument of",n,"byte(s)"
              );
              arg = n ? wasm.heap8u().slice(pBlob, pBlob + Number(n)) : null;
              break;
            }
            case capi.SQLITE_NULL:
              arg = null; break;
            default:
              toss3("Unhandled sqlite3_value_type()",valType,
                    "is possibly indicative of incorrect",
                    "pointer size assumption.");
        }
        tgt.push(arg);
      }
      return tgt;
    }/*__udfConvertArgs()*/;

    const __udfSetError = (pCtx, e)=>{
      if(e instanceof sqlite3.WasmAllocError){
        capi.sqlite3_result_error_nomem(pCtx);
      }else{
        const msg = ('string'===typeof e) ? e : e.message;
        capi.sqlite3_result_error(pCtx, msg, -1);
      }
    };

    const __xFunc = function(callback){
      return function(pCtx, argc, pArgv){
        try{ __udfSetResult(pCtx, callback(pCtx, ...__udfConvertArgs(argc, pArgv))) }
        catch(e){
          //console.error('xFunc() caught:',e);
          __udfSetError(pCtx, e);
        }
      };
    };

    const __xInverseAndStep = function(callback){
      return function(pCtx, argc, pArgv){
        try{ callback(pCtx, ...__udfConvertArgs(argc, pArgv)) }
        catch(e){ __udfSetError(pCtx, e) }
      };
    };

    const __xFinalAndValue = function(callback){
      return function(pCtx){
        try{ __udfSetResult(pCtx, callback(pCtx)) }
        catch(e){ __udfSetError(pCtx, e) }
      };
    };

    const __xDestroy = function(callback){
      return function(pVoid){
        try{ callback(pVoid) }
        catch(e){ console.error("UDF xDestroy method threw:",e) }
      };
    };

    const __xMap = Object.assign(Object.create(null), {
      xFunc:    {sig:'v(pip)', f:__xFunc},
      xStep:    {sig:'v(pip)', f:__xInverseAndStep},
      xInverse: {sig:'v(pip)', f:__xInverseAndStep},
      xFinal:   {sig:'v(p)',   f:__xFinalAndValue},
      xValue:   {sig:'v(p)',   f:__xFinalAndValue},
      xDestroy: {sig:'v(p)',   f:__xDestroy}
    });

    const __xWrapFuncs = function(theFuncs, tgtUninst){
      const rc = []
      let k;
      for(k in theFuncs){
        let fArg = theFuncs[k];
        if('function'===typeof fArg){
          const w = __xMap[k];
          fArg = wasm.installFunction(w.sig, w.f(fArg));
          tgtUninst.push(fArg);
        }
        rc.push(fArg);
      }
      return rc;
    };

    /* Documented in the api object's initializer. */
    capi.sqlite3_create_function_v2 = function f(
      pDb, funcName, nArg, eTextRep, pApp,
      xFunc,   //void (*xFunc)(sqlite3_context*,int,sqlite3_value**)
      xStep,   //void (*xStep)(sqlite3_context*,int,sqlite3_value**)
      xFinal,  //void (*xFinal)(sqlite3_context*)
      xDestroy //void (*xDestroy)(void*)
    ){
      if(f.length!==arguments.length){
        return __dbArgcMismatch(pDb,"sqlite3_create_function_v2",f.length);
      }
      /* Wrap the callbacks in a WASM-bound functions... */
      const uninstall = [/*funcs to uninstall on error*/];
      let rc;
      try{
        const funcArgs =  __xWrapFuncs({xFunc, xStep, xFinal, xDestroy},
                                       uninstall);
        rc = sqlite3CreateFunction(pDb, funcName, nArg, eTextRep,
                                   pApp, ...funcArgs);
      }catch(e){
        console.error("sqlite3_create_function_v2() setup threw:",e);
        for(let v of uninstall){
          wasm.uninstallFunction(v);
        }
        rc = util.sqlite3_wasm_db_error(pDb, capi.SQLITE_ERROR,
                                        "Creation of UDF threw: "+e.message);
      }
      return rc;
    };

    capi.sqlite3_create_function = function f(
      pDb, funcName, nArg, eTextRep, pApp,
      xFunc, xStep, xFinal
    ){
      return (f.length===arguments.length)
        ? capi.sqlite3_create_function_v2(pDb, funcName, nArg, eTextRep,
                                          pApp, xFunc, xStep, xFinal, 0)
        : __dbArgcMismatch(pDb,"sqlite3_create_function",f.length);
    };

    /* Documented in the api object's initializer. */
    capi.sqlite3_create_window_function = function f(
      pDb, funcName, nArg, eTextRep, pApp,
      xStep,   //void (*xStep)(sqlite3_context*,int,sqlite3_value**)
      xFinal,  //void (*xFinal)(sqlite3_context*)
      xValue,  //void (*xFinal)(sqlite3_context*)
      xInverse,//void (*xStep)(sqlite3_context*,int,sqlite3_value**)
      xDestroy //void (*xDestroy)(void*)
    ){
      if(f.length!==arguments.length){
        return __dbArgcMismatch(pDb,"sqlite3_create_window_function",f.length);
      }
      /* Wrap the callbacks in a WASM-bound functions... */
      const uninstall = [/*funcs to uninstall on error*/];
      let rc;
      try{
        const funcArgs = __xWrapFuncs({xStep, xFinal, xValue, xInverse, xDestroy},
                                      uninstall);
        rc = sqlite3CreateWindowFunction(pDb, funcName, nArg, eTextRep,
                                         pApp, ...funcArgs);
      }catch(e){
        console.error("sqlite3_create_window_function() setup threw:",e);
        for(let v of uninstall){
          wasm.uninstallFunction(v);
        }
        rc = util.sqlite3_wasm_db_error(pDb, capi.SQLITE_ERROR,
                                        "Creation of UDF threw: "+e.message);
      }
      return rc;
    };
    /**
       A helper for UDFs implemented in JS and bound to WASM by the
       client. Given a JS value, udfSetResult(pCtx,X) calls one of the
       sqlite3_result_xyz(pCtx,...)  routines, depending on X's data
       type:

       - `null`: sqlite3_result_null()
       - `boolean`: sqlite3_result_int()
       - `number`: sqlite3_result_int() or sqlite3_result_double()
       - `string`: sqlite3_result_text()
       - Uint8Array or Int8Array: sqlite3_result_blob()
       - `undefined`: indicates that the UDF called one of the
         `sqlite3_result_xyz()` routines on its own, making this
         function a no-op. Results are _undefined_ if this function is
         passed the `undefined` value but did _not_ call one of the
         `sqlite3_result_xyz()` routines.

       Anything else triggers sqlite3_result_error().
    */
    capi.sqlite3_create_function_v2.udfSetResult =
      capi.sqlite3_create_function.udfSetResult =
      capi.sqlite3_create_window_function.udfSetResult = __udfSetResult;

    /**
       A helper for UDFs implemented in JS and bound to WASM by the
       client. When passed the
       (argc,argv) values from the UDF-related functions which receive
       them (xFunc, xStep, xInverse), it creates a JS array
       representing those arguments, converting each to JS in a manner
       appropriate to its data type: numeric, text, blob
       (Uint8Array), or null.

       Results are undefined if it's passed anything other than those
       two arguments from those specific contexts.

       Thus an argc of 4 will result in a length-4 array containing
       the converted values from the corresponding argv.

       The conversion will throw only on allocation error or an internal
       error.
    */
    capi.sqlite3_create_function_v2.udfConvertArgs =
      capi.sqlite3_create_function.udfConvertArgs =
      capi.sqlite3_create_window_function.udfConvertArgs = __udfConvertArgs;

    /**
       A helper for UDFs implemented in JS and bound to WASM by the
       client. It expects to be a passed `(sqlite3_context*, Error)`
       (an exception object or message string). And it sets the
       current UDF's result to sqlite3_result_error_nomem() or
       sqlite3_result_error(), depending on whether the 2nd argument
       is a sqlite3.WasmAllocError object or not.
    */
    capi.sqlite3_create_function_v2.udfSetError =
      capi.sqlite3_create_function.udfSetError =
      capi.sqlite3_create_window_function.udfSetError = __udfSetError;

  }/*sqlite3_create_function_v2() and sqlite3_create_window_function() proxies*/;

  if(1){/* Special-case handling of sqlite3_prepare_v2() and
           sqlite3_prepare_v3() */
    /**
       Scope-local holder of the two impls of sqlite3_prepare_v2/v3().
    */
    const __prepare = Object.create(null);
    /**
       This binding expects a JS string as its 2nd argument and
       null as its final argument. In order to compile multiple
       statements from a single string, the "full" impl (see
       below) must be used.
    */
    __prepare.basic = wasm.xWrap('sqlite3_prepare_v3',
                                 "int", ["sqlite3*", "string",
                                         "int"/*ignored for this impl!*/,
                                         "int", "**",
                                         "**"/*MUST be 0 or null or undefined!*/]);
    /**
       Impl which requires that the 2nd argument be a pointer
       to the SQL string, instead of being converted to a
       string. This variant is necessary for cases where we
       require a non-NULL value for the final argument
       (exec()'ing multiple statements from one input
       string). For simpler cases, where only the first
       statement in the SQL string is required, the wrapper
       named sqlite3_prepare_v2() is sufficient and easier to
       use because it doesn't require dealing with pointers.
    */
    __prepare.full = wasm.xWrap('sqlite3_prepare_v3',
                                "int", ["sqlite3*", "*", "int", "int",
                                        "**", "**"]);

    /* Documented in the api object's initializer. */
    capi.sqlite3_prepare_v3 = function f(pDb, sql, sqlLen, prepFlags, ppStmt, pzTail){
      if(f.length!==arguments.length){
        return __dbArgcMismatch(pDb,"sqlite3_prepare_v3",f.length);
      }
      const [xSql, xSqlLen] = __flexiString(sql, sqlLen);
      switch(typeof xSql){
          case 'string': return __prepare.basic(pDb, xSql, xSqlLen, prepFlags, ppStmt, null);
          case 'number': return __prepare.full(pDb, xSql, xSqlLen, prepFlags, ppStmt, pzTail);
          default:
            return util.sqlite3_wasm_db_error(
              pDb, capi.SQLITE_MISUSE,
              "Invalid SQL argument type for sqlite3_prepare_v2/v3()."
            );
      }
    };

    /* Documented in the api object's initializer. */
    capi.sqlite3_prepare_v2 = function f(pDb, sql, sqlLen, ppStmt, pzTail){
      return (f.length===arguments.length)
        ? capi.sqlite3_prepare_v3(pDb, sql, sqlLen, 0, ppStmt, pzTail)
        : __dbArgcMismatch(pDb,"sqlite3_prepare_v2",f.length);
    };
  }/*sqlite3_prepare_v2/v3()*/;

  {/* Import C-level constants and structs... */
    const cJson = wasm.xCall('sqlite3_wasm_enum_json');
    if(!cJson){
      toss("Maintenance required: increase sqlite3_wasm_enum_json()'s",
           "static buffer size!");
    }
    wasm.ctype = JSON.parse(wasm.cstringToJs(cJson));
    //console.debug('wasm.ctype length =',wasm.cstrlen(cJson));
    for(const t of ['access', 'blobFinalizers', 'dataTypes',
                    'encodings', 'fcntl', 'flock', 'ioCap',
                    'openFlags', 'prepareFlags', 'resultCodes',
                    'serialize', 'syncFlags', 'trace', 'udfFlags',
                    'version'
                   ]){
      for(const e of Object.entries(wasm.ctype[t])){
        // ^^^ [k,v] there triggers a buggy code transormation via one
        // of the Emscripten-driven optimizers.
        capi[e[0]] = e[1];
      }
    }
    const __rcMap = Object.create(null);
    for(const t of ['resultCodes']){
      for(const e of Object.entries(wasm.ctype[t])){
        __rcMap[e[1]] = e[0];
      }
    }
    /**
       For the given integer, returns the SQLITE_xxx result code as a
       string, or undefined if no such mapping is found.
    */
    capi.sqlite3_js_rc_str = (rc)=>__rcMap[rc];
    /* Bind all registered C-side structs... */
    const notThese = Object.assign(Object.create(null),{
      // Structs NOT to register
      WasmTestStruct: true
    });
    if(!util.isUIThread()){
      /* We remove the kvvfs VFS from Worker threads below. */
      notThese.sqlite3_kvvfs_methods = true;
    }
    for(const s of wasm.ctype.structs){
      if(!notThese[s.name]){
        capi[s.name] = sqlite3.StructBinder(s);
      }
    }
  }/*end C constant imports*/

  const pKvvfs = capi.sqlite3_vfs_find("kvvfs");
  if( pKvvfs ){/* kvvfs-specific glue */
    if(util.isUIThread()){
      const kvvfsMethods = new capi.sqlite3_kvvfs_methods(
        wasm.exports.sqlite3_wasm_kvvfs_methods()
      );
      delete capi.sqlite3_kvvfs_methods;

      const kvvfsMakeKey = wasm.exports.sqlite3_wasm_kvvfsMakeKeyOnPstack,
            pstack = wasm.pstack,
            pAllocRaw = wasm.exports.sqlite3_wasm_pstack_alloc;

      const kvvfsStorage = (zClass)=>
            ((115/*=='s'*/===wasm.getMemValue(zClass))
             ? sessionStorage : localStorage);

      /**
         Implementations for members of the object referred to by
         sqlite3_wasm_kvvfs_methods(). We swap out the native
         implementations with these, which use localStorage or
         sessionStorage for their backing store.
      */
      const kvvfsImpls = {
        xRead: (zClass, zKey, zBuf, nBuf)=>{
          const stack = pstack.pointer,
                astack = wasm.scopedAllocPush();
          try {
            const zXKey = kvvfsMakeKey(zClass,zKey);
            if(!zXKey) return -3/*OOM*/;
            const jKey = wasm.cstringToJs(zXKey);
            const jV = kvvfsStorage(zClass).getItem(jKey);
            if(!jV) return -1;
            const nV = jV.length /* Note that we are relying 100% on v being
                                    ASCII so that jV.length is equal to the
                                    C-string's byte length. */;
            if(nBuf<=0) return nV;
            else if(1===nBuf){
              wasm.setMemValue(zBuf, 0);
              return nV;
            }
            const zV = wasm.scopedAllocCString(jV);
            if(nBuf > nV + 1) nBuf = nV + 1;
            wasm.heap8u().copyWithin(zBuf, zV, zV + nBuf - 1);
            wasm.setMemValue(zBuf + nBuf - 1, 0);
            return nBuf - 1;
          }catch(e){
            console.error("kvstorageRead()",e);
            return -2;
          }finally{
            pstack.restore(stack);
            wasm.scopedAllocPop(astack);
          }
        },
        xWrite: (zClass, zKey, zData)=>{
          const stack = pstack.pointer;
          try {
            const zXKey = kvvfsMakeKey(zClass,zKey);
            if(!zXKey) return 1/*OOM*/;
            const jKey = wasm.cstringToJs(zXKey);
            kvvfsStorage(zClass).setItem(jKey, wasm.cstringToJs(zData));
            return 0;
          }catch(e){
            console.error("kvstorageWrite()",e);
            return capi.SQLITE_IOERR;
          }finally{
            pstack.restore(stack);
          }
        },
        xDelete: (zClass, zKey)=>{
          const stack = pstack.pointer;
          try {
            const zXKey = kvvfsMakeKey(zClass,zKey);
            if(!zXKey) return 1/*OOM*/;
            kvvfsStorage(zClass).removeItem(wasm.cstringToJs(zXKey));
            return 0;
          }catch(e){
            console.error("kvstorageDelete()",e);
            return capi.SQLITE_IOERR;
          }finally{
            pstack.restore(stack);
          }
        }
      }/*kvvfsImpls*/;
      for(const k of Object.keys(kvvfsImpls)){
        kvvfsMethods[kvvfsMethods.memberKey(k)] =
          wasm.installFunction(
            kvvfsMethods.memberSignature(k),
            kvvfsImpls[k]
          );
      }
    }else{
      /* Worker thread: unregister kvvfs to avoid it being used
         for anything other than local/sessionStorage. It "can"
         be used that way but it's not really intended to be. */
      capi.sqlite3_vfs_unregister(pKvvfs);
    }
  }/*pKvvfs*/

});
/* END FILE: api/sqlite3-api-glue.js */
/* BEGIN FILE: ./bld/sqlite3-api-build-version.js */
self.sqlite3ApiBootstrap.initializers.push(function(sqlite3){
  sqlite3.version = {"libVersion": "3.40.0", "libVersionNumber": 3040000, "sourceId": "2022-11-02 14:08:59 70ee6ee014bc4e2c1daa9b4a8909cf76ccecf32de1eb39055f20d3d0b1daalt1","downloadVersion": 3400000};
});
/* END FILE: ./bld/sqlite3-api-build-version.js */
/* BEGIN FILE: api/sqlite3-api-oo1.js */
/*
  2022-07-22

  The author disclaims copyright to this source code.  In place of a
  legal notice, here is a blessing:

  *   May you do good and not evil.
  *   May you find forgiveness for yourself and forgive others.
  *   May you share freely, never taking more than you give.

  ***********************************************************************

  This file contains the so-called OO #1 API wrapper for the sqlite3
  WASM build. It requires that sqlite3-api-glue.js has already run
  and it installs its deliverable as self.sqlite3.oo1.
*/
self.sqlite3ApiBootstrap.initializers.push(function(sqlite3){
  const toss = (...args)=>{throw new Error(args.join(' '))};
  const toss3 = (...args)=>{throw new sqlite3.SQLite3Error(...args)};

  const capi = sqlite3.capi, wasm = sqlite3.wasm, util = sqlite3.util;
  /* What follows is colloquially known as "OO API #1". It is a
     binding of the sqlite3 API which is designed to be run within
     the same thread (main or worker) as the one in which the
     sqlite3 WASM binding was initialized. This wrapper cannot use
     the sqlite3 binding if, e.g., the wrapper is in the main thread
     and the sqlite3 API is in a worker. */

  /**
     In order to keep clients from manipulating, perhaps
     inadvertently, the underlying pointer values of DB and Stmt
     instances, we'll gate access to them via the `pointer` property
     accessor and store their real values in this map. Keys = DB/Stmt
     objects, values = pointer values. This also unifies how those are
     accessed, for potential use downstream via custom
     wasm.xWrap() function signatures which know how to extract
     it.
  */
  const __ptrMap = new WeakMap();
  /**
     Map of DB instances to objects, each object being a map of Stmt
     wasm pointers to Stmt objects.
  */
  const __stmtMap = new WeakMap();

  /** If object opts has _its own_ property named p then that
      property's value is returned, else dflt is returned. */
  const getOwnOption = (opts, p, dflt)=>{
    const d = Object.getOwnPropertyDescriptor(opts,p);
    return d ? d.value : dflt;
  };

  // Documented in DB.checkRc()
  const checkSqlite3Rc = function(dbPtr, sqliteResultCode){
    if(sqliteResultCode){
      if(dbPtr instanceof DB) dbPtr = dbPtr.pointer;
      toss3(
        "sqlite result code",sqliteResultCode+":",
        (dbPtr
         ? capi.sqlite3_errmsg(dbPtr)
         : capi.sqlite3_errstr(sqliteResultCode))
      );
    }
  };

  /**
     sqlite3_trace_v2() callback which gets installed by the DB ctor
     if its open-flags contain "t".
  */
  const __dbTraceToConsole =
        wasm.installFunction('i(ippp)', function(t,c,p,x){
          if(capi.SQLITE_TRACE_STMT===t){
            // x == SQL, p == sqlite3_stmt*
            console.log("SQL TRACE #"+(++this.counter),
                        wasm.cstringToJs(x));
          }
        }.bind({counter: 0}));

  /**
     A map of sqlite3_vfs pointers to SQL code to run when the DB
     constructor opens a database with the given VFS.
  */
  const __vfsPostOpenSql = Object.create(null);

  /**
     A proxy for DB class constructors. It must be called with the
     being-construct DB object as its "this". See the DB constructor
     for the argument docs. This is split into a separate function
     in order to enable simple creation of special-case DB constructors,
     e.g. JsStorageDb and OpfsDb.

     Expects to be passed a configuration object with the following
     properties:

     - `.filename`: the db filename. It may be a special name like ":memory:"
       or "".

     - `.flags`: as documented in the DB constructor.

     - `.vfs`: as documented in the DB constructor.

     It also accepts those as the first 3 arguments.
  */
  const dbCtorHelper = function ctor(...args){
    if(!ctor._name2vfs){
      /**
         Map special filenames which we handle here (instead of in C)
         to some helpful metadata...

         As of 2022-09-20, the C API supports the names :localStorage:
         and :sessionStorage: for kvvfs. However, C code cannot
         determine (without embedded JS code, e.g. via Emscripten's
         EM_JS()) whether the kvvfs is legal in the current browser
         context (namely the main UI thread). In order to help client
         code fail early on, instead of it being delayed until they
         try to read or write a kvvfs-backed db, we'll check for those
         names here and throw if they're not legal in the current
         context.
      */
      ctor._name2vfs = Object.create(null);
      const isWorkerThread = ('function'===typeof importScripts/*===running in worker thread*/)
            ? (n)=>toss3("The VFS for",n,"is only available in the main window thread.")
            : false;
      ctor._name2vfs[':localStorage:'] = {
        vfs: 'kvvfs', filename: isWorkerThread || (()=>'local')
      };
      ctor._name2vfs[':sessionStorage:'] = {
        vfs: 'kvvfs', filename: isWorkerThread || (()=>'session')
      };
    }
    const opt = ctor.normalizeArgs(...args);
    let fn = opt.filename, vfsName = opt.vfs, flagsStr = opt.flags;
    if(('string'!==typeof fn && 'number'!==typeof fn)
       || 'string'!==typeof flagsStr
       || (vfsName && ('string'!==typeof vfsName && 'number'!==typeof vfsName))){
      console.error("Invalid DB ctor args",opt,arguments);
      toss3("Invalid arguments for DB constructor.");
    }
    let fnJs = ('number'===typeof fn) ? wasm.cstringToJs(fn) : fn;
    const vfsCheck = ctor._name2vfs[fnJs];
    if(vfsCheck){
      vfsName = vfsCheck.vfs;
      fn = fnJs = vfsCheck.filename(fnJs);
    }
    let pDb, oflags = 0;
    if( flagsStr.indexOf('c')>=0 ){
      oflags |= capi.SQLITE_OPEN_CREATE | capi.SQLITE_OPEN_READWRITE;
    }
    if( flagsStr.indexOf('w')>=0 ) oflags |= capi.SQLITE_OPEN_READWRITE;
    if( 0===oflags ) oflags |= capi.SQLITE_OPEN_READONLY;
    oflags |= capi.SQLITE_OPEN_EXRESCODE;
    const stack = wasm.pstack.pointer;
    try {
      const pPtr = wasm.pstack.allocPtr() /* output (sqlite3**) arg */;
      let rc = capi.sqlite3_open_v2(fn, pPtr, oflags, vfsName || 0);
      pDb = wasm.getPtrValue(pPtr);
      checkSqlite3Rc(pDb, rc);
      if(flagsStr.indexOf('t')>=0){
        capi.sqlite3_trace_v2(pDb, capi.SQLITE_TRACE_STMT,
                              __dbTraceToConsole, 0);
      }
      // Check for per-VFS post-open SQL...
      const pVfs = capi.sqlite3_js_db_vfs(pDb);
      //console.warn("Opened db",fn,"with vfs",vfsName,pVfs);
      if(!pVfs) toss3("Internal error: cannot get VFS for new db handle.");
      const postInitSql = __vfsPostOpenSql[pVfs];
      if(postInitSql){
        rc = capi.sqlite3_exec(pDb, postInitSql, 0, 0, 0);
        checkSqlite3Rc(pDb, rc);
      }      
    }catch( e ){
      if( pDb ) capi.sqlite3_close_v2(pDb);
      throw e;
    }finally{
      wasm.pstack.restore(stack);
    }
    this.filename = fnJs;
    __ptrMap.set(this, pDb);
    __stmtMap.set(this, Object.create(null));
  };

  /**
     Sets SQL which should be exec()'d on a DB instance after it is
     opened with the given VFS pointer. This is intended only for use
     by DB subclasses or sqlite3_vfs implementations.
  */
  dbCtorHelper.setVfsPostOpenSql = function(pVfs, sql){
    __vfsPostOpenSql[pVfs] = sql;
  };

  /**
     A helper for DB constructors. It accepts either a single
     config-style object or up to 3 arguments (filename, dbOpenFlags,
     dbVfsName). It returns a new object containing:

     { filename: ..., flags: ..., vfs: ... }

     If passed an object, any additional properties it has are copied
     as-is into the new object.
  */
  dbCtorHelper.normalizeArgs = function(filename=':memory:',flags = 'c',vfs = null){
    const arg = {};
    if(1===arguments.length && 'object'===typeof arguments[0]){
      const x = arguments[0];
      Object.keys(x).forEach((k)=>arg[k] = x[k]);
      if(undefined===arg.flags) arg.flags = 'c';
      if(undefined===arg.vfs) arg.vfs = null;
      if(undefined===arg.filename) arg.filename = ':memory:';
    }else{
      arg.filename = filename;
      arg.flags = flags;
      arg.vfs = vfs;
    }
    return arg;
  };
  /**
     The DB class provides a high-level OO wrapper around an sqlite3
     db handle.

     The given db filename must be resolvable using whatever
     filesystem layer (virtual or otherwise) is set up for the default
     sqlite3 VFS.

     Note that the special sqlite3 db names ":memory:" and ""
     (temporary db) have their normal special meanings here and need
     not resolve to real filenames, but "" uses an on-storage
     temporary database and requires that the VFS support that.

     The second argument specifies the open/create mode for the
     database. It must be string containing a sequence of letters (in
     any order, but case sensitive) specifying the mode:

     - "c": create if it does not exist, else fail if it does not
       exist. Implies the "w" flag.

     - "w": write. Implies "r": a db cannot be write-only.

     - "r": read-only if neither "w" nor "c" are provided, else it
       is ignored.

     - "t": enable tracing of SQL executed on this database handle,
       sending it to `console.log()`. To disable it later, call
       `sqlite3.capi.sqlite3_trace_v2(thisDb.pointer, 0, 0, 0)`.

     If "w" is not provided, the db is implicitly read-only, noting
     that "rc" is meaningless

     Any other letters are currently ignored. The default is
     "c". These modes are ignored for the special ":memory:" and ""
     names and _may_ be ignored altogether for certain VFSes.

     The final argument is analogous to the final argument of
     sqlite3_open_v2(): the name of an sqlite3 VFS. Pass a falsy value,
     or none at all, to use the default. If passed a value, it must
     be the string name of a VFS.

     The constructor optionally (and preferably) takes its arguments
     in the form of a single configuration object with the following
     properties:

     - `filename`: database file name
     - `flags`: open-mode flags
     - `vfs`: the VFS fname

     The `filename` and `vfs` arguments may be either JS strings or
     C-strings allocated via WASM. `flags` is required to be a JS
     string (because it's specific to this API, which is specific
     to JS).

     For purposes of passing a DB instance to C-style sqlite3
     functions, the DB object's read-only `pointer` property holds its
     `sqlite3*` pointer value. That property can also be used to check
     whether this DB instance is still open.

     In the main window thread, the filenames `":localStorage:"` and
     `":sessionStorage:"` are special: they cause the db to use either
     localStorage or sessionStorage for storing the database using
     the kvvfs. If one of these names are used, they trump
     any vfs name set in the arguments.
  */
  const DB = function(...args){
    dbCtorHelper.apply(this, args);
  };
  DB.dbCtorHelper = dbCtorHelper;

  /**
     Internal-use enum for mapping JS types to DB-bindable types.
     These do not (and need not) line up with the SQLITE_type
     values. All values in this enum must be truthy and distinct
     but they need not be numbers.
  */
  const BindTypes = {
    null: 1,
    number: 2,
    string: 3,
    boolean: 4,
    blob: 5
  };
  BindTypes['undefined'] == BindTypes.null;
  if(wasm.bigIntEnabled){
    BindTypes.bigint = BindTypes.number;
  }

  /**
     This class wraps sqlite3_stmt. Calling this constructor
     directly will trigger an exception. Use DB.prepare() to create
     new instances.

     For purposes of passing a Stmt instance to C-style sqlite3
     functions, its read-only `pointer` property holds its `sqlite3_stmt*`
     pointer value.

     Other non-function properties include:

     - `db`: the DB object which created the statement.

     - `columnCount`: the number of result columns in the query, or 0 for
     queries which cannot return results.

     - `parameterCount`: the number of bindable paramters in the query.
  */
  const Stmt = function(){
    if(BindTypes!==arguments[2]){
      toss3("Do not call the Stmt constructor directly. Use DB.prepare().");
    }
    this.db = arguments[0];
    __ptrMap.set(this, arguments[1]);
    this.columnCount = capi.sqlite3_column_count(this.pointer);
    this.parameterCount = capi.sqlite3_bind_parameter_count(this.pointer);
  };

  /** Throws if the given DB has been closed, else it is returned. */
  const affirmDbOpen = function(db){
    if(!db.pointer) toss3("DB has been closed.");
    return db;
  };

  /** Throws if ndx is not an integer or if it is out of range
      for stmt.columnCount, else returns stmt.

      Reminder: this will also fail after the statement is finalized
      but the resulting error will be about an out-of-bounds column
      index rather than a statement-is-finalized error.
  */
  const affirmColIndex = function(stmt,ndx){
    if((ndx !== (ndx|0)) || ndx<0 || ndx>=stmt.columnCount){
      toss3("Column index",ndx,"is out of range.");
    }
    return stmt;
  };

  /**
     Expects to be passed the `arguments` object from DB.exec(). Does
     the argument processing/validation, throws on error, and returns
     a new object on success:

     { sql: the SQL, opt: optionsObj, cbArg: function}

     The opt object is a normalized copy of any passed to this
     function. The sql will be converted to a string if it is provided
     in one of the supported non-string formats.

     cbArg is only set if the opt.callback or opt.resultRows are set,
     in which case it's a function which expects to be passed the
     current Stmt and returns the callback argument of the type
     indicated by the input arguments.
  */
  const parseExecArgs = function(db, args){
    const out = Object.create(null);
    out.opt = Object.create(null);
    switch(args.length){
        case 1:
          if('string'===typeof args[0] || util.isSQLableTypedArray(args[0])){
            out.sql = args[0];
          }else if(Array.isArray(args[0])){
            out.sql = args[0];
          }else if(args[0] && 'object'===typeof args[0]){
            out.opt = args[0];
            out.sql = out.opt.sql;
          }
          break;
        case 2:
          out.sql = args[0];
          out.opt = args[1];
          break;
        default: toss3("Invalid argument count for exec().");
    };
    out.sql = util.flexibleString(out.sql);
    if('string'!==typeof out.sql){
      toss3("Missing SQL argument or unsupported SQL value type.");
    }
    const opt = out.opt;
    switch(opt.returnValue){
        case 'resultRows':
          if(!opt.resultRows) opt.resultRows = [];
          out.returnVal = ()=>opt.resultRows;
          break;
        case 'saveSql':
          if(!opt.saveSql) opt.saveSql = [];
          out.returnVal = ()=>opt.saveSql;
          break;
        case undefined:
        case 'this':
          out.returnVal = ()=>db;
          break;
        default:
          toss3("Invalid returnValue value:",opt.returnValue);
    }
    if(opt.callback || opt.resultRows){
      switch((undefined===opt.rowMode)
             ? 'array' : opt.rowMode) {
          case 'object': out.cbArg = (stmt)=>stmt.get(Object.create(null)); break;
          case 'array': out.cbArg = (stmt)=>stmt.get([]); break;
          case 'stmt':
            if(Array.isArray(opt.resultRows)){
              toss3("exec(): invalid rowMode for a resultRows array: must",
                    "be one of 'array', 'object',",
                    "a result column number, or column name reference.");
            }
            out.cbArg = (stmt)=>stmt;
            break;
          default:
            if(util.isInt32(opt.rowMode)){
              out.cbArg = (stmt)=>stmt.get(opt.rowMode);
              break;
            }else if('string'===typeof opt.rowMode && opt.rowMode.length>1){
              /* "$X", ":X", and "@X" fetch column named "X" (case-sensitive!) */
              const prefix = opt.rowMode[0];
              if(':'===prefix || '@'===prefix || '$'===prefix){
                out.cbArg = function(stmt){
                  const rc = stmt.get(this.obj)[this.colName];
                  return (undefined===rc) ? toss3("exec(): unknown result column:",this.colName) : rc;
                }.bind({
                  obj:Object.create(null),
                  colName: opt.rowMode.substr(1)
                });
                break;
              }
            }
            toss3("Invalid rowMode:",opt.rowMode);
      }
    }
    return out;
  };

  /**
     Internal impl of the DB.selectArray() and
     selectObject() methods.
  */
  const __selectFirstRow = (db, sql, bind, getArg)=>{
    let stmt, rc;
    try {
      stmt = db.prepare(sql).bind(bind);
      if(stmt.step()) rc = stmt.get(getArg);
    }finally{
      if(stmt) stmt.finalize();
    }
    return rc;
  };

  /**
     Expects to be given a DB instance or an `sqlite3*` pointer (may
     be null) and an sqlite3 API result code. If the result code is
     not falsy, this function throws an SQLite3Error with an error
     message from sqlite3_errmsg(), using dbPtr as the db handle, or
     sqlite3_errstr() if dbPtr is falsy. Note that if it's passed a
     non-error code like SQLITE_ROW or SQLITE_DONE, it will still
     throw but the error string might be "Not an error."  The various
     non-0 non-error codes need to be checked for in
     client code where they are expected.
  */
  DB.checkRc = checkSqlite3Rc;

  DB.prototype = {
    /** Returns true if this db handle is open, else false. */
    isOpen: function(){
      return !!this.pointer;
    },
    /** Throws if this given DB has been closed, else returns `this`. */
    affirmOpen: function(){
      return affirmDbOpen(this);
    },
    /**
       Finalizes all open statements and closes this database
       connection. This is a no-op if the db has already been
       closed. After calling close(), `this.pointer` will resolve to
       `undefined`, so that can be used to check whether the db
       instance is still opened.

       If this.onclose.before is a function then it is called before
       any close-related cleanup.

       If this.onclose.after is a function then it is called after the
       db is closed but before auxiliary state like this.filename is
       cleared.

       Both onclose handlers are passed this object. If this db is not
       opened, neither of the handlers are called. Any exceptions the
       handlers throw are ignored because "destructors must not
       throw."

       Note that garbage collection of a db handle, if it happens at
       all, will never trigger close(), so onclose handlers are not a
       reliable way to implement close-time cleanup or maintenance of
       a db.
    */
    close: function(){
      if(this.pointer){
        if(this.onclose && (this.onclose.before instanceof Function)){
          try{this.onclose.before(this)}
          catch(e){/*ignore*/}
        }
        const pDb = this.pointer;
        Object.keys(__stmtMap.get(this)).forEach((k,s)=>{
          if(s && s.pointer) s.finalize();
        });
        __ptrMap.delete(this);
        __stmtMap.delete(this);
        capi.sqlite3_close_v2(pDb);
        if(this.onclose && (this.onclose.after instanceof Function)){
          try{this.onclose.after(this)}
          catch(e){/*ignore*/}
        }
        delete this.filename;
      }
    },
    /**
       Returns the number of changes, as per sqlite3_changes()
       (if the first argument is false) or sqlite3_total_changes()
       (if it's true). If the 2nd argument is true, it uses
       sqlite3_changes64() or sqlite3_total_changes64(), which
       will trigger an exception if this build does not have
       BigInt support enabled.
    */
    changes: function(total=false,sixtyFour=false){
      const p = affirmDbOpen(this).pointer;
      if(total){
        return sixtyFour
          ? capi.sqlite3_total_changes64(p)
          : capi.sqlite3_total_changes(p);
      }else{
        return sixtyFour
          ? capi.sqlite3_changes64(p)
          : capi.sqlite3_changes(p);
      }
    },
    /**
       Similar to the this.filename but returns the
       sqlite3_db_filename() value for the given database name,
       defaulting to "main".  The argument may be either a JS string
       or a pointer to a WASM-allocated C-string.
    */
    dbFilename: function(dbName='main'){
      return capi.sqlite3_db_filename(affirmDbOpen(this).pointer, dbName);
    },
    /**
       Returns the name of the given 0-based db number, as documented
       for sqlite3_db_name().
    */
    dbName: function(dbNumber=0){
      return capi.sqlite3_db_name(affirmDbOpen(this).pointer, dbNumber);
    },
    /**
       Returns the name of the sqlite3_vfs used by the given database
       of this connection (defaulting to 'main'). The argument may be
       either a JS string or a WASM C-string. Returns undefined if the
       given db name is invalid. Throws if this object has been
       close()d.
    */
    dbVfsName: function(dbName=0){
      let rc;
      const pVfs = capi.sqlite3_js_db_vfs(
        affirmDbOpen(this).pointer, dbName
      );
      if(pVfs){
        const v = new capi.sqlite3_vfs(pVfs);
        try{ rc = wasm.cstringToJs(v.$zName) }
        finally { v.dispose() }
      }
      return rc;        
    },
    /**
       Compiles the given SQL and returns a prepared Stmt. This is
       the only way to create new Stmt objects. Throws on error.

       The given SQL must be a string, a Uint8Array holding SQL, a
       WASM pointer to memory holding the NUL-terminated SQL string,
       or an array of strings. In the latter case, the array is
       concatenated together, with no separators, to form the SQL
       string (arrays are often a convenient way to formulate long
       statements).  If the SQL contains no statements, an
       SQLite3Error is thrown.

       Design note: the C API permits empty SQL, reporting it as a 0
       result code and a NULL stmt pointer. Supporting that case here
       would cause extra work for all clients: any use of the Stmt API
       on such a statement will necessarily throw, so clients would be
       required to check `stmt.pointer` after calling `prepare()` in
       order to determine whether the Stmt instance is empty or not.
       Long-time practice (with other sqlite3 script bindings)
       suggests that the empty-prepare case is sufficiently rare that
       supporting it here would simply hurt overall usability.
    */
    prepare: function(sql){
      affirmDbOpen(this);
      const stack = wasm.pstack.pointer;
      let ppStmt, pStmt;
      try{
        ppStmt = wasm.pstack.alloc(8)/* output (sqlite3_stmt**) arg */;
        DB.checkRc(this, capi.sqlite3_prepare_v2(this.pointer, sql, -1, ppStmt, null));
        pStmt = wasm.getPtrValue(ppStmt);
      }
      finally {
        wasm.pstack.restore(stack);
      }
      if(!pStmt) toss3("Cannot prepare empty SQL.");
      const stmt = new Stmt(this, pStmt, BindTypes);
      __stmtMap.get(this)[pStmt] = stmt;
      return stmt;
    },
    /**
       Executes one or more SQL statements in the form of a single
       string. Its arguments must be either (sql,optionsObject) or
       (optionsObject). In the latter case, optionsObject.sql must
       contain the SQL to execute. By default it returns this object
       but that can be changed via the `returnValue` option as
       described below. Throws on error.

       If no SQL is provided, or a non-string is provided, an
       exception is triggered. Empty SQL, on the other hand, is
       simply a no-op.

       The optional options object may contain any of the following
       properties:

       - `sql` = the SQL to run (unless it's provided as the first
       argument). This must be of type string, Uint8Array, or an array
       of strings. In the latter case they're concatenated together
       as-is, _with no separator_ between elements, before evaluation.
       The array form is often simpler for long hand-written queries.

       - `bind` = a single value valid as an argument for
       Stmt.bind(). This is _only_ applied to the _first_ non-empty
       statement in the SQL which has any bindable parameters. (Empty
       statements are skipped entirely.)

       - `saveSql` = an optional array. If set, the SQL of each
       executed statement is appended to this array before the
       statement is executed (but after it is prepared - we don't have
       the string until after that). Empty SQL statements are elided
       but can have odd effects in the output. e.g. SQL of: `"select
       1; -- empty\n; select 2"` will result in an array containing
       `["select 1;", "--empty \n; select 2"]`. That's simply how
       sqlite3 records the SQL for the 2nd statement.

       ==================================================================
       The following options apply _only_ to the _first_ statement
       which has a non-zero result column count, regardless of whether
       the statement actually produces any result rows.
       ==================================================================

       - `columnNames`: if this is an array, the column names of the
       result set are stored in this array before the callback (if
       any) is triggered (regardless of whether the query produces any
       result rows). If no statement has result columns, this value is
       unchanged. Achtung: an SQL result may have multiple columns
       with identical names.

       - `callback` = a function which gets called for each row of
       the result set, but only if that statement has any result
       _rows_. The callback's "this" is the options object, noting
       that this function synthesizes one if the caller does not pass
       one to exec(). The second argument passed to the callback is
       always the current Stmt object, as it's needed if the caller
       wants to fetch the column names or some such (noting that they
       could also be fetched via `this.columnNames`, if the client
       provides the `columnNames` option).

       ACHTUNG: The callback MUST NOT modify the Stmt object. Calling
       any of the Stmt.get() variants, Stmt.getColumnName(), or
       similar, is legal, but calling step() or finalize() is
       not. Member methods which are illegal in this context will
       trigger an exception.

       The first argument passed to the callback defaults to an array of
       values from the current result row but may be changed with ...

       - `rowMode` = specifies the type of he callback's first argument.
       It may be any of...

       A) A string describing what type of argument should be passed
       as the first argument to the callback:

         A.1) `'array'` (the default) causes the results of
         `stmt.get([])` to be passed to the `callback` and/or appended
         to `resultRows`

         A.2) `'object'` causes the results of
         `stmt.get(Object.create(null))` to be passed to the
         `callback` and/or appended to `resultRows`.  Achtung: an SQL
         result may have multiple columns with identical names. In
         that case, the right-most column will be the one set in this
         object!

         A.3) `'stmt'` causes the current Stmt to be passed to the
         callback, but this mode will trigger an exception if
         `resultRows` is an array because appending the statement to
         the array would be downright unhelpful.

       B) An integer, indicating a zero-based column in the result
       row. Only that one single value will be passed on.

       C) A string with a minimum length of 2 and leading character of
       ':', '$', or '@' will fetch the row as an object, extract that
       one field, and pass that field's value to the callback. Note
       that these keys are case-sensitive so must match the case used
       in the SQL. e.g. `"select a A from t"` with a `rowMode` of
       `'$A'` would work but `'$a'` would not. A reference to a column
       not in the result set will trigger an exception on the first
       row (as the check is not performed until rows are fetched).
       Note also that `$` is a legal identifier character in JS so
       need not be quoted. (Design note: those 3 characters were
       chosen because they are the characters support for naming bound
       parameters.)

       Any other `rowMode` value triggers an exception.

       - `resultRows`: if this is an array, it functions similarly to
       the `callback` option: each row of the result set (if any),
       with the exception that the `rowMode` 'stmt' is not legal. It
       is legal to use both `resultRows` and `callback`, but
       `resultRows` is likely much simpler to use for small data sets
       and can be used over a WebWorker-style message interface.
       exec() throws if `resultRows` is set and `rowMode` is 'stmt'.

       - `returnValue`: is a string specifying what this function
       should return:

         A) The default value is `"this"`, meaning that the
            DB object itself should be returned.

         B) `"resultRows"` means to return the value of the
            `resultRows` option. If `resultRows` is not set, this
            function behaves as if it were set to an empty array.

         C) `"saveSql"` means to return the value of the
            `saveSql` option. If `saveSql` is not set, this
            function behaves as if it were set to an empty array.

       Potential TODOs:

       - `bind`: permit an array of arrays/objects to bind. The first
       sub-array would act on the first statement which has bindable
       parameters (as it does now). The 2nd would act on the next such
       statement, etc.

       - `callback` and `resultRows`: permit an array entries with
       semantics similar to those described for `bind` above.

    */
    exec: function(/*(sql [,obj]) || (obj)*/){
      affirmDbOpen(this);
      const arg = parseExecArgs(this, arguments);
      if(!arg.sql){
        return toss3("exec() requires an SQL string.");
      }
      const opt = arg.opt;
      const callback = opt.callback;
      const resultRows =
            Array.isArray(opt.resultRows) ? opt.resultRows : undefined;
      let stmt;
      let bind = opt.bind;
      let evalFirstResult = !!(arg.cbArg || opt.columnNames) /* true to evaluate the first result-returning query */;
      const stack = wasm.scopedAllocPush();
      try{
        const isTA = util.isSQLableTypedArray(arg.sql)
        /* Optimization: if the SQL is a TypedArray we can save some string
           conversion costs. */;
        /* Allocate the two output pointers (ppStmt, pzTail) and heap
           space for the SQL (pSql). When prepare_v2() returns, pzTail
           will point to somewhere in pSql. */
        let sqlByteLen = isTA ? arg.sql.byteLength : wasm.jstrlen(arg.sql);
        const ppStmt  = wasm.scopedAlloc(/* output (sqlite3_stmt**) arg and pzTail */
          (2 * wasm.ptrSizeof)
          + (sqlByteLen + 1/* SQL + NUL */));
        const pzTail = ppStmt + wasm.ptrSizeof /* final arg to sqlite3_prepare_v2() */;
        let pSql = pzTail + wasm.ptrSizeof;
        const pSqlEnd = pSql + sqlByteLen;
        if(isTA) wasm.heap8().set(arg.sql, pSql);
        else wasm.jstrcpy(arg.sql, wasm.heap8(), pSql, sqlByteLen, false);
        wasm.setMemValue(pSql + sqlByteLen, 0/*NUL terminator*/);
        while(pSql && wasm.getMemValue(pSql, 'i8')
              /* Maintenance reminder:^^^ _must_ be 'i8' or else we
                 will very likely cause an endless loop. What that's
                 doing is checking for a terminating NUL byte. If we
                 use i32 or similar then we read 4 bytes, read stuff
                 around the NUL terminator, and get stuck in and
                 endless loop at the end of the SQL, endlessly
                 re-preparing an empty statement. */ ){
          wasm.setPtrValue(ppStmt, 0);
          wasm.setPtrValue(pzTail, 0);
          DB.checkRc(this, capi.sqlite3_prepare_v3(
            this.pointer, pSql, sqlByteLen, 0, ppStmt, pzTail
          ));
          const pStmt = wasm.getPtrValue(ppStmt);
          pSql = wasm.getPtrValue(pzTail);
          sqlByteLen = pSqlEnd - pSql;
          if(!pStmt) continue;
          if(Array.isArray(opt.saveSql)){
            opt.saveSql.push(capi.sqlite3_sql(pStmt).trim());
          }
          stmt = new Stmt(this, pStmt, BindTypes);
          if(bind && stmt.parameterCount){
            stmt.bind(bind);
            bind = null;
          }
          if(evalFirstResult && stmt.columnCount){
            /* Only forward SELECT results for the FIRST query
               in the SQL which potentially has them. */
            evalFirstResult = false;
            if(Array.isArray(opt.columnNames)){
              stmt.getColumnNames(opt.columnNames);
            }
            while(!!arg.cbArg && stmt.step()){
              stmt._isLocked = true;
              const row = arg.cbArg(stmt);
              if(resultRows) resultRows.push(row);
              if(callback) callback.call(opt, row, stmt);
              stmt._isLocked = false;
            }
          }else{
            stmt.step();
          }
          stmt.finalize();
          stmt = null;
        }
      }/*catch(e){
        console.warn("DB.exec() is propagating exception",opt,e);
        throw e;
      }*/finally{
        if(stmt){
          delete stmt._isLocked;
          stmt.finalize();
        }
        wasm.scopedAllocPop(stack);
      }
      return arg.returnVal();
    }/*exec()*/,
    /**
       Creates a new scalar UDF (User-Defined Function) which is
       accessible via SQL code. This function may be called in any
       of the following forms:

       - (name, function)
       - (name, function, optionsObject)
       - (name, optionsObject)
       - (optionsObject)

       In the final two cases, the function must be defined as the
       `callback` property of the options object (optionally called
       `xFunc` to align with the C API documentation). In the final
       case, the function's name must be the 'name' property.

       The first two call forms can only be used for creating scalar
       functions. Creating an aggregate or window function requires
       the options-object form (see below for details).

       UDFs cannot currently be removed from a DB handle after they're
       added. More correctly, they can be removed as documented for
       sqlite3_create_function_v2(), but doing so will "leak" the
       JS-created WASM binding of those functions.

       On success, returns this object. Throws on error.

       When called from SQL arguments to the UDF, and its result,
       will be converted between JS and SQL with as much fidelity as
       is feasible, triggering an exception if a type conversion
       cannot be determined. The docs for sqlite3_create_function_v2()
       describe the conversions in more detail.

       The values set in the options object differ for scalar and
       aggregate functions:

       - Scalar: set the `xFunc` function-type property to the UDF
         function.

       - Aggregate: set the `xStep` and `xFinal` function-type
         properties to the "step" and "final" callbacks for the
         aggregate. Do not set the `xFunc` property.

       - Window: set the `xStep`, `xFinal`, `xValue`, and `xInverse`
         function-type properties. Do not set the `xFunc` property.

       The options object may optionally have an `xDestroy`
       function-type property, as per sqlite3_create_function_v2().
       Its argument will be the WASM-pointer-type value of the `pApp`
       property, and this function will throw if `pApp` is defined but
       is not null, undefined, or a numeric (WASM pointer)
       value. i.e. `pApp`, if set, must be value suitable for use as a
       WASM pointer argument, noting that `null` or `undefined` will
       translate to 0 for that purpose.

       The options object may contain flags to modify how
       the function is defined:

       - `arity`: the number of arguments which SQL calls to this
       function expect or require. The default value is `xFunc.length`
       or `xStep.length` (i.e. the number of declared parameters it
       has) **MINUS 1** (see below for why). As a special case, if the
       `length` is 0, its arity is also 0 instead of -1. A negative
       arity value means that the function is variadic and may accept
       any number of arguments, up to sqlite3's compile-time
       limits. sqlite3 will enforce the argument count if is zero or
       greater. The callback always receives a pointer to an
       `sqlite3_context` object as its first argument. Any arguments
       after that are from SQL code. The leading context argument does
       _not_ count towards the function's arity. See the docs for
       sqlite3.capi.sqlite3_create_function_v2() for why that argument
       is needed in the interface.

       The following options-object properties correspond to flags
       documented at:

       https://sqlite.org/c3ref/create_function.html

       - `deterministic` = sqlite3.capi.SQLITE_DETERMINISTIC
       - `directOnly` = sqlite3.capi.SQLITE_DIRECTONLY
       - `innocuous` = sqlite3.capi.SQLITE_INNOCUOUS

       Sidebar: the ability to add new WASM-accessible functions to
       the runtime requires that the WASM build is compiled with the
       equivalent functionality as that provided by Emscripten's
       `-sALLOW_TABLE_GROWTH` flag.
    */
    createFunction: function f(name, xFunc, opt){
      const isFunc = (f)=>(f instanceof Function);
      switch(arguments.length){
          case 1: /* (optionsObject) */
            opt = name;
            name = opt.name;
            xFunc = opt.xFunc || 0;
            break;
          case 2: /* (name, callback|optionsObject) */
            if(!isFunc(xFunc)){
              opt = xFunc;
              xFunc = opt.xFunc || 0;
            }
            break;
          case 3: /* name, xFunc, opt */
            break;
          default: break;
      }
      if(!opt) opt = {};
      if('string' !== typeof name){
        toss3("Invalid arguments: missing function name.");
      }
      let xStep = opt.xStep || 0;
      let xFinal = opt.xFinal || 0;
      const xValue = opt.xValue || 0;
      const xInverse = opt.xInverse || 0;
      let isWindow = undefined;
      if(isFunc(xFunc)){
        isWindow = false;
        if(isFunc(xStep) || isFunc(xFinal)){
          toss3("Ambiguous arguments: scalar or aggregate?");
        }
        xStep = xFinal = null;
      }else if(isFunc(xStep)){
        if(!isFunc(xFinal)){
          toss3("Missing xFinal() callback for aggregate or window UDF.");
        }
        xFunc = null;
      }else if(isFunc(xFinal)){
        toss3("Missing xStep() callback for aggregate or window UDF.");
      }else{
        toss3("Missing function-type properties.");
      }
      if(false === isWindow){
        if(isFunc(xValue) || isFunc(xInverse)){
          toss3("xValue and xInverse are not permitted for non-window UDFs.");
        }
      }else if(isFunc(xValue)){
        if(!isFunc(xInverse)){
          toss3("xInverse must be provided if xValue is.");
        }
        isWindow = true;
      }else if(isFunc(xInverse)){
        toss3("xValue must be provided if xInverse is.");
      }
      const pApp = opt.pApp;
      if(undefined!==pApp &&
         null!==pApp &&
         (('number'!==typeof pApp) || !util.isInt32(pApp))){
        toss3("Invalid value for pApp property. Must be a legal WASM pointer value.");
      }
      const xDestroy = opt.xDestroy || 0;
      if(xDestroy && !isFunc(xDestroy)){
        toss3("xDestroy property must be a function.");
      }
      let fFlags = 0 /*flags for sqlite3_create_function_v2()*/;
      if(getOwnOption(opt, 'deterministic')) fFlags |= capi.SQLITE_DETERMINISTIC;
      if(getOwnOption(opt, 'directOnly')) fFlags |= capi.SQLITE_DIRECTONLY;
      if(getOwnOption(opt, 'innocuous')) fFlags |= capi.SQLITE_INNOCUOUS;
      name = name.toLowerCase();
      const xArity = xFunc || xStep;
      const arity = getOwnOption(opt, 'arity');
      const arityArg = ('number'===typeof arity
                        ? arity
                        : (xArity.length ? xArity.length-1/*for pCtx arg*/ : 0));
      let rc;
      if( isWindow ){
        rc = capi.sqlite3_create_window_function(
          this.pointer, name, arityArg,
          capi.SQLITE_UTF8 | fFlags, pApp || 0,
          xStep, xFinal, xValue, xInverse, xDestroy);
      }else{
        rc = capi.sqlite3_create_function_v2(
          this.pointer, name, arityArg,
          capi.SQLITE_UTF8 | fFlags, pApp || 0,
          xFunc, xStep, xFinal, xDestroy);
      }
      DB.checkRc(this, rc);
      return this;
    }/*createFunction()*/,
    /**
       Prepares the given SQL, step()s it one time, and returns
       the value of the first result column. If it has no results,
       undefined is returned.

       If passed a second argument, it is treated like an argument
       to Stmt.bind(), so may be any type supported by that
       function. Passing the undefined value is the same as passing
       no value, which is useful when...

       If passed a 3rd argument, it is expected to be one of the
       SQLITE_{typename} constants. Passing the undefined value is
       the same as not passing a value.

       Throws on error (e.g. malformed SQL).
    */
    selectValue: function(sql,bind,asType){
      let stmt, rc;
      try {
        stmt = this.prepare(sql).bind(bind);
        if(stmt.step()) rc = stmt.get(0,asType);
      }finally{
        if(stmt) stmt.finalize();
      }
      return rc;
    },
    /**
       Prepares the given SQL, step()s it one time, and returns an
       array containing the values of the first result row. If it has
       no results, `undefined` is returned.

       If passed a second argument other than `undefined`, it is
       treated like an argument to Stmt.bind(), so may be any type
       supported by that function.

       Throws on error (e.g. malformed SQL).
    */
    selectArray: function(sql,bind){
      return __selectFirstRow(this, sql, bind, []);
    },

    /**
       Prepares the given SQL, step()s it one time, and returns an
       object containing the key/value pairs of the first result
       row. If it has no results, `undefined` is returned.

       Note that the order of returned object's keys is not guaranteed
       to be the same as the order of the fields in the query string.

       If passed a second argument other than `undefined`, it is
       treated like an argument to Stmt.bind(), so may be any type
       supported by that function.

       Throws on error (e.g. malformed SQL).
    */
    selectObject: function(sql,bind){
      return __selectFirstRow(this, sql, bind, {});
    },

    /**
       Returns the number of currently-opened Stmt handles for this db
       handle, or 0 if this DB instance is closed.
    */
    openStatementCount: function(){
      return this.pointer ? Object.keys(__stmtMap.get(this)).length : 0;
    },

    /**
       Starts a transaction, calls the given callback, and then either
       rolls back or commits the savepoint, depending on whether the
       callback throws. The callback is passed this db object as its
       only argument. On success, returns the result of the
       callback. Throws on error.

       Note that transactions may not be nested, so this will throw if
       it is called recursively. For nested transactions, use the
       savepoint() method or manually manage SAVEPOINTs using exec().
     */
    transaction: function(callback){
      affirmDbOpen(this).exec("BEGIN");
      try {
        const rc = callback(this);
        this.exec("COMMIT");
        return rc;
      }catch(e){
        this.exec("ROLLBACK");
        throw e;
      }
    },

    /**
       This works similarly to transaction() but uses sqlite3's SAVEPOINT
       feature. This function starts a savepoint (with an unspecified name)
       and calls the given callback function, passing it this db object.
       If the callback returns, the savepoint is released (committed). If
       the callback throws, the savepoint is rolled back. If it does not
       throw, it returns the result of the callback.
    */
    savepoint: function(callback){
      affirmDbOpen(this).exec("SAVEPOINT oo1");
      try {
        const rc = callback(this);
        this.exec("RELEASE oo1");
        return rc;
      }catch(e){
        this.exec("ROLLBACK to SAVEPOINT oo1; RELEASE SAVEPOINT oo1");
        throw e;
      }
    }
  }/*DB.prototype*/;


  /** Throws if the given Stmt has been finalized, else stmt is
      returned. */
  const affirmStmtOpen = function(stmt){
    if(!stmt.pointer) toss3("Stmt has been closed.");
    return stmt;
  };

  /** Returns an opaque truthy value from the BindTypes
      enum if v's type is a valid bindable type, else
      returns a falsy value. As a special case, a value of
      undefined is treated as a bind type of null. */
  const isSupportedBindType = function(v){
    let t = BindTypes[(null===v||undefined===v) ? 'null' : typeof v];
    switch(t){
        case BindTypes.boolean:
        case BindTypes.null:
        case BindTypes.number:
        case BindTypes.string:
          return t;
        case BindTypes.bigint:
          if(wasm.bigIntEnabled) return t;
          /* else fall through */
        default:
          //console.log("isSupportedBindType",t,v);
          return util.isBindableTypedArray(v) ? BindTypes.blob : undefined;
    }
  };

  /**
     If isSupportedBindType(v) returns a truthy value, this
     function returns that value, else it throws.
  */
  const affirmSupportedBindType = function(v){
    //console.log('affirmSupportedBindType',v);
    return isSupportedBindType(v) || toss3("Unsupported bind() argument type:",typeof v);
  };

  /**
     If key is a number and within range of stmt's bound parameter
     count, key is returned.

     If key is not a number then it is checked against named
     parameters. If a match is found, its index is returned.

     Else it throws.
  */
  const affirmParamIndex = function(stmt,key){
    const n = ('number'===typeof key)
          ? key : capi.sqlite3_bind_parameter_index(stmt.pointer, key);
    if(0===n || !util.isInt32(n)){
      toss3("Invalid bind() parameter name: "+key);
    }
    else if(n<1 || n>stmt.parameterCount) toss3("Bind index",key,"is out of range.");
    return n;
  };

  /**
     If stmt._isLocked is truthy, this throws an exception
     complaining that the 2nd argument (an operation name,
     e.g. "bind()") is not legal while the statement is "locked".
     Locking happens before an exec()-like callback is passed a
     statement, to ensure that the callback does not mutate or
     finalize the statement. If it does not throw, it returns stmt.
  */
  const affirmUnlocked = function(stmt,currentOpName){
    if(stmt._isLocked){
      toss3("Operation is illegal when statement is locked:",currentOpName);
    }
    return stmt;
  };

  /**
     Binds a single bound parameter value on the given stmt at the
     given index (numeric or named) using the given bindType (see
     the BindTypes enum) and value. Throws on error. Returns stmt on
     success.
  */
  const bindOne = function f(stmt,ndx,bindType,val){
    affirmUnlocked(stmt, 'bind()');
    if(!f._){
      f._tooBigInt = (v)=>toss3(
        "BigInt value is too big to store without precision loss:", v
      );
      /* Reminder: when not in BigInt mode, it's impossible for
         JS to represent a number out of the range we can bind,
         so we have no range checking. */
      f._ = {
        string: function(stmt, ndx, val, asBlob){
          if(1){
            /* _Hypothetically_ more efficient than the impl in the 'else' block. */
            const stack = wasm.scopedAllocPush();
            try{
              const n = wasm.jstrlen(val);
              const pStr = wasm.scopedAlloc(n);
              wasm.jstrcpy(val, wasm.heap8u(), pStr, n, false);
              const f = asBlob ? capi.sqlite3_bind_blob : capi.sqlite3_bind_text;
              return f(stmt.pointer, ndx, pStr, n, capi.SQLITE_TRANSIENT);
            }finally{
              wasm.scopedAllocPop(stack);
            }
          }else{
            const bytes = wasm.jstrToUintArray(val,false);
            const pStr = wasm.alloc(bytes.length || 1);
            wasm.heap8u().set(bytes.length ? bytes : [0], pStr);
            try{
              const f = asBlob ? capi.sqlite3_bind_blob : capi.sqlite3_bind_text;
              return f(stmt.pointer, ndx, pStr, bytes.length, capi.SQLITE_TRANSIENT);
            }finally{
              wasm.dealloc(pStr);
            }
          }
        }
      };
    }/* static init */
    affirmSupportedBindType(val);
    ndx = affirmParamIndex(stmt,ndx);
    let rc = 0;
    switch((null===val || undefined===val) ? BindTypes.null : bindType){
        case BindTypes.null:
          rc = capi.sqlite3_bind_null(stmt.pointer, ndx);
          break;
        case BindTypes.string:
          rc = f._.string(stmt, ndx, val, false);
          break;
        case BindTypes.number: {
          let m;
          if(util.isInt32(val)) m = capi.sqlite3_bind_int;
          else if('bigint'===typeof val){
            if(!util.bigIntFits64(val)){
              f._tooBigInt(val);
            }else if(wasm.bigIntEnabled){
              m = capi.sqlite3_bind_int64;
            }else if(util.bigIntFitsDouble(val)){
              val = Number(val);
              m = capi.sqlite3_bind_double;
            }else{
              f._tooBigInt(val);
            }
          }else{ // !int32, !bigint
            val = Number(val);
            if(wasm.bigIntEnabled && Number.isInteger(val)){
              m = capi.sqlite3_bind_int64;
            }else{
              m = capi.sqlite3_bind_double;
            }
          }
          rc = m(stmt.pointer, ndx, val);
          break;
        }
        case BindTypes.boolean:
          rc = capi.sqlite3_bind_int(stmt.pointer, ndx, val ? 1 : 0);
          break;
        case BindTypes.blob: {
          if('string'===typeof val){
            rc = f._.string(stmt, ndx, val, true);
          }else if(!util.isBindableTypedArray(val)){
            toss3("Binding a value as a blob requires",
                  "that it be a string, Uint8Array, or Int8Array.");
          }else if(1){
            /* _Hypothetically_ more efficient than the impl in the 'else' block. */
            const stack = wasm.scopedAllocPush();
            try{
              const pBlob = wasm.scopedAlloc(val.byteLength || 1);
              wasm.heap8().set(val.byteLength ? val : [0], pBlob)
              rc = capi.sqlite3_bind_blob(stmt.pointer, ndx, pBlob, val.byteLength,
                                         capi.SQLITE_TRANSIENT);
            }finally{
              wasm.scopedAllocPop(stack);
            }
          }else{
            const pBlob = wasm.allocFromTypedArray(val);
            try{
              rc = capi.sqlite3_bind_blob(stmt.pointer, ndx, pBlob, val.byteLength,
                                         capi.SQLITE_TRANSIENT);
            }finally{
              wasm.dealloc(pBlob);
            }
          }
          break;
        }
        default:
          console.warn("Unsupported bind() argument type:",val);
          toss3("Unsupported bind() argument type: "+(typeof val));
    }
    if(rc) DB.checkRc(stmt.db.pointer, rc);
    return stmt;
  };

  Stmt.prototype = {
    /**
       "Finalizes" this statement. This is a no-op if the
       statement has already been finalizes. Returns
       undefined. Most methods in this class will throw if called
       after this is.
    */
    finalize: function(){
      if(this.pointer){
        affirmUnlocked(this,'finalize()');
        delete __stmtMap.get(this.db)[this.pointer];
        capi.sqlite3_finalize(this.pointer);
        __ptrMap.delete(this);
        delete this._mayGet;
        delete this.columnCount;
        delete this.parameterCount;
        delete this.db;
        delete this._isLocked;
      }
    },
    /** Clears all bound values. Returns this object.
        Throws if this statement has been finalized. */
    clearBindings: function(){
      affirmUnlocked(affirmStmtOpen(this), 'clearBindings()')
      capi.sqlite3_clear_bindings(this.pointer);
      this._mayGet = false;
      return this;
    },
    /**
       Resets this statement so that it may be step()ed again
       from the beginning. Returns this object. Throws if this
       statement has been finalized.

       If passed a truthy argument then this.clearBindings() is
       also called, otherwise any existing bindings, along with
       any memory allocated for them, are retained.
    */
    reset: function(alsoClearBinds){
      affirmUnlocked(this,'reset()');
      if(alsoClearBinds) this.clearBindings();
      capi.sqlite3_reset(affirmStmtOpen(this).pointer);
      this._mayGet = false;
      return this;
    },
    /**
       Binds one or more values to its bindable parameters. It
       accepts 1 or 2 arguments:

       If passed a single argument, it must be either an array, an
       object, or a value of a bindable type (see below).

       If passed 2 arguments, the first one is the 1-based bind
       index or bindable parameter name and the second one must be
       a value of a bindable type.

       Bindable value types:

       - null is bound as NULL.

       - undefined as a standalone value is a no-op intended to
         simplify certain client-side use cases: passing undefined as
         a value to this function will not actually bind anything and
         this function will skip confirmation that binding is even
         legal. (Those semantics simplify certain client-side uses.)
         Conversely, a value of undefined as an array or object
         property when binding an array/object (see below) is treated
         the same as null.

       - Numbers are bound as either doubles or integers: doubles if
         they are larger than 32 bits, else double or int32, depending
         on whether they have a fractional part. Booleans are bound as
         integer 0 or 1. It is not expected the distinction of binding
         doubles which have no fractional parts is integers is
         significant for the majority of clients due to sqlite3's data
         typing model. If [BigInt] support is enabled then this
         routine will bind BigInt values as 64-bit integers if they'll
         fit in 64 bits. If that support disabled, it will store the
         BigInt as an int32 or a double if it can do so without loss
         of precision. If the BigInt is _too BigInt_ then it will
         throw.

       - Strings are bound as strings (use bindAsBlob() to force
         blob binding).

       - Uint8Array and Int8Array instances are bound as blobs.
         (TODO: binding the other TypedArray types.)

       If passed an array, each element of the array is bound at
       the parameter index equal to the array index plus 1
       (because arrays are 0-based but binding is 1-based).

       If passed an object, each object key is treated as a
       bindable parameter name. The object keys _must_ match any
       bindable parameter names, including any `$`, `@`, or `:`
       prefix. Because `$` is a legal identifier chararacter in
       JavaScript, that is the suggested prefix for bindable
       parameters: `stmt.bind({$a: 1, $b: 2})`.

       It returns this object on success and throws on
       error. Errors include:

       - Any bind index is out of range, a named bind parameter
       does not match, or this statement has no bindable
       parameters.

       - Any value to bind is of an unsupported type.

       - Passed no arguments or more than two.

       - The statement has been finalized.
    */
    bind: function(/*[ndx,] arg*/){
      affirmStmtOpen(this);
      let ndx, arg;
      switch(arguments.length){
          case 1: ndx = 1; arg = arguments[0]; break;
          case 2: ndx = arguments[0]; arg = arguments[1]; break;
          default: toss3("Invalid bind() arguments.");
      }
      if(undefined===arg){
        /* It might seem intuitive to bind undefined as NULL
           but this approach simplifies certain client-side
           uses when passing on arguments between 2+ levels of
           functions. */
        return this;
      }else if(!this.parameterCount){
        toss3("This statement has no bindable parameters.");
      }
      this._mayGet = false;
      if(null===arg){
        /* bind NULL */
        return bindOne(this, ndx, BindTypes.null, arg);
      }
      else if(Array.isArray(arg)){
        /* bind each entry by index */
        if(1!==arguments.length){
          toss3("When binding an array, an index argument is not permitted.");
        }
        arg.forEach((v,i)=>bindOne(this, i+1, affirmSupportedBindType(v), v));
        return this;
      }
      else if('object'===typeof arg/*null was checked above*/
              && !util.isBindableTypedArray(arg)){
        /* Treat each property of arg as a named bound parameter. */
        if(1!==arguments.length){
          toss3("When binding an object, an index argument is not permitted.");
        }
        Object.keys(arg)
          .forEach(k=>bindOne(this, k,
                              affirmSupportedBindType(arg[k]),
                              arg[k]));
        return this;
      }else{
        return bindOne(this, ndx, affirmSupportedBindType(arg), arg);
      }
      toss3("Should not reach this point.");
    },
    /**
       Special case of bind() which binds the given value using the
       BLOB binding mechanism instead of the default selected one for
       the value. The ndx may be a numbered or named bind index. The
       value must be of type string, null/undefined (both get treated
       as null), or a TypedArray of a type supported by the bind()
       API.

       If passed a single argument, a bind index of 1 is assumed and
       the first argument is the value.
    */
    bindAsBlob: function(ndx,arg){
      affirmStmtOpen(this);
      if(1===arguments.length){
        arg = ndx;
        ndx = 1;
      }
      const t = affirmSupportedBindType(arg);
      if(BindTypes.string !== t && BindTypes.blob !== t
         && BindTypes.null !== t){
        toss3("Invalid value type for bindAsBlob()");
      }
      bindOne(this, ndx, BindTypes.blob, arg);
      this._mayGet = false;
      return this;
    },
    /**
       Steps the statement one time. If the result indicates that a
       row of data is available, a truthy value is returned.
       If no row of data is available, a falsy
       value is returned.  Throws on error.
    */
    step: function(){
      affirmUnlocked(this, 'step()');
      const rc = capi.sqlite3_step(affirmStmtOpen(this).pointer);
      switch(rc){
          case capi.SQLITE_DONE: return this._mayGet = false;
          case capi.SQLITE_ROW: return this._mayGet = true;
          default:
            this._mayGet = false;
            console.warn("sqlite3_step() rc=",rc,
                         capi.sqlite3_js_rc_str(rc),
                         "SQL =", capi.sqlite3_sql(this.pointer));
            DB.checkRc(this.db.pointer, rc);
      }
    },
    /**
       Functions exactly like step() except that...

       1) On success, it calls this.reset() and returns this object.
       2) On error, it throws and does not call reset().

       This is intended to simplify constructs like:

       ```
       for(...) {
         stmt.bind(...).stepReset();
       }
       ```

       Note that the reset() call makes it illegal to call this.get()
       after the step.
    */
    stepReset: function(){
      this.step();
      return this.reset();
    },
    /**
       Functions like step() except that it finalizes this statement
       immediately after stepping unless the step cannot be performed
       because the statement is locked. Throws on error, but any error
       other than the statement-is-locked case will also trigger
       finalization of this statement.

       On success, it returns true if the step indicated that a row of
       data was available, else it returns false.

       This is intended to simplify use cases such as:

       ```
       aDb.prepare("insert into foo(a) values(?)").bind(123).stepFinalize();
       ```
    */
    stepFinalize: function(){
      const rc = this.step();
      this.finalize();
      return rc;
    },
    /**
       Fetches the value from the given 0-based column index of
       the current data row, throwing if index is out of range. 

       Requires that step() has just returned a truthy value, else
       an exception is thrown.

       By default it will determine the data type of the result
       automatically. If passed a second arugment, it must be one
       of the enumeration values for sqlite3 types, which are
       defined as members of the sqlite3 module: SQLITE_INTEGER,
       SQLITE_FLOAT, SQLITE_TEXT, SQLITE_BLOB. Any other value,
       except for undefined, will trigger an exception. Passing
       undefined is the same as not passing a value. It is legal
       to, e.g., fetch an integer value as a string, in which case
       sqlite3 will convert the value to a string.

       If ndx is an array, this function behaves a differently: it
       assigns the indexes of the array, from 0 to the number of
       result columns, to the values of the corresponding column,
       and returns that array.

       If ndx is a plain object, this function behaves even
       differentlier: it assigns the properties of the object to
       the values of their corresponding result columns.

       Blobs are returned as Uint8Array instances.

       Potential TODO: add type ID SQLITE_JSON, which fetches the
       result as a string and passes it (if it's not null) to
       JSON.parse(), returning the result of that. Until then,
       getJSON() can be used for that.
    */
    get: function(ndx,asType){
      if(!affirmStmtOpen(this)._mayGet){
        toss3("Stmt.step() has not (recently) returned true.");
      }
      if(Array.isArray(ndx)){
        let i = 0;
        while(i<this.columnCount){
          ndx[i] = this.get(i++);
        }
        return ndx;
      }else if(ndx && 'object'===typeof ndx){
        let i = 0;
        while(i<this.columnCount){
          ndx[capi.sqlite3_column_name(this.pointer,i)] = this.get(i++);
        }
        return ndx;
      }
      affirmColIndex(this, ndx);
      switch(undefined===asType
             ? capi.sqlite3_column_type(this.pointer, ndx)
             : asType){
          case capi.SQLITE_NULL: return null;
          case capi.SQLITE_INTEGER:{
            if(wasm.bigIntEnabled){
              const rc = capi.sqlite3_column_int64(this.pointer, ndx);
              if(rc>=Number.MIN_SAFE_INTEGER && rc<=Number.MAX_SAFE_INTEGER){
                /* Coerce "normal" number ranges to normal number values,
                   and only return BigInt-type values for numbers out of this
                   range. */
                return Number(rc).valueOf();
              }
              return rc;
            }else{
              const rc = capi.sqlite3_column_double(this.pointer, ndx);
              if(rc>Number.MAX_SAFE_INTEGER || rc<Number.MIN_SAFE_INTEGER){
                /* Throwing here is arguable but, since we're explicitly
                   extracting an SQLITE_INTEGER-type value, it seems fair to throw
                   if the extracted number is out of range for that type.
                   This policy may be laxened to simply pass on the number and
                   hope for the best, as the C API would do. */
                toss3("Integer is out of range for JS integer range: "+rc);
              }
              //console.log("get integer rc=",rc,isInt32(rc));
              return util.isInt32(rc) ? (rc | 0) : rc;
            }
          }
          case capi.SQLITE_FLOAT:
            return capi.sqlite3_column_double(this.pointer, ndx);
          case capi.SQLITE_TEXT:
            return capi.sqlite3_column_text(this.pointer, ndx);
          case capi.SQLITE_BLOB: {
            const n = capi.sqlite3_column_bytes(this.pointer, ndx),
                  ptr = capi.sqlite3_column_blob(this.pointer, ndx),
                  rc = new Uint8Array(n);
            //heap = n ? wasm.heap8() : false;
            if(n) rc.set(wasm.heap8u().slice(ptr, ptr+n), 0);
            //for(let i = 0; i < n; ++i) rc[i] = heap[ptr + i];
            if(n && this.db._blobXfer instanceof Array){
              /* This is an optimization soley for the
                 Worker-based API. These values will be
                 transfered to the main thread directly
                 instead of being copied. */
              this.db._blobXfer.push(rc.buffer);
            }
            return rc;
          }
          default: toss3("Don't know how to translate",
                         "type of result column #"+ndx+".");
      }
      toss3("Not reached.");
    },
    /** Equivalent to get(ndx) but coerces the result to an
        integer. */
    getInt: function(ndx){return this.get(ndx,capi.SQLITE_INTEGER)},
    /** Equivalent to get(ndx) but coerces the result to a
        float. */
    getFloat: function(ndx){return this.get(ndx,capi.SQLITE_FLOAT)},
    /** Equivalent to get(ndx) but coerces the result to a
        string. */
    getString: function(ndx){return this.get(ndx,capi.SQLITE_TEXT)},
    /** Equivalent to get(ndx) but coerces the result to a
        Uint8Array. */
    getBlob: function(ndx){return this.get(ndx,capi.SQLITE_BLOB)},
    /**
       A convenience wrapper around get() which fetches the value
       as a string and then, if it is not null, passes it to
       JSON.parse(), returning that result. Throws if parsing
       fails. If the result is null, null is returned. An empty
       string, on the other hand, will trigger an exception.
    */
    getJSON: function(ndx){
      const s = this.get(ndx, capi.SQLITE_STRING);
      return null===s ? s : JSON.parse(s);
    },
    // Design note: the only reason most of these getters have a 'get'
    // prefix is for consistency with getVALUE_TYPE().  The latter
    // arguably really need that prefix for API readability and the
    // rest arguably don't, but consistency is a powerful thing.
    /**
       Returns the result column name of the given index, or
       throws if index is out of bounds or this statement has been
       finalized. This can be used without having run step()
       first.
    */
    getColumnName: function(ndx){
      return capi.sqlite3_column_name(
        affirmColIndex(affirmStmtOpen(this),ndx).pointer, ndx
      );
    },
    /**
       If this statement potentially has result columns, this
       function returns an array of all such names. If passed an
       array, it is used as the target and all names are appended
       to it. Returns the target array. Throws if this statement
       cannot have result columns. This object's columnCount member
       holds the number of columns.
    */
    getColumnNames: function(tgt=[]){
      affirmColIndex(affirmStmtOpen(this),0);
      for(let i = 0; i < this.columnCount; ++i){
        tgt.push(capi.sqlite3_column_name(this.pointer, i));
      }
      return tgt;
    },
    /**
       If this statement has named bindable parameters and the
       given name matches one, its 1-based bind index is
       returned. If no match is found, 0 is returned. If it has no
       bindable parameters, the undefined value is returned.
    */
    getParamIndex: function(name){
      return (affirmStmtOpen(this).parameterCount
              ? capi.sqlite3_bind_parameter_index(this.pointer, name)
              : undefined);
    }
  }/*Stmt.prototype*/;

  {/* Add the `pointer` property to DB and Stmt. */
    const prop = {
      enumerable: true,
      get: function(){return __ptrMap.get(this)},
      set: ()=>toss3("The pointer property is read-only.")
    }
    Object.defineProperty(Stmt.prototype, 'pointer', prop);
    Object.defineProperty(DB.prototype, 'pointer', prop);
  }

  /** The OO API's public namespace. */
  sqlite3.oo1 = {
    version: {
      lib: capi.sqlite3_libversion(),
      ooApi: "0.1"
    },
    DB,
    Stmt
  }/*oo1 object*/;

  if(util.isUIThread()){
    /**
       Functionally equivalent to DB(storageName,'c','kvvfs') except
       that it throws if the given storage name is not one of 'local'
       or 'session'.
    */
    sqlite3.oo1.JsStorageDb = function(storageName='session'){
      if('session'!==storageName && 'local'!==storageName){
        toss3("JsStorageDb db name must be one of 'session' or 'local'.");
      }
      dbCtorHelper.call(this, {
        filename: storageName,
        flags: 'c',
        vfs: "kvvfs"
      });
    };
    const jdb = sqlite3.oo1.JsStorageDb;
    jdb.prototype = Object.create(DB.prototype);
    /** Equivalent to sqlite3_js_kvvfs_clear(). */
    jdb.clearStorage = capi.sqlite3_js_kvvfs_clear;
    /**
       Clears this database instance's storage or throws if this
       instance has been closed. Returns the number of
       database blocks which were cleaned up.
    */
    jdb.prototype.clearStorage = function(){
      return jdb.clearStorage(affirmDbOpen(this).filename);
    };
    /** Equivalent to sqlite3_js_kvvfs_size(). */
    jdb.storageSize = capi.sqlite3_js_kvvfs_size;
    /**
       Returns the _approximate_ number of bytes this database takes
       up in its storage or throws if this instance has been closed.
    */
    jdb.prototype.storageSize = function(){
      return jdb.storageSize(affirmDbOpen(this).filename);
    };
  }/*main-window-only bits*/

});

/* END FILE: api/sqlite3-api-oo1.js */
/* BEGIN FILE: api/sqlite3-api-worker1.js */
/*
  2022-07-22

  The author disclaims copyright to this source code.  In place of a
  legal notice, here is a blessing:

  *   May you do good and not evil.
  *   May you find forgiveness for yourself and forgive others.
  *   May you share freely, never taking more than you give.

  ***********************************************************************

  This file implements the initializer for the sqlite3 "Worker API
  #1", a very basic DB access API intended to be scripted from a main
  window thread via Worker-style messages. Because of limitations in
  that type of communication, this API is minimalistic and only
  capable of serving relatively basic DB requests (e.g. it cannot
  process nested query loops concurrently).

  This file requires that the core C-style sqlite3 API and OO API #1
  have been loaded.
*/

/**
  sqlite3.initWorker1API() implements a Worker-based wrapper around
  SQLite3 OO API #1, colloquially known as "Worker API #1".

  In order to permit this API to be loaded in worker threads without
  automatically registering onmessage handlers, initializing the
  worker API requires calling initWorker1API(). If this function is
  called from a non-worker thread then it throws an exception.  It
  must only be called once per Worker.

  When initialized, it installs message listeners to receive Worker
  messages and then it posts a message in the form:

  ```
  {type:'sqlite3-api', result:'worker1-ready'}
  ```

  to let the client know that it has been initialized. Clients may
  optionally depend on this function not returning until
  initialization is complete, as the initialization is synchronous.
  In some contexts, however, listening for the above message is
  a better fit.

  Note that the worker-based interface can be slightly quirky because
  of its async nature. In particular, any number of messages may be posted
  to the worker before it starts handling any of them. If, e.g., an
  "open" operation fails, any subsequent messages will fail. The
  Promise-based wrapper for this API (`sqlite3-worker1-promiser.js`)
  is more comfortable to use in that regard.

  The documentation for the input and output worker messages for
  this API follows...

  ====================================================================
  Common message format...

  Each message posted to the worker has an operation-independent
  envelope and operation-dependent arguments:

  ```
  {
    type: string, // one of: 'open', 'close', 'exec', 'config-get'

    messageId: OPTIONAL arbitrary value. The worker will copy it as-is
    into response messages to assist in client-side dispatching.

    dbId: a db identifier string (returned by 'open') which tells the
    operation which database instance to work on. If not provided, the
    first-opened db is used. This is an "opaque" value, with no
    inherently useful syntax or information. Its value is subject to
    change with any given build of this API and cannot be used as a
    basis for anything useful beyond its one intended purpose.

    args: ...operation-dependent arguments...

    // the framework may add other properties for testing or debugging
    // purposes.

  }
  ```

  Response messages, posted back to the main thread, look like:

  ```
  {
    type: string. Same as above except for error responses, which have the type
    'error',

    messageId: same value, if any, provided by the inbound message

    dbId: the id of the db which was operated on, if any, as returned
    by the corresponding 'open' operation.

    result: ...operation-dependent result...

  }
  ```

  ====================================================================
  Error responses

  Errors are reported messages in an operation-independent format:

  ```
  {
    type: "error",

    messageId: ...as above...,

    dbId: ...as above...

    result: {

      operation: type of the triggering operation: 'open', 'close', ...

      message: ...error message text...

      errorClass: string. The ErrorClass.name property from the thrown exception.

      input: the message object which triggered the error.

      stack: _if available_, a stack trace array.

    }

  }
  ```


  ====================================================================
  "config-get"

  This operation fetches the serializable parts of the sqlite3 API
  configuration.

  Message format:

  ```
  {
    type: "config-get",
    messageId: ...as above...,
    args: currently ignored and may be elided.
  }
  ```

  Response:

  ```
  {
    type: "config-get",
    messageId: ...as above...,
    result: {

      version: sqlite3.version object

      bigIntEnabled: bool. True if BigInt support is enabled.

      wasmfsOpfsDir: path prefix, if any, _intended_ for use with
      WASMFS OPFS persistent storage.

      wasmfsOpfsEnabled: true if persistent storage is enabled in the
      current environment. Only files stored under wasmfsOpfsDir
      will persist using that mechanism, however. It is legal to use
      the non-WASMFS OPFS VFS to open a database via a URI-style
      db filename.

      vfsList: result of sqlite3.capi.sqlite3_js_vfs_list()
   }
  }
  ```


  ====================================================================
  "open" a database

  Message format:

  ```
  {
    type: "open",
    messageId: ...as above...,
    args:{

      filename [=":memory:" or "" (unspecified)]: the db filename.
      See the sqlite3.oo1.DB constructor for peculiarities and
      transformations,

      vfs: sqlite3_vfs name. Ignored if filename is ":memory:" or "".
           This may change how the given filename is resolved.
    }
  }
  ```

  Response:

  ```
  {
    type: "open",
    messageId: ...as above...,
    result: {
      filename: db filename, possibly differing from the input.

      dbId: an opaque ID value which must be passed in the message
      envelope to other calls in this API to tell them which db to
      use. If it is not provided to future calls, they will default to
      operating on the least-recently-opened db. This property is, for
      API consistency's sake, also part of the containing message
      envelope.  Only the `open` operation includes it in the `result`
      property.

      persistent: true if the given filename resides in the
      known-persistent storage, else false.

      vfs: name of the VFS the "main" db is using.
   }
  }
  ```

  ====================================================================
  "close" a database

  Message format:

  ```
  {
    type: "close",
    messageId: ...as above...
    dbId: ...as above...
    args: OPTIONAL {unlink: boolean}
  }
  ```

  If the `dbId` does not refer to an opened ID, this is a no-op. If
  the `args` object contains a truthy `unlink` value then the database
  will be unlinked (deleted) after closing it. The inability to close a
  db (because it's not opened) or delete its file does not trigger an
  error.

  Response:

  ```
  {
    type: "close",
    messageId: ...as above...,
    result: {

      filename: filename of closed db, or undefined if no db was closed

    }
  }
  ```

  ====================================================================
  "exec" SQL

  All SQL execution is processed through the exec operation. It offers
  most of the features of the oo1.DB.exec() method, with a few limitations
  imposed by the state having to cross thread boundaries.

  Message format:

  ```
  {
    type: "exec",
    messageId: ...as above...
    dbId: ...as above...
    args: string (SQL) or {... see below ...}
  }
  ```

  Response:

  ```
  {
    type: "exec",
    messageId: ...as above...,
    dbId: ...as above...
    result: {
      input arguments, possibly modified. See below.
    }
  }
  ```

  The arguments are in the same form accepted by oo1.DB.exec(), with
  the exceptions noted below.

  A function-type args.callback property cannot cross
  the window/Worker boundary, so is not useful here. If
  args.callback is a string then it is assumed to be a
  message type key, in which case a callback function will be
  applied which posts each row result via:

  postMessage({type: thatKeyType,
               rowNumber: 1-based-#,
               row: theRow,
               columnNames: anArray
               })

  And, at the end of the result set (whether or not any result rows
  were produced), it will post an identical message with
  (row=undefined, rowNumber=null) to alert the caller than the result
  set is completed. Note that a row value of `null` is a legal row
  result for certain arg.rowMode values.

    (Design note: we don't use (row=undefined, rowNumber=undefined) to
    indicate end-of-results because fetching those would be
    indistinguishable from fetching from an empty object unless the
    client used hasOwnProperty() (or similar) to distinguish "missing
    property" from "property with the undefined value".  Similarly,
    `null` is a legal value for `row` in some case , whereas the db
    layer won't emit a result value of `undefined`.)

  The callback proxy must not recurse into this interface. An exec()
  call will tie up the Worker thread, causing any recursion attempt
  to wait until the first exec() is completed.

  The response is the input options object (or a synthesized one if
  passed only a string), noting that options.resultRows and
  options.columnNames may be populated by the call to db.exec().

*/
self.sqlite3ApiBootstrap.initializers.push(function(sqlite3){
sqlite3.initWorker1API = function(){
  'use strict';
  const toss = (...args)=>{throw new Error(args.join(' '))};
  if('function' !== typeof importScripts){
    toss("initWorker1API() must be run from a Worker thread.");
  }
  const self = this.self;
  const sqlite3 = this.sqlite3 || toss("Missing this.sqlite3 object.");
  const DB = sqlite3.oo1.DB;

  /**
     Returns the app-wide unique ID for the given db, creating one if
     needed.
  */
  const getDbId = function(db){
    let id = wState.idMap.get(db);
    if(id) return id;
    id = 'db#'+(++wState.idSeq)+'@'+db.pointer;
    /** ^^^ can't simply use db.pointer b/c closing/opening may re-use
        the same address, which could map pending messages to a wrong
        instance. */
    wState.idMap.set(db, id);
    return id;
  };

  /**
     Internal helper for managing Worker-level state.
  */
  const wState = {
    /**
       Each opened DB is added to this.dbList, and the first entry in
       that list is the default db. As each db is closed, its entry is
       removed from the list.
    */
    dbList: [],
    /** Sequence number of dbId generation. */
    idSeq: 0,
    /** Map of DB instances to dbId. */
    idMap: new WeakMap,
    /** Temp holder for "transferable" postMessage() state. */
    xfer: [],
    open: function(opt){
      const db = new DB(opt);
      this.dbs[getDbId(db)] = db;
      if(this.dbList.indexOf(db)<0) this.dbList.push(db);
      return db;
    },
    close: function(db,alsoUnlink){
      if(db){
        delete this.dbs[getDbId(db)];
        const filename = db.filename;
        const pVfs = sqlite3.wasm.sqlite3_wasm_db_vfs(db.pointer, 0);
        db.close();
        const ddNdx = this.dbList.indexOf(db);
        if(ddNdx>=0) this.dbList.splice(ddNdx, 1);
        if(alsoUnlink && filename && pVfs){
          sqlite3.wasm.sqlite3_wasm_vfs_unlink(pVfs, filename);
        }
      }
    },
    /**
       Posts the given worker message value. If xferList is provided,
       it must be an array, in which case a copy of it passed as
       postMessage()'s second argument and xferList.length is set to
       0.
    */
    post: function(msg,xferList){
      if(xferList && xferList.length){
        self.postMessage( msg, Array.from(xferList) );
        xferList.length = 0;
      }else{
        self.postMessage(msg);
      }
    },
    /** Map of DB IDs to DBs. */
    dbs: Object.create(null),
    /** Fetch the DB for the given id. Throw if require=true and the
        id is not valid, else return the db or undefined. */
    getDb: function(id,require=true){
      return this.dbs[id]
        || (require ? toss("Unknown (or closed) DB ID:",id) : undefined);
    }
  };

  /** Throws if the given db is falsy or not opened, else returns its
      argument. */
  const affirmDbOpen = function(db = wState.dbList[0]){
    return (db && db.pointer) ? db : toss("DB is not opened.");
  };

  /** Extract dbId from the given message payload. */
  const getMsgDb = function(msgData,affirmExists=true){
    const db = wState.getDb(msgData.dbId,false) || wState.dbList[0];
    return affirmExists ? affirmDbOpen(db) : db;
  };

  const getDefaultDbId = function(){
    return wState.dbList[0] && getDbId(wState.dbList[0]);
  };

  const guessVfs = function(filename){
    const m = /^file:.+(vfs=(\w+))/.exec(filename);
    return sqlite3.capi.sqlite3_vfs_find(m ? m[2] : 0);
  };

  const isSpecialDbFilename = (n)=>{
    return ''===n || ':'===n[0];
  };

  /**
     A level of "organizational abstraction" for the Worker1
     API. Each method in this object must map directly to a Worker1
     message type key. The onmessage() dispatcher attempts to
     dispatch all inbound messages to a method of this object,
     passing it the event.data part of the inbound event object. All
     methods must return a plain Object containing any result
     state, which the dispatcher may amend. All methods must throw
     on error.
  */
  const wMsgHandler = {
    open: function(ev){
      const oargs = Object.create(null), args = (ev.args || Object.create(null));
      if(args.simulateError){ // undocumented internal testing option
        toss("Throwing because of simulateError flag.");
      }
      const rc = Object.create(null);
      const pDir = sqlite3.capi.sqlite3_wasmfs_opfs_dir();
      let byteArray, pVfs;
      oargs.vfs = args.vfs;
      if(isSpecialDbFilename(args.filename)){
        oargs.filename = args.filename || '';
      }else{
        oargs.filename = args.filename;
        byteArray = args.byteArray;
        if(byteArray) pVfs = guessVfs(args.filename);
      }
      if(pVfs){
        /* 2022-11-02: this feature is as-yet untested except that
           sqlite3_wasm_vfs_create_file() has been tested from the
           browser dev console. */
        let pMem;
        try{
          pMem = sqlite3.wasm.allocFromTypedArray(byteArray);
          const rc = sqlite3.wasm.sqlite3_wasm_vfs_create_file(
            pVfs, oargs.filename, pMem, byteArray.byteLength
          );
          if(rc) sqlite3.SQLite3Error.toss(rc);
        }catch(e){
          throw new sqlite3.SQLite3Error(
            e.name+' creating '+args.filename+": "+e.message, {
              cause: e
            }
          );                           
        }finally{
          if(pMem) sqlite3.wasm.dealloc(pMem);
        }
      }
      const db = wState.open(oargs);
      rc.filename = db.filename;
      rc.persistent = (!!pDir && db.filename.startsWith(pDir+'/'))
        || !!sqlite3.capi.sqlite3_js_db_uses_vfs(db.pointer, "opfs");
      rc.dbId = getDbId(db);
      rc.vfs = db.dbVfsName();
      return rc;
    },

    close: function(ev){
      const db = getMsgDb(ev,false);
      const response = {
        filename: db && db.filename
      };
      if(db){
        const doUnlink = ((ev.args && 'object'===typeof ev.args)
                         ? !!ev.args.unlink : false);
        wState.close(db, doUnlink);
      }
      return response;
    },

    exec: function(ev){
      const rc = (
        'string'===typeof ev.args
      ) ? {sql: ev.args} : (ev.args || Object.create(null));
      if('stmt'===rc.rowMode){
        toss("Invalid rowMode for 'exec': stmt mode",
             "does not work in the Worker API.");
      }else if(!rc.sql){
        toss("'exec' requires input SQL.");
      }
      const db = getMsgDb(ev);
      if(rc.callback || Array.isArray(rc.resultRows)){
        // Part of a copy-avoidance optimization for blobs
        db._blobXfer = wState.xfer;
      }
      const theCallback = rc.callback;
      let rowNumber = 0;
      const hadColNames = !!rc.columnNames;
      if('string' === typeof theCallback){
        if(!hadColNames) rc.columnNames = [];
        /* Treat this as a worker message type and post each
           row as a message of that type. */
        rc.callback = function(row,stmt){
          wState.post({
            type: theCallback,
            columnNames: rc.columnNames,
            rowNumber: ++rowNumber,
            row: row
          }, wState.xfer);
        }
      }
      try {
        db.exec(rc);
        if(rc.callback instanceof Function){
          rc.callback = theCallback;
          /* Post a sentinel message to tell the client that the end
             of the result set has been reached (possibly with zero
             rows). */
          wState.post({
            type: theCallback,
            columnNames: rc.columnNames,
            rowNumber: null /*null to distinguish from "property not set"*/,
            row: undefined /*undefined because null is a legal row value
                             for some rowType values, but undefined is not*/
          });
        }
      }finally{
        delete db._blobXfer;
        if(rc.callback) rc.callback = theCallback;
      }
      return rc;
    }/*exec()*/,

    'config-get': function(){
      const rc = Object.create(null), src = sqlite3.config;
      [
        'wasmfsOpfsDir', 'bigIntEnabled'
      ].forEach(function(k){
        if(Object.getOwnPropertyDescriptor(src, k)) rc[k] = src[k];
      });
      rc.wasmfsOpfsEnabled = !!sqlite3.capi.sqlite3_wasmfs_opfs_dir();
      rc.version = sqlite3.version;
      rc.vfsList = sqlite3.capi.sqlite3_js_vfs_list();
      rc.opfsEnabled = !!sqlite3.opfs;
      return rc;
    },

    /**
       Exports the database to a byte array, as per
       sqlite3_serialize(). Response is an object:

       {
         byteArray:  Uint8Array (db file contents),
         filename: the current db filename,
         mimetype: 'application/x-sqlite3'
       }
    */
    export: function(ev){
      const db = getMsgDb(ev);
      const response = {
        byteArray: sqlite3.capi.sqlite3_js_db_export(db.pointer),
        filename: db.filename,
        mimetype: 'application/x-sqlite3'
      };
      wState.xfer.push(response.byteArray.buffer);
      return response;
    }/*export()*/,

    toss: function(ev){
      toss("Testing worker exception");
    },

    'opfs-tree': async function(ev){
      if(!sqlite3.opfs) toss("OPFS support is unavailable.");
      const response = await sqlite3.opfs.treeList();
      return response;
    }
  }/*wMsgHandler*/;

  self.onmessage = async function(ev){
    ev = ev.data;
    let result, dbId = ev.dbId, evType = ev.type;
    const arrivalTime = performance.now();
    try {
      if(wMsgHandler.hasOwnProperty(evType) &&
         wMsgHandler[evType] instanceof Function){
        result = await wMsgHandler[evType](ev);
      }else{
        toss("Unknown db worker message type:",ev.type);
      }
    }catch(err){
      evType = 'error';
      result = {
        operation: ev.type,
        message: err.message,
        errorClass: err.name,
        input: ev
      };
      if(err.stack){
        result.stack = ('string'===typeof err.stack)
          ? err.stack.split(/\n\s*/) : err.stack;
      }
      if(0) console.warn("Worker is propagating an exception to main thread.",
                         "Reporting it _here_ for the stack trace:",err,result);
    }
    if(!dbId){
      dbId = result.dbId/*from 'open' cmd*/
        || getDefaultDbId();
    }
    // Timing info is primarily for use in testing this API. It's not part of
    // the public API. arrivalTime = when the worker got the message.
    wState.post({
      type: evType,
      dbId: dbId,
      messageId: ev.messageId,
      workerReceivedTime: arrivalTime,
      workerRespondTime: performance.now(),
      departureTime: ev.departureTime,
      // TODO: move the timing bits into...
      //timing:{
      //  departure: ev.departureTime,
      //  workerReceived: arrivalTime,
      //  workerResponse: performance.now();
      //},
      result: result
    }, wState.xfer);
  };
  self.postMessage({type:'sqlite3-api',result:'worker1-ready'});
}.bind({self, sqlite3});
});
/* END FILE: api/sqlite3-api-worker1.js */
/* BEGIN FILE: api/sqlite3-api-opfs.js */
/*
  2022-09-18

  The author disclaims copyright to this source code.  In place of a
  legal notice, here is a blessing:

  *   May you do good and not evil.
  *   May you find forgiveness for yourself and forgive others.
  *   May you share freely, never taking more than you give.

  ***********************************************************************

  This file holds the synchronous half of an sqlite3_vfs
  implementation which proxies, in a synchronous fashion, the
  asynchronous Origin-Private FileSystem (OPFS) APIs using a second
  Worker, implemented in sqlite3-opfs-async-proxy.js.  This file is
  intended to be appended to the main sqlite3 JS deliverable somewhere
  after sqlite3-api-oo1.js and before sqlite3-api-cleanup.js.
*/
'use strict';
self.sqlite3ApiBootstrap.initializers.push(function(sqlite3){
/**
   installOpfsVfs() returns a Promise which, on success, installs an
   sqlite3_vfs named "opfs", suitable for use with all sqlite3 APIs
   which accept a VFS. It is intended to be called via
   sqlite3ApiBootstrap.initializersAsync or an equivalent mechanism.

   The installed VFS uses the Origin-Private FileSystem API for
   all file storage. On error it is rejected with an exception
   explaining the problem. Reasons for rejection include, but are
   not limited to:

   - The counterpart Worker (see below) could not be loaded.

   - The environment does not support OPFS. That includes when
     this function is called from the main window thread.

  Significant notes and limitations:

  - As of this writing, OPFS is still very much in flux and only
    available in bleeding-edge versions of Chrome (v102+, noting that
    that number will increase as the OPFS API matures).

  - The OPFS features used here are only available in dedicated Worker
    threads. This file tries to detect that case, resulting in a
    rejected Promise if those features do not seem to be available.

  - It requires the SharedArrayBuffer and Atomics classes, and the
    former is only available if the HTTP server emits the so-called
    COOP and COEP response headers. These features are required for
    proxying OPFS's synchronous API via the synchronous interface
    required by the sqlite3_vfs API.

  - This function may only be called a single time. When called, this
    function removes itself from the sqlite3 object.

  All arguments to this function are for internal/development purposes
  only. They do not constitute a public API and may change at any
  time.

  The argument may optionally be a plain object with the following
  configuration options:

  - proxyUri: as described above

  - verbose (=2): an integer 0-3. 0 disables all logging, 1 enables
    logging of errors. 2 enables logging of warnings and errors. 3
    additionally enables debugging info.

  - sanityChecks (=false): if true, some basic sanity tests are
    run on the OPFS VFS API after it's initialized, before the
    returned Promise resolves.

  On success, the Promise resolves to the top-most sqlite3 namespace
  object and that object gets a new object installed in its
  `opfs` property, containing several OPFS-specific utilities.
*/
const installOpfsVfs = function callee(options){
  if(!self.SharedArrayBuffer ||
     !self.Atomics ||
     !self.FileSystemHandle ||
     !self.FileSystemDirectoryHandle ||
     !self.FileSystemFileHandle ||
     !self.FileSystemFileHandle.prototype.createSyncAccessHandle ||
     !navigator.storage.getDirectory){
    return Promise.reject(
      new Error("This environment does not have OPFS support.")
    );
  }
  if(!options || 'object'!==typeof options){
    options = Object.create(null);
  }
  const urlParams = new URL(self.location.href).searchParams;
  if(undefined===options.verbose){
    options.verbose = urlParams.has('opfs-verbose') ? 3 : 2;
  }
  if(undefined===options.sanityChecks){
    options.sanityChecks = urlParams.has('opfs-sanity-check');
  }
  if(undefined===options.proxyUri){
    options.proxyUri = callee.defaultProxyUri;
  }

  if('function' === typeof options.proxyUri){
    options.proxyUri = options.proxyUri();
  }
  const thePromise = new Promise(function(promiseResolve, promiseReject_){
    const loggers = {
      0:console.error.bind(console),
      1:console.warn.bind(console),
      2:console.log.bind(console)
    };
    const logImpl = (level,...args)=>{
      if(options.verbose>level) loggers[level]("OPFS syncer:",...args);
    };
    const log =    (...args)=>logImpl(2, ...args);
    const warn =   (...args)=>logImpl(1, ...args);
    const error =  (...args)=>logImpl(0, ...args);
    const toss = function(...args){throw new Error(args.join(' '))};
    const capi = sqlite3.capi;
    const wasm = sqlite3.wasm;
    const sqlite3_vfs = capi.sqlite3_vfs;
    const sqlite3_file = capi.sqlite3_file;
    const sqlite3_io_methods = capi.sqlite3_io_methods;
    /**
       Generic utilities for working with OPFS. This will get filled out
       by the Promise setup and, on success, installed as sqlite3.opfs.
    */
    const opfsUtil = Object.create(null);
    /**
       Not part of the public API. Solely for internal/development
       use.
    */
    opfsUtil.metrics = {
      dump: function(){
        let k, n = 0, t = 0, w = 0;
        for(k in state.opIds){
          const m = metrics[k];
          n += m.count;
          t += m.time;
          w += m.wait;
          m.avgTime = (m.count && m.time) ? (m.time / m.count) : 0;
          m.avgWait = (m.count && m.wait) ? (m.wait / m.count) : 0;
        }
        console.log(self.location.href,
                    "metrics for",self.location.href,":",metrics,
                    "\nTotal of",n,"op(s) for",t,
                    "ms (incl. "+w+" ms of waiting on the async side)");
        console.log("Serialization metrics:",metrics.s11n);
        W.postMessage({type:'opfs-async-metrics'});
      },
      reset: function(){
        let k;
        const r = (m)=>(m.count = m.time = m.wait = 0);
        for(k in state.opIds){
          r(metrics[k] = Object.create(null));
        }
        let s = metrics.s11n = Object.create(null);
        s = s.serialize = Object.create(null);
        s.count = s.time = 0;
        s = metrics.s11n.deserialize = Object.create(null);
        s.count = s.time = 0;
      }
    }/*metrics*/;      
    const promiseReject = function(err){
      opfsVfs.dispose();
      return promiseReject_(err);
    };
    const W = new Worker(options.proxyUri);
    W._originalOnError = W.onerror /* will be restored later */;
    W.onerror = function(err){
      // The error object doesn't contain any useful info when the
      // failure is, e.g., that the remote script is 404.
      error("Error initializing OPFS asyncer:",err);
      promiseReject(new Error("Loading OPFS async Worker failed for unknown reasons."));
    };
    const pDVfs = capi.sqlite3_vfs_find(null)/*pointer to default VFS*/;
    const dVfs = pDVfs
          ? new sqlite3_vfs(pDVfs)
          : null /* dVfs will be null when sqlite3 is built with
                    SQLITE_OS_OTHER. Though we cannot currently handle
                    that case, the hope is to eventually be able to. */;
    const opfsVfs = new sqlite3_vfs();
    const opfsIoMethods = new sqlite3_io_methods();
    opfsVfs.$iVersion = 2/*yes, two*/;
    opfsVfs.$szOsFile = capi.sqlite3_file.structInfo.sizeof;
    opfsVfs.$mxPathname = 1024/*sure, why not?*/;
    opfsVfs.$zName = wasm.allocCString("opfs");
    // All C-side memory of opfsVfs is zeroed out, but just to be explicit:
    opfsVfs.$xDlOpen = opfsVfs.$xDlError = opfsVfs.$xDlSym = opfsVfs.$xDlClose = null;
    opfsVfs.ondispose = [
      '$zName', opfsVfs.$zName,
      'cleanup default VFS wrapper', ()=>(dVfs ? dVfs.dispose() : null),
      'cleanup opfsIoMethods', ()=>opfsIoMethods.dispose()
    ];
    /**
       Pedantic sidebar about opfsVfs.ondispose: the entries in that array
       are items to clean up when opfsVfs.dispose() is called, but in this
       environment it will never be called. The VFS instance simply
       hangs around until the WASM module instance is cleaned up. We
       "could" _hypothetically_ clean it up by "importing" an
       sqlite3_os_end() impl into the wasm build, but the shutdown order
       of the wasm engine and the JS one are undefined so there is no
       guaranty that the opfsVfs instance would be available in one
       environment or the other when sqlite3_os_end() is called (_if_ it
       gets called at all in a wasm build, which is undefined).
    */
    /**
       State which we send to the async-api Worker or share with it.
       This object must initially contain only cloneable or sharable
       objects. After the worker's "inited" message arrives, other types
       of data may be added to it.

       For purposes of Atomics.wait() and Atomics.notify(), we use a
       SharedArrayBuffer with one slot reserved for each of the API
       proxy's methods. The sync side of the API uses Atomics.wait()
       on the corresponding slot and the async side uses
       Atomics.notify() on that slot.

       The approach of using a single SAB to serialize comms for all
       instances might(?) lead to deadlock situations in multi-db
       cases. We should probably have one SAB here with a single slot
       for locking a per-file initialization step and then allocate a
       separate SAB like the above one for each file. That will
       require a bit of acrobatics but should be feasible. The most
       problematic part is that xOpen() would have to use
       postMessage() to communicate its SharedArrayBuffer, and mixing
       that approach with Atomics.wait/notify() gets a bit messy.
    */
    const state = Object.create(null);
    state.verbose = options.verbose;
    state.littleEndian = (()=>{
      const buffer = new ArrayBuffer(2);
      new DataView(buffer).setInt16(0, 256, true /* ==>littleEndian */);
      // Int16Array uses the platform's endianness.
      return new Int16Array(buffer)[0] === 256;
    })();
    /**
       Whether the async counterpart should log exceptions to
       the serialization channel. That produces a great deal of
       noise for seemingly innocuous things like xAccess() checks
       for missing files, so this option may have one of 3 values:

       0 = no exception logging

       1 = only log exceptions for "significant" ops like xOpen(),
       xRead(), and xWrite().

       2 = log all exceptions.
    */
    state.asyncS11nExceptions = 1;
    /* Size of file I/O buffer block. 64k = max sqlite3 page size, and
       xRead/xWrite() will never deal in blocks larger than that. */
    state.fileBufferSize = 1024 * 64;
    state.sabS11nOffset = state.fileBufferSize;
    /**
       The size of the block in our SAB for serializing arguments and
       result values. Needs to be large enough to hold serialized
       values of any of the proxied APIs. Filenames are the largest
       part but are limited to opfsVfs.$mxPathname bytes.
    */
    state.sabS11nSize = opfsVfs.$mxPathname * 2;
    /**
       The SAB used for all data I/O between the synchronous and
       async halves (file i/o and arg/result s11n).
    */
    state.sabIO = new SharedArrayBuffer(
      state.fileBufferSize/* file i/o block */
      + state.sabS11nSize/* argument/result serialization block */
    );
    state.opIds = Object.create(null);
    const metrics = Object.create(null);
    {
      /* Indexes for use in our SharedArrayBuffer... */
      let i = 0;
      /* SAB slot used to communicate which operation is desired
         between both workers. This worker writes to it and the other
         listens for changes. */
      state.opIds.whichOp = i++;
      /* Slot for storing return values. This worker listens to that
         slot and the other worker writes to it. */
      state.opIds.rc = i++;
      /* Each function gets an ID which this worker writes to
         the whichOp slot. The async-api worker uses Atomic.wait()
         on the whichOp slot to figure out which operation to run
         next. */
      state.opIds.xAccess = i++;
      state.opIds.xClose = i++;
      state.opIds.xDelete = i++;
      state.opIds.xDeleteNoWait = i++;
      state.opIds.xFileControl = i++;
      state.opIds.xFileSize = i++;
      state.opIds.xLock = i++;
      state.opIds.xOpen = i++;
      state.opIds.xRead = i++;
      state.opIds.xSleep = i++;
      state.opIds.xSync = i++;
      state.opIds.xTruncate = i++;
      state.opIds.xUnlock = i++;
      state.opIds.xWrite = i++;
      state.opIds.mkdir = i++;
      state.opIds['opfs-async-metrics'] = i++;
      state.opIds['opfs-async-shutdown'] = i++;
      /* The retry slot is used by the async part for wait-and-retry
         semantics. Though we could hypothetically use the xSleep slot
         for that, doing so might lead to undesired side effects. */
      state.opIds.retry = i++;
      state.sabOP = new SharedArrayBuffer(
        i * 4/* ==sizeof int32, noting that Atomics.wait() and friends
                can only function on Int32Array views of an SAB. */);
      opfsUtil.metrics.reset();
    }
    /**
       SQLITE_xxx constants to export to the async worker
       counterpart...
    */
    state.sq3Codes = Object.create(null);
    [
      'SQLITE_ACCESS_EXISTS',
      'SQLITE_ACCESS_READWRITE',
      'SQLITE_ERROR',
      'SQLITE_IOERR',
      'SQLITE_IOERR_ACCESS',
      'SQLITE_IOERR_CLOSE',
      'SQLITE_IOERR_DELETE',
      'SQLITE_IOERR_FSYNC',
      'SQLITE_IOERR_LOCK',
      'SQLITE_IOERR_READ',
      'SQLITE_IOERR_SHORT_READ',
      'SQLITE_IOERR_TRUNCATE',
      'SQLITE_IOERR_UNLOCK',
      'SQLITE_IOERR_WRITE',
      'SQLITE_LOCK_EXCLUSIVE',
      'SQLITE_LOCK_NONE',
      'SQLITE_LOCK_PENDING',
      'SQLITE_LOCK_RESERVED',
      'SQLITE_LOCK_SHARED',
      'SQLITE_MISUSE',
      'SQLITE_NOTFOUND',
      'SQLITE_OPEN_CREATE',
      'SQLITE_OPEN_DELETEONCLOSE',
      'SQLITE_OPEN_READONLY'
    ].forEach((k)=>{
      if(undefined === (state.sq3Codes[k] = capi[k])){
        toss("Maintenance required: not found:",k);
      }
    });

    /**
       Runs the given operation (by name) in the async worker
       counterpart, waits for its response, and returns the result
       which the async worker writes to SAB[state.opIds.rc]. The
       2nd and subsequent arguments must be the aruguments for the
       async op.
    */
    const opRun = (op,...args)=>{
      const opNdx = state.opIds[op] || toss("Invalid op ID:",op);
      state.s11n.serialize(...args);
      Atomics.store(state.sabOPView, state.opIds.rc, -1);
      Atomics.store(state.sabOPView, state.opIds.whichOp, opNdx);
      Atomics.notify(state.sabOPView, state.opIds.whichOp)
      /* async thread will take over here */;
      const t = performance.now();
      Atomics.wait(state.sabOPView, state.opIds.rc, -1)
      /* When this wait() call returns, the async half will have
         completed the operation and reported its results. */;
      const rc = Atomics.load(state.sabOPView, state.opIds.rc);
      metrics[op].wait += performance.now() - t;
      if(rc && state.asyncS11nExceptions){
        const err = state.s11n.deserialize();
        if(err) error(op+"() async error:",...err);
      }
      return rc;
    };

    /**
       Not part of the public API. Only for test/development use.
    */
    opfsUtil.debug = {
      asyncShutdown: ()=>{
        warn("Shutting down OPFS async listener. The OPFS VFS will no longer work.");
        opRun('opfs-async-shutdown');
      },
      asyncRestart: ()=>{
        warn("Attempting to restart OPFS VFS async listener. Might work, might not.");
        W.postMessage({type: 'opfs-async-restart'});
      }
    };

    const initS11n = ()=>{
      /**
         !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
         ACHTUNG: this code is 100% duplicated in the other half of
         this proxy! The documentation is maintained in the
         "synchronous half".
         !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

         This proxy de/serializes cross-thread function arguments and
         output-pointer values via the state.sabIO SharedArrayBuffer,
         using the region defined by (state.sabS11nOffset,
         state.sabS11nOffset]. Only one dataset is recorded at a time.

         This is not a general-purpose format. It only supports the
         range of operations, and data sizes, needed by the
         sqlite3_vfs and sqlite3_io_methods operations. Serialized
         data are transient and this serialization algorithm may
         change at any time.

         The data format can be succinctly summarized as:

         Nt...Td...D

         Where:

         - N = number of entries (1 byte)

         - t = type ID of first argument (1 byte)

         - ...T = type IDs of the 2nd and subsequent arguments (1 byte
         each).

         - d = raw bytes of first argument (per-type size).

         - ...D = raw bytes of the 2nd and subsequent arguments (per-type
         size).

         All types except strings have fixed sizes. Strings are stored
         using their TextEncoder/TextDecoder representations. It would
         arguably make more sense to store them as Int16Arrays of
         their JS character values, but how best/fastest to get that
         in and out of string form is an open point. Initial
         experimentation with that approach did not gain us any speed.

         Historical note: this impl was initially about 1% this size by
         using using JSON.stringify/parse(), but using fit-to-purpose
         serialization saves considerable runtime.
      */
      if(state.s11n) return state.s11n;
      const textDecoder = new TextDecoder(),
            textEncoder = new TextEncoder('utf-8'),
            viewU8 = new Uint8Array(state.sabIO, state.sabS11nOffset, state.sabS11nSize),
            viewDV = new DataView(state.sabIO, state.sabS11nOffset, state.sabS11nSize);
      state.s11n = Object.create(null);
      /* Only arguments and return values of these types may be
         serialized. This covers the whole range of types needed by the
         sqlite3_vfs API. */
      const TypeIds = Object.create(null);
      TypeIds.number  = { id: 1, size: 8, getter: 'getFloat64', setter: 'setFloat64' };
      TypeIds.bigint  = { id: 2, size: 8, getter: 'getBigInt64', setter: 'setBigInt64' };
      TypeIds.boolean = { id: 3, size: 4, getter: 'getInt32', setter: 'setInt32' };
      TypeIds.string =  { id: 4 };

      const getTypeId = (v)=>(
        TypeIds[typeof v]
          || toss("Maintenance required: this value type cannot be serialized.",v)
      );
      const getTypeIdById = (tid)=>{
        switch(tid){
            case TypeIds.number.id: return TypeIds.number;
            case TypeIds.bigint.id: return TypeIds.bigint;
            case TypeIds.boolean.id: return TypeIds.boolean;
            case TypeIds.string.id: return TypeIds.string;
            default: toss("Invalid type ID:",tid);
        }
      };

      /**
         Returns an array of the deserialized state stored by the most
         recent serialize() operation (from from this thread or the
         counterpart thread), or null if the serialization buffer is empty.
      */
      state.s11n.deserialize = function(){
        ++metrics.s11n.deserialize.count;
        const t = performance.now();
        const argc = viewU8[0];
        const rc = argc ? [] : null;
        if(argc){
          const typeIds = [];
          let offset = 1, i, n, v;
          for(i = 0; i < argc; ++i, ++offset){
            typeIds.push(getTypeIdById(viewU8[offset]));
          }
          for(i = 0; i < argc; ++i){
            const t = typeIds[i];
            if(t.getter){
              v = viewDV[t.getter](offset, state.littleEndian);
              offset += t.size;
            }else{/*String*/
              n = viewDV.getInt32(offset, state.littleEndian);
              offset += 4;
              v = textDecoder.decode(viewU8.slice(offset, offset+n));
              offset += n;
            }
            rc.push(v);
          }
        }
        //log("deserialize:",argc, rc);
        metrics.s11n.deserialize.time += performance.now() - t;
        return rc;
      };

      /**
         Serializes all arguments to the shared buffer for consumption
         by the counterpart thread.

         This routine is only intended for serializing OPFS VFS
         arguments and (in at least one special case) result values,
         and the buffer is sized to be able to comfortably handle
         those.

         If passed no arguments then it zeroes out the serialization
         state.
      */
      state.s11n.serialize = function(...args){
        const t = performance.now();
        ++metrics.s11n.serialize.count;
        if(args.length){
          //log("serialize():",args);
          const typeIds = [];
          let i = 0, offset = 1;
          viewU8[0] = args.length & 0xff /* header = # of args */;
          for(; i < args.length; ++i, ++offset){
            /* Write the TypeIds.id value into the next args.length
               bytes. */
            typeIds.push(getTypeId(args[i]));
            viewU8[offset] = typeIds[i].id;
          }
          for(i = 0; i < args.length; ++i) {
            /* Deserialize the following bytes based on their
               corresponding TypeIds.id from the header. */
            const t = typeIds[i];
            if(t.setter){
              viewDV[t.setter](offset, args[i], state.littleEndian);
              offset += t.size;
            }else{/*String*/
              const s = textEncoder.encode(args[i]);
              viewDV.setInt32(offset, s.byteLength, state.littleEndian);
              offset += 4;
              viewU8.set(s, offset);
              offset += s.byteLength;
            }
          }
          //log("serialize() result:",viewU8.slice(0,offset));
        }else{
          viewU8[0] = 0;
        }
        metrics.s11n.serialize.time += performance.now() - t;
      };
      return state.s11n;
    }/*initS11n()*/;

    /**
       Generates a random ASCII string len characters long, intended for
       use as a temporary file name.
    */
    const randomFilename = function f(len=16){
      if(!f._chars){
        f._chars = "abcdefghijklmnopqrstuvwxyz"+
          "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+
          "012346789";
        f._n = f._chars.length;
      }
      const a = [];
      let i = 0;
      for( ; i < len; ++i){
        const ndx = Math.random() * (f._n * 64) % f._n | 0;
        a[i] = f._chars[ndx];
      }
      return a.join('');
    };

    /**
       Map of sqlite3_file pointers to objects constructed by xOpen().
    */
    const __openFiles = Object.create(null);

    /**
       Installs a StructBinder-bound function pointer member of the
       given name and function in the given StructType target object.
       It creates a WASM proxy for the given function and arranges for
       that proxy to be cleaned up when tgt.dispose() is called.  Throws
       on the slightest hint of error (e.g. tgt is-not-a StructType,
       name does not map to a struct-bound member, etc.).

       Returns a proxy for this function which is bound to tgt and takes
       2 args (name,func). That function returns the same thing,
       permitting calls to be chained.

       If called with only 1 arg, it has no side effects but returns a
       func with the same signature as described above.
    */
    const installMethod = function callee(tgt, name, func){
      if(!(tgt instanceof sqlite3.StructBinder.StructType)){
        toss("Usage error: target object is-not-a StructType.");
      }
      if(1===arguments.length){
        return (n,f)=>callee(tgt,n,f);
      }
      if(!callee.argcProxy){
        callee.argcProxy = function(func,sig){
          return function(...args){
            if(func.length!==arguments.length){
              toss("Argument mismatch. Native signature is:",sig);
            }
            return func.apply(this, args);
          }
        };
        callee.removeFuncList = function(){
          if(this.ondispose.__removeFuncList){
            this.ondispose.__removeFuncList.forEach(
              (v,ndx)=>{
                if('number'===typeof v){
                  try{wasm.uninstallFunction(v)}
                  catch(e){/*ignore*/}
                }
                /* else it's a descriptive label for the next number in
                   the list. */
              }
            );
            delete this.ondispose.__removeFuncList;
          }
        };
      }/*static init*/
      const sigN = tgt.memberSignature(name);
      if(sigN.length<2){
        toss("Member",name," is not a function pointer. Signature =",sigN);
      }
      const memKey = tgt.memberKey(name);
      const fProxy = 0
      /** This middle-man proxy is only for use during development, to
          confirm that we always pass the proper number of
          arguments. We know that the C-level code will always use the
          correct argument count. */
            ? callee.argcProxy(func, sigN)
            : func;
      const pFunc = wasm.installFunction(fProxy, tgt.memberSignature(name, true));
      tgt[memKey] = pFunc;
      if(!tgt.ondispose) tgt.ondispose = [];
      if(!tgt.ondispose.__removeFuncList){
        tgt.ondispose.push('ondispose.__removeFuncList handler',
                           callee.removeFuncList);
        tgt.ondispose.__removeFuncList = [];
      }
      tgt.ondispose.__removeFuncList.push(memKey, pFunc);
      return (n,f)=>callee(tgt, n, f);
    }/*installMethod*/;

    const opTimer = Object.create(null);
    opTimer.op = undefined;
    opTimer.start = undefined;
    const mTimeStart = (op)=>{
      opTimer.start = performance.now();
      opTimer.op = op;
      ++metrics[op].count;
    };
    const mTimeEnd = ()=>(
      metrics[opTimer.op].time += performance.now() - opTimer.start
    );

    /**
       Impls for the sqlite3_io_methods methods. Maintenance reminder:
       members are in alphabetical order to simplify finding them.
    */
    const ioSyncWrappers = {
      xCheckReservedLock: function(pFile,pOut){
        /**
           As of late 2022, only a single lock can be held on an OPFS
           file. We have no way of checking whether any _other_ db
           connection has a lock except by trying to obtain and (on
           success) release a sync-handle for it, but doing so would
           involve an inherent race condition. For the time being,
           pending a better solution, we simply report whether the
           given pFile instance has a lock.
        */
        const f = __openFiles[pFile];
        wasm.setMemValue(pOut, f.lockMode ? 1 : 0, 'i32');
        return 0;
      },
      xClose: function(pFile){
        mTimeStart('xClose');
        let rc = 0;
        const f = __openFiles[pFile];
        if(f){
          delete __openFiles[pFile];
          rc = opRun('xClose', pFile);
          if(f.sq3File) f.sq3File.dispose();
        }
        mTimeEnd();
        return rc;
      },
      xDeviceCharacteristics: function(pFile){
        //debug("xDeviceCharacteristics(",pFile,")");
        return capi.SQLITE_IOCAP_UNDELETABLE_WHEN_OPEN;
      },
      xFileControl: function(pFile, opId, pArg){
        mTimeStart('xFileControl');
        const rc = (capi.SQLITE_FCNTL_SYNC===opId)
              ? opRun('xSync', pFile, 0)
              : capi.SQLITE_NOTFOUND;
        mTimeEnd();
        return rc;
      },
      xFileSize: function(pFile,pSz64){
        mTimeStart('xFileSize');
        const rc = opRun('xFileSize', pFile);
        if(0==rc){
          const sz = state.s11n.deserialize()[0];
          wasm.setMemValue(pSz64, sz, 'i64');
        }
        mTimeEnd();
        return rc;
      },
      xLock: function(pFile,lockType){
        mTimeStart('xLock');
        const f = __openFiles[pFile];
        let rc = 0;
        if( capi.SQLITE_LOCK_NONE === f.lockType ) {
          rc = opRun('xLock', pFile, lockType);
          if( 0===rc ) f.lockType = lockType;
        }else{
          f.lockType = lockType;
        }
        mTimeEnd();
        return rc;
      },
      xRead: function(pFile,pDest,n,offset64){
        mTimeStart('xRead');
        const f = __openFiles[pFile];
        let rc;
        try {
          rc = opRun('xRead',pFile, n, Number(offset64));
          if(0===rc || capi.SQLITE_IOERR_SHORT_READ===rc){ 
            /**
               Results get written to the SharedArrayBuffer f.sabView.
               Because the heap is _not_ a SharedArrayBuffer, we have
               to copy the results. TypedArray.set() seems to be the
               fastest way to copy this. */
            wasm.heap8u().set(f.sabView.subarray(0, n), pDest);
          }
        }catch(e){
          error("xRead(",arguments,") failed:",e,f);
          rc = capi.SQLITE_IOERR_READ;
        }
        mTimeEnd();
        return rc;
      },
      xSync: function(pFile,flags){
        ++metrics.xSync.count;
        return 0; // impl'd in xFileControl()
      },
      xTruncate: function(pFile,sz64){
        mTimeStart('xTruncate');
        const rc = opRun('xTruncate', pFile, Number(sz64));
        mTimeEnd();
        return rc;
      },
      xUnlock: function(pFile,lockType){
        mTimeStart('xUnlock');
        const f = __openFiles[pFile];
        let rc = 0;
        if( capi.SQLITE_LOCK_NONE === lockType
          && f.lockType ){
          rc = opRun('xUnlock', pFile, lockType);
        }
        if( 0===rc ) f.lockType = lockType;
        mTimeEnd();
        return rc;
      },
      xWrite: function(pFile,pSrc,n,offset64){
        mTimeStart('xWrite');
        const f = __openFiles[pFile];
        let rc;
        try {
          f.sabView.set(wasm.heap8u().subarray(pSrc, pSrc+n));
          rc = opRun('xWrite', pFile, n, Number(offset64));
        }catch(e){
          error("xWrite(",arguments,") failed:",e,f);
          rc = capi.SQLITE_IOERR_WRITE;
        }
        mTimeEnd();
        return rc;
      }
    }/*ioSyncWrappers*/;

    /**
       Impls for the sqlite3_vfs methods. Maintenance reminder: members
       are in alphabetical order to simplify finding them.
    */
    const vfsSyncWrappers = {
      xAccess: function(pVfs,zName,flags,pOut){
        mTimeStart('xAccess');
        const rc = opRun('xAccess', wasm.cstringToJs(zName));
        wasm.setMemValue( pOut, (rc ? 0 : 1), 'i32' );
        mTimeEnd();
        return 0;
      },
      xCurrentTime: function(pVfs,pOut){
        /* If it turns out that we need to adjust for timezone, see:
           https://stackoverflow.com/a/11760121/1458521 */
        wasm.setMemValue(pOut, 2440587.5 + (new Date().getTime()/86400000),
                         'double');
        return 0;
      },
      xCurrentTimeInt64: function(pVfs,pOut){
        // TODO: confirm that this calculation is correct
        wasm.setMemValue(pOut, (2440587.5 * 86400000) + new Date().getTime(),
                         'i64');
        return 0;
      },
      xDelete: function(pVfs, zName, doSyncDir){
        mTimeStart('xDelete');
        opRun('xDelete', wasm.cstringToJs(zName), doSyncDir, false);
        /* We're ignoring errors because we cannot yet differentiate
           between harmless and non-harmless failures. */
        mTimeEnd();
        return 0;
      },
      xFullPathname: function(pVfs,zName,nOut,pOut){
        /* Until/unless we have some notion of "current dir"
           in OPFS, simply copy zName to pOut... */
        const i = wasm.cstrncpy(pOut, zName, nOut);
        return i<nOut ? 0 : capi.SQLITE_CANTOPEN
        /*CANTOPEN is required by the docs but SQLITE_RANGE would be a closer match*/;
      },
      xGetLastError: function(pVfs,nOut,pOut){
        /* TODO: store exception.message values from the async
           partner in a dedicated SharedArrayBuffer, noting that we'd have
           to encode them... TextEncoder can do that for us. */
        warn("OPFS xGetLastError() has nothing sensible to return.");
        return 0;
      },
      //xSleep is optionally defined below
      xOpen: function f(pVfs, zName, pFile, flags, pOutFlags){
        mTimeStart('xOpen');
        if(0===zName){
          zName = randomFilename();
        }else if('number'===typeof zName){
          zName = wasm.cstringToJs(zName);
        }
        const fh = Object.create(null);
        fh.fid = pFile;
        fh.filename = zName;
        fh.sab = new SharedArrayBuffer(state.fileBufferSize);
        fh.flags = flags;
        const rc = opRun('xOpen', pFile, zName, flags);
        if(!rc){
          /* Recall that sqlite3_vfs::xClose() will be called, even on
             error, unless pFile->pMethods is NULL. */
          if(fh.readOnly){
            wasm.setMemValue(pOutFlags, capi.SQLITE_OPEN_READONLY, 'i32');
          }
          __openFiles[pFile] = fh;
          fh.sabView = state.sabFileBufView;
          fh.sq3File = new sqlite3_file(pFile);
          fh.sq3File.$pMethods = opfsIoMethods.pointer;
          fh.lockType = capi.SQLITE_LOCK_NONE;
        }
        mTimeEnd();
        return rc;
      }/*xOpen()*/
    }/*vfsSyncWrappers*/;

    if(dVfs){
      opfsVfs.$xRandomness = dVfs.$xRandomness;
      opfsVfs.$xSleep = dVfs.$xSleep;
    }
    if(!opfsVfs.$xRandomness){
      /* If the default VFS has no xRandomness(), add a basic JS impl... */
      vfsSyncWrappers.xRandomness = function(pVfs, nOut, pOut){
        const heap = wasm.heap8u();
        let i = 0;
        for(; i < nOut; ++i) heap[pOut + i] = (Math.random()*255000) & 0xFF;
        return i;
      };
    }
    if(!opfsVfs.$xSleep){
      /* If we can inherit an xSleep() impl from the default VFS then
         assume it's sane and use it, otherwise install a JS-based
         one. */
      vfsSyncWrappers.xSleep = function(pVfs,ms){
        Atomics.wait(state.sabOPView, state.opIds.xSleep, 0, ms);
        return 0;
      };
    }

    /* Install the vfs/io_methods into their C-level shared instances... */
    for(let k of Object.keys(ioSyncWrappers)){
      installMethod(opfsIoMethods, k, ioSyncWrappers[k]);
    }
    for(let k of Object.keys(vfsSyncWrappers)){
      installMethod(opfsVfs, k, vfsSyncWrappers[k]);
    }

    /**
       Expects an OPFS file path. It gets resolved, such that ".."
       components are properly expanded, and returned. If the 2nd arg
       is true, the result is returned as an array of path elements,
       else an absolute path string is returned.
    */
    opfsUtil.getResolvedPath = function(filename,splitIt){
      const p = new URL(filename, "file://irrelevant").pathname;
      return splitIt ? p.split('/').filter((v)=>!!v) : p;
    };

    /**
       Takes the absolute path to a filesystem element. Returns an
       array of [handleOfContainingDir, filename]. If the 2nd argument
       is truthy then each directory element leading to the file is
       created along the way. Throws if any creation or resolution
       fails.
    */
    opfsUtil.getDirForFilename = async function f(absFilename, createDirs = false){
      const path = opfsUtil.getResolvedPath(absFilename, true);
      const filename = path.pop();
      let dh = opfsUtil.rootDirectory;
      for(const dirName of path){
        if(dirName){
          dh = await dh.getDirectoryHandle(dirName, {create: !!createDirs});
        }
      }
      return [dh, filename];
    };

    /**
       Creates the given directory name, recursively, in
       the OPFS filesystem. Returns true if it succeeds or the
       directory already exists, else false.
    */
    opfsUtil.mkdir = async function(absDirName){
      try {
        await opfsUtil.getDirForFilename(absDirName+"/filepart", true);
        return true;
      }catch(e){
        //console.warn("mkdir(",absDirName,") failed:",e);
        return false;
      }
    };
    /**
       Checks whether the given OPFS filesystem entry exists,
       returning true if it does, false if it doesn't.
    */
    opfsUtil.entryExists = async function(fsEntryName){
      try {
        const [dh, fn] = await opfsUtil.getDirForFilename(fsEntryName);
        await dh.getFileHandle(fn);
        return true;
      }catch(e){
        return false;
      }
    };

    /**
       Generates a random ASCII string, intended for use as a
       temporary file name. Its argument is the length of the string,
       defaulting to 16.
    */
    opfsUtil.randomFilename = randomFilename;

    /**
       Re-registers the OPFS VFS. This is intended only for odd use
       cases which have to call sqlite3_shutdown() as part of their
       initialization process, which will unregister the VFS
       registered by installOpfsVfs(). If passed a truthy value, the
       OPFS VFS is registered as the default VFS, else it is not made
       the default. Returns the result of the the
       sqlite3_vfs_register() call.

       Design note: the problem of having to re-register things after
       a shutdown/initialize pair is more general. How to best plug
       that in to the library is unclear. In particular, we cannot
       hook in to any C-side calls to sqlite3_initialize(), so we
       cannot add an after-initialize callback mechanism.
    */
    opfsUtil.registerVfs = (asDefault=false)=>{
      return wasm.exports.sqlite3_vfs_register(
        opfsVfs.pointer, asDefault ? 1 : 0
      );
    };

    /**
       Returns a promise which resolves to an object which represents
       all files and directories in the OPFS tree. The top-most object
       has two properties: `dirs` is an array of directory entries
       (described below) and `files` is a list of file names for all
       files in that directory.

       Traversal starts at sqlite3.opfs.rootDirectory.

       Each `dirs` entry is an object in this form:

       ```
       { name: directoryName,
         dirs: [...subdirs],
         files: [...file names]
       }
       ```

       The `files` and `subdirs` entries are always set but may be
       empty arrays.

       The returned object has the same structure but its `name` is
       an empty string. All returned objects are created with
       Object.create(null), so have no prototype.

       Design note: the entries do not contain more information,
       e.g. file sizes, because getting such info is not only
       expensive but is subject to locking-related errors.
    */
    opfsUtil.treeList = async function(){
      const doDir = async function callee(dirHandle,tgt){
        tgt.name = dirHandle.name;
        tgt.dirs = [];
        tgt.files = [];
        for await (const handle of dirHandle.values()){
          if('directory' === handle.kind){
            const subDir = Object.create(null);
            tgt.dirs.push(subDir);
            await callee(handle, subDir);
          }else{
            tgt.files.push(handle.name);
          }
        }
      };
      const root = Object.create(null);
      await doDir(opfsUtil.rootDirectory, root);
      return root;
    };

    /**
       Irrevocably deletes _all_ files in the current origin's OPFS.
       Obviously, this must be used with great caution. It may throw
       an exception if removal of anything fails (e.g. a file is
       locked), but the precise conditions under which it will throw
       are not documented (so we cannot tell you what they are).
    */
    opfsUtil.rmfr = async function(){
      const dir = opfsUtil.rootDirectory, opt = {recurse: true};
      for await (const handle of dir.values()){
        dir.removeEntry(handle.name, opt);
      }
    };

    /**
       Deletes the given OPFS filesystem entry.  As this environment
       has no notion of "current directory", the given name must be an
       absolute path. If the 2nd argument is truthy, deletion is
       recursive (use with caution!).

       The returned Promise resolves to true if the deletion was
       successful, else false (but...). The OPFS API reports the
       reason for the failure only in human-readable form, not
       exceptions which can be type-checked to determine the
       failure. Because of that...

       If the final argument is truthy then this function will
       propagate any exception on error, rather than returning false.
    */
    opfsUtil.unlink = async function(fsEntryName, recursive = false,
                                          throwOnError = false){
      try {
        const [hDir, filenamePart] =
              await opfsUtil.getDirForFilename(fsEntryName, false);
        await hDir.removeEntry(filenamePart, {recursive});
        return true;
      }catch(e){
        if(throwOnError){
          throw new Error("unlink(",arguments[0],") failed: "+e.message,{
            cause: e
          });
        }
        return false;
      }
    };

    /**
       Traverses the OPFS filesystem, calling a callback for each one.
       The argument may be either a callback function or an options object
       with any of the following properties:

       - `callback`: function which gets called for each filesystem
         entry.  It gets passed 3 arguments: 1) the
         FileSystemFileHandle or FileSystemDirectoryHandle of each
         entry (noting that both are instanceof FileSystemHandle). 2)
         the FileSystemDirectoryHandle of the parent directory. 3) the
         current depth level, with 0 being at the top of the tree
         relative to the starting directory. If the callback returns a
         literal false, as opposed to any other falsy value, traversal
         stops without an error. Any exceptions it throws are
         propagated. Results are undefined if the callback manipulate
         the filesystem (e.g. removing or adding entries) because the
         how OPFS iterators behave in the face of such changes is
         undocumented.

       - `recursive` [bool=true]: specifies whether to recurse into
         subdirectories or not. Whether recursion is depth-first or
         breadth-first is unspecified!

       - `directory` [FileSystemDirectoryEntry=sqlite3.opfs.rootDirectory]
         specifies the starting directory.

       If this function is passed a function, it is assumed to be the
       callback.

       Returns a promise because it has to (by virtue of being async)
       but that promise has no specific meaning: the traversal it
       performs is synchronous. The promise must be used to catch any
       exceptions propagated by the callback, however.

       TODO: add an option which specifies whether to traverse
       depth-first or breadth-first. We currently do depth-first but
       an incremental file browsing widget would benefit more from
       breadth-first.
    */
    opfsUtil.traverse = async function(opt){
      const defaultOpt = {
        recursive: true,
        directory: opfsUtil.rootDirectory
      };
      if('function'===typeof opt){
        opt = {callback:opt};
      }
      opt = Object.assign(defaultOpt, opt||{});
      const doDir = async function callee(dirHandle, depth){
        for await (const handle of dirHandle.values()){
          if(false === opt.callback(handle, dirHandle, depth)) return false;
          else if(opt.recursive && 'directory' === handle.kind){
            if(false === await callee(handle, depth + 1)) break;
          }
        }
      };
      doDir(opt.directory, 0);
    };

    //TODO to support fiddle and worker1 db upload:
    //opfsUtil.createFile = function(absName, content=undefined){...}

    if(sqlite3.oo1){
      opfsUtil.OpfsDb = function(...args){
        const opt = sqlite3.oo1.DB.dbCtorHelper.normalizeArgs(...args);
        opt.vfs = opfsVfs.$zName;
        sqlite3.oo1.DB.dbCtorHelper.call(this, opt);
      };
      opfsUtil.OpfsDb.prototype = Object.create(sqlite3.oo1.DB.prototype);
      sqlite3.oo1.DB.dbCtorHelper.setVfsPostOpenSql(
        opfsVfs.pointer,
        [
          /* Truncate journal mode is faster than delete or wal for
             this vfs, per speedtest1. */
          "pragma journal_mode=truncate;"
          /*
            This vfs benefits hugely from cache on moderate/large
            speedtest1 --size 50 and --size 100 workloads. We currently
            rely on setting a non-default cache size when building
            sqlite3.wasm. If that policy changes, the cache can
            be set here.
          */
          //"pragma cache_size=-8388608;"
        ].join('')
      );
    }

    /**
       Potential TODOs:

       - Expose one or both of the Worker objects via opfsUtil and
         publish an interface for proxying the higher-level OPFS
         features like getting a directory listing.
    */
    const sanityCheck = function(){
      const scope = wasm.scopedAllocPush();
      const sq3File = new sqlite3_file();
      try{
        const fid = sq3File.pointer;
        const openFlags = capi.SQLITE_OPEN_CREATE
              | capi.SQLITE_OPEN_READWRITE
        //| capi.SQLITE_OPEN_DELETEONCLOSE
              | capi.SQLITE_OPEN_MAIN_DB;
        const pOut = wasm.scopedAlloc(8);
        const dbFile = "/sanity/check/file"+randomFilename(8);
        const zDbFile = wasm.scopedAllocCString(dbFile);
        let rc;
        state.s11n.serialize("This is ä string.");
        rc = state.s11n.deserialize();
        log("deserialize() says:",rc);
        if("This is ä string."!==rc[0]) toss("String d13n error.");
        vfsSyncWrappers.xAccess(opfsVfs.pointer, zDbFile, 0, pOut);
        rc = wasm.getMemValue(pOut,'i32');
        log("xAccess(",dbFile,") exists ?=",rc);
        rc = vfsSyncWrappers.xOpen(opfsVfs.pointer, zDbFile,
                                   fid, openFlags, pOut);
        log("open rc =",rc,"state.sabOPView[xOpen] =",
            state.sabOPView[state.opIds.xOpen]);
        if(0!==rc){
          error("open failed with code",rc);
          return;
        }
        vfsSyncWrappers.xAccess(opfsVfs.pointer, zDbFile, 0, pOut);
        rc = wasm.getMemValue(pOut,'i32');
        if(!rc) toss("xAccess() failed to detect file.");
        rc = ioSyncWrappers.xSync(sq3File.pointer, 0);
        if(rc) toss('sync failed w/ rc',rc);
        rc = ioSyncWrappers.xTruncate(sq3File.pointer, 1024);
        if(rc) toss('truncate failed w/ rc',rc);
        wasm.setMemValue(pOut,0,'i64');
        rc = ioSyncWrappers.xFileSize(sq3File.pointer, pOut);
        if(rc) toss('xFileSize failed w/ rc',rc);
        log("xFileSize says:",wasm.getMemValue(pOut, 'i64'));
        rc = ioSyncWrappers.xWrite(sq3File.pointer, zDbFile, 10, 1);
        if(rc) toss("xWrite() failed!");
        const readBuf = wasm.scopedAlloc(16);
        rc = ioSyncWrappers.xRead(sq3File.pointer, readBuf, 6, 2);
        wasm.setMemValue(readBuf+6,0);
        let jRead = wasm.cstringToJs(readBuf);
        log("xRead() got:",jRead);
        if("sanity"!==jRead) toss("Unexpected xRead() value.");
        if(vfsSyncWrappers.xSleep){
          log("xSleep()ing before close()ing...");
          vfsSyncWrappers.xSleep(opfsVfs.pointer,2000);
          log("waking up from xSleep()");
        }
        rc = ioSyncWrappers.xClose(fid);
        log("xClose rc =",rc,"sabOPView =",state.sabOPView);
        log("Deleting file:",dbFile);
        vfsSyncWrappers.xDelete(opfsVfs.pointer, zDbFile, 0x1234);
        vfsSyncWrappers.xAccess(opfsVfs.pointer, zDbFile, 0, pOut);
        rc = wasm.getMemValue(pOut,'i32');
        if(rc) toss("Expecting 0 from xAccess(",dbFile,") after xDelete().");
        warn("End of OPFS sanity checks.");
      }finally{
        sq3File.dispose();
        wasm.scopedAllocPop(scope);
      }
    }/*sanityCheck()*/;

    W.onmessage = function({data}){
      //log("Worker.onmessage:",data);
      switch(data.type){
          case 'opfs-async-loaded':
            /*Arrives as soon as the asyc proxy finishes loading.
              Pass our config and shared state on to the async worker.*/
            W.postMessage({type: 'opfs-async-init',args: state});
            break;
          case 'opfs-async-inited':{
            /*Indicates that the async partner has received the 'init'
              and has finished initializing, so the real work can
              begin...*/
            try {
              const rc = capi.sqlite3_vfs_register(opfsVfs.pointer, 0);
              if(rc){
                toss("sqlite3_vfs_register(OPFS) failed with rc",rc);
              }
              if(opfsVfs.pointer !== capi.sqlite3_vfs_find("opfs")){
                toss("BUG: sqlite3_vfs_find() failed for just-installed OPFS VFS");
              }
              capi.sqlite3_vfs_register.addReference(opfsVfs, opfsIoMethods);
              state.sabOPView = new Int32Array(state.sabOP);
              state.sabFileBufView = new Uint8Array(state.sabIO, 0, state.fileBufferSize);
              state.sabS11nView = new Uint8Array(state.sabIO, state.sabS11nOffset, state.sabS11nSize);
              initS11n();
              if(options.sanityChecks){
                warn("Running sanity checks because of opfs-sanity-check URL arg...");
                sanityCheck();
              }
              navigator.storage.getDirectory().then((d)=>{
                W.onerror = W._originalOnError;
                delete W._originalOnError;
                sqlite3.opfs = opfsUtil;
                opfsUtil.rootDirectory = d;
                log("End of OPFS sqlite3_vfs setup.", opfsVfs);
                promiseResolve(sqlite3);
              });
            }catch(e){
              error(e);
              promiseReject(e);
            }
            break;
          }
          default:
            promiseReject(e);
            error("Unexpected message from the async worker:",data);
            break;
      }/*switch(data.type)*/
    }/*W.onmessage()*/;
  })/*thePromise*/;
  return thePromise;
}/*installOpfsVfs()*/;
installOpfsVfs.defaultProxyUri =
  "sqlite3-opfs-async-proxy.js";
self.sqlite3ApiBootstrap.initializersAsync.push(async (sqlite3)=>{
  if(sqlite3.scriptInfo && !sqlite3.scriptInfo.isWorker){
    return;
  }
  try{
    let proxyJs = installOpfsVfs.defaultProxyUri;
    if(sqlite3.scriptInfo.sqlite3Dir){
      installOpfsVfs.defaultProxyUri =
        sqlite3.scriptInfo.sqlite3Dir + proxyJs;
      //console.warn("installOpfsVfs.defaultProxyUri =",installOpfsVfs.defaultProxyUri);
    }
    return installOpfsVfs().catch((e)=>{
      console.warn("Ignoring inability to install OPFS sqlite3_vfs:",e.message);
    });
  }catch(e){
    console.error("installOpfsVfs() exception:",e);
    throw e;
  }
});
}/*sqlite3ApiBootstrap.initializers.push()*/);
/* END FILE: api/sqlite3-api-opfs.js */
/* BEGIN FILE: api/sqlite3-api-cleanup.js */
/*
  2022-07-22

  The author disclaims copyright to this source code.  In place of a
  legal notice, here is a blessing:

  *   May you do good and not evil.
  *   May you find forgiveness for yourself and forgive others.
  *   May you share freely, never taking more than you give.

  ***********************************************************************

  This file is the tail end of the sqlite3-api.js constellation,
  intended to be appended after all other sqlite3-api-*.js files so
  that it can finalize any setup and clean up any global symbols
  temporarily used for setting up the API's various subsystems.
*/
'use strict';
if('undefined' !== typeof Module){ // presumably an Emscripten build
  /**
     Install a suitable default configuration for sqlite3ApiBootstrap().
  */
  const SABC = Object.assign(
    Object.create(null), {
      Module: Module /* ==> Currently needs to be exposed here for
                        test code. NOT part of the public API. */,
      exports: Module['asm'],
      memory: Module.wasmMemory /* gets set if built with -sIMPORT_MEMORY */
    },
    self.sqlite3ApiConfig || Object.create(null)
  );

  /**
     For current (2022-08-22) purposes, automatically call
     sqlite3ApiBootstrap().  That decision will be revisited at some
     point, as we really want client code to be able to call this to
     configure certain parts. Clients may modify
     self.sqlite3ApiBootstrap.defaultConfig to tweak the default
     configuration used by a no-args call to sqlite3ApiBootstrap(),
     but must have first loaded their WASM module in order to be
     able to provide the necessary configuration state.
  */
  //console.warn("self.sqlite3ApiConfig = ",self.sqlite3ApiConfig);
  self.sqlite3ApiConfig = SABC;
  let sqlite3;
  try{
    sqlite3 = self.sqlite3ApiBootstrap();
  }catch(e){
    console.error("sqlite3ApiBootstrap() error:",e);
    throw e;
  }finally{
    delete self.sqlite3ApiBootstrap;
    delete self.sqlite3ApiConfig;
  }

  if(self.location && +self.location.port > 1024){
    console.warn("Installing sqlite3 bits as global S for local dev/test purposes.");
    self.S = sqlite3;
  }

  /* Clean up temporary references to our APIs... */
  delete sqlite3.util /* arguable, but these are (currently) internal-use APIs */;
  Module.sqlite3 = sqlite3 /* Needed for customized sqlite3InitModule() to be able to
                              pass the sqlite3 object off to the client. */;
}else{
  console.warn("This is not running in an Emscripten module context, so",
               "self.sqlite3ApiBootstrap() is _not_ being called due to lack",
               "of config info for the WASM environment.",
               "It must be called manually.");
}
/* END FILE: api/sqlite3-api-cleanup.js */
