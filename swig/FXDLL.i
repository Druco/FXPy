/* FXDLL.i */

namespace FX {

extern void* fxdllOpen(const FXchar *dllname);
extern void fxdllClose(void* dllhandle);
extern void* fxdllSymbol(void* dllhandle,const FXchar* dllsymbol);
extern FXString fxdllError();


}
