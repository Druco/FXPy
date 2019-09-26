/********************************************************************************
*                                                                               *
*       P e r s i s t e n t   S t o r a g e   S t r e a m   C l a s s e s       *
*                                                                               *
*********************************************************************************
* Copyright (C) 1997,2006 by Jeroen van der Zijp.   All Rights Reserved.        *
*********************************************************************************
* This library is free software; you can redistribute it and/or                 *
* modify it under the terms of the GNU Lesser General Public                    *
* License as published by the Free Software Foundation; either                  *
* version 2.1 of the License, or (at your option) any later version.            *
*                                                                               *
* This library is distributed in the hope that it will be useful,               *
* but WITHOUT ANY WARRANTY; without even the implied warranty of                *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU             *
* Lesser General Public License for more details.                               *
*                                                                               *
* You should have received a copy of the GNU Lesser General Public              *
* License along with this library; if not, write to the Free Software           *
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA.    *
*********************************************************************************
* $Id: FXStream.h,v 1.42 2006/01/22 17:58:10 fox Exp $                          *
********************************************************************************/
#ifndef FXSTREAM_H
#define FXSTREAM_H


namespace FX {


/// Stream data flow direction
enum FXStreamDirection {
  FXStreamDead=0,               /// Unopened stream
  FXStreamSave=1,               /// Saving stuff to stream
  FXStreamLoad=2                /// Loading stuff from stream
  };


/// Stream status codes
enum FXStreamStatus {
  FXStreamOK=0,                 /// OK
  FXStreamEnd=1,                /// Try read past end of stream
  FXStreamFull=2,               /// Filled up stream buffer or disk full
  FXStreamNoWrite=3,            /// Unable to open for write
  FXStreamNoRead=4,             /// Unable to open for read
  FXStreamFormat=5,             /// Stream format error
  FXStreamUnknown=6,            /// Trying to read unknown class
  FXStreamAlloc=7,              /// Alloc failed
  FXStreamFailure=8             /// General failure
  };


/// Stream seeking
enum FXWhence {
  FXFromStart=0,                /// Seek from start position
  FXFromCurrent=1,              /// Seek from current position
  FXFromEnd=2                   /// Seek from end position
  };


/**
* A stream is a way to serialize data and objects into a byte stream.
* Each item of data that is saved or loaded from the stream may be byte-swapped,
* thus allowing little-endian machines to read data produced on big endian ones
* and vice-versa.
* Data is serialized exactly as-is.  There are no tags or other markers
* inserted into the stream; thus, the stream may be used to save or load arbitrary
* binary data.
* Objects derived from FXObjects may be serialized also; whenever a reference to an
* object is serialized, a table is consulted to determine if the same object has
* been encountered previously; if not, the object is added to the table and then
* its contents are serialized.  If the object has been encountered before, only a
* reference to the object is serialized.
* When loading back a serialized object, new instances are constructed using
* the default constructor, and subsequently the object's contents are loaded.
* A special container object may be passed in which is placed in the table
* as if it had been encountered before; this will cause only references to this
* object to be saved.  The container object is typically the top-level document
* object which manages all objects contained by it.  Additional objects may be
* added using addObject(); these will not be actually saved or loaded.
*/
class FXStream {
protected:
  FX::FXHash             hash;      // Hash table
  const FX::FXObject    *parent;    // Parent object
  FX::FXuchar           *begptr;    // Begin of buffer
  FX::FXuchar           *endptr;    // End of buffer
  FX::FXuchar           *wrptr;     // Write pointer
  FX::FXuchar           *rdptr;     // Read pointer
  FX::FXlong             pos;       // Position
  FX::FXStreamDirection  dir;       // Direction of current transfer
  FX::FXStreamStatus     code;      // Status code
  FX::FXuint             seq;       // Sequence number
  bool               owns;      // Stream owns buffer
  bool               swap;      // Swap bytes on readin
protected:

  /**
  * Write at least count bytes from the buffer;
  * returns number of bytes available to be written.
  */
  virtual FX::FXuval writeBuffer(FX::FXuval count);

  /**
  * Read at least count bytes into the buffer;
  * returns number of bytes available to be read.
  */
  virtual FX::FXuval readBuffer(FX::FXuval count);

public:

  /**
  * Construct stream with given container object.  The container object
  * is an object that will itself not be saved to or loaded from the stream,
  * but which may be referenced by other objects.  These references will be
  * properly saved and restored.
  */
  FXStream(const FX::FXObject* cont=NULL);

  /**
  * Open stream for reading (FX::FXStreamLoad) or for writing (FXStreamSave).
  * An initial buffer size may be given, which must be at least 16 bytes.
  * If data is not NULL, it is expected to point to an external data buffer
  * of length size; otherwise stream will use an internally managed buffer.
  */
  bool open(FX::FXStreamDirection save_or_load,FX::FXuval size=8192,FX::FXuchar* data=NULL);

  /// Flush buffer
  virtual bool flush();

  /// Close; return true if OK
  virtual bool close();

  /// Get available buffer space
  FX::FXuval getSpace() const;

  /// Set available buffer space
  void setSpace(FX::FXuval sp);

  /// Get status code
  FX::FXStreamStatus status() const { return code; }

  /// Return true if at end of file or error
  bool eof() const { return code!=FXStreamOK; }

  /// Set status code
  void setError(FX::FXStreamStatus err);

  /// Obtain stream direction
  FX::FXStreamDirection direction() const { return dir; }

  /// Get parent object
  const FX::FXObject* container() const { return parent; }

  /// Get position
  FX::FXlong position() const { return pos; }

