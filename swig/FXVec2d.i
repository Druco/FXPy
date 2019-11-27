/* FXVec2d.i */

%pythonappend FX::FXVec2d::FXVec2d %{
  self.thisown = False
%}

%include "include/fxdefs2.h"

namespace FX {


class FXMat3d;


/// Double-precision 2-element vector
class FXAPI FXVec2d {
public:
  FXdouble x;
  FXdouble y;
public:

  /// Default constructor
  FXVec2d(){}

  /// Initialize from another vector
  FXVec2d(const FXVec2d& v){x=v.x;y=v.y;}

  /// Initialize from array of floats
  FXVec2d(const FXdouble v[]){x=v[0];y=v[1];}

  /// Initialize from components
  FXVec2d(FXdouble xx,FXdouble yy){x=xx;y=yy;}

  /// Return a non-const reference to the ith element
//  FXdouble& operator[](FXint i){return (&x)[i];}

  /// Return a const reference to the ith element
//  const FXdouble& operator[](FXint i) const {return (&x)[i];}

  %extend {
      FXdouble __getitem__(FXint i){return (*self)[i];}
      void __setitem__(FXint i, FXdouble d){(*self)[i]=d;}
  }

  /// Set value from another vector
  FXVec2d& set(const FXVec2d& v){x=v.x;y=v.y;return *this;}

  /// Set value from array of floats
  FXVec2d& set(const FXdouble v[]){x=v[0];y=v[1];return *this;}

  /// Set value from components
  FXVec2d& set(FXdouble xx,FXdouble yy){x=xx;y=yy;return *this;}

  /// Assigning operators
  FXVec2d& operator*=(FXdouble n){x*=n;y*=n;return *this;}
  FXVec2d& operator/=(FXdouble n){x/=n;y/=n;return *this;}
  FXVec2d& operator+=(const FXVec2d& v){x+=v.x;y+=v.y;return *this;}
  FXVec2d& operator-=(const FXVec2d& v){x-=v.x;y-=v.y;return *this;}

  /// Unary
  FXVec2d operator+() const { return *this; }
  FXVec2d operator-() const { return FXVec2d(-x,-y); }

  /// Vector and vector
  FXVec2d operator+(const FXVec2d& v) const { return FXVec2d(x+v.x,y+v.y); }
  FXVec2d operator-(const FXVec2d& v) const { return FXVec2d(x-v.x,y-v.y); }

  /// Vector and matrix
  FXVec2d operator*(const FXMat3d& m) const;

  /// Scaling
  %extend {
      FXVec2d operator*(FXdouble n) {return (*self * n);}
  }
  friend inline FXVec2d operator/(const FXVec2d& a,FXdouble n);
  friend inline FXVec2d operator/(FXdouble n,const FXVec2d& a);

  /// Dot product
  FXdouble operator*(const FXVec2d& v) const { return x*v.x+y*v.y; }

  /// Equality tests
  bool operator==(const FXVec2d& v) const { return x==v.x && y==v.y; }
  bool operator!=(const FXVec2d& v) const { return x!=v.x || y!=v.y; }

  /// Inequality tests
  bool operator<(const FXVec2d& v) const { return x<v.x && y<v.y; }
  bool operator<=(const FXVec2d& v) const { return x<=v.x && y<=v.y; }
  bool operator>(const FXVec2d& v) const { return x>v.x && y>v.y; }
  bool operator>=(const FXVec2d& v) const { return x>=v.x && y>=v.y; }

  /// Length and square of length
  FXdouble length2() const { return x*x+y*y; }
  FXdouble length() const { return sqrt(length2()); }

  /// Clamp values of vector between limits
  FXVec2d& clamp(FXdouble lo,FXdouble hi){x=FXCLAMP(lo,x,hi);y=FXCLAMP(lo,y,hi);return *this;}

  /// Lowest or highest components
  friend inline FXVec2d lo(const FXVec2d& a,const FXVec2d& b);
  friend inline FXVec2d hi(const FXVec2d& a,const FXVec2d& b);

  /// Normalize vector
  friend FXAPI FXVec2d normalize(const FXVec2d& v);

  };


//inline FXVec2d operator*(const FXVec2d& a,FXdouble n){return FXVec2d(a.x*n,a.y*n);}
//inline FXVec2d operator*(FXdouble n,const FXVec2d& a){return FXVec2d(n*a.x,n*a.y);}
inline FXVec2d operator/(const FXVec2d& a,FXdouble n){return FXVec2d(a.x/n,a.y/n);}
inline FXVec2d operator/(FXdouble n,const FXVec2d& a){return FXVec2d(n/a.x,n/a.y);}

inline bool operator==(const FXVec2d& a,FXdouble n){return a.x==n && a.y==n;}
inline bool operator!=(const FXVec2d& a,FXdouble n){return a.x!=n || a.y!=n;}
inline bool operator==(FXdouble n,const FXVec2d& a){return n==a.x && n==a.y;}
inline bool operator!=(FXdouble n,const FXVec2d& a){return n!=a.x || n!=a.y;}

inline bool operator<(const FXVec2d& a,FXdouble n){return a.x<n && a.y<n;}
inline bool operator<=(const FXVec2d& a,FXdouble n){return a.x<=n && a.y<=n;}
inline bool operator>(const FXVec2d& a,FXdouble n){return a.x>n && a.y>n;}
inline bool operator>=(const FXVec2d& a,FXdouble n){return a.x>=n && a.y>=n;}

inline bool operator<(FXdouble n,const FXVec2d& a){return n<a.x && n<a.y;}
inline bool operator<=(FXdouble n,const FXVec2d& a){return n<=a.x && n<=a.y;}
inline bool operator>(FXdouble n,const FXVec2d& a){return n>a.x && n>a.y;}
inline bool operator>=(FXdouble n,const FXVec2d& a){return n>=a.x && n>=a.y;}

inline FXVec2d lo(const FXVec2d& a,const FXVec2d& b){return FXVec2d(FXMIN(a.x,b.x),FXMIN(a.y,b.y));}
inline FXVec2d hi(const FXVec2d& a,const FXVec2d& b){return FXVec2d(FXMAX(a.x,b.x),FXMAX(a.y,b.y));}

extern FXAPI FXVec2d normalize(const FXVec2d& v);

extern FXAPI FXStream& operator<<(FXStream& store,const FXVec2d& v);
extern FXAPI FXStream& operator>>(FXStream& store,FXVec2d& v);

}
