/* FXDataTarget.i */

%pythonappend FX::FXDataTarget::FXDataTarget %{
  self.thisown = False
%}
%pythonappend FX::FXPyDataTarget::FXPyDataTarget %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
namespace FX {

%ignore FXDataTarget::getData() const;

/**
* A Data Target allows a valuator widget such as a Slider or Text Field
* to be directly connected with a variable in the program.
* Whenever the valuator control changes, the variable connected through
* the data target is automatically updated; conversely, whenever the program
* changes a variable, all the connected valuator widgets will be updated
* to reflect this new value on the display.
* Data Targets also allow connecting Radio Buttons, Menu Commands, and so on
* to a variable.  In this case, the new value of the connected variable is computed
* by subtracting ID_OPTION from the message ID.
*/
class FXAPI FXDataTarget : public FXObject {
public:
  long onCmdValue(FXObject*,FXSelector,void*);
  long onUpdValue(FXObject*,FXSelector,void*);
  long onCmdOption(FXObject*,FXSelector,void*);
  long onUpdOption(FXObject*,FXSelector,void*);
public:
  enum {
    DT_VOID=0,
    DT_CHAR,
    DT_UCHAR,
    DT_SHORT,
    DT_USHORT,
    DT_INT,
    DT_UINT,
    DT_LONG,
    DT_ULONG,
    DT_FLOAT,
    DT_DOUBLE,
    DT_STRING,
    DT_LAST
    };
public:
  enum {
    ID_VALUE=1,                   /// Will cause the FXDataTarget to ask sender for value
    ID_OPTION=ID_VALUE+10001,     /// ID_OPTION+i will set the value to i where -10000<=i<=10000
    ID_LAST=ID_OPTION+10000
    };
public:
  %extend {
    // Initialize with this value
    FXDataTarget(PyObject* value=Py_None,FXObject* tgt=NULL,FXSelector sel=0){
      return new FXPyDataTarget(value,tgt,sel);
      }
  }

  /// Set the message target object for this data target
  void setTarget(FXObject *t);

  /// Get the message target object for this data target, if any
  FXObject* getTarget() const;


  /// Set the message identifier for this data target
  void setSelector(FXSelector sel);

  /// Get the message identifier for this data target
  FXSelector getSelector() const;


  /// Return type of data its connected to
  FXuint getType() const;

  /// Return pointer to data its connected to
  void* getData() const;
};

class FXPyDataTarget : public FXDataTarget {
    FXDECLARE(FXPyDataTarget)
private:
  // Associated integer value (if it's an integer)
  FXint intValue;

  // Associated double value (if it's a float)
  FXdouble doubleValue;

  // Associated string value (if it's a string)
  FXString stringValue;

  // Associated boolean value (if it's a boolean)
  FXbool boolValue;

public:

  FXPyDataTarget(PyObject *value,FXObject* tgt,FXSelector sel);
  void setValue(PyObject *obj);
};
}


//%extend FXPyDataTarget {

// Initialize a data target with this value
FX::FXPyDataTarget::FXPyDataTarget(PyObject *value,FXObject* tgt,FXSelector sel) : FXDataTarget(tgt,sel), intValue(0), doubleValue(0.0), boolValue(FALSE) {
  setValue(value);
  }

// Set new value for data target
void FX::FXPyDataTarget::setValue(PyObject *obj){
    if (PyLong_Check(obj)) {
        intValue=PyLong_AsLong(obj);
        connect(intValue);
    } else if (PyUnicode_Check(obj)){
        stringValue= FXString(PyUnicode_AsString(obj));
        connect(stringValue);
    } else if (PyBool_Check(obj)) {
        if (PyObject_IsTrue(obj)) {
            boolValue = TRUE;
        } else {
            boolValue = TRUE;
        }
        connect(boolValue);
    } else if (PyFloat_Check(obj)) {
        doubleValue = PyFloat_AsDouble(obj);
        connect(doubleValue);
    } else if (obj == Py_None) {
        connect();
    }
}
