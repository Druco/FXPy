/* FXVec3d.i */

%pythonappend FX::FXVec3d::FXVec3d %{
  self.thisown = False
%}

%include "include/fxdefs2.h"

namespace FX {


class FXMat3d;
class FXMat4d;


/// Double-precision 3-element vector
class FXAPI FXVec3d {
public:
  FXdouble x;
  FXdouble y;
  FXdouble z;
public:

  /// Default constructor
  FXVec3d(){}

  /// Initialize from another vector
  FXVec3d(const FXVec3d& v){x=v.x;y=v.y;z=v.z;}

  /// Initialize from array of doubles
  FXVec3d(const FXdouble v[]){x=v[0];y=v[1];z=v[2];}

  /// Initialize with components
  FXVec3d(FXdouble xx,FXdouble yy,FXdouble zz=1.0){x=xx;y=yy;z=zz;}

  /// Initialize with color
  FXVec3d(FXColor color);

  /// Return a non-const reference to the ith element
  // FXdouble& operator[](FXint i){return (&x)[i];}

  /// Return a const reference to the ith element
  //const FXdouble& operator[](FXint i) const {return (&x)[i];}
  %extend {
      FXdouble __getitem__(FXint i){
          if (0 <= i && i <=2) {
              return (*self)[i];
          } else {
              PyErr_SetString(PyExc_IndexError, "index out of bounds");
              return (*self)[i];  // We need to return something, doesn't matter what
          }
      }
          
      void __setitem__(FXint i, FXdouble d){
          if (0 <= i && i <= 2) {
              (*self)[i]=d;
              return;
          } else {
              PyErr_SetString(PyExc_IndexError, "index out of bounds");
          }
      }
  }

  /// Set value from another vector
  FXVec3d& set(const FXVec3d& v){x=v.x;y=v.y;z=v.z;return *this;}

  /// Set value from array of floats
  FXVec3d& set(const FXdouble v[]){x=v[0];y=v[1];z=v[2];return *this;}

  /// Set value from components
  FXVec3d& set(FXdouble xx,FXdouble yy,FXdouble zz){x=xx;y=yy;z=zz;return *this;}

  /// Assigning operators
  FXVec3d& operator*=(FXdouble n){x*=n;y*=n;z*=n;return *this;}
  FXVec3d& operator/=(FXdouble n){x/=n;y/=n;z/=n;return *this;}
  FXVec3d& operator+=(const FXVec3d& v){x+=v.x;y+=v.y;z+=v.z;return *this;}
  FXVec3d& operator-=(const FXVec3d& v){x-=v.x;y-=v.y;z-=v.z;return *this;}

  /// Conversions
  operator FXdouble*(){return &x;}
  operator const FXdouble*() const {return &x;}
  operator FXVec2d&(){return *reinterpret_cast<FXVec2d*>(this);}
  operator const FXVec2d&() const {return *reinterpret_cast<const FXVec2d*>(this);}

  /// Convert to color
  operator FXColor() const;

  /// Unary
  FXVec3d operator+() const { return *this; }
  FXVec3d operator-() const { return FXVec3d(-x,-y,-z); }

  /// Vector and vector
  FXVec3d operator+(const FXVec3d& v) const { return FXVec3d(x+v.x,y+v.y,z+v.z); }
  FXVec3d operator-(const FXVec3d& v) const { return FXVec3d(x-v.x,y-v.y,z-v.z); }

  /// Vector and matrix
  FXVec3d operator*(const FXMat3d& m) const;
  FXVec3d operator*(const FXMat4d& m) const;

  /// Scaling
  friend inline FXVec3d operator*(const FXVec3d& a,FXdouble n);
  friend inline FXVec3d operator*(FXdouble n,const FXVec3d& a);
  friend inline FXVec3d operator/(const FXVec3d& a,FXdouble n);
  friend inline FXVec3d operator/(FXdouble n,const FXVec3d& a);

  /// Dot product
  FXdouble operator*(const FXVec3d& v) const { return x*v.x+y*v.y+z*v.z; }

  /// Cross product
  FXVec3d operator^(const FXVec3d& v) const { return FXVec3d(y*v.z-z*v.y, z*v.x-x*v.z, x*v.y-y*v.x); }

  /// Equality tests
  bool operator==(const FXVec3d& v) const { return x==v.x && y==v.y && z==v.z; }
  bool operator!=(const FXVec3d& v) const { return x!=v.x || y!=v.y || z!=v.z; }

  friend inline bool operator==(const FXVec3d& a,FXdouble n);
  friend inline bool operator!=(const FXVec3d& a,FXdouble n);
  friend inline bool operator==(FXdouble n,const FXVec3d& a);
  friend inline bool operator!=(FXdouble n,const FXVec3d& a);

  /// Inequality tests
  bool operator<(const FXVec3d& v) const { return x<v.x && y<v.y && z<v.z; }
  bool operator<=(const FXVec3d& v) const { return x<=v.x && y<=v.y && z<=v.z; }
  bool operator>(const FXVec3d& v) const { return x>v.x && y>v.y && z>v.z; }
  bool operator>=(const FXVec3d& v) const { return x>=v.x && y>=v.y && z>=v.z; }

