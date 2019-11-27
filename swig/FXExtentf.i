/* FXExtentf.i */

%pythonappend FX::FXExtentf::FXExtentf %{
  self.thisown = False
%}


%module FXExtentf

%include "include/fxdefs2.h"

namespace FX {


/// Extent
class FXAPI FXExtentf {
public:
  FXVec2f lower;
  FXVec2f upper;
public:

  /// Default constructor
  FXExtentf(){}

  /// Copy constructor
  FXExtentf(const FXExtentf& ext):lower(ext.lower),upper(ext.upper){}

  /// Initialize from two vectors
  FXExtentf(const FXVec2f& lo,const FXVec2f& hi):lower(lo),upper(hi){}

  /// Initialize from six numbers
  FXExtentf(FXfloat xlo,FXfloat xhi,FXfloat ylo,FXfloat yhi):lower(xlo,ylo),upper(xhi,yhi){}

  /// Indexing with 0..1
  %extend {
    // Indexing with 0 or 1
    FX::FXVec2f __getitem__(FXint i){
      if(0 <= i && i <= 1) {
          return (*self)[i];
      } else {
          PyErr_SetString(PyExc_IndexError, "index out of bounds");
          return (*self)[0];
      }
    }

    void __setitem__(FXint i,FX::FXVec2f& slice){
      if(0 <= i && i <= 1){
          PyErr_SetString(PyExc_IndexError, "index out of bounds");
      } else {
          (*self)[i]=slice;
      }
    }
  }

  /// Comparison
  bool operator==(const FXExtentf& ext) const { return lower==ext.lower && upper==ext.upper;}
  bool operator!=(const FXExtentf& ext) const { return lower!=ext.lower || upper!=ext.upper;}

  /// Width of box
  FXfloat width() const { return upper.x-lower.x; }

  /// Height of box
  FXfloat height() const { return upper.y-lower.y; }

  /// Longest side
  FXfloat longest() const;

  /// shortest side
  FXfloat shortest() const;

  /// Length of diagonal
  FXfloat diameter() const;

  /// Get radius of box
  FXfloat radius() const;

  /// Compute diagonal
  FXVec2f diagonal() const;

  /// Get center of box
  FXVec2f center() const;

  /// Test if empty
  bool empty() const;

  /// Test if box contains point x,y
  bool contains(FXfloat x,FXfloat y) const;

  /// Test if box contains point p
  bool contains(const FXVec2f& p) const;

  /// Test if box properly contains another box
  bool contains(const FXExtentf& ext) const;

  /// Include point
  FXExtentf& include(FXfloat x,FXfloat y);

  /// Include point
  FXExtentf& include(const FXVec2f& v);

  /// Include given range into extent
  FXExtentf& include(const FXExtentf& ext);

  /// Test if bounds overlap
  friend FXAPI bool overlap(const FXExtentf& a,const FXExtentf& b);

  /// Get corner number 0..3
  FXVec2f corner(FXint c) const { return FXVec2f((&lower)[c&1].x, (&lower)[(c>>1)&1].y); }

  /// Union of two boxes
  friend FXAPI FXExtentf unite(const FXExtentf& a,const FXExtentf& b);

  /// Intersection of two boxes
  friend FXAPI FXExtentf intersect(const FXExtentf& a,const FXExtentf& b);

  /// Save object to a stream
  friend FXAPI FXStream& operator<<(FXStream& store,const FXExtentf& ext);

  /// Load object from a stream
  friend FXAPI FXStream& operator>>(FXStream& store,FXExtentf& ext);
  };


extern FXAPI bool overlap(const FXExtentf& a,const FXExtentf& b);

extern FXAPI FXExtentf unite(const FXExtentf& a,const FXExtentf& b);
extern FXAPI FXExtentf intersect(const FXExtentf& a,const FXExtentf& b);

extern FXAPI FXStream& operator<<(FXStream& store,const FXExtentf& ext);
extern FXAPI FXStream& operator>>(FXStream& store,FXExtentf& ext);

}
