/********************************************************************************
*                                                                               *
*         M i s c e l l a n e o u s   S y s t e m   F u n c t i o n s           *
*                                                                               *
*********************************************************************************
* Copyright (C) 2005,2006 by Jeroen van der Zijp.   All Rights Reserved.        *
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
* $Id: FXSystem.h,v 1.6 2006/01/22 17:58:10 fox Exp $                           *
********************************************************************************/
#ifndef FXSYSTEM_H
#define FXSYSTEM_H



namespace FX {



namespace FXSystem {


/// Return current time
FXTime now();

/// Convert time value to date-string
FXString time(FXTime value);

/**
* Convert time value to date-string as per strftime.
* Format characters supported by most systems are:
*
*  %a %A %b %B %c %d %H %I %j %m %M %p %S %U %w %W %x %X %y %Y %Z %%
*
* Some systems support additional conversions.
*/
FXString time(const FXchar *format,FXTime value);



/// Get effective user id
FXuint user();

/// Get effective group id
FXuint group();

/// Return owner name from uid if available
FXString userName(FXuint uid);

/// Return group name from gid if available
FXString groupName(FXuint gid);

/// Get current effective user name
FXString currentUserName();

/// Get current effective group name
FXString currentGroupName();


/// Get permissions string
FXString modeString(FXuint mode);



/// Return value of environment variable name
FXString getEnvironment(const FXString& name);

/// Change value of environment variable name, return true if success
bool setEnvironment(const FXString& name,const FXString& value);



/// Get the current working directory
FXString getCurrentDirectory();

/// Set the current working directory
FXbool setCurrentDirectory(const FXString& path);

/// Return the current drive (for Win32 systems)
FXString getCurrentDrive();

/// Set the current drive (for Win32 systems)
FXbool setCurrentDrive(const FXString& prefix);



/// Get executable path
FXString getExecPath();

/// Return the home directory for the current user
FXString getHomeDirectory();

/// Return the home directory for a given user
FXString getUserDirectory(const FXString& user);

/// Return temporary directory
FXString getTempDirectory();



/**
* Get DLL name for given base name; for example "png"
* becomes "libpng.so" on Linux, and "png.dll" on Windows.
*/
FXString dllName(const FXString& name);

}

}

#endif
