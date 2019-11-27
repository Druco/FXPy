
%typemap(out) FXString& %{
  return PyString_FromString($1->text());
%}
%typemap(out) FX::FXString& %{
  return PyString_FromString($1->text());
%}
%typemap(out) FX::FXString* %{
  return PyString_FromString($1->text());
%}
%typemap(out) FX::FXString %{
  return PyString_FromString($1.text());
%}

%typemap(out) FX::FXRegistry& %{
    $result = SWIG_NewPointerObj($1, SWIGTYPE_p_FX__FXRegistry, 0 |  0 );
%}
%typemap(out) FXRegistry& %{
    $result = SWIG_NewPointerObj($1, SWIGTYPE_p_FX__FXRegistry, 0 |  0 );
%}

%typemap(out) FX::FXRectangle %{
    $result = SWIG_NewPointerObj(&$1, SWIGTYPE_p_FX__FXRectangle, 0 |  0 );
%}
%typemap(out) FXRectangle %{
    $result = SWIG_NewPointerObj(&$1, SWIGTYPE_p_FX__FXRectangle, 0 |  0 );
%}

%typemap(out) FX::FXint* "return PyLong_FromLong($1);";
%typemap(out) FXint "return PyLong_FromLong($1);";

%typemap(in) FXuchar "$1 = PyLong_AsUnsignedLong($input);";
%typemap(in) FX::FXuchar "$1 = PyLong_AsUnsignedLong($input);";
%typemap(in) FXchar "$1 = PyLong_AsLong($input);";
%typemap(in) FX::FXchar "$1 = PyLong_AsLong($input);";
%typemap(in) FXuint "$1 = PyLong_AsUnsignedLong($input);";
%typemap(in) FX::FXuint "$1 = PyLong_AsUnsignedLong($input);";
%typemap(in) FXint "$1 = PyLong_AsLong($input);";
%typemap(in) FX::FXint "$1 = PyLong_AsLong($input);";
%typemap(in) FXfloat "$1 = PyFloat_AsDouble($input);";
%typemap(in) FX::FXfloat "$1 = PyFloat_AsDouble($input);";
%typemap(in) FXdouble "$1 = PyFloat_AsDouble($input);";
%typemap(in) FX::FXdouble "$1 = PyFloat_AsDouble($input);";
%typemap(in) FXColor "$1 = PyLong_AsUnsignedLong($input);";
%typemap(in) FX::FXColor "$1 = PyLong_AsUnsignedLong($input);";
%typemap(out) FXColor "$result = (PyLong_FromUnsignedLong($1 & 0xffffff));";
%typemap(out) FX::FXColor "$result = (PyLong_FromUnsignedLong($1 & 0xffffff));";
%typemap(in) FXSelector "$1 = PyLong_AsUnsignedLong($input);";
%typemap(in) FX::FXSelector "$1 = PyLong_AsUnsignedLong($input);";

%typemap(in) const void* "$1 = PyBytes_AsString($input);";
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) const void* {
    $1 = PyBytes_Check($input) ? 1 : 0;
}
%typemap(in) void* handle__ptr (int tmp) {
    if ($input == Py_None || $input == 0)
        $1 = reinterpret_cast<void*>(NULL);
    else if (PyUnicode_Check($input)) {
        char *cstr;
        Py_ssize_t len;
        PyBytes_AsStringAndSize(PyUnicode_AsUTF8String($input), &cstr, &len);
        $1 = reinterpret_cast<void*>(cstr);
    }
    else {
        ushort selid = _FXSELID(arg3);
        tmp = PyLong_AsLong($input);
        if (selid == FXWindow::ID_SETVALUE) {
            $1 = reinterpret_cast<void*>(tmp);
        } else {
            $1 = reinterpret_cast<void*>(&tmp);
        }
    }
}

