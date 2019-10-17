/* FX7Segment.i */

%pythonappend FX::FX7Segment::FX7Segment %{
  self.thisown = False
%}

%module FX7Segment

%{
#include "fxdefs2.h"
#include "fx.h"
%}

%include "include/fxdefs2.h"
%include "include/FX7Segment.h"
