with ada.real_time; use ada.real_time;
with ada.exceptions;
with ada.text_io; use ada;
with system;
with interfaces.c;

package os_rt_prio is

	package io renames text_io;
	use exceptions;

	type priority_type is range 0 .. 99;
   	
	SCHED_FIFO  : constant := 1;
	MCL_CURRENT_AND_FUTURE : constant := 3;

	type pid_t is new Interfaces.C.int;
   use type interfaces.c.int;

	type struct_sched_param is record
      sched_priority : interfaces.c.int;
   end record;
   pragma convention (c, struct_sched_param);
   param : aliased struct_sched_param;

   function sched_setscheduler
     (process : pid_t;
      policy : interfaces.c.int;
      param  : access struct_sched_param) return interfaces.c.int;
   pragma import (c, sched_setscheduler, "sched_setscheduler");

	function mlockall
		(flags : interfaces.c.int) return interfaces.c.int;
	pragma import (c, mlockall, "mlockall");


	procedure gain_priority(prio : in priority_type);


end os_rt_prio;
