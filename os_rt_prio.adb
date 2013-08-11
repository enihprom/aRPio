with ada.real_time; use ada.real_time;
with ada.exceptions;
with ada.text_io; use ada;
with system;
with interfaces.c;

package body os_rt_prio is


	procedure gain_priority(prio : in priority_type) is
		priority : interfaces.c.int;
	begin	
		
		priority := interfaces.c.int (prio);

	   if priority /= 0 then
	      if mlockall (MCL_CURRENT_AND_FUTURE) /= 0 then
	         raise program_error
					with "attempt to lock memory failed (need to run as root)";
	      end if;
	   end if;

		if priority /= 0 then
			param.sched_priority := priority;
			if sched_setscheduler(0, sched_fifo, param'access) /= 0 then
				raise program_error
					with "attempt to set priority failed (need to run as root)";
			end if;
		end if;

	exception
		when ex : others =>
			io.put_line("--- error ---");
			io.put_line(exception_information(ex));

	end gain_priority;


end os_rt_prio;


