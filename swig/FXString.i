/* FXString.i */

%pythonappend FX::FXString::FXString %{
  self.thisown = False
%}

%ignore vformat;
%ignore vscan;
%ignore FXStringVFormat;

%include "include/fxdefs2.h"

typedef char FXchar;

namespace FX {


/**
* FXString provides essential string manipulation capabilities.
*/
class FXString {
public:
  static const FXchar null[];
  static const FXchar hex[17];
  static const FXchar HEX[17];
public:
  static const signed char utfBytes[256];
public:

  /// Create empty string
  FXString();
  };

}
