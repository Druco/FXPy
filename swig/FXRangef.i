/* FXRangef.i */

%pythonappend FX::FXRangef::FXRangef %{
  self.thisown = False
%}

%include "include/fxdefs2.h"

%ignore FX::FXRangef::operator=(const FXRangef& bounds);

namespace FX {


class FXSpheref;


/// Bounds
class FXAPI FXRangef {
public:
  FXVec3f lower;
  FXVec3f upper;
public:

  /// Default constructor
  FXRangef(){}

  /// Copy constructor
  FXRangef(const FXRangef& bounds):lower(bounds.lower),upper(bounds.upper){}

  /// Initialize from two vectors
  FXRangef(const FXVec3f& lo,const FXVec3f& hi):lower(lo),upper(hi){}

  /// Initialize from six numbers
  FXRangef(FXfloat xlo,FXfloat xhi,FXfloat ylo,FXfloat yhi,FXfloat zlo,FXfloat zhi):lower(xlo,ylo,zlo),upper(xhi,yhi,zhi){}

  /// Initialize box to fully contain the given bounding sphere
  FXRangef(const FXSpheref& sphere);

  /// Assignment
  FXRangef& operator=(const FXRangef& bounds){ lower=bounds.lower; upper=bounds.upper; return *this; }

  /// Set value from another range
  FXRangef& set(const FXRangef& bounds){ lower=bounds.lower; upper=bounds.upper; return *this; }

  /// Set value from two vectors
  FXRangef& set(const FXVec3f& lo,const FXVec3f& hi){ lower=lo; upper=hi; return *this; }

  /// Set value from six numbers
  FXRangef& set(FXfloat xlo,FXfloat xhi,FXfloat ylo,FXfloat yhi,FXfloat zlo,FXfloat zhi){ lower.set(xlo,ylo,zlo); upper.set(xhi,yhi,zhi); return *this; }

  %extend {
    // Indexing with 0 or 1
    FX::FXVec3f __getitem__(FXint i){
      if(0 <= i && i <= 1) {
          return (*self)[i];
      } else {
          PyErr_SetString(PyExc_IndexError, "index out of bounds");
          return (*self)[0];
      }
    }

    void __setitem__(FXint i,FX::FXVec3f& slice){
      if(0 <= i && i <= 1){
          PyErr_SetString(PyExc_IndexError, "index out of bounds");
      } else {
          (*self)[i]=slice;
      }
    }
  }

  /// Comparison
  bool operator==(const FXRangef& r) const { return lower==r.lower && upper==r.upper; }
  bool operator!=(const FXRangef& r) const { return lower!=r.lower || upper!=r.upper; }

  /// Width of box
  FXfloat width() const { return upper.x-lower.x; }

  /// Height of box
  FXfloat height() const { return upper.y-lower.y; }

  /// Depth of box
  FXfloat depth() const { return upper.z-lower.z; }

  /// Longest side
  FXfloat longest() const;

  /// shortest side
  FXfloat shortest() const;

  /// Length of diagonal
  FXfloat diameter() const;

  /// Get radius of box
  FXfloat radius() const;

  /// Compute diagonal
  FXVec3f diagonal() const;

  /// Get center of box
  FXVec3f center() const;

  /// Test if empty
  bool empty() const;

  /// Test if box contains point x,y,z
  bool contains(FXfloat x,FXfloat y,FXfloat z) const;

  /// Test if box contains point p
  bool contains(const FXVec3f& p) const;

  /// Test if box properly contains another box
  bool contains(const FXRangef& bounds) const;

  /// Test if box properly contains sphere
  bool contains(const FXSpheref& sphere) const;

  /// Include point
  FXRangef& include(FXfloat x,FXfloat y,FXfloat z);

  /// Include point
  FXRangef& include(const FXVec3f& v);

  /// Include given range into box
  FXRangef& include(const FXRangef& box);

  /// Include given sphere into this box
  FXRangef& include(const FXSpheref& sphere);

  /// Intersect box with normalized plane ax+by+cz+w; returns -1,0,+1
  FXint intersect(const FXVec4f& plane) const;

  /// Intersect box with ray u-v
  bool intersect(const FXVec3f& u,const FXVec3f& v);

  /// Test if boxes a and b overlap
  friend FXAPI bool overlap(const FXRangef& a,const FXRangef& b);

  /// Get corner number 0..7
  FXVec3f corner(FXint c) const { return FXVec3f((&lower)[c&1].x,(&lower)[(c>>1)&1].y,(&lower)[c>>2].z); }

  /// Union of two boxes
  //friend FXAPI FXRangef unite(const FXRangef& a,const FXRangef& b);

  /// Intersection of two boxes
  //friend FXAPI FXRangef intersect(const FXRangef& a,const FXRangef& b);

  /// Save object to a stream
  //friend FXAPI FXStream& operator<<(FXStream& store,const FXRangef& bounds);

  /// Load object from a stream
  //friend FXAPI FXStream& operator>>(FXStream& store,FXRangef& bounds);
  };


extern FXAPI bool overlap(const FXRangef& a,const FXRangef& b);

extern FXAPI FXRangef unite(const FXRangef& a,const FXRangef& b);
extern FXAPI FXRangef intersect(const FXRangef& a,const FXRangef& b);

extern FXAPI FXStream& operator<<(FXStream& store,const FXRangef& bounds);
extern FXAPI FXStream& operator>>(FXStream& store,FXRangef& bounds);

}
