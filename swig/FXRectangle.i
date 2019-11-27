/* FXRectangle.i */

%pythonappend FX::FXRectangle::FXRectangle %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
//%include "include/FXRectangle.h"

namespace FX {


/// Rectangle
class FXAPI FXRectangle {
public:
  FXshort x;
  FXshort y;
  FXshort w;
  FXshort h;
public:

  /// Constructors
  FXRectangle(){ }
  FXRectangle(FXshort xx,FXshort yy,FXshort ww,FXshort hh):x(xx),y(yy),w(ww),h(hh){ }
  FXRectangle(const FXPoint& p,const FXSize& s):x(p.x),y(p.y),w(s.w),h(s.h){ }
  FXRectangle(const FXPoint& topleft,const FXPoint& bottomright):x(topleft.x),y(topleft.y),w(bottomright.x-topleft.x+1),h(bottomright.y-topleft.y+1){ }

  /// Test if empty
  bool empty() const { return w<=0 || h<=0; }

  /// Test if zero
  bool operator!() const { return x==0 && y==0 && w==0 && h==0; }

  /// Equality
  bool operator==(const FXRectangle& r) const { return x==r.x && y==r.y && w==r.w && h==r.h; }
  bool operator!=(const FXRectangle& r) const { return x!=r.x || y!=r.y || w!=r.w || h!=r.h; }

  /// Point in rectangle
  bool contains(const FXPoint& p) const { return x<=p.x && y<=p.y && p.x<x+w && p.y<y+h; }
  bool contains(FXshort xx,FXshort yy) const { return x<=xx && y<=yy && xx<x+w && yy<y+h; }

  /// Rectangle properly contained in rectangle
  bool contains(const FXRectangle& r) const { return x<=r.x && y<=r.y && r.x+r.w<=x+w && r.y+r.h<=y+h; }

  /// Rectangles overlap
  friend inline bool overlap(const FXRectangle& a,const FXRectangle& b);

  /// Return moved rectangle
  FXRectangle& move(const FXPoint& p){ x+=p.x; y+=p.y; return *this; }
  FXRectangle& move(FXshort dx,FXshort dy){ x+=dx; y+=dy; return *this; }

  /// Grow by amount
  FXRectangle& grow(FXshort margin);
  FXRectangle& grow(FXshort hormargin,FXshort vermargin);
  FXRectangle& grow(FXshort leftmargin,FXshort rightmargin,FXshort topmargin,FXshort bottommargin);

  /// Shrink by amount
  FXRectangle& shrink(FXshort margin);
  FXRectangle& shrink(FXshort hormargin,FXshort vermargin);
  FXRectangle& shrink(FXshort leftmargin,FXshort rightmargin,FXshort topmargin,FXshort bottommargin);

  /// Corners
  FXPoint tl() const { return FXPoint(x,y); }
  FXPoint tr() const { return FXPoint(x+w-1,y); }
  FXPoint bl() const { return FXPoint(x,y+h-1); }
  FXPoint br() const { return FXPoint(x+w-1,y+h-1); }

  /// Assignment
  FXRectangle& operator=(const FXRectangle& r){ x=r.x; y=r.y; w=r.w; h=r.h; return *this; }

  /// Set value from another rectangle
  FXRectangle& set(const FXRectangle& r){ x=r.x; y=r.y; w=r.w; h=r.h; return *this; }

  /// Set from point and size
  FXRectangle& set(const FXPoint& p,const FXSize& s){ x=p.x; y=p.y; w=s.w; h=s.h; return *this; }

  /// Set from corners
  FXRectangle& set(const FXPoint& topleft,const FXPoint& bottomright){ x=topleft.x; y=topleft.y; w=bottomright.x-topleft.x+1; h=bottomright.y-topleft.y+1; return *this; }

  /// Set value from components
  FXRectangle& set(FXshort xx,FXshort yy,FXshort ww,FXshort hh){ x=xx; y=yy; w=ww; h=hh; return *this; }

  /// Union and intersection with rectangle
  FXRectangle& operator+=(const FXRectangle &r);
  FXRectangle& operator*=(const FXRectangle &r);

// Redefine the FXRectangle typemap for these operators
%typemap(out) FXRectangle %{
    $result = SWIG_NewPointerObj(SWIG_as_voidptr(new FX::FXRectangle($1.x,$1.y,$1.w,$1.h)), SWIGTYPE_p_FX__FXRectangle, 0 );
%}

  /// Union and intersection between rectangles
  FXRectangle operator+(const FXRectangle& r) const;
  FXRectangle operator*(const FXRectangle& r) const;
%typemap(out) FXRectangle %{
    $result = SWIG_NewPointerObj(&$1, SWIGTYPE_p_FX__FXRectangle, 0 |  0 );
%}

  };


friend inline bool overlap(const FXRectangle& a,const FXRectangle& b){ return b.x<a.x+a.w && b.y<a.y+a.h && a.x<b.x+b.w && a.y<b.y+b.h; 
}

}
