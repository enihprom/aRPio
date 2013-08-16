with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_types_h;
with stddef_h;
with arm_linux_gnueabihf_sys_types_h;
limited with arm_linux_gnueabihf_bits_uio_h;

package arm_linux_gnueabihf_bits_fcntl_h is

   --  unsupported macro: O_ACCMODE 0003
   --  unsupported macro: O_RDONLY 00
   --  unsupported macro: O_WRONLY 01
   --  unsupported macro: O_RDWR 02
   --  unsupported macro: O_CREAT 0100
   --  unsupported macro: O_EXCL 0200
   --  unsupported macro: O_NOCTTY 0400
   --  unsupported macro: O_TRUNC 01000
   --  unsupported macro: O_APPEND 02000
   --  unsupported macro: O_NONBLOCK 04000
   --  unsupported macro: O_NDELAY O_NONBLOCK
   --  unsupported macro: O_SYNC 04010000
   --  unsupported macro: O_FSYNC O_SYNC
   --  unsupported macro: O_ASYNC 020000
   --  unsupported macro: O_DIRECTORY 040000
   --  unsupported macro: O_NOFOLLOW 0100000
   --  unsupported macro: O_CLOEXEC 02000000
   --  unsupported macro: O_DIRECT 0200000
   --  unsupported macro: O_NOATIME 01000000
   --  unsupported macro: O_DSYNC 010000
   --  unsupported macro: O_RSYNC O_SYNC
   --  unsupported macro: O_LARGEFILE 0400000
   --  unsupported macro: F_DUPFD 0
   --  unsupported macro: F_GETFD 1
   --  unsupported macro: F_SETFD 2
   --  unsupported macro: F_GETFL 3
   --  unsupported macro: F_SETFL 4
   --  unsupported macro: F_GETLK 5
   --  unsupported macro: F_SETLK 6
   --  unsupported macro: F_SETLKW 7
   --  unsupported macro: F_GETLK64 12
   --  unsupported macro: F_SETLK64 13
   --  unsupported macro: F_SETLKW64 14
   --  unsupported macro: F_SETOWN 8
   --  unsupported macro: F_GETOWN 9
   --  unsupported macro: F_SETSIG 10
   --  unsupported macro: F_GETSIG 11
   --  unsupported macro: F_SETOWN_EX 15
   --  unsupported macro: F_GETOWN_EX 16
   --  unsupported macro: F_SETLEASE 1024
   --  unsupported macro: F_GETLEASE 1025
   --  unsupported macro: F_NOTIFY 1026
   --  unsupported macro: F_SETPIPE_SZ 1031
   --  unsupported macro: F_GETPIPE_SZ 1032
   --  unsupported macro: F_DUPFD_CLOEXEC 1030
   --  unsupported macro: FD_CLOEXEC 1
   --  unsupported macro: F_RDLCK 0
   --  unsupported macro: F_WRLCK 1
   --  unsupported macro: F_UNLCK 2
   --  unsupported macro: F_EXLCK 4
   --  unsupported macro: F_SHLCK 8
   --  unsupported macro: LOCK_SH 1
   --  unsupported macro: LOCK_EX 2
   --  unsupported macro: LOCK_NB 4
   --  unsupported macro: LOCK_UN 8
   --  unsupported macro: LOCK_MAND 32
   --  unsupported macro: LOCK_READ 64
   --  unsupported macro: LOCK_WRITE 128
   --  unsupported macro: LOCK_RW 192
   --  unsupported macro: DN_ACCESS 0x00000001
   --  unsupported macro: DN_MODIFY 0x00000002
   --  unsupported macro: DN_CREATE 0x00000004
   --  unsupported macro: DN_DELETE 0x00000008
   --  unsupported macro: DN_RENAME 0x00000010
   --  unsupported macro: DN_ATTRIB 0x00000020
   --  unsupported macro: DN_MULTISHOT 0x80000000
   --  unsupported macro: FAPPEND O_APPEND
   --  unsupported macro: FFSYNC O_FSYNC
   --  unsupported macro: FASYNC O_ASYNC
   --  unsupported macro: FNONBLOCK O_NONBLOCK
   --  unsupported macro: FNDELAY O_NDELAY
   --  unsupported macro: POSIX_FADV_NORMAL 0
   --  unsupported macro: POSIX_FADV_RANDOM 1
   --  unsupported macro: POSIX_FADV_SEQUENTIAL 2
   --  unsupported macro: POSIX_FADV_WILLNEED 3
   --  unsupported macro: POSIX_FADV_DONTNEED 4
   --  unsupported macro: POSIX_FADV_NOREUSE 5
   --  unsupported macro: SYNC_FILE_RANGE_WAIT_BEFORE 1
   --  unsupported macro: SYNC_FILE_RANGE_WRITE 2
   --  unsupported macro: SYNC_FILE_RANGE_WAIT_AFTER 4
   --  unsupported macro: SPLICE_F_MOVE 1
   --  unsupported macro: SPLICE_F_NONBLOCK 2
   --  unsupported macro: SPLICE_F_MORE 4
   --  unsupported macro: SPLICE_F_GIFT 8
   --  unsupported macro: AT_FDCWD -100
   --  unsupported macro: AT_SYMLINK_NOFOLLOW 0x100
   --  unsupported macro: AT_REMOVEDIR 0x200
   --  unsupported macro: AT_SYMLINK_FOLLOW 0x400
   --  unsupported macro: AT_NO_AUTOMOUNT 0x800
   --  unsupported macro: AT_EACCESS 0x200
  -- O_*, F_*, FD_* bit values for Linux.
  --   Copyright (C) 1995-1998, 2000, 2004, 2006, 2007, 2009, 2010
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

  -- open/fcntl - O_SYNC is only implemented on blocks devices and on files
  --   located on an ext2 file system  

  -- For now Linux has synchronisity options for data and read operations.
  --   We define the symbols here but let them do the same as O_SYNC since
  --   this is a superset.	 

  -- Values for the second argument to `fcntl'.   
  -- For F_[GET|SET]FD.   
  -- For posix fcntl() and `l_type' field of a `struct flock' for lockf().   
  -- For old implementation of bsd flock().   
  -- Operations for bsd flock(), also used by the kernel implementation.	 
  -- Types of directory notifications that may be requested with F_NOTIFY.   
  -- Type of lock: F_RDLCK, F_WRLCK, or F_UNLCK.	 
   type flock is record
      l_type : aliased short;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:154
      l_whence : aliased short;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:155
      l_start : aliased arm_linux_gnueabihf_bits_types_h.uu_off_t;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:157
      l_len : aliased arm_linux_gnueabihf_bits_types_h.uu_off_t;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:158
      l_pid : aliased arm_linux_gnueabihf_bits_types_h.uu_pid_t;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:163
   end record;
   pragma Convention (C_Pass_By_Copy, flock);  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:152

  -- Where `l_start' is relative to (like `lseek').   
  -- Offset where the lock begins.   
  -- Size of the locked area; zero means until EOF.   
  -- Offset where the lock begins.   
  -- Size of the locked area; zero means until EOF.   
  -- Process holding the lock.   
  -- Type of lock: F_RDLCK, F_WRLCK, or F_UNLCK.	 
   type flock64 is record
      l_type : aliased short;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:169
      l_whence : aliased short;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:170
      l_start : aliased arm_linux_gnueabihf_bits_types_h.uu_off64_t;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:171
      l_len : aliased arm_linux_gnueabihf_bits_types_h.uu_off64_t;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:172
      l_pid : aliased arm_linux_gnueabihf_bits_types_h.uu_pid_t;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:173
   end record;
   pragma Convention (C_Pass_By_Copy, flock64);  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:167

  -- Where `l_start' is relative to (like `lseek').   
  -- Offset where the lock begins.   
  -- Size of the locked area; zero means until EOF.   
  -- Process holding the lock.   
  -- Owner types.   
   subtype uu_pid_type is unsigned;
   F_OWNER_TID : constant uu_pid_type := 0;
   F_OWNER_PID : constant uu_pid_type := 1;
   F_OWNER_PGRP : constant uu_pid_type := 2;
   F_OWNER_GID : constant uu_pid_type := 2;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:179

  -- Kernel thread.   
  -- Process.   
  -- Process group.   
  -- Alternative, obsolete name.   
  -- Structure to use with F_GETOWN_EX and F_SETOWN_EX.   
  -- Owner type of ID.   
   type f_owner_ex is record
      c_type : aliased uu_pid_type;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:190
      pid : aliased arm_linux_gnueabihf_bits_types_h.uu_pid_t;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:191
   end record;
   pragma Convention (C_Pass_By_Copy, f_owner_ex);  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:188

  -- ID of owner.   
  -- Define some more compatibility macros to be backward compatible with
  --   BSD systems which did not managed to hide these kernel macros.   

  -- Advise to `posix_fadvise'.   
  -- Flags for SYNC_FILE_RANGE.   
  -- Flags for SPLICE and VMSPLICE.   
  -- Values for `*at' functions.   
  -- Provide kernel hint to read ahead.   
   function readahead
     (uu_fd : int;
      uu_offset : arm_linux_gnueabihf_bits_types_h.uu_off64_t;
      uu_count : stddef_h.size_t) return arm_linux_gnueabihf_sys_types_h.ssize_t;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:257
   pragma Import (C, readahead, "readahead");

  -- Selective file content synch'ing.   
   function sync_file_range
     (uu_fd : int;
      uu_offset : arm_linux_gnueabihf_bits_types_h.uu_off64_t;
      uu_count : arm_linux_gnueabihf_bits_types_h.uu_off64_t;
      uu_flags : unsigned) return int;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:262
   pragma Import (C, sync_file_range, "sync_file_range");

  -- Splice address range into a pipe.   
   function vmsplice
     (uu_fdout : int;
      uu_iov : access constant arm_linux_gnueabihf_bits_uio_h.iovec;
      uu_count : stddef_h.size_t;
      uu_flags : unsigned) return arm_linux_gnueabihf_sys_types_h.ssize_t;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:267
   pragma Import (C, vmsplice, "vmsplice");

  -- Splice two files together.   
   function splice
     (uu_fdin : int;
      uu_offin : access arm_linux_gnueabihf_bits_types_h.uu_off64_t;
      uu_fdout : int;
      uu_offout : access arm_linux_gnueabihf_bits_types_h.uu_off64_t;
      uu_len : stddef_h.size_t;
      uu_flags : unsigned) return arm_linux_gnueabihf_sys_types_h.ssize_t;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:271
   pragma Import (C, splice, "splice");

  -- In-kernel implementation of tee for pipe buffers.   
   function tee
     (uu_fdin : int;
      uu_fdout : int;
      uu_len : stddef_h.size_t;
      uu_flags : unsigned) return arm_linux_gnueabihf_sys_types_h.ssize_t;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:276
   pragma Import (C, tee, "tee");

  -- Reserve storage for the data of the file associated with FD.   
   function fallocate
     (uu_fd : int;
      uu_mode : int;
      uu_offset : arm_linux_gnueabihf_bits_types_h.uu_off_t;
      uu_len : arm_linux_gnueabihf_bits_types_h.uu_off_t) return int;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:281
   pragma Import (C, fallocate, "fallocate");

   function fallocate64
     (uu_fd : int;
      uu_mode : int;
      uu_offset : arm_linux_gnueabihf_bits_types_h.uu_off64_t;
      uu_len : arm_linux_gnueabihf_bits_types_h.uu_off64_t) return int;  -- /usr/include/arm-linux-gnueabihf/bits/fcntl.h:292
   pragma Import (C, fallocate64, "fallocate64");

end arm_linux_gnueabihf_bits_fcntl_h;
