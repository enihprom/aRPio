with ada.text_io; use ada.text_io;
with ada.real_time; use ada.real_time;
with os_rt_prio;
with rpiservo; 

----------------------------------------------------------------------
procedure test_rpiservo is
----------------------------------------------------------------------

	type av_functions is (
		aileron_l, aileron_r,
		elevator, rudder,
		nose_gear, main_gear,
		engine_gas,
		flaps, slats
	);

	for av_functions use (
		aileron_l  =>  1, 
		aileron_r  =>  2,
		elevator   =>  3, 
		rudder     =>  4,
		nose_gear  =>  5, 
		main_gear  =>  6,
		engine_gas =>  7,
		flaps      =>  8,
		slats      =>  9
	);
	
	type su_functions is (
		nose_cam,
		belly_cam,
		delivery_hatch
	);
	
	for su_functions use (
		nose_cam      =>  1,
		belly_cam     =>  2,
		delivery_hatch => 3
	);

	type slim_av is (
		ails_bank, 
		elev_level,
		prop_rudder,
		plumb_trim
	);
	
	--package supports is new rpiservo(
	--	su_functions
	--	--,ts_min => 0.5, 
	--	--ts_range => 1.0
	--	);
	
	package avionics is new rpiservo(
		slim_av
		--,ts_min => 0.6, 
		--ts_range => 0.4
		);

	function ms(n : natural) return duration is
	begin
		return to_duration(milliseconds(n));
	end ms;

----------------------------------------------------------------------
begin
----------------------------------------------------------------------

	os_rt_prio.gain_priority(94);

	put_line("running test");
	
	-------------------------------------------------------------------

	declare
		use avionics;
	begin
		for i in av_functions'range loop
			steer(av_functions'pos(i), -26.7);
			delay ms(50);
			steer(av_functions'pos(i), 26.75);
			delay ms(50);
		end loop;
		full_range_test_all;
		center_all;
	end;

	-------------------------------------------------------------------
	
	--declare
	--	use supports;
	--begin
	--	for i in su_functions'range loop
	--		steer(su_functions'pos(i), -38.0);
	--		delay ms(50);
	--		steer(su_functions'pos(i), 38.0);
	--		delay ms(50);
	--	end loop;
	--	full_range_test_all;
	--	center_all;
	--end;

----------------------------------------------------------------------
end test_rpiservo;
----------------------------------------------------------------------


