with interfaces; use interfaces;
with ada.text_io; use ada.text_io;
with system.machine_code; use system.machine_code;
with model_specific; use model_specific;

-- implementation utilizing sysfs. simple and not so slowly w/ async_io

package body gpio is

	sys_class_gpio : constant string :=	"/sys/class/gpio";


	task dev_io_task; 
	-- is
	-- 	entry stand_on; -- pause io for t
	-- end task;


	task body dev_io_task is 
	begin
		loop
			
		end loop;
	end;

	procedure init is
	begin
		
	end init;
	pragma inline(init);

	procedure set(pi :   in pin_index; state : in boolean := true) is
	begin
		null; -- todo
	end set;
	pragma inline(set);

	--procedure gset(pi :   in pin_index; state : in boolean := true) is
	--begin
	--	set(pi,state);
	--end gset;
	--pragma inline(gset);

	procedure unset(pi : in pin_index) is
	begin
		set(pi, false);
	end unset;
	pragma inline(unset);

	function get(pi : in pin_index) return boolean is
		not_impl : exception;
	begin
		raise not_impl;
		return false;
	end get;
	
end gpio;




-- notes




-- #!/bin/sh
-- 
-- # GPIO numbers should be from this list
-- # 0, 1, 4, 7, 8, 9, 10, 11, 14, 15, 17, 18, 21, 22, 23, 24, 25
-- 
-- # Note that the GPIO numbers that you program here refer to the pins
-- # of the BCM2835 and *not* the numbers on the pin header. 
-- # So, if you want to activate GPIO7 on the header you should be 
-- # using GPIO4 in this script. Likewise if you want to activate GPIO0
-- # on the header you should be using GPIO17 here.
-- 
-- # Set up GPIO 4 and set to output
-- echo "4" > /sys/class/gpio/export
-- echo "out" > /sys/class/gpio/gpio4/direction
-- 
-- # Set up GPIO 7 and set to input
-- echo "7" > /sys/class/gpio/export
-- echo "in" > /sys/class/gpio/gpio7/direction
-- 
-- # Write output
-- echo "1" > /sys/class/gpio/gpio4/value
-- 
-- # Read from input
-- cat /sys/class/gpio/gpio7/value 
-- 
-- # Clean up
-- echo "4" > /sys/class/gpio/unexport
-- echo "7" > /sys/class/gpio/unexport
-- 
-- 
