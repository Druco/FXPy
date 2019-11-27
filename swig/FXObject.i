/* FXObject.i */

%pythonappend FX::FXPyObject::FXPyObject %{
  self.thisown = False
  FXPyRegister(self)
%}

namespace FX {

/// Minimum and maximum message id
enum {
  MINKEY = 0,
  MAXKEY = 65535
  };


/// Minimum and maximum message type
enum {
  MINTYPE = 0,
  MAXTYPE = 65535
  };


/// Association key
typedef FXuint FXSelector;


class FXObject;


/// Describes a FOX object
class FXMetaClass {
public:
  FXMetaClass(const FXchar* name,FXObject *(fac)(),const FXMetaClass* base,const void* ass,FXuint nass,FXuint assz);

  /// Check if metaclass is subclass of some other metaclass
  bool isSubClassOf(const FXMetaClass* metaclass) const;

  /// Make instance of some object
  FXObject* makeInstance() const;

  /// Ask class name
  const FXchar* getClassName() const { return className; }

  /// Ask base class
  const FXMetaClass* getBaseClass() const { return baseClass; }

  /// Find metaclass object
  static const FXMetaClass* getMetaClassFromName(const FXchar* name);

  /// Search message map
  const void* search(FXSelector key) const;

 ~FXMetaClass();
  };

/// Macro to set up class declaration
#define FXDECLARE(classname) \
  public: \
   struct FXMapEntry { FXSelector keylo; FXSelector keyhi; long (classname::* func)(FXObject*,FXSelector,void*); }; \
   static const FXMetaClass metaClass; \
   static FXObject* manufacture(); \
   virtual long handle(FXObject* sender,FXSelector sel,void* handle__ptr); \
   virtual const FXMetaClass* getMetaClass() const { return &metaClass; } \
/*   friend FXStream& operator<<(FXStream& store,const classname* obj){return store.saveObject((FXObjectPtr)(obj));}  */ \
/*   friend FXStream& operator>>(FXStream& store,classname*& obj){return store.loadObject((FXObjectPtr&)(obj));}  */ \
  private:

#if 0
/// Macro to set up class implementation
#define FXIMPLEMENT(classname,baseclassname,mapping,nmappings) \
  FXObject* classname::manufacture(){return new classname;} \
  const FXMetaClass classname::metaClass(#classname,classname::manufacture,&baseclassname::metaClass,mapping,nmappings,sizeof(classname::FXMapEntry)); \
  long classname::handle(FXObject* sender,FXSelector sel,void* ptr){ \
    const FXMapEntry* me=(const FXMapEntry*)metaClass.search(sel); \
    return me ? (this->* me->func)(sender,sel,ptr) : baseclassname::handle(sender,sel,ptr); \
    }

/// Macro to set up abstract class declaration
#define FXDECLARE_ABSTRACT(classname) \
  public: \
   struct FXMapEntry { FXSelector keylo; FXSelector keyhi; long (classname::* func)(FXObject*,FXSelector,void*); }; \
   static const FXMetaClass metaClass; \
   virtual long handle(FXObject* sender,FXSelector sel,void* ptr); \
   virtual const FXMetaClass* getMetaClass() const { return &metaClass; } \
/*   friend FXStream& operator<<(FXStream& store,const classname* obj){return store.saveObject((FXObjectPtr)(obj));} */ \
/*   friend FXStream& operator>>(FXStream& store,classname*& obj){return store.loadObject((FXObjectPtr&)(obj));} */ \
  private:

/// Macro to set up abstract class implementation
#define FXIMPLEMENT_ABSTRACT(classname,baseclassname,mapping,nmappings) \
  const FXMetaClass classname::metaClass(#classname,NULL,&baseclassname::metaClass,mapping,nmappings,sizeof(classname::FXMapEntry)); \
  long classname::handle(FXObject* sender,FXSelector sel,void* ptr){ \
    const FXMapEntry* me=(const FXMapEntry*)metaClass.search(sel); \
    return me ? (this->* me->func)(sender,sel,ptr) : baseclassname::handle(sender,sel,ptr); \
    }


/// MetaClass of a class
#define FXMETACLASS(classname) (&classname::metaClass)


/// Set up map type
#define FXDEFMAP(classname) static const classname::FXMapEntry

/// Define range of function types
#define FXMAPTYPES(typelo,typehi,func) {FXSEL(typelo,MINKEY),FXSEL(typehi,MAXKEY),&func}

/// Define range of function types
#define FXMAPTYPE(type,func) {FXSEL(type,MINKEY),FXSEL(type,MAXKEY),&func}

/// Define range of functions
#define FXMAPFUNCS(type,keylo,keyhi,func) {FXSEL(type,keylo),FXSEL(type,keyhi),&func}

/// Define one function
#define FXMAPFUNC(type,key,func) {FXSEL(type,key),FXSEL(type,key),&func}
#endif

/**
* Object is the base class for all objects in FOX; in order to receive
* messages from the user interface, your class must derive from Object.
* The Object class also provides serialization facilities, with which
* you can save and restore the object's state.  If you've subclassed
* from Object, you can save your subclasses' state by overloading the
* save() and load() functions and use the stream API to serialize its
* member data.
*/
class FXObject {
public:

  /// Called for unhandled messages
  virtual long onDefault(FXObject*,FXSelector,void*);
  virtual long handle(FXObject*,FXSelector,void*);

%pythoncode %{
def _fxmapsearch(self, key):
        try:
            for (keylo, keyhi, func) in self.FXMSGMAP:
                if keylo <= key and keyhi >= key:
                    return func
        except:
            pass
        return None
%}
public:
      
  /// Get class name of some object
  const FXchar* getClassName() const;

  /// Check if object is member of metaclass
  bool isMemberOf(const FXMetaClass* metaclass) const;

  /// Try handle message safely
  virtual long tryHandle(FXObject* sender,FXSelector sel,void* ptr);

  /// Save object to stream
  virtual void save(FXStream& store) const;

  /// Load object from stream
  virtual void load(FXStream& store);

  /// Virtual destructor
  virtual ~FXObject();
  };

}


namespace FX {
class FXPyObject : public FXObject {
    FXDECLARE(FXPyObject)
public:
  FXPyObject();
};
}
