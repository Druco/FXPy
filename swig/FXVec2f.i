/* FXVec2f.i */

%pythonappend FX::FXVec2f::FXVec2f %{
  self.thisown = False
%}

%include "include/fxdefs2.h"

namespace FX {


class FXMat3f;


/// Single-precision 2-element vector
class FXAPI FXVec2f {
public:
  FXfloat x;
  FXfloat y;
public:

  /// Default constructor
  FXVec2f(){}

  /// Initialize from another vector
  FXVec2f(const FXVec2f& v){x=v.x;y=v.y;}

  /// Initialize from array of floats
  FXVec2f(const FXfloat v[]){x=v[0];y=v[1];}

  /// Initialize from components
  FXVec2f(FXfloat xx,FXfloat yy){x=xx;y=yy;}

  /// Return and set the ith element
  %extend {
      FXfloat __getitem__(FXint i){return (*self)[i];}
      void __setitem__(FXint i, FXdouble d){(*self)[i]=d;}
  }

  /// Set value from another vector
  FXVec2f& set(const FXVec2f& v){x=v.x;y=v.y;return *this;}

  /// Set value from array of floats
  FXVec2f& set(const FXfloat v[]){x=v[0];y=v[1];return *this;}

  /// Set value from components
  FXVec2f& set(FXfloat xx,FXfloat yy){x=xx;y=yy;return *this;}

  /// Assigning operators
  FXVec2f& operator*=(FXfloat n){x*=n;y*=n;return *this;}
  FXVec2f& operator/=(FXfloat n){x/=n;y/=n;return *this;}
  FXVec2f& operator+=(const FXVec2f& v){x+=v.x;y+=v.y;return *this;}
  FXVec2f& operator-=(const FXVec2f& v){x-=v.x;y-=v.y;return *this;}

  /// Conversions
  operator FXfloat*(){return &x;}
  operator const FXfloat*() const {return &x;}

  /// Unary
  FXVec2f operator+() const { return *this; }
  FXVec2f operator-() const { return FXVec2f(-x,-y); }

  /// Vector and vector
  FXVec2f operator+(const FXVec2f& v) const { return FXVec2f(x+v.x,y+v.y); }
  FXVec2f operator-(const FXVec2f& v) const { return FXVec2f(x-v.x,y-v.y); }

  /// Vector and matrix
  FXVec2f operator*(const FXMat3f& m) const;

  /// Scaling
  friend inline FXVec2f operator*(const FXVec2f& a,FXfloat n);
  friend inline FXVec2f operator*(FXfloat n,const FXVec2f& a);
  friend inline FXVec2f operator/(const FXVec2f& a,FXfloat n);
  friend inline FXVec2f operator/(FXfloat n,const FXVec2f& a);

  /// Dot product
  FXfloat operator*(const FXVec2f& v) const { return x*v.x+y*v.y; }

  /// Equality tests
  bool operator==(const FXVec2f& v) const { return x==v.x && y==v.y; }
  bool operator!=(const FXVec2f& v) const { return x!=v.x || y!=v.y; }

  friend inline bool operator==(const FXVec2f& a,FXfloat n);
  friend inline bool operator!=(const FXVec2f& a,FXfloat n);
  friend inline bool operator==(FXfloat n,const FXVec2f& a);
  friend inline bool operator!=(FXfloat n,const FXVec2f& a);

  /// Inequality tests
  bool operator<(const FXVec2f& v) const { return x<v.x && y<v.y; }
  bool operator<=(const FXVec2f& v) const { return x<=v.x && y<=v.y; }
  bool operator>(const FXVec2f& v) const { return x>v.x && y>v.y; }
  bool operator>=(const FXVec2f& v) const { return x>=v.x && y>=v.y; }

  friend inline bool operator<(const FXVec2f& a,FXfloat n);
  friend inline bool operator<=(const FXVec2f& a,FXfloat n);
  friend inline bool operator>(const FXVec2f& a,FXfloat n);
  friend inline bool operator>=(const FXVec2f& a,FXfloat n);

  friend inline bool operator<(FXfloat n,const FXVec2f& a);
  friend inline bool operator<=(FXfloat n,const FXVec2f& a);
  friend inline bool operator>(FXfloat n,const FXVec2f& a);
  friend inline bool operator>=(FXfloat n,const FXVec2f& a);

  /// Length and square of length
  FXfloat length2() const { return x*x+y*y; }
  FXfloat length() const { return sqrtf(length2()); }

  /// Clamp values of vector between limits
  FXVec2f& clamp(FXfloat lo,FXfloat hi){x=FXCLAMP(lo,x,hi);y=FXCLAMP(lo,y,hi);return *this;}

  /// Lowest or highest components
  friend inline FXVec2f lo(const FXVec2f& a,const FXVec2f& b);
  friend inline FXVec2f hi(const FXVec2f& a,const FXVec2f& b);

  /// Normalize vector
  friend FXAPI FXVec2f normalize(const FXVec2f& v);

  /// Save vector to a stream
  friend FXAPI FXStream& operator<<(FXStream& store,const FXVec2f& v);

  /// Load vector from a stream
  friend FXAPI FXStream& operator>>(FXStream& store,FXVec2f& v);
  };


inline FXVec2f operator*(const FXVec2f& a,FXfloat n){return FXVec2f(a.x*n,a.y*n);}
inline FXVec2f operator*(FXfloat n,const FXVec2f& a){return FXVec2f(n*a.x,n*a.y);}
inline FXVec2f operator/(const FXVec2f& a,FXfloat n){return FXVec2f(a.x/n,a.y/n);}
inline FXVec2f operator/(FXfloat n,const FXVec2f& a){return FXVec2f(n/a.x,n/a.y);}

inline bool operator==(const FXVec2f& a,FXfloat n){return a.x==n && a.y==n;}
inline bool operator!=(const FXVec2f& a,FXfloat n){return a.x!=n || a.y!=n;}
inline bool operator==(FXfloat n,const FXVec2f& a){return n==a.x && n==a.y;}
inline bool operator!=(FXfloat n,const FXVec2f& a){return n!=a.x || n!=a.y;}

inline bool operator<(const FXVec2f& a,FXfloat n){return a.x<n && a.y<n;}
inline bool operator<=(const FXVec2f& a,FXfloat n){return a.x<=n && a.y<=n;}
inline bool operator>(const FXVec2f& a,FXfloat n){return a.x>n && a.y>n;}
inline bool operator>=(const FXVec2f& a,FXfloat n){return a.x>=n && a.y>=n;}

inline bool operator<(FXfloat n,const FXVec2f& a){return n<a.x && n<a.y;}
inline bool operator<=(FXfloat n,const FXVec2f& a){return n<=a.x && n<=a.y;}
inline bool operator>(FXfloat n,const FXVec2f& a){return n>a.x && n>a.y;}
inline bool operator>=(FXfloat n,const FXVec2f& a){return n>=a.x && n>=a.y;}

inline FXVec2f lo(const FXVec2f& a,const FXVec2f& b){return FXVec2f(FXMIN(a.x,b.x),FXMIN(a.y,b.y));}
inline FXVec2f hi(const FXVec2f& a,const FXVec2f& b){return FXVec2f(FXMAX(a.x,b.x),FXMAX(a.y,b.y));}

extern FXAPI FXVec2f normalize(const FXVec2f& v);

extern FXAPI FXStream& operator<<(FXStream& store,const FXVec2f& v);
extern FXAPI FXStream& operator>>(FXStream& store,FXVec2f& v);

}
