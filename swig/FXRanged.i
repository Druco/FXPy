/* FXRanged.i */

%pythonappend FX::FXRanged::FXRanged %{
  self.thisown = False
%}

%rename("$ignore", fullname=1) FX::FXRanged::operator[];
%ignore FX::FXRanged::operator=(const FXRanged& bounds);

%include "include/fxdefs2.h"

namespace FX {


class FXSphered;


/// Bounds
class FXAPI FXRanged {
public:
  FXVec3d lower;
  FXVec3d upper;
public:

  /// Default constructor
  FXRanged(){}

  /// Initialize from another range
  FXRanged(const FXRanged& bounds):lower(bounds.lower),upper(bounds.upper){}

  /// Initialize from two vectors
  FXRanged(const FXVec3d& lo,const FXVec3d& hi):lower(lo),upper(hi){}

  /// Initialize from six numbers
  FXRanged(FXdouble xlo,FXdouble xhi,FXdouble ylo,FXdouble yhi,FXdouble zlo,FXdouble zhi):lower(xlo,ylo,zlo),upper(xhi,yhi,zhi){}

  /// Initialize box to fully contain the given bounding sphere
  FXRanged(const FXSphered& sphere);

  /// Assignment
  FXRanged& operator=(const FXRanged& bounds);

  /// Set value from another range
  FXRanged& set(const FXRanged& bounds){ lower=bounds.lower; upper=bounds.upper; return *this; }

  /// Set value from two vectors
  FXRanged& set(const FXVec3d& lo,const FXVec3d& hi){ lower=lo; upper=hi; return *this; }

  /// Set value from six numbers
  FXRanged& set(FXdouble xlo,FXdouble xhi,FXdouble ylo,FXdouble yhi,FXdouble zlo,FXdouble zhi){ lower.set(xlo,ylo,zlo); upper.set(xhi,yhi,zhi); return *this; }

  %extend {
    // Indexing with 0 or 1
    FX::FXVec3d __getitem__(FXint i){
      if(0 <= i && i <= 1) {
          return (*self)[i];
      } else {
          PyErr_SetString(PyExc_IndexError, "index out of bounds");
          return (*self)[0];
      }
    }

    void __setitem__(FXint i,FX::FXVec3d& slice){
      if(0 <= i && i <= 1){
          PyErr_SetString(PyExc_IndexError, "index out of bounds");
      } else {
          (*self)[i]=slice;
      }
    }
  }

  /// Comparison
  bool operator==(const FXRanged& r) const { return lower==r.lower && upper==r.upper; }
  bool operator!=(const FXRanged& r) const { return lower!=r.lower || upper!=r.upper; }

  /// Width of box
  FXdouble width() const { return upper.x-lower.x; }

  /// Height of box
  FXdouble height() const { return upper.y-lower.y; }

  /// Depth of box
  FXdouble depth() const { return upper.z-lower.z; }

  /// Longest side
  FXdouble longest() const;

  /// shortest side
  FXdouble shortest() const;

  /// Length of diagonal
  FXdouble diameter() const;

  /// Get radius of box
  FXdouble radius() const;

  /// Compute diagonal
  FXVec3d diagonal() const;

  /// Get center of box
  FXVec3d center() const;

  /// Test if empty
  bool empty() const;

  /// Test if box contains point x,y,z
  bool contains(FXdouble x,FXdouble y,FXdouble z) const;

  /// Test if box contains point p
  bool contains(const FXVec3d& p) const;

  /// Test if box properly contains another box
  bool contains(const FXRanged& bounds) const;

  /// Test if box properly contains sphere
  bool contains(const FXSphered& sphere) const;

  /// Include point
  FXRanged& include(FXdouble x,FXdouble y,FXdouble z);

  /// Include point
  FXRanged& include(const FXVec3d& v);

  /// Include given range into box
  FXRanged& include(const FXRanged& box);

  /// Include given sphere into this box
  FXRanged& include(const FXSphered& sphere);

  /// Intersect box with normalized plane ax+by+cz+w; returns -1,0,+1
  FXint intersect(const FXVec4d &plane) const;

  /// Intersect box with ray u-v
  bool intersect(const FXVec3d& u,const FXVec3d& v);

  /// Test if bounds overlap
  // friend FXAPI bool overlap(const FXRanged& a,const FXRanged& b);

  /// Get corner number 0..7
  FXVec3d corner(FXint c) const { return FXVec3d((&lower)[c&1].x, (&lower)[(c>>1)&1].y, (&lower)[c>>2].z); }

  /// Union of two boxes
  // friend FXAPI FXRanged unite(const FXRanged& a,const FXRanged& b);

  /// Intersection of two boxes
  // friend FXAPI FXRanged intersect(const FXRanged& a,const FXRanged& b);

  };
}
