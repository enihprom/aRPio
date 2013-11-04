with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_types_h;
with System;
with stddef_h;
with Interfaces.C.Strings;

package arm_linux_gnueabihf_sys_mman_h is

   --  unsupported macro: MAP_FAILED ((void *) -1)
  -- Definitions for BSD-style memory management.
  --   Copyright (C) 1994-2000, 2003, 2004, 2005 Free Software Foundation, Inc.
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

   subtype off_t is arm_linux_gnueabihf_bits_types_h.uu_off_t;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:30

   subtype mode_t is arm_linux_gnueabihf_bits_types_h.uu_mode_t;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:38

  -- Return value of `mmap' in case of an error.   
  -- Map addresses starting near ADDR and extending for LEN bytes.  from
  --   OFFSET into the file FD describes according to PROT and FLAGS.  If ADDR
  --   is nonzero, it is the desired mapping address.  If the MAP_FIXED bit is
  --   set in FLAGS, the mapping will be at ADDR exactly (which must be
  --   page-aligned); otherwise the system chooses a convenient nearby address.
  --   The return value is the actual mapping address chosen or MAP_FAILED
  --   for errors (in which case `errno' is set).  A successful `mmap' call
  --   deallocates any previous mapping for the affected region.   

   function mmap
     (uu_addr : System.Address;
      uu_len : stddef_h.size_t;
      uu_prot : int;
      uu_flags : int;
      uu_fd : int;
      uu_offset : arm_linux_gnueabihf_bits_types_h.uu_off_t) return System.Address;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:58
   pragma Import (C, mmap, "mmap");

   function mmap64
     (uu_addr : System.Address;
      uu_len : stddef_h.size_t;
      uu_prot : int;
      uu_flags : int;
      uu_fd : int;
      uu_offset : arm_linux_gnueabihf_bits_types_h.uu_off64_t) return System.Address;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:71
   pragma Import (C, mmap64, "mmap64");

  -- Deallocate any mapping for the region starting at ADDR and extending LEN
  --   bytes.  Returns 0 if successful, -1 for errors (and sets errno).   

   function munmap (uu_addr : System.Address; uu_len : stddef_h.size_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:77
   pragma Import (C, munmap, "munmap");

  -- Change the memory protection of the region starting at ADDR and
  --   extending LEN bytes to PROT.  Returns 0 if successful, -1 for errors
  --   (and sets errno).   

   function mprotect
     (uu_addr : System.Address;
      uu_len : stddef_h.size_t;
      uu_prot : int) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:82
   pragma Import (C, mprotect, "mprotect");

  -- Synchronize the region starting at ADDR and extending LEN bytes with the
  --   file it maps.  Filesystem operations on a file being mapped are
  --   unpredictable before this is done.  Flags are from the MS_* set.
  --   This function is a cancellation point and therefore not marked with
  --   __THROW.   

   function msync
     (uu_addr : System.Address;
      uu_len : stddef_h.size_t;
      uu_flags : int) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:90
   pragma Import (C, msync, "msync");

  -- Advise the system about particular usage patterns the program follows
  --   for the region starting at ADDR and extending LEN bytes.   

   function madvise
     (uu_addr : System.Address;
      uu_len : stddef_h.size_t;
      uu_advice : int) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:95
   pragma Import (C, madvise, "madvise");

  -- This is the POSIX name for this function.   
   function posix_madvise
     (uu_addr : System.Address;
      uu_len : stddef_h.size_t;
      uu_advice : int) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:99
   pragma Import (C, posix_madvise, "posix_madvise");

  -- Guarantee all whole pages mapped by the range [ADDR,ADDR+LEN) to
  --   be memory resident.   

   function mlock (uu_addr : System.Address; uu_len : stddef_h.size_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:104
   pragma Import (C, mlock, "mlock");

  -- Unlock whole pages previously mapped by the range [ADDR,ADDR+LEN).   
   function munlock (uu_addr : System.Address; uu_len : stddef_h.size_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:107
   pragma Import (C, munlock, "munlock");

  -- Cause all currently mapped pages of the process to be memory resident
  --   until unlocked by a call to the `munlockall', until the process exits,
  --   or until the process calls `execve'.   

   function mlockall (uu_flags : int) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:112
   pragma Import (C, mlockall, "mlockall");

  -- All currently mapped pages of the process' address space become
  --   unlocked.   

   function munlockall return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:116
   pragma Import (C, munlockall, "munlockall");

  -- mincore returns the memory residency status of the pages in the
  --   current process's address space specified by [start, start + len).
  --   The status is returned in a vector of bytes.  The least significant
  --   bit of each byte is 1 if the referenced page is in memory, otherwise
  --   it is zero.   

   function mincore
     (uu_start : System.Address;
      uu_len : stddef_h.size_t;
      uu_vec : access unsigned_char) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:124
   pragma Import (C, mincore, "mincore");

  -- Remap pages mapped by the range [ADDR,ADDR+OLD_LEN) to new length
  --   NEW_LEN.  If MREMAP_MAYMOVE is set in FLAGS the returned address
  --   may differ from ADDR.  If MREMAP_FIXED is set in FLAGS the function
  --   takes another paramter which is a fixed address at which the block
  --   resides after a successful call.   

   function mremap
     (uu_addr : System.Address;
      uu_old_len : stddef_h.size_t;
      uu_new_len : stddef_h.size_t;
      uu_flags : int  -- , ...
      ) return System.Address;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:134
   pragma Import (C, mremap, "mremap");

  -- Remap arbitrary pages of a shared backing store within an existing
  --   VMA.   

   function remap_file_pages
     (uu_start : System.Address;
      uu_size : stddef_h.size_t;
      uu_prot : int;
      uu_pgoff : stddef_h.size_t;
      uu_flags : int) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:139
   pragma Import (C, remap_file_pages, "remap_file_pages");

  -- Open shared memory segment.   
   function shm_open
     (uu_name : Interfaces.C.Strings.chars_ptr;
      uu_oflag : int;
      uu_mode : mode_t) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:145
   pragma Import (C, shm_open, "shm_open");

  -- Remove shared memory segment.   
   function shm_unlink (uu_name : Interfaces.C.Strings.chars_ptr) return int;  -- /usr/include/arm-linux-gnueabihf/sys/mman.h:148
   pragma Import (C, shm_unlink, "shm_unlink");

end arm_linux_gnueabihf_sys_mman_h;
