/* FXDate.i */

%pythonappend FX::FXDate::FXDate %{
  self.thisown = False
%}


namespace FX {

/**
* Gregorian date object.
*/
class FXDate {
public:

  /// Names for the months
  enum {
    Jan=1,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec
    };

  /// Names for the weekdays
  enum {
    Sun=0,Mon,Tue,Wed,Thu,Fri,Sat
    };

public:

  /// Default constructor
  FXDate(){}

  /// Copy constructor
  FXDate(const FXDate& date):julian(date.julian){}

  /// Initialize with year, month, and day
  FXDate(FXint y,FXint m,FXint d);

  /// Initialize with julian day number
  FXDate(FXuint j):julian(j){}

  /// Set julian day number
  void setJulian(FXuint d){ julian=d; }

  /// Get julian day number
  FXuint getJulian() const { return julian; }

  /// Set to year, month, and day
  void setDate(FXint y,FXint m,FXint d);

  /// Get year, month, and day
  void getDate(FXint& y,FXint& m,FXint& d) const;

  /// Return day of the month
  FXint day() const;

  /// Return month
  FXint month() const;

  /// Return year
  FXint year() const;

  /// Return day of the week
  FXint dayOfWeek() const;

  /// Return day of year
  FXint dayOfYear() const;

  /// Return days in this month
  FXint daysInMonth() const;

  /// Return true if leap year
  bool leapYear() const;

  /// Is the value a leap year
  static bool leapYear(FXint y);

  /// Get the name of the month
  static const FXchar *monthName(FXint m){ return longMonthName[m-1]; }

  /// Get the abbreviated name of the month
  static const FXchar *monthNameShort(FXint m){ return shortMonthName[m-1]; }

  /// Get the name of the day
  static const FXchar *dayName(FXint d){ return longWeekDay[d]; }

  /// Get the abbreviated name of the day
  static const FXchar *dayNameShort(FXint d){ return shortWeekDay[d]; }

  /// Return current local date
  static FXDate localDate();

  /// Return current UTC (Zulu) date
  static FXDate zuluDate();

  /// Assignment
  FXDate& operator=(const FXDate& date){julian=date.julian;return *this;}

  /// Assignment operators
  FXDate& operator+=(FXint x){ julian+=x; return *this; }
  FXDate& operator-=(FXint x){ julian-=x; return *this; }

  /// Increment and decrement
  FXDate& operator++(){ julian++; return *this; }
  FXDate& operator--(){ julian--; return *this; }

  /// Equality tests
  bool operator==(const FXDate& date) const { return julian==date.julian;}
  bool operator!=(const FXDate& date) const { return julian!=date.julian;}

  /// Inequality tests
  bool operator<(const FXDate& date) const { return julian<date.julian;}
  bool operator<=(const FXDate& date) const { return julian<=date.julian;}
  bool operator>(const FXDate& date) const { return julian>date.julian;}
  bool operator>=(const FXDate& date) const { return julian>=date.julian;}

  /// Add days to date yielding another date
  friend inline FXDate operator+(const FXDate& d,FXint x);
  friend inline FXDate operator+(FXint x,const FXDate& d);

  /// Substract dates yielding days
  friend inline FXint operator-(const FXDate& a,const FXDate& b);

  /// save to stream
  friend FXStream& operator<<(FXStream& store,const FXDate& d);

  /// load from stream
  friend FXStream& operator>>(FXStream& store,FXDate& d);
  };


inline FXDate operator+(const FXDate& d,FXint x){ return FXDate(d.julian+x); }
inline FXDate operator+(FXint x,const FXDate& d){ return FXDate(x+d.julian); }
inline FXint operator-(const FXDate& a,const FXDate& b){return a.julian-b.julian; }

extern FXStream& operator<<(FXStream& store,const FXDate& d);
extern FXStream& operator>>(FXStream& store,FXDate& d);

}