  friend inline bool operator<(const FXVec3d& a,FXdouble n);
  friend inline bool operator<=(const FXVec3d& a,FXdouble n);
  friend inline bool operator>(const FXVec3d& a,FXdouble n);
  friend inline bool operator>=(const FXVec3d& a,FXdouble n);

  friend inline bool operator<(FXdouble n,const FXVec3d& a);
  friend inline bool operator<=(FXdouble n,const FXVec3d& a);
  friend inline bool operator>(FXdouble n,const FXVec3d& a);
  friend inline bool operator>=(FXdouble n,const FXVec3d& a);

  /// Length and square of length
  FXdouble length2() const { return x*x+y*y+z*z; }
  FXdouble length() const { return sqrt(length2()); }

  /// Clamp values of vector between limits
  FXVec3d& clamp(FXdouble lo,FXdouble hi){x=FXCLAMP(lo,x,hi);y=FXCLAMP(lo,y,hi);z=FXCLAMP(lo,z,hi);return *this;}

  /// Lowest or highest components
  friend inline FXVec3d lo(const FXVec3d& a,const FXVec3d& b);
  friend inline FXVec3d hi(const FXVec3d& a,const FXVec3d& b);

  /// Compute normal from three points a,b,c
  friend FXAPI FXVec3d normal(const FXVec3d& a,const FXVec3d& b,const FXVec3d& c);

  /// Compute approximate normal from four points a,b,c,d
  friend FXAPI FXVec3d normal(const FXVec3d& a,const FXVec3d& b,const FXVec3d& c,const FXVec3d& d);

  /// Normalize vector
  friend FXAPI FXVec3d normalize(const FXVec3d& v);

  /// Save vector to a stream
  friend FXAPI FXStream& operator<<(FXStream& store,const FXVec3d& v);

  /// Load vector from a stream
  friend FXAPI FXStream& operator>>(FXStream& store,FXVec3d& v);
  };


inline FXVec3d operator*(const FXVec3d& a,FXdouble n){return FXVec3d(a.x*n,a.y*n,a.z*n);}
inline FXVec3d operator*(FXdouble n,const FXVec3d& a){return FXVec3d(n*a.x,n*a.y,n*a.z);}
inline FXVec3d operator/(const FXVec3d& a,FXdouble n){return FXVec3d(a.x/n,a.y/n,a.z/n);}
inline FXVec3d operator/(FXdouble n,const FXVec3d& a){return FXVec3d(n/a.x,n/a.y,n/a.z);}

inline bool operator==(const FXVec3d& a,FXdouble n){return a.x==n && a.y==n && a.z==n;}
inline bool operator!=(const FXVec3d& a,FXdouble n){return a.x!=n || a.y!=n || a.z!=n;}
inline bool operator==(FXdouble n,const FXVec3d& a){return n==a.x && n==a.y && n==a.z;}
inline bool operator!=(FXdouble n,const FXVec3d& a){return n!=a.x || n!=a.y || n!=a.z;}

inline bool operator<(const FXVec3d& a,FXdouble n){return a.x<n && a.y<n && a.z<n;}
inline bool operator<=(const FXVec3d& a,FXdouble n){return a.x<=n && a.y<=n && a.z<=n;}
inline bool operator>(const FXVec3d& a,FXdouble n){return a.x>n && a.y>n && a.z>n;}
inline bool operator>=(const FXVec3d& a,FXdouble n){return a.x>=n && a.y>=n && a.z>=n;}

inline bool operator<(FXdouble n,const FXVec3d& a){return n<a.x && n<a.y && n<a.z;}
inline bool operator<=(FXdouble n,const FXVec3d& a){return n<=a.x && n<=a.y && n<=a.z;}
inline bool operator>(FXdouble n,const FXVec3d& a){return n>a.x && n>a.y && n>a.z;}
inline bool operator>=(FXdouble n,const FXVec3d& a){return n>=a.x && n>=a.y && n>=a.z;}

inline FXVec3d lo(const FXVec3d& a,const FXVec3d& b){return FXVec3d(FXMIN(a.x,b.x),FXMIN(a.y,b.y),FXMIN(a.z,b.z));}
inline FXVec3d hi(const FXVec3d& a,const FXVec3d& b){return FXVec3d(FXMAX(a.x,b.x),FXMAX(a.y,b.y),FXMAX(a.z,b.z));}

extern FXAPI FXVec3d normal(const FXVec3d& a,const FXVec3d& b,const FXVec3d& c);
extern FXAPI FXVec3d normal(const FXVec3d& a,const FXVec3d& b,const FXVec3d& c,const FXVec3d& d);

extern FXAPI FXVec3d normalize(const FXVec3d& v);

extern FXAPI FXStream& operator<<(FXStream& store,const FXVec3d& v);
extern FXAPI FXStream& operator>>(FXStream& store,FXVec3d& v);

}
