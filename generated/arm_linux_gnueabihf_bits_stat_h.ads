with Interfaces.C; use Interfaces.C;
with arm_linux_gnueabihf_bits_types_h;
with time_h;

package arm_linux_gnueabihf_bits_stat_h is

   --  unsupported macro: st_atime st_atim.tv_sec
   --  unsupported macro: st_mtime st_mtim.tv_sec
   --  unsupported macro: st_ctime st_ctim.tv_sec
   --  unsupported macro: UTIME_NOW ((1l << 30) - 1l)
   --  unsupported macro: UTIME_OMIT ((1l << 30) - 2l)
  -- Copyright (C) 1992, 1995-2002, 2009, 2010 Free Software Foundation, Inc.
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

  -- Versions of the `struct stat' data structure.   
  -- Versions of the `xmknod' interface.   
  -- Device.   
   type stat is record
      st_dev : aliased arm_linux_gnueabihf_bits_types_h.uu_dev_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:41
      uu_pad1 : aliased unsigned_short;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:42
      st_ino : aliased arm_linux_gnueabihf_bits_types_h.uu_ino_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:44
      st_mode : aliased arm_linux_gnueabihf_bits_types_h.uu_mode_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:48
      st_nlink : aliased arm_linux_gnueabihf_bits_types_h.uu_nlink_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:49
      st_uid : aliased arm_linux_gnueabihf_bits_types_h.uu_uid_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:50
      st_gid : aliased arm_linux_gnueabihf_bits_types_h.uu_gid_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:51
      st_rdev : aliased arm_linux_gnueabihf_bits_types_h.uu_dev_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:52
      uu_pad2 : aliased unsigned_short;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:53
      st_size : aliased arm_linux_gnueabihf_bits_types_h.uu_off_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:55
      st_blksize : aliased arm_linux_gnueabihf_bits_types_h.uu_blksize_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:59
      st_blocks : aliased arm_linux_gnueabihf_bits_types_h.uu_blkcnt_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:62
      st_atim : aliased time_h.timespec;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:73
      st_mtim : aliased time_h.timespec;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:74
      st_ctim : aliased time_h.timespec;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:75
      uu_unused4 : aliased unsigned_long;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:88
      uu_unused5 : aliased unsigned_long;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:89
   end record;
   pragma Convention (C_Pass_By_Copy, stat);  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:39

  -- File serial number.	 
  -- 32bit file serial number.	 
  -- File mode.   
  -- Link count.   
  -- User ID of the file's owner.	 
  -- Group ID of the file's group. 
  -- Device number, if device.   
  -- Size of file, in bytes.   
  -- Size of file, in bytes.   
  -- Optimal block size for I/O.   
  -- Number 512-byte blocks allocated.  
  -- Number 512-byte blocks allocated.  
  -- Nanosecond resolution timestamps are stored in a format
  --       equivalent to 'struct timespec'.  This is the type used
  --       whenever possible but the Unix namespace rules do not allow the
  --       identifier 'timespec' to appear in the <sys/stat.h> header.
  --       Therefore we have to handle the use of this header in strictly
  --       standard-compliant sources special.   

  -- Time of last access.   
  -- Time of last modification.   
  -- Time of last status change.   
  -- Time of last access.   
  -- Nscecs of last access.   
  -- Time of last modification.   
  -- Nsecs of last modification.   
  -- Time of last status change.   
  -- Nsecs of last status change.   
  -- File serial number.	 
  -- Device.   
   type stat64 is record
      st_dev : aliased arm_linux_gnueabihf_bits_types_h.uu_dev_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:98
      uu_pad1 : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:99
      uu_st_ino : aliased arm_linux_gnueabihf_bits_types_h.uu_ino_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:101
      st_mode : aliased arm_linux_gnueabihf_bits_types_h.uu_mode_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:102
      st_nlink : aliased arm_linux_gnueabihf_bits_types_h.uu_nlink_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:103
      st_uid : aliased arm_linux_gnueabihf_bits_types_h.uu_uid_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:104
      st_gid : aliased arm_linux_gnueabihf_bits_types_h.uu_gid_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:105
      st_rdev : aliased arm_linux_gnueabihf_bits_types_h.uu_dev_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:106
      uu_pad2 : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:107
      st_size : aliased arm_linux_gnueabihf_bits_types_h.uu_off64_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:108
      st_blksize : aliased arm_linux_gnueabihf_bits_types_h.uu_blksize_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:109
      st_blocks : aliased arm_linux_gnueabihf_bits_types_h.uu_blkcnt64_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:111
      st_atim : aliased time_h.timespec;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:119
      st_mtim : aliased time_h.timespec;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:120
      st_ctim : aliased time_h.timespec;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:121
      st_ino : aliased arm_linux_gnueabihf_bits_types_h.uu_ino64_t;  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:130
   end record;
   pragma Convention (C_Pass_By_Copy, stat64);  -- /usr/include/arm-linux-gnueabihf/bits/stat.h:96

  -- 32bit file serial number.	 
  -- File mode.   
  -- Link count.   
  -- User ID of the file's owner.	 
  -- Group ID of the file's group. 
  -- Device number, if device.   
  -- Size of file, in bytes.   
  -- Optimal block size for I/O.   
  -- Number 512-byte blocks allocated.  
  -- Nanosecond resolution timestamps are stored in a format
  --       equivalent to 'struct timespec'.  This is the type used
  --       whenever possible but the Unix namespace rules do not allow the
  --       identifier 'timespec' to appear in the <sys/stat.h> header.
  --       Therefore we have to handle the use of this header in strictly
  --       standard-compliant sources special.   

  -- Time of last access.   
  -- Time of last modification.   
  -- Time of last status change.   
  -- Time of last access.   
  -- Nscecs of last access.   
  -- Time of last modification.   
  -- Nsecs of last modification.   
  -- Time of last status change.   
  -- Nsecs of last status change.   
  -- File serial number.		 
  -- Tell code we have these members.   
  -- Nanosecond resolution time values are supported.   
  -- Encoding of the file mode.   
  -- File types.   
  -- POSIX.1b objects.  Note that these macros always evaluate to zero.  But
  --   they do it by enforcing the correct use of the macros.   

  -- Protection bits.   
end arm_linux_gnueabihf_bits_stat_h;
