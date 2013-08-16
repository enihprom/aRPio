with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_types_h;
with Interfaces.C.Strings;
limited with arm_linux_gnueabihf_bits_stat_h;
limited with time_h;

package arm_linux_gnueabihf_sys_stat_h is

   --  unsupported macro: S_IFMT __S_IFMT
   --  unsupported macro: S_IFDIR __S_IFDIR
   --  unsupported macro: S_IFCHR __S_IFCHR
   --  unsupported macro: S_IFBLK __S_IFBLK
   --  unsupported macro: S_IFREG __S_IFREG
   --  unsupported macro: S_IFIFO __S_IFIFO
   --  unsupported macro: S_IFLNK __S_IFLNK
   --  unsupported macro: S_IFSOCK __S_IFSOCK
   --  arg-macro: procedure S_ISDIR (mode)
   --    __S_ISTYPE((mode), __S_IFDIR)
   --  arg-macro: procedure S_ISCHR (mode)
   --    __S_ISTYPE((mode), __S_IFCHR)
   --  arg-macro: procedure S_ISBLK (mode)
   --    __S_ISTYPE((mode), __S_IFBLK)
   --  arg-macro: procedure S_ISREG (mode)
   --    __S_ISTYPE((mode), __S_IFREG)
   --  arg-macro: procedure S_ISFIFO (mode)
   --    __S_ISTYPE((mode), __S_IFIFO)
   --  arg-macro: procedure S_ISLNK (mode)
   --    __S_ISTYPE((mode), __S_IFLNK)
   --  arg-macro: procedure S_ISSOCK (mode)
   --    __S_ISTYPE((mode), __S_IFSOCK)
   --  arg-macro: procedure S_TYPEISMQ (buf)
   --    __S_TYPEISMQ(buf)
   --  arg-macro: procedure S_TYPEISSEM (buf)
   --    __S_TYPEISSEM(buf)
   --  arg-macro: procedure S_TYPEISSHM (buf)
   --    __S_TYPEISSHM(buf)
   --  unsupported macro: S_ISUID __S_ISUID
   --  unsupported macro: S_ISGID __S_ISGID
   --  unsupported macro: S_ISVTX __S_ISVTX
   --  unsupported macro: S_IRUSR __S_IREAD
   --  unsupported macro: S_IWUSR __S_IWRITE
   --  unsupported macro: S_IXUSR __S_IEXEC
   --  unsupported macro: S_IRWXU (__S_IREAD|__S_IWRITE|__S_IEXEC)
   --  unsupported macro: S_IREAD S_IRUSR
   --  unsupported macro: S_IWRITE S_IWUSR
   --  unsupported macro: S_IEXEC S_IXUSR
   --  unsupported macro: S_IRGRP (S_IRUSR >> 3)
   --  unsupported macro: S_IWGRP (S_IWUSR >> 3)
   --  unsupported macro: S_IXGRP (S_IXUSR >> 3)
   --  unsupported macro: S_IRWXG (S_IRWXU >> 3)
   --  unsupported macro: S_IROTH (S_IRGRP >> 3)
   --  unsupported macro: S_IWOTH (S_IWGRP >> 3)
   --  unsupported macro: S_IXOTH (S_IXGRP >> 3)
   --  unsupported macro: S_IRWXO (S_IRWXG >> 3)
   --  unsupported macro: ACCESSPERMS (S_IRWXU|S_IRWXG|S_IRWXO)
   --  unsupported macro: ALLPERMS (S_ISUID|S_ISGID|S_ISVTX|S_IRWXU|S_IRWXG|S_IRWXO)
   --  unsupported macro: DEFFILEMODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)
   --  unsupported macro: S_BLKSIZE 512
  -- Copyright (C) 1991, 1992, 1995-2004, 2005, 2006, 2007, 2009, 2010
  --   Free Software Foundation, Inc.
  --   This file is part of the GNU C Library.
  --   The GNU C Library is free software; you can redistribute it and/or
  --   modify it under the terms of the GNU Lesser General Public
  --   License as published by the Free Software Foundation; either
  --   version 2.1 of the License, or (at your option) any later version.
  --   The GNU C Library is distributed in the hope that it will be useful,
  --   but WITHOUT ANY WARRANTY; without even the implied warranty of
  --   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --   Lesser General Public License for more details.
  --   You should have received a copy of the GNU Lesser General Public
  --   License along with the GNU C Library; if not, write to the Free
  --   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
  --   02111-1307 USA.   

  -- *	POSIX Standard: 5.6 File Characteristics	<sys/stat.h>
  --  

  -- For __mode_t and __dev_t.   
  -- For time_t resp. timespec.   
  -- The Single Unix specification says that some more types are
  --   available here.   

   subtype dev_t is arm_linux_gnueabihf_bits_types_h.uu_dev_t;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:46

   subtype gid_t is arm_linux_gnueabihf_bits_types_h.uu_gid_t;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:51

   subtype ino_t is arm_linux_gnueabihf_bits_types_h.uu_ino_t;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:57

   subtype mode_t is arm_linux_gnueabihf_bits_types_h.uu_mode_t;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:65

   subtype nlink_t is arm_linux_gnueabihf_bits_types_h.uu_nlink_t;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:70

   subtype off_t is arm_linux_gnueabihf_bits_types_h.uu_off_t;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:76

   subtype uid_t is arm_linux_gnueabihf_bits_types_h.uu_uid_t;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:84

   subtype blkcnt_t is arm_linux_gnueabihf_bits_types_h.uu_blkcnt_t;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:92

   subtype blksize_t is arm_linux_gnueabihf_bits_types_h.uu_blksize_t;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:100

  -- Test macros for file types.	 
  -- These are from POSIX.1b.  If the objects are not implemented using separate
  --   distinct file types, the macros always will evaluate to zero.  Unlike the
  --   other S_* macros the following three take a pointer to a `struct stat'
  --   object as the argument.   

  -- Protection bits.   
  -- Save swapped text after use (sticky bit).  This is pretty well obsolete.   
  -- Read, write, and execute by owner.   
  -- Read, write, and execute by group.   
  -- Read, write, and execute by others.   
  -- Macros for common mode bit masks.   
  -- Get file attributes for FILE and put them in BUF.   
   function stat (uu_file : Interfaces.C.Strings.chars_ptr; uu_buf : access arm_linux_gnueabihf_bits_stat_h.stat) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:211
   pragma Import (C, stat, "stat");

  -- Get file attributes for the file, device, pipe, or socket
  --   that file descriptor FD is open on and put them in BUF.   

   function fstat (uu_fd : int; uu_buf : access arm_linux_gnueabihf_bits_stat_h.stat) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:216
   pragma Import (C, fstat, "fstat");

   function stat64 (uu_file : Interfaces.C.Strings.chars_ptr; uu_buf : access arm_linux_gnueabihf_bits_stat_h.stat64) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:230
   pragma Import (C, stat64, "stat64");

   function fstat64 (uu_fd : int; uu_buf : access arm_linux_gnueabihf_bits_stat_h.stat64) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:232
   pragma Import (C, fstat64, "fstat64");

  -- Similar to stat, get the attributes for FILE and put them in BUF.
  --   Relative path names are interpreted relative to FD unless FD is
  --   AT_FDCWD.   

   function fstatat
     (uu_fd : int;
      uu_file : Interfaces.C.Strings.chars_ptr;
      uu_buf : access arm_linux_gnueabihf_bits_stat_h.stat;
      uu_flag : int) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:240
   pragma Import (C, fstatat, "fstatat");

   function fstatat64
     (uu_fd : int;
      uu_file : Interfaces.C.Strings.chars_ptr;
      uu_buf : access arm_linux_gnueabihf_bits_stat_h.stat64;
      uu_flag : int) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:255
   pragma Import (C, fstatat64, "fstatat64");

  -- Get file attributes about FILE and put them in BUF.
  --   If FILE is a symbolic link, do not follow it.   

   function lstat (uu_file : Interfaces.C.Strings.chars_ptr; uu_buf : access arm_linux_gnueabihf_bits_stat_h.stat) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:265
   pragma Import (C, lstat, "lstat");

   function lstat64 (uu_file : Interfaces.C.Strings.chars_ptr; uu_buf : access arm_linux_gnueabihf_bits_stat_h.stat64) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:278
   pragma Import (C, lstat64, "lstat64");

  -- Set file access permissions for FILE to MODE.
  --   If FILE is a symbolic link, this affects its target instead.   

   function chmod (uu_file : Interfaces.C.Strings.chars_ptr; uu_mode : arm_linux_gnueabihf_bits_types_h.uu_mode_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:286
   pragma Import (C, chmod, "chmod");

  -- Set file access permissions for FILE to MODE.
  --   If FILE is a symbolic link, this affects the link itself
  --   rather than its target.   

   function lchmod (uu_file : Interfaces.C.Strings.chars_ptr; uu_mode : arm_linux_gnueabihf_bits_types_h.uu_mode_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:293
   pragma Import (C, lchmod, "lchmod");

  -- Set file access permissions of the file FD is open on to MODE.   
   function fchmod (uu_fd : int; uu_mode : arm_linux_gnueabihf_bits_types_h.uu_mode_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:299
   pragma Import (C, fchmod, "fchmod");

  -- Set file access permissions of FILE relative to
  --   the directory FD is open on.   

   function fchmodat
     (uu_fd : int;
      uu_file : Interfaces.C.Strings.chars_ptr;
      uu_mode : arm_linux_gnueabihf_bits_types_h.uu_mode_t;
      uu_flag : int) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:305
   pragma Import (C, fchmodat, "fchmodat");

  -- Set the file creation mask of the current process to MASK,
  --   and return the old creation mask.   

   function umask (uu_mask : arm_linux_gnueabihf_bits_types_h.uu_mode_t) return arm_linux_gnueabihf_bits_types_h.uu_mode_t;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:314
   pragma Import (C, umask, "umask");

  -- Get the current `umask' value without changing it.
  --   This function is only available under the GNU Hurd.   

   function getumask return arm_linux_gnueabihf_bits_types_h.uu_mode_t;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:319
   pragma Import (C, getumask, "getumask");

  -- Create a new directory named PATH, with permission bits MODE.   
   function mkdir (uu_path : Interfaces.C.Strings.chars_ptr; uu_mode : arm_linux_gnueabihf_bits_types_h.uu_mode_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:323
   pragma Import (C, mkdir, "mkdir");

  -- Like mkdir, create a new directory with permission bits MODE.  But
  --   interpret relative PATH names relative to the directory associated
  --   with FD.   

   function mkdirat
     (uu_fd : int;
      uu_path : Interfaces.C.Strings.chars_ptr;
      uu_mode : arm_linux_gnueabihf_bits_types_h.uu_mode_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:330
   pragma Import (C, mkdirat, "mkdirat");

  -- Create a device file named PATH, with permission and special bits MODE
  --   and device number DEV (which can be constructed from major and minor
  --   device numbers with the `makedev' macro above).   

   function mknod
     (uu_path : Interfaces.C.Strings.chars_ptr;
      uu_mode : arm_linux_gnueabihf_bits_types_h.uu_mode_t;
      uu_dev : arm_linux_gnueabihf_bits_types_h.uu_dev_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:338
   pragma Import (C, mknod, "mknod");

  -- Like mknod, create a new device file with permission bits MODE and
  --   device number DEV.  But interpret relative PATH names relative to
  --   the directory associated with FD.   

   function mknodat
     (uu_fd : int;
      uu_path : Interfaces.C.Strings.chars_ptr;
      uu_mode : arm_linux_gnueabihf_bits_types_h.uu_mode_t;
      uu_dev : arm_linux_gnueabihf_bits_types_h.uu_dev_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:345
   pragma Import (C, mknodat, "mknodat");

  -- Create a new FIFO named PATH, with permission bits MODE.   
   function mkfifo (uu_path : Interfaces.C.Strings.chars_ptr; uu_mode : arm_linux_gnueabihf_bits_types_h.uu_mode_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:352
   pragma Import (C, mkfifo, "mkfifo");

  -- Like mkfifo, create a new FIFO with permission bits MODE.  But
  --   interpret relative PATH names relative to the directory associated
  --   with FD.   

   function mkfifoat
     (uu_fd : int;
      uu_path : Interfaces.C.Strings.chars_ptr;
      uu_mode : arm_linux_gnueabihf_bits_types_h.uu_mode_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:359
   pragma Import (C, mkfifoat, "mkfifoat");

  -- Set file access and modification times relative to directory file
  --   descriptor.   

   function utimensat
     (uu_fd : int;
      uu_path : Interfaces.C.Strings.chars_ptr;
      uu_times : access constant time_h.timespec;
      uu_flags : int) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:366
   pragma Import (C, utimensat, "utimensat");

  -- Set file access and modification times of the file associated with FD.   
   function futimens (uu_fd : int; uu_times : access constant time_h.timespec) return int;  -- /usr/include/arm-linux-gnueabihf/sys/stat.h:374
   pragma Import (C, futimens, "futimens");

  -- To allow the `struct stat' structure and the file type `mode_t'
  --   bits to vary without changing shared library major version number,
  --   the `stat' family of functions and `mknod' are in fact inline
  --   wrappers around calls to `xstat', `fxstat', `lxstat', and `xmknod',
  --   which all take a leading version-number argument designating the
  --   data structure and bits used.  <bits/stat.h> defines _STAT_VER with
  --   the version number corresponding to `struct stat' as defined in
  --   that file; and _MKNOD_VER with the version number corresponding to
  --   the S_IF* macros defined therein.  It is arranged that when not
  --   inlined these function are always statically linked; that way a
  --   dynamically-linked executable always encodes the version number
  --   corresponding to the data structures it uses, so the `x' functions
  --   in the shared library can adapt without needing to recompile all
  --   callers.   

  -- Wrappers for stat and mknod system calls.   
  -- Inlined versions of the real stat and mknod functions.   
end arm_linux_gnueabihf_sys_stat_h;
