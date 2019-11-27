/* FXSize.i */

%pythonappend FX::FXSize::FXSize %{
  self.thisown = False
%}

%include "include/fxdefs2.h"

%rename FX::FXSize::operator! is_zero;

namespace FX {

/// Size
class FXAPI FXSize {
public:
  FXshort w;
  FXshort h;
public:

  /// Constructors
  FXSize(){ }
  FXSize(const FXSize& s);
  FXSize(FXshort ww,FXshort hh);

  /// Test if empty
  bool empty() const;

  /// Test if zero
  bool operator!() const;

  /// Equality
  bool operator==(const FXSize& s);
  bool operator!=(const FXSize& s);

  /// Grow by amount
  FXSize& grow(FXshort margin);
  FXSize& grow(FXshort hormargin,FXshort vermargin);
  FXSize& grow(FXshort leftmargin,FXshort rightmargin,FXshort topmargin,FXshort bottommargin);

  /// Shrink by amount
  FXSize& shrink(FXshort margin);
  FXSize& shrink(FXshort hormargin,FXshort vermargin);
  FXSize& shrink(FXshort leftmargin,FXshort rightmargin,FXshort topmargin,FXshort bottommargin);

  /// Set value from another size
  FXSize& set(const FXSize& s);

  /// Set value from components
  FXSize& set(FXshort ww,FXshort hh);

  /// Assignment operators
  FXSize& operator+=(const FXSize& s);
  FXSize& operator-=(const FXSize& s);
  FXSize& operator*=(FXshort c);
  FXSize& operator/=(FXshort c);

  /// Negation
  FXSize operator-();

  %extend {
      FXSize operator+(const FXSize &s) const { return *self +s; }
      FXSize operator-(const FXSize& s) const { return *self - s; }
      FXSize operator*(FXshort c) const { return *self * c; }
      FXSize operator/(FXshort c) const { return *self / c; }
  }
  };
}
