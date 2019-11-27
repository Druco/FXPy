/* FXVec3f.i */

%pythonappend FX::FXVec3f::FXVec3f %{
  self.thisown = False
%}

%include "include/fxdefs2.h"

namespace FX {


class FXMat3f;
class FXMat4f;


/// Single-precision 3-element vector
class FXAPI FXVec3f {
public:
  FXfloat x;
  FXfloat y;
  FXfloat z;
public:

  /// Default constructor
  FXVec3f(){}

  /// Initialize from another vector
  FXVec3f(const FXVec3f& v){x=v.x;y=v.y;z=v.z;}

  /// Initialize from array of floats
  FXVec3f(const FXfloat v[]){x=v[0];y=v[1];z=v[2];}

  /// Initialize from components
  FXVec3f(FXfloat xx,FXfloat yy,FXfloat zz=1.0f){x=xx;y=yy;z=zz;}

  /// Initialize with color
  FXVec3f(FXColor color);

  /// Get and set the ith element
  %extend {
      FXfloat __getitem__(FXint i){
          if (0 <= i && i <=2) {
              return (*self)[i];
          } else {
              PyErr_SetString(PyExc_IndexError, "index out of bounds");
              return (*self)[i];  // We need to return something, doesn't matter what
          }
      }
          
      void __setitem__(FXint i, FXfloat d){
          if (0 <= i && i <= 2) {
              (*self)[i]=d;
              return;
          } else {
              PyErr_SetString(PyExc_IndexError, "index out of bounds");
              return;
          }
      }
  }

  /// Set value from another vector
  FXVec3f& set(const FXVec3f& v){x=v.x;y=v.y;z=v.z;return *this;}

  /// Set value from array of floats
  FXVec3f& set(const FXfloat v[]){x=v[0];y=v[1];z=v[2];return *this;}

  /// Set value from components
  FXVec3f& set(FXfloat xx,FXfloat yy,FXfloat zz){x=xx;y=yy;z=zz;return *this;}

  /// Assigning operators
  FXVec3f& operator*=(FXfloat n){x*=n;y*=n;z*=n;return *this;}
  FXVec3f& operator/=(FXfloat n){x/=n;y/=n;z/=n;return *this;}
  FXVec3f& operator+=(const FXVec3f& v){x+=v.x;y+=v.y;z+=v.z;return *this;}
  FXVec3f& operator-=(const FXVec3f& v){x-=v.x;y-=v.y;z-=v.z;return *this;}

  /// Conversions
  operator FXfloat*(){return &x;}
  operator const FXfloat*() const {return &x;}
  operator FXVec2f&(){return *reinterpret_cast<FXVec2f*>(this);}
  operator const FXVec2f&() const {return *reinterpret_cast<const FXVec2f*>(this);}

  /// Convert to color
  operator FXColor() const;

  /// Unary
  FXVec3f operator+() const { return *this; }
  FXVec3f operator-() const { return FXVec3f(-x,-y,-z); }

  /// Vector and vector
  FXVec3f operator+(const FXVec3f& v) const { return FXVec3f(x+v.x,y+v.y,z+v.z); }
  FXVec3f operator-(const FXVec3f& v) const { return FXVec3f(x-v.x,y-v.y,z-v.z); }

  /// Vector and matrix
  FXVec3f operator*(const FXMat3f& m) const;
  FXVec3f operator*(const FXMat4f& m) const;

  /// Scaling
  friend inline FXVec3f operator*(const FXVec3f& a,FXfloat n);
  friend inline FXVec3f operator*(FXfloat n,const FXVec3f& a);
  friend inline FXVec3f operator/(const FXVec3f& a,FXfloat n);
  friend inline FXVec3f operator/(FXfloat n,const FXVec3f& a);

  /// Dot product
  FXfloat operator*(const FXVec3f& v) const { return x*v.x+y*v.y+z*v.z; }

  /// Cross product
  FXVec3f operator^(const FXVec3f& v) const { return FXVec3f(y*v.z-z*v.y, z*v.x-x*v.z, x*v.y-y*v.x); }

  /// Equality tests
  bool operator==(const FXVec3f& v) const { return x==v.x && y==v.y && z==v.z; }
  bool operator!=(const FXVec3f& v) const { return x!=v.x || y!=v.y || z!=v.z; }

  friend inline bool operator==(const FXVec3f& a,FXfloat n);
  friend inline bool operator!=(const FXVec3f& a,FXfloat n);
  friend inline bool operator==(FXfloat n,const FXVec3f& a);
  friend inline bool operator!=(FXfloat n,const FXVec3f& a);

  /// Inequality tests
  bool operator<(const FXVec3f& v) const { return x<v.x && y<v.y && z<v.z; }
  bool operator<=(const FXVec3f& v) const { return x<=v.x && y<=v.y && z<=v.z; }
  bool operator>(const FXVec3f& v) const { return x>v.x && y>v.y && z>v.z; }
  bool operator>=(const FXVec3f& v) const { return x>=v.x && y>=v.y && z>=v.z; }

