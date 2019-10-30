/* FXThread.i */

%pythonappend FX::FXThread::FXThread %{
  self.thisown = False
%}


%module FXThread

%include "include/fxdefs2.h"
%include "include/FXThread.h"
