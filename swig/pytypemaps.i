
%typemap(out) FX::FXString& %{
  return PyString_FromString($1->text());
%}
%typemap(out) FX::FXString* %{
  return PyString_FromString($1->text());
%}
%typemap(out) FX::FXString %{
  return PyString_FromString($1.text());
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
// BAA %typemap(in) FXStipplePattern "$1 = reinterpret_cast<FX::FXStipplePattern>(PyLong_AsLong($input));";
// BAA %typemap(in) FX::FXStipplePattern "$1 = reinterpret_cast<FX::FXStipplePattern>(PyLong_AsLong($input));";

%typemap(in) const void* "$1 = PyBytes_AsString($input);";

%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FXuint {
  $1 = PyLong_Check($input) ? 1 : 0;
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FX::FXuint {
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
  $1 = PyLong_Check($input) ? 1 : 0;  // BAA FXint
}
%typemap(typecheck, precedence=SWIG_TYPECHECK_INTEGER) FX::FXint {
  $1 = PyLong_Check($input) ? 1 : 0;  // BAA FX::Xint
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