  /// Move to position relative to head, tail, or current location
  virtual bool position(FX::FXlong offset,FX::FXWhence whence=FXFromStart);

  /**
  * Change swap bytes flag.
  */
  void swapBytes(bool s){ swap=s; }

  /**
  * Get state of the swap bytes flag.
  */
  bool swapBytes() const { return swap; }

  /**
  * Set stream to big endian mode if true.  Byte swapping will
  * be enabled if the machine native byte order is not equal to
  * the desired byte order.
  */
  void setBigEndian(bool big);

  /**
  * Return true if big endian mode.
  */
  bool isBigEndian() const;

  /// Save single items to stream
  FX::FXStream& operator<<(const FX::FXuchar& v);
  FX::FXStream& operator<<(const FX::FXchar& v){ return *this << reinterpret_cast<const FX::FXuchar&>(v); }
  FX::FXStream& operator<<(const FX::FXushort& v);
  FX::FXStream& operator<<(const FX::FXshort& v){ return *this << reinterpret_cast<const FX::FXushort&>(v); }
  FX::FXStream& operator<<(const FX::FXuint& v);
  FX::FXStream& operator<<(const FX::FXint& v){ return *this << reinterpret_cast<const FX::FXuint&>(v); }
  FX::FXStream& operator<<(const FX::FXfloat& v){ return *this << reinterpret_cast<const FX::FXuint&>(v); }
  FX::FXStream& operator<<(const FX::FXdouble& v);
  FX::FXStream& operator<<(const FX::FXlong& v){ return *this << reinterpret_cast<const FX::FXdouble&>(v); }
  FX::FXStream& operator<<(const FX::FXulong& v){ return *this << reinterpret_cast<const FX::FXdouble&>(v); }

  /// Save arrays of items to stream
  FX::FXStream& save(const FX::FXuchar* p,FX::FXuval n);
  FX::FXStream& save(const FX::FXchar* p,FX::FXuval n){ return save(reinterpret_cast<const FX::FXuchar*>(p),n); }
  FX::FXStream& save(const FX::FXushort* p,FX::FXuval n);
  FX::FXStream& save(const FX::FXshort* p,FX::FXuval n){ return save(reinterpret_cast<const FX::FXushort*>(p),n); }
  FX::FXStream& save(const FX::FXuint* p,FX::FXuval n);
  FX::FXStream& save(const FX::FXint* p,FX::FXuval n){ return save(reinterpret_cast<const FX::FXuint*>(p),n); }
  FX::FXStream& save(const FX::FXfloat* p,FX::FXuval n){ return save(reinterpret_cast<const FX::FXuint*>(p),n); }
  FX::FXStream& save(const FX::FXdouble* p,FX::FXuval n);
  FX::FXStream& save(const FX::FXlong* p,FX::FXuval n){ return save(reinterpret_cast<const FX::FXdouble*>(p),n); }
  FX::FXStream& save(const FX::FXulong* p,FX::FXuval n){ return save(reinterpret_cast<const FX::FXdouble*>(p),n); }

  /// Load single items from stream
  FX::FXStream& operator>>(FX::FXuchar& v);
  FX::FXStream& operator>>(FX::FXchar& v){ return *this >> reinterpret_cast<FX::FXuchar&>(v); }
  FX::FXStream& operator>>(FX::FXushort& v);
  FX::FXStream& operator>>(FX::FXshort& v){ return *this >> reinterpret_cast<FX::FXushort&>(v); }
  FX::FXStream& operator>>(FX::FXuint& v);
  FX::FXStream& operator>>(FX::FXint& v){ return *this >> reinterpret_cast<FX::FXuint&>(v); }
  FX::FXStream& operator>>(FX::FXfloat& v){ return *this >> reinterpret_cast<FX::FXuint&>(v); }
  FX::FXStream& operator>>(FX::FXdouble& v);
  FX::FXStream& operator>>(FX::FXlong& v){ return *this >> reinterpret_cast<FX::FXdouble&>(v); }
  FX::FXStream& operator>>(FX::FXulong& v){ return *this >> reinterpret_cast<FX::FXdouble&>(v); }

  /// Load arrays of items from stream
  FX::FXStream& load(FX::FXuchar* p,FX::FXuval n);
  FX::FXStream& load(FX::FXchar* p,FX::FXuval n){ return load(reinterpret_cast<FX::FXuchar*>(p),n); }
  FX::FXStream& load(FX::FXushort* p,FX::FXuval n);
  FX::FXStream& load(FX::FXshort* p,FX::FXuval n){ return load(reinterpret_cast<FX::FXushort*>(p),n); }
  FX::FXStream& load(FX::FXuint* p,FX::FXuval n);
  FX::FXStream& load(FX::FXint* p,FX::FXuval n){ return load(reinterpret_cast<FX::FXuint*>(p),n); }
  FX::FXStream& load(FX::FXfloat* p,FX::FXuval n){ return load(reinterpret_cast<FX::FXuint*>(p),n); }
  FX::FXStream& load(FX::FXdouble* p,FX::FXuval n);
  FX::FXStream& load(FX::FXlong* p,FX::FXuval n){ return load(reinterpret_cast<FX::FXdouble*>(p),n); }
  FX::FXStream& load(FX::FXulong* p,FX::FXuval n){ return load(reinterpret_cast<FX::FXdouble*>(p),n); }

  /// Save object
  FX::FXStream& saveObject(const FX::FXObject* v);

  /// Load object
  FX::FXStream& loadObject(FX::FXObject*& v);

  /// Add object without saving or loading
  FX::FXStream& addObject(const FX::FXObject* v);

  /// Destructor
  virtual ~FXStream();
  };

}

#endif
