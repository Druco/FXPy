/********************************************************************************
*                                                                               *
*               D e v i c e   C o n t e x t   B a s e   C l a s s               *
*                                                                               *
*********************************************************************************
* Copyright (C) 1999,2006 by Jeroen van der Zijp.   All Rights Reserved.        *
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
* $Id: FXDC.h,v 1.37 2006/01/22 17:58:00 fox Exp $                              *
********************************************************************************/
#ifndef FXDC_H
#define FXDC_H

namespace FX {

/// Drawing (BITBLT) functions
enum FXFunction {
  BLT_CLR,                        /// D := 0
  BLT_SRC_AND_DST,                /// D := S & D
  BLT_SRC_AND_NOT_DST,            /// D := S & ~D
  BLT_SRC,                        /// D := S
  BLT_NOT_SRC_AND_DST,            /// D := ~S & D
  BLT_DST,                        /// D := D
  BLT_SRC_XOR_DST,                /// D := S ^ D
  BLT_SRC_OR_DST,                 /// D := S | D
  BLT_NOT_SRC_AND_NOT_DST,        /// D := ~S & ~D  ==  D := ~(S | D)
  BLT_NOT_SRC_XOR_DST,            /// D := ~S ^ D
  BLT_NOT_DST,                    /// D := ~D
  BLT_SRC_OR_NOT_DST,             /// D := S | ~D
  BLT_NOT_SRC,                    /// D := ~S
  BLT_NOT_SRC_OR_DST,             /// D := ~S | D
  BLT_NOT_SRC_OR_NOT_DST,         /// D := ~S | ~D  ==  ~(S & D)
  BLT_SET                         /// D := 1
  };


/// Line Styles
enum FXLineStyle {
  LINE_SOLID,                     /// Solid lines
  LINE_ONOFF_DASH,                /// On-off dashed lines
  LINE_DOUBLE_DASH                /// Double dashed lines
  };


/// Line Cap Styles
enum FXCapStyle {
  CAP_NOT_LAST,                   /// Don't include last end cap
  CAP_BUTT,                       /// Butting line end caps
  CAP_ROUND,                      /// Round line end caps
  CAP_PROJECTING                  /// Projecting line end caps
  };


/// Line Join Styles
enum FXJoinStyle {
  JOIN_MITER,                     /// Mitered or pointy joints
  JOIN_ROUND,                     /// Round line joints
  JOIN_BEVEL                      /// Beveled or flat joints
  };


/// Fill Styles
enum FXFillStyle {
  FILL_SOLID,                     /// Fill with solid color
  FILL_TILED,                     /// Fill with tiled bitmap
  FILL_STIPPLED,                  /// Fill where stipple mask is 1
  FILL_OPAQUESTIPPLED             /// Fill with foreground where mask is 1, background otherwise
  };


/// Fill Rules
enum FXFillRule {
  RULE_EVEN_ODD,                  /// Even odd polygon filling
  RULE_WINDING                    /// Winding rule polygon filling
  };


/// Stipple/dither patterns
enum FXStipplePattern {
  STIPPLE_0         = 0,
  STIPPLE_NONE      = 0,
  STIPPLE_BLACK     = 0,            /// All ones
  STIPPLE_1         = 1,
  STIPPLE_2         = 2,
  STIPPLE_3         = 3,
  STIPPLE_4         = 4,
  STIPPLE_5         = 5,
  STIPPLE_6         = 6,
  STIPPLE_7         = 7,
  STIPPLE_8         = 8,
  STIPPLE_GRAY      = 8,            /// 50% gray
  STIPPLE_9         = 9,
  STIPPLE_10        = 10,
  STIPPLE_11        = 11,
  STIPPLE_12        = 12,
  STIPPLE_13        = 13,
  STIPPLE_14        = 14,
  STIPPLE_15        = 15,
  STIPPLE_16        = 16,
  STIPPLE_WHITE     = 16,           /// All zeroes
  STIPPLE_HORZ      = 17,           /// Horizontal hatch pattern
  STIPPLE_VERT      = 18,           /// Vertical hatch pattern
  STIPPLE_CROSS     = 19,           /// Cross-hatch pattern
  STIPPLE_DIAG      = 20,           /// Diagonal // hatch pattern
  STIPPLE_REVDIAG   = 21,           /// Reverse diagonal \\ hatch pattern
  STIPPLE_CROSSDIAG = 22            /// Cross-diagonal hatch pattern
  };


/// Line segment
struct FXSegment {
  FX::FXshort x1,y1,x2,y2;
  };


/// Arc
struct FXArc {
  FX::FXshort x,y,w,h,a,b;
  };


class FXApp;
class FXImage;
class FXBitmap;
class FXIcon;
class FXFont;
class FXDrawable;
class FXRegion;


/**
* Abstract Device Context
*
* A Device Context is used to maintain the state of the graphics drawing system.
* Defining your drawing code in terms of the Abstract Device Context allows the
* drawing commands to be rendered on different types of surfaces, such as windows
* and images (FXDCWindow), or on paper (FXDCPrint).
* WYSYWYG may be obtained by using the same identical drawing code in your
* application regardless of the actual device surface being utilized.
*/
class FXDC {
  friend class FX::FXFont;
private:
  FX::FXApp           *app;         // Application
protected:
  void            *ctx;         // Context handle
  FX::FXFont          *font;        // Drawing font
  FX::FXStipplePattern pattern;     // Stipple pattern
  FX::FXBitmap        *stipple;     // Stipple bitmap
  FX::FXImage         *tile;        // Tile image
  FX::FXBitmap        *mask;        // Mask bitmap
  FX::FXRectangle      clip;        // Clip rectangle
  FX::FXColor          fg;          // Foreground color
  FX::FXColor          bg;          // Background color
  FX::FXuint           width;       // Line width
  FX::FXCapStyle       cap;         // Line cap style
  FX::FXJoinStyle      join;        // Line join style
  FX::FXLineStyle      style;       // Line style
  FX::FXFillStyle      fill;        // Fill style
  FX::FXFillRule       rule;        // Fill rule
  FX::FXFunction       rop;         // RasterOp
  FX::FXchar           dashpat[32]; // Line dash pattern data
  FX::FXuint           dashlen;     // Line dash pattern length
  FX::FXuint           dashoff;     // Line dash pattern offset
  FX::FXint            tx;          // Tile dx
  FX::FXint            ty;          // Tile dy
  FX::FXint            cx;          // Clip x
  FX::FXint            cy;          // Clip y
private:
  FXDC();
  FXDC(const FX::FXDC&);
  FXDC &operator=(const FX::FXDC&);
public:

