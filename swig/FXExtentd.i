/* FXExtentd.i */

%pythonappend FX::FXExtentd::FXExtentd %{
  self.thisown = False
%}


%include "include/fxdefs2.h"

namespace FX {


/// Extent
class FXAPI FXExtentd {
public:
  FXVec2d lower;
  FXVec2d upper;
public:

  /// Default constructor
  FXExtentd(){}

  /// Copy constructor
  FXExtentd(const FXExtentd& ext):lower(ext.lower),upper(ext.upper){}

  /// Initialize from two vectors
  FXExtentd(const FXVec2d& lo,const FXVec2d& hi):lower(lo),upper(hi){}

  /// Initialize from six numbers
  FXExtentd(FXdouble xlo,FXdouble xhi,FXdouble ylo,FXdouble yhi):lower(xlo,ylo),upper(xhi,yhi){}

  %extend {
    // Indexing with 0 or 1
    FX::FXVec2d __getitem__(FXint i){
      if(0 <= i && i <= 1) {
          return (*self)[i];
      } else {
          PyErr_SetString(PyExc_IndexError, "index out of bounds");
          return (*self)[0];
      }
    }

    void __setitem__(FXint i,FX::FXVec2d& slice){
      if(0 <= i && i <= 1){
          PyErr_SetString(PyExc_IndexError, "index out of bounds");
      } else {
          (*self)[i]=slice;
      }
    }
  }

  /// Comparison
  bool operator==(const FXExtentd& ext) const { return lower==ext.lower && upper==ext.upper;}
  bool operator!=(const FXExtentd& ext) const { return lower!=ext.lower || upper!=ext.upper;}

  /// Width of box
  FXdouble width() const { return upper.x-lower.x; }

  /// Height of box
  FXdouble height() const { return upper.y-lower.y; }

  /// Longest side
  FXdouble longest() const;

  /// shortest side
  FXdouble shortest() const;

  /// Length of diagonal
  FXdouble diameter() const;

  /// Get radius of box
  FXdouble radius() const;

  /// Compute diagonal
  FXVec2d diagonal() const;

  /// Get center of box
  FXVec2d center() const;

  /// Test if empty
  bool empty() const;

  /// Test if box contains point x,y
  bool contains(FXdouble x,FXdouble y) const;

  /// Test if box contains point p
  bool contains(const FXVec2d& p) const;

  /// Test if box properly contains another box
  bool contains(const FXExtentd& ext) const;

  /// Include point
  FXExtentd& include(FXdouble x,FXdouble y);

  /// Include point
  FXExtentd& include(const FXVec2d& v);

  /// Include given range into extent
  FXExtentd& include(const FXExtentd& ext);

  /// Test if bounds overlap
  friend FXAPI bool overlap(const FXExtentd& a,const FXExtentd& b);

  /// Get corner number 0..3
  FXVec2d corner(FXint c) const { return FXVec2d((&lower)[c&1].x, (&lower)[(c>>1)&1].y); }

  /// Union of two boxes
  friend FXAPI FXExtentd unite(const FXExtentd& a,const FXExtentd& b);

  /// Intersection of two boxes
  friend FXAPI FXExtentd intersect(const FXExtentd& a,const FXExtentd& b);

  /// Save object to a stream
  friend FXAPI FXStream& operator<<(FXStream& store,const FXExtentd& ext);

  /// Load object from a stream
  friend FXAPI FXStream& operator>>(FXStream& store,FXExtentd& ext);
  };


extern FXAPI bool overlap(const FXExtentd& a,const FXExtentd& b);

extern FXAPI FXExtentd unite(const FXExtentd& a,const FXExtentd& b);
extern FXAPI FXExtentd intersect(const FXExtentd& a,const FXExtentd& b);

extern FXAPI FXStream& operator<<(FXStream& store,const FXExtentd& ext);
extern FXAPI FXStream& operator>>(FXStream& store,FXExtentd& ext);

}
