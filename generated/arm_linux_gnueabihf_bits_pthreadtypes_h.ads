with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with System;

package arm_linux_gnueabihf_bits_pthreadtypes_h is

  -- Copyright (C) 2002, 2003, 2004, 2005, 2006 Free Software Foundation, Inc.
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

  -- Thread identifiers.  The structure of the attribute type is not
  --   exposed on purpose.   

   subtype pthread_t is unsigned_long;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:38

   subtype pthread_attr_t_uu_size_array is Interfaces.C.char_array (0 .. 35);
   type pthread_attr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_attr_t_uu_size_array;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:43
         when others =>
            uu_align : aliased long;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:44
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_attr_t);
   pragma Unchecked_Union (pthread_attr_t);  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:45

   --  skipped anonymous struct anon_3

   type uu_pthread_internal_slist is record
      uu_next : access uu_pthread_internal_slist;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:50
   end record;
   pragma Convention (C_Pass_By_Copy, uu_pthread_internal_slist);  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:48

   subtype uu_pthread_slist_t is uu_pthread_internal_slist;

  -- Data structures for mutex handling.  The structure of the attribute
  --   type is not exposed on purpose.   

  -- KIND must stay at this position in the structure to maintain
  --       binary compatibility.   

   subtype pthread_mutex_t_uu_size_array is Interfaces.C.char_array (0 .. 23);
   type pthread_mutex_t;
   type anon_5 (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_spins : aliased int;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:69
         when others =>
            uu_list : aliased uu_pthread_slist_t;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:70
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, anon_5);
   pragma Unchecked_Union (anon_5);
   type uu_pthread_mutex_s is record
      uu_lock : aliased int;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:60
      uu_count : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:61
      uu_owner : aliased int;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:62
      uu_kind : aliased int;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:65
      uu_nusers : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:66
      field_6 : anon_5;
   end record;
   pragma Convention (C_Pass_By_Copy, uu_pthread_mutex_s);
   type pthread_mutex_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_data : aliased uu_pthread_mutex_s;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:72
         when 1 =>
            uu_size : aliased pthread_mutex_t_uu_size_array;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:73
         when others =>
            uu_align : aliased long;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:74
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_mutex_t);
   pragma Unchecked_Union (pthread_mutex_t);  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:75

   --  skipped anonymous struct anon_4

   subtype pthread_mutexattr_t_uu_size_array is Interfaces.C.char_array (0 .. 3);
   type pthread_mutexattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_mutexattr_t_uu_size_array;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:79
         when others =>
            uu_align : aliased long;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:80
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_mutexattr_t);
   pragma Unchecked_Union (pthread_mutexattr_t);  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:81

   --  skipped anonymous struct anon_6

  -- Data structure for conditional variable handling.  The structure of
  --   the attribute type is not exposed on purpose.   

   subtype pthread_cond_t_uu_size_array is Interfaces.C.char_array (0 .. 47);
   type pthread_cond_t;
   type anon_8 is record
      uu_lock : aliased int;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:90
      uu_futex : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:91
      uu_total_seq : aliased Extensions.unsigned_long_long;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:92
      uu_wakeup_seq : aliased Extensions.unsigned_long_long;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:93
      uu_woken_seq : aliased Extensions.unsigned_long_long;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:94
      uu_mutex : System.Address;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:95
      uu_nwaiters : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:96
      uu_broadcast_seq : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:97
   end record;
   pragma Convention (C_Pass_By_Copy, anon_8);
   type pthread_cond_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_data : aliased anon_8;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:98
         when 1 =>
            uu_size : aliased pthread_cond_t_uu_size_array;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:99
         when others =>
            uu_align : aliased Long_Long_Integer;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:100
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_cond_t);
   pragma Unchecked_Union (pthread_cond_t);  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:101

   --  skipped anonymous struct anon_7

   subtype pthread_condattr_t_uu_size_array is Interfaces.C.char_array (0 .. 3);
   type pthread_condattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_condattr_t_uu_size_array;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:105
         when others =>
            uu_align : aliased long;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:106
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_condattr_t);
   pragma Unchecked_Union (pthread_condattr_t);  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:107

   --  skipped anonymous struct anon_9

  -- Keys for thread-specific data  
   subtype pthread_key_t is unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:111

  -- Once-only execution  
   subtype pthread_once_t is int;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:115

  -- Data structure for read-write lock variable handling.  The
  --   structure of the attribute type is not exposed on purpose.   

  -- FLAGS must stay at this position in the structure to maintain
  --       binary compatibility.   

  -- FLAGS must stay at this position in the structure to maintain
  --       binary compatibility.   

   subtype pthread_rwlock_t_uu_size_array is Interfaces.C.char_array (0 .. 31);
   type pthread_rwlock_t;
   type anon_11 is record
      uu_lock : aliased int;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:125
      uu_nr_readers : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:126
      uu_readers_wakeup : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:127
      uu_writer_wakeup : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:128
      uu_nr_readers_queued : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:129
      uu_nr_writers_queued : aliased unsigned;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:130
      uu_flags : aliased unsigned_char;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:141
      uu_shared : aliased unsigned_char;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:142
      uu_pad1 : aliased unsigned_char;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:143
      uu_pad2 : aliased unsigned_char;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:144
      uu_writer : aliased int;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:146
   end record;
   pragma Convention (C_Pass_By_Copy, anon_11);
   type pthread_rwlock_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_data : aliased anon_11;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:147
         when 1 =>
            uu_size : aliased pthread_rwlock_t_uu_size_array;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:148
         when others =>
            uu_align : aliased long;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:149
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_rwlock_t);
   pragma Unchecked_Union (pthread_rwlock_t);  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:150

   --  skipped anonymous struct anon_10

   subtype pthread_rwlockattr_t_uu_size_array is Interfaces.C.char_array (0 .. 7);
   type pthread_rwlockattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_rwlockattr_t_uu_size_array;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:154
         when others =>
            uu_align : aliased long;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:155
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_rwlockattr_t);
   pragma Unchecked_Union (pthread_rwlockattr_t);  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:156

   --  skipped anonymous struct anon_12

  -- POSIX spinlock data type.   
   subtype pthread_spinlock_t is int;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:162

  -- POSIX barriers data type.  The structure of the type is
  --   deliberately not exposed.   

   subtype pthread_barrier_t_uu_size_array is Interfaces.C.char_array (0 .. 19);
   type pthread_barrier_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_barrier_t_uu_size_array;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:169
         when others =>
            uu_align : aliased long;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:170
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_barrier_t);
   pragma Unchecked_Union (pthread_barrier_t);  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:171

   --  skipped anonymous struct anon_13

   subtype pthread_barrierattr_t_uu_size_array is Interfaces.C.char_array (0 .. 3);
   type pthread_barrierattr_t (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            uu_size : aliased pthread_barrierattr_t_uu_size_array;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:175
         when others =>
            uu_align : aliased int;  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:176
      end case;
   end record;
   pragma Convention (C_Pass_By_Copy, pthread_barrierattr_t);
   pragma Unchecked_Union (pthread_barrierattr_t);  -- /usr/include/arm-linux-gnueabihf/bits/pthreadtypes.h:177

   --  skipped anonymous struct anon_14

end arm_linux_gnueabihf_bits_pthreadtypes_h;