  /// Construct dummy DC
  FXDC(FX::FXApp* a);

  /// Get application
  FX::FXApp* getApp() const { return app; }

  /// Get context handle
  void* context() const { return ctx; }

  /// Read back pixel
  virtual FX::FXColor readPixel(FX::FXint x,FX::FXint y);

  /// Draw points
  virtual void drawPoint(FX::FXint x,FX::FXint y);
  virtual void drawPoints(const FX::FXPoint* points,FX::FXuint npoints);
  virtual void drawPointsRel(const FX::FXPoint* points,FX::FXuint npoints);

  /// Draw lines
  virtual void drawLine(FX::FXint x1,FX::FXint y1,FX::FXint x2,FX::FXint y2);
  virtual void drawLines(const FX::FXPoint* points,FX::FXuint npoints);
  virtual void drawLinesRel(const FX::FXPoint* points,FX::FXuint npoints);
  virtual void drawLineSegments(const FX::FXSegment* segments,FX::FXuint nsegments);

  /// Draw rectangles
  virtual void drawRectangle(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
  virtual void drawRectangles(const FX::FXRectangle* rectangles,FX::FXuint nrectangles);

  /// Draw rounded rectangle with ellipse with ew and ellips height eh
  virtual void drawRoundRectangle(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h,FX::FXint ew,FX::FXint eh);

  /**
  * Draw arcs.
  * The argument ang1 specifies the start of the arc relative to the
  * three-o'clock position from the center, in units of degrees*64.
  * The argument ang2 specifies the path and extent of the arc relative
  * to the start of the arc, in units of degrees*64.
  * The arguments x,y,w,h specify the bounding rectangle.
  */
  virtual void drawArc(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h,FX::FXint ang1,FX::FXint ang2);
  virtual void drawArcs(const FX::FXArc* arcs,FX::FXuint narcs);

  /// Draw ellipse
  virtual void drawEllipse(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);

  /// Filled rectangles
  virtual void fillRectangle(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
  virtual void fillRectangles(const FX::FXRectangle* rectangles,FX::FXuint nrectangles);

  /// Filled rounded rectangle with ellipse with ew and ellips height eh
  virtual void fillRoundRectangle(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h,FX::FXint ew,FX::FXint eh);

  /// Fill chord
  virtual void fillChord(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h,FX::FXint ang1,FX::FXint ang2);
  virtual void fillChords(const FX::FXArc* chords,FX::FXuint nchords);

  /// Fill arcs
  virtual void fillArc(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h,FX::FXint ang1,FX::FXint ang2);
  virtual void fillArcs(const FX::FXArc* arcs,FX::FXuint narcs);

  /// Fill ellipse
  virtual void fillEllipse(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);

  /// Filled polygon
  virtual void fillPolygon(const FX::FXPoint* points,FX::FXuint npoints);
  virtual void fillConcavePolygon(const FX::FXPoint* points,FX::FXuint npoints);
  virtual void fillComplexPolygon(const FX::FXPoint* points,FX::FXuint npoints);

  /// Filled polygon with relative points
  virtual void fillPolygonRel(const FX::FXPoint* points,FX::FXuint npoints);
  virtual void fillConcavePolygonRel(const FX::FXPoint* points,FX::FXuint npoints);
  virtual void fillComplexPolygonRel(const FX::FXPoint* points,FX::FXuint npoints);

  /// Draw hashed box
  virtual void drawHashBox(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h,FX::FXint b=1);

  /// Draw focus rectangle
  virtual void drawFocusRectangle(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);

  /// Draw area from source
  virtual void drawArea(const FX::FXDrawable* source,FX::FXint sx,FX::FXint sy,FX::FXint sw,FX::FXint sh,FX::FXint dx,FX::FXint dy);

  /// Draw area stretched area from source
  virtual void drawArea(const FX::FXDrawable* source,FX::FXint sx,FX::FXint sy,FX::FXint sw,FX::FXint sh,FX::FXint dx,FX::FXint dy,FX::FXint dw,FX::FXint dh);

  /// Draw image
  virtual void drawImage(const FX::FXImage* image,FX::FXint dx,FX::FXint dy);

  /// Draw bitmap
  virtual void drawBitmap(const FX::FXBitmap* bitmap,FX::FXint dx,FX::FXint dy);

  /// Draw icon
  virtual void drawIcon(const FX::FXIcon* icon,FX::FXint dx,FX::FXint dy);
  virtual void drawIconShaded(const FX::FXIcon* icon,FX::FXint dx,FX::FXint dy);
  virtual void drawIconSunken(const FX::FXIcon* icon,FX::FXint dx,FX::FXint dy);

  /// Draw string with base line starting at x, y
  virtual void drawText(FX::FXint x,FX::FXint y,const FX::FXString& string);
  virtual void drawText(FX::FXint x,FX::FXint y,const FX::FXchar* string,FX::FXuint length);

  /// Draw text starting at x, y over filled background
  virtual void drawImageText(FX::FXint x,FX::FXint y,const FX::FXString& string);
  virtual void drawImageText(FX::FXint x,FX::FXint y,const FX::FXchar* string,FX::FXuint length);

  /// Set foreground drawing color
  virtual void setForeground(FX::FXColor clr);

  /// Get foreground drawing color
  FX::FXColor getForeground() const { return fg; }

  /// Set background drawing color
  virtual void setBackground(FX::FXColor clr);

  /// Get background drawing color
  FX::FXColor getBackground() const { return bg; }

  /**
  * Set dash pattern and dash offset.
  * A dash pattern of [1 2 3 4] is a repeating pattern of 1 foreground pixel,
  * 2 background pixels, 3 foreground pixels, and 4 background pixels.
  * The offset is where in the pattern the system will start counting.
  * The maximum length of the dash pattern is 32.
  */
  virtual void setDashes(FX::FXuint dashoffset,const FX::FXchar *dashpattern,FX::FXuint dashlength);

  /// Get dash pattern
  const FX::FXchar* getDashPattern() const { return dashpat; }

  /// Get dash offset
  FX::FXuint getDashOffset() const { return dashoff; }

  /// Get dash length
  FX::FXuint getDashLength() const { return dashlen; }

  /// Set line width:- 0 means thinnest/fastest possible
  virtual void setLineWidth(FX::FXuint linewidth=0);

  /// Get line width
  FX::FXuint getLineWidth() const { return width; }

  /// Set line cap style
  virtual void setLineCap(FX::FXCapStyle capstyle=CAP_BUTT);

  /// Get line cap style
  FX::FXCapStyle getLineCap() const { return cap; }

  /// Set line join style
  virtual void setLineJoin(FX::FXJoinStyle joinstyle=JOIN_MITER);

  /// Get line join style
  FX::FXJoinStyle getLineJoin() const { return join; }

  /// Set line style
  virtual void setLineStyle(FX::FXLineStyle linestyle=LINE_SOLID);

  /// Get line style
  FX::FXLineStyle getLineStyle() const { return style; }

  /// Set fill style
  virtual void setFillStyle(FX::FXFillStyle fillstyle=FILL_SOLID);

  /// Get fill style
  FX::FXFillStyle getFillStyle() const { return fill; }

  /// Set fill rule
  virtual void setFillRule(FX::FXFillRule fillrule=RULE_EVEN_ODD);

  /// Get fill rule
  FX::FXFillRule getFillRule() const { return rule; }

  /// Set rasterop function
  virtual void setFunction(FX::FXFunction func=BLT_SRC);

  /// Get rasterop function
  FX::FXFunction getFunction() const { return rop; }

  /// Set the tile image
  virtual void setTile(FX::FXImage* image,FX::FXint dx=0,FX::FXint dy=0);

  /// Get the tile image
  FX::FXImage *getTile() const { return tile; }

  /// Set the stipple pattern
  virtual void setStipple(FX::FXBitmap *bitmap,FX::FXint dx=0,FX::FXint dy=0);

  /// Get stipple bitmap
  FX::FXBitmap *getStippleBitmap() const { return stipple; }

  /// Set the stipple pattern
  virtual void setStipple(FX::FXStipplePattern pat,FX::FXint dx=0,FX::FXint dy=0);

  /// Get pattern
  FX::FXStipplePattern getStipplePattern() const { return pattern; }

  /// Set clip region
  virtual void setClipRegion(const FX::FXRegion& region);

  /// Set clip rectangle
  virtual void setClipRectangle(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);

  /// Change clip rectangle
  virtual void setClipRectangle(const FX::FXRectangle& rectangle);

  /// Return clip rectangle
  const FX::FXRectangle& getClipRectangle() const { return clip; }

  /// Return clip x
  FX::FXint getClipX() const { return clip.x; }

  /// Return clip y
  FX::FXint getClipY() const { return clip.y; }

  /// Return clip width
  FX::FXint getClipWidth() const { return clip.w; }

  /// Return clip height
  FX::FXint getClipHeight() const { return clip.h; }

  /// Clear clipping
  virtual void clearClipRectangle();

  /// Set clip mask
  virtual void setClipMask(FX::FXBitmap* bitmap,FX::FXint dx=0,FX::FXint dy=0);

  /// Clear clip mask
  virtual void clearClipMask();

  /// Set font to draw text with
  virtual void setFont(FX::FXFont *fnt);

  /// Get text font
  FX::FXFont* getFont() const { return font; }

  /// Clip against child windows
  virtual void clipChildren(FX::FXbool yes);

  /// Destructor
  virtual ~FXDC();
  };

}

#endif