  friend inline bool operator<(const FXVec3f& a,FXfloat n);
  friend inline bool operator<=(const FXVec3f& a,FXfloat n);
  friend inline bool operator>(const FXVec3f& a,FXfloat n);
  friend inline bool operator>=(const FXVec3f& a,FXfloat n);

  friend inline bool operator<(FXfloat n,const FXVec3f& a);
  friend inline bool operator<=(FXfloat n,const FXVec3f& a);
  friend inline bool operator>(FXfloat n,const FXVec3f& a);
  friend inline bool operator>=(FXfloat n,const FXVec3f& a);

  /// Length and square of length
  FXfloat length2() const { return x*x+y*y+z*z; }
  FXfloat length() const { return sqrtf(length2()); }

  /// Clamp values of vector between limits
  FXVec3f& clamp(FXfloat lo,FXfloat hi){x=FXCLAMP(lo,x,hi);y=FXCLAMP(lo,y,hi);z=FXCLAMP(lo,z,hi);return *this;}

  /// Lowest or highest components
  friend inline FXVec3f lo(const FXVec3f& a,const FXVec3f& b);
  friend inline FXVec3f hi(const FXVec3f& a,const FXVec3f& b);

  /// Compute normal from three points a,b,c
  friend FXAPI FXVec3f normal(const FXVec3f& a,const FXVec3f& b,const FXVec3f& c);

  /// Compute approximate normal from four points a,b,c,d
  friend FXAPI FXVec3f normal(const FXVec3f& a,const FXVec3f& b,const FXVec3f& c,const FXVec3f& d);

  /// Normalize vector
  friend FXAPI FXVec3f normalize(const FXVec3f& v);

  /// Save vector to a stream
  friend FXAPI FXStream& operator<<(FXStream& store,const FXVec3f& v);

  /// Load vector from a stream
  friend FXAPI FXStream& operator>>(FXStream& store,FXVec3f& v);
  };


inline FXVec3f operator*(const FXVec3f& a,FXfloat n){return FXVec3f(a.x*n,a.y*n,a.z*n);}
inline FXVec3f operator*(FXfloat n,const FXVec3f& a){return FXVec3f(n*a.x,n*a.y,n*a.z);}
inline FXVec3f operator/(const FXVec3f& a,FXfloat n){return FXVec3f(a.x/n,a.y/n,a.z/n);}
inline FXVec3f operator/(FXfloat n,const FXVec3f& a){return FXVec3f(n/a.x,n/a.y,n/a.z);}

inline bool operator==(const FXVec3f& a,FXfloat n){return a.x==n && a.y==n && a.z==n;}
inline bool operator!=(const FXVec3f& a,FXfloat n){return a.x!=n || a.y!=n || a.z!=n;}
inline bool operator==(FXfloat n,const FXVec3f& a){return n==a.x && n==a.y && n==a.z;}
inline bool operator!=(FXfloat n,const FXVec3f& a){return n!=a.x || n!=a.y || n!=a.z;}

inline bool operator<(const FXVec3f& a,FXfloat n){return a.x<n && a.y<n && a.z<n;}
inline bool operator<=(const FXVec3f& a,FXfloat n){return a.x<=n && a.y<=n && a.z<=n;}
inline bool operator>(const FXVec3f& a,FXfloat n){return a.x>n && a.y>n && a.z>n;}
inline bool operator>=(const FXVec3f& a,FXfloat n){return a.x>=n && a.y>=n && a.z>=n;}

inline bool operator<(FXfloat n,const FXVec3f& a){return n<a.x && n<a.y && n<a.z;}
inline bool operator<=(FXfloat n,const FXVec3f& a){return n<=a.x && n<=a.y && n<=a.z;}
inline bool operator>(FXfloat n,const FXVec3f& a){return n>a.x && n>a.y && n>a.z;}
inline bool operator>=(FXfloat n,const FXVec3f& a){return n>=a.x && n>=a.y && n>=a.z;}

inline FXVec3f lo(const FXVec3f& a,const FXVec3f& b){return FXVec3f(FXMIN(a.x,b.x),FXMIN(a.y,b.y),FXMIN(a.z,b.z));}
inline FXVec3f hi(const FXVec3f& a,const FXVec3f& b){return FXVec3f(FXMAX(a.x,b.x),FXMAX(a.y,b.y),FXMAX(a.z,b.z));}

extern FXAPI FXVec3f normal(const FXVec3f& a,const FXVec3f& b,const FXVec3f& c);
extern FXAPI FXVec3f normal(const FXVec3f& a,const FXVec3f& b,const FXVec3f& c,const FXVec3f& d);

extern FXAPI FXVec3f normalize(const FXVec3f& v);

extern FXAPI FXStream& operator<<(FXStream& store,const FXVec3f& v);
extern FXAPI FXStream& operator>>(FXStream& store,FXVec3f& v);

}