%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FXuint {
  $1 = PyLong_Check($input) ? 1 : 0;
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FX::FXuint {
  $1 = PyLong_Check($input) ? 1 : 0;
}

%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FXSelector {
  $1 = PyLong_Check($input) ? 1 : 0;
}

%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FX::FXSelector {
  $1 = PyLong_Check($input) ? 1 : 0;
}

%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FXuchar {
  $1 = PyLong_Check($input) ? 1 : 0;
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FX::FXuchar {
  $1 = PyLong_Check($input) ? 1 : 0;
}

%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FXchar {
  $1 = PyLong_Check($input) ? 1 : 0;
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FX::FXchar {
  $1 = PyLong_Check($input) ? 1 : 0;
}

%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FXint {
  $1 = PyLong_Check($input) ? 1 : 0;
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FX::FXint {
  $1 = PyLong_Check($input) ? 1 : 0;
}

%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FXfloat {
  $1 = PyFloat_Check($input) ? 1 : 0;
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FX::FXfloat {
  $1 = PyFloat_Check($input) ? 1 : 0;
}

%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FXdouble {
  $1 = PyFloat_Check($input) ? 1 : 0;
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FX::FXdouble {
  $1 = PyFloat_Check($input) ? 1 : 0;
}

%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FXColor {
  $1 = PyLong_Check($input) ? 1 : 0;
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FX::FXColor {
  $1 = PyLong_Check($input) ? 1 : 0;
}

/* Convert Python String to FXString */
%{
namespace FX {
inline FXString to_FXString(PyObject *obj){
  if(obj != 0){
    obj = PyUnicode_AsUTF8String(obj);
    if (obj) {
        char *cstr;
        Py_ssize_t len;
        PyBytes_AsStringAndSize(obj, &cstr, &len);
        return FXString(reinterpret_cast<FX::FXchar*>(cstr));
    }
    else 
        return FXString(FXString::null);
    }
  else{
    return FXString(FXString::null);
    }
  }
}
%}

%typemap(in) FX::FXString "$1 = to_FXString($input);";
%typemap(in) FX::FXString const & (SwigValueWrapper<FXString>p) "p = to_FXString($input); $1 = &p;";
%typemap(typecheck, precedence=SWIG_TYPECHECK_STRING) FX::FXString const & {
    $1 = PyUnicode_Check($input) ? 1 : 0;
}

// Input is an array of FXPoints
%typemap(typecheck, precedence=SWIG_TYPECHECK_STRING) const FXPoint * {
    void *argp = 0;
    int res = 0;
    if (PyList_Check($input)) {
        PyObject *o = PyList_GetItem($input, 0);
        int r = SWIG_ConvertPtr(o, &argp, SWIGTYPE_p_FX__FXPoint, 0);
        if (SWIG_IsOK(r))
            res = 1;
    }
    $1 = res;
 }

%typemap(in) const FXPoint * {
    FX::FXPoint *myarg1;
    void *myargp1 = 0;
    int myres1 = 0;

    /* Check if is a list */
    if (PyList_Check($input)) {
        int mysize = PyList_Size($input);
        $1 = (FXPoint *) malloc((mysize+1)*sizeof(FXPoint));
        for (int i = 0; i < mysize; i++) {
            PyObject *myo = PyList_GetItem($input, i);
            myres1 = SWIG_ConvertPtr(myo, &myargp1, SWIGTYPE_p_FX__FXPoint, 0 | 0);
            if (SWIG_IsOK(myres1)) {
                myarg1 = reinterpret_cast<FX::FXPoint *>(myargp1);
                $1[i] = *myarg1;
            } else {
                free($1);
                PyErr_SetString(PyExc_TypeError, "list must contain FXPoint");
                SWIG_fail;
            }
        }
    } else {
        PyErr_SetString(PyExc_TypeError, "not a list");
        SWIG_fail;
    }
 }

// This cleans up the char ** array we malloc'd before the function call
%typemap(freearg) const FXPoint * {
  free($1);
}

// Input is an array of FXSegments
%typemap(in) const FXSegment * {
    FX::FXSegment *arg1;
    void *argp1 = 0;
    int res1 = 0;

    /* Check if is a list */
    if (PyList_Check($input)) {
        int size = PyList_Size($input);
        int i = 0;
        $1 = (FXSegment *) malloc((size+1)*sizeof(FXSegment));
        for (i = 0; i < size; i++) {
            PyObject *o = PyList_GetItem($input, i);
            res1 = SWIG_ConvertPtr(o, &argp1, SWIGTYPE_p_FX__FXSegment, 0 | 0);
            if (SWIG_IsOK(res1)) {
                arg1 = reinterpret_cast<FX::FXSegment *>(argp1);
                $1[i] = *arg1;
            } else {
                free($1);
                PyErr_SetString(PyExc_TypeError, "list must contain FXSegment");
                SWIG_fail;
            }
        }
    } else {
        PyErr_SetString(PyExc_TypeError, "not a list");
        SWIG_fail;
    }
 }

// This cleans up the char ** array we malloc'd before the function call
%typemap(freearg) const FXSegment * {
  free($1);
}

// Input is an array of FXRectangles
%typemap(in) const FXRectangle * {
    FX::FXRectangle *arg1;
    void *argp1 = 0;
    int res1 = 0;

    /* Check if is a list */
    if (PyList_Check($input)) {
        int size = PyList_Size($input);
        int i = 0;
        $1 = (FXRectangle *) malloc((size+1)*sizeof(FXRectangle));
        for (i = 0; i < size; i++) {
            PyObject *o = PyList_GetItem($input, i);
            res1 = SWIG_ConvertPtr(o, &argp1, SWIGTYPE_p_FX__FXRectangle, 0 | 0);
            if (SWIG_IsOK(res1)) {
                arg1 = reinterpret_cast<FX::FXRectangle *>(argp1);
                $1[i] = *arg1;
            } else {
                free($1);
                PyErr_SetString(PyExc_TypeError, "list must contain FXRectangle");
                SWIG_fail;
            }
        }
    } else {
        PyErr_SetString(PyExc_TypeError, "not a list");
        SWIG_fail;
    }
 }

// This cleans up the char ** array we malloc'd before the function call
%typemap(freearg) const FXRectangle * {
  free($1);
}

// Input is an array of FXArcs
%typemap(in) const FXArc * {
    FX::FXArc *arg1;
    void *argp1 = 0;
    int res1 = 0;

    /* Check if is a list */
    if (PyList_Check($input)) {
        int size = PyList_Size($input);
        int i = 0;
        $1 = (FXArc *) malloc((size+1)*sizeof(FXArc));
        for (i = 0; i < size; i++) {
            PyObject *o = PyList_GetItem($input, i);
            res1 = SWIG_ConvertPtr(o, &argp1, SWIGTYPE_p_FX__FXArc, 0 | 0);
            if (SWIG_IsOK(res1)) {
                arg1 = reinterpret_cast<FX::FXArc *>(argp1);
                $1[i] = *arg1;
            } else {
                free($1);
                PyErr_SetString(PyExc_TypeError, "list must contain FXArc");
                SWIG_fail;
            }
        }
    } else {
        PyErr_SetString(PyExc_TypeError, "not a list");
        SWIG_fail;
    }
 }

// This cleans up the char ** array we malloc'd before the function call
%typemap(freearg) const FXArc * {
  free($1);
}

// Input is an array of FXPoints
%typemap(typecheck, precedence=SWIG_TYPECHECK_STRING) const FXColor * {
    void *argp = 0;
    int res = 0;
    if (PyList_Check($input)) {
        PyObject *o = PyList_GetItem($input, 0);
        if (PyLong_Check(o))
            res = 1;
    }
    $1 = res;
 }

// An array of FXColors
%typemap(in) const FXColor * {
    FX::FXColor *myarg1;
    void *myargp1 = 0;
    int myres1 = 0;

    /* Check if is a list */
    if (PyList_Check($input)) {
        int mysize = PyList_Size($input);
        $1 = (FXColor *) malloc((mysize+1)*sizeof(FXColor));
        for (int i = 0; i < mysize; i++) {
            PyObject *myo = PyList_GetItem($input, i);
            $1[i] = PyLong_AsUnsignedLong(myo);
        }
    } else {
        PyErr_SetString(PyExc_TypeError, "not a list");
        SWIG_fail;
    }
 }

// This cleans up the Color array we malloc'd before the function call
%typemap(freearg) const FXColor * {
  free($1);
}
