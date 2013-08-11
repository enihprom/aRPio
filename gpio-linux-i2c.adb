with interfaces; use interfaces;
with ada.text_io; use ada.text_io;
with system.machine_code; use system.machine_code;
with model_specific; use model_specific;

-- todo speak w/ the i2c kernel driver via /dev/i2c
package body gpio is


	procedure set(pi :   in pin_index; state : in boolean := true) is
	begin
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
