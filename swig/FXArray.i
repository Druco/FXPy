/* FXArray.i */

%pythonappend FX::FXArray::FXArray %{
  self.thisown = False
%}


#define __GNUC__
%module FXArray

%include "include/FXArray.h"


%inline  %{
template<class T>
    class FXArray{
private:
    FX::FXArray<T> data_;
    size_t xsize_;
public:
    FXArray(): xsize_(0) {};

    // creates vector of size nx and sets each element to t
    FXArray(const size_t& nx, const T& t): xsize_(nx) {
        data_.resize(xsize_, t);
    }

    T& operator[](const size_t i) {return data_.at(i);}
};
%}

%extend FXArray {
   T __getitem__(size_t i) {
    return (*$self)[i];
  }
}

