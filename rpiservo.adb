with ada.real_time; use ada.real_time;
with ada.text_io; use ada.text_io;
with ada.float_text_io; use ada.float_text_io;
with gpio;

package body rpiservo is

	task body servo_task is

		cycles : array (chan_id_type) of time;

	
	begin

		loop
			for i in chan_id_type'range loop
				gpio.set(i);
				delay time_1(i);
				gpio.clr(i);
			end loop;
			delay time_0;
		end loop;

		-- todo
		--
		-- hiprec-symmetry/antisymmetry between channels (constraint-bridges)
		-- runtime rescaling
		-- calibration mode
		-- and before all: using the above as fallback only =>
		-- 	set PWM pins or communicate w/ I?C

	end servo_task;

	

	procedure full_range_test_all
	is
	begin
		put_line("this array will full range test all" 
			& n_servos'img & " servos");
	end full_range_test_all;

	procedure center_all
	is
	begin
		put_line("this array will center all" 
			& n_servos'img & " servos");
		for i in chan_id_type'range loop
			time_1(i) := time_half;
		end loop;
	end center_all;

	procedure set_t1(
		servo_id  : chan_id_type;
		new_ts    : pulselen_type)
	is
	begin
		put_line("new_ts of " & servo_id'img & " = " & new_ts'img);
		time_1(servo_id) := new_ts;		
	end set_t1;

	procedure steer(
		servo_id    : in chan_id_type;
		new_degrees : in degrees_type) is
		d_range    : float := 
			degrees_type'last - degrees_type'first;
		t_range    : float := 
			float(pulselen_type'last - pulselen_type'first);
		d_ts_ratio : float := d_range/t_range;
	begin
		put_line("degrees_new(" & servo_id'img & ") =" & d_range'img);
		set_t1(servo_id, pulselen_type(new_degrees/d_ts_ratio));
	end steer;

end rpiservo;



		--measure-stuff
		--
		--procedure set_pin(si : in chan_id_type) is
		--begin
		--	cycles(si) := clock;
		--end set_pin;
		--pragma inline(set_pin);

		--procedure unset_pin(si : in chan_id_type) is
		--	t : duration := to_duration(clock-cycles(si));
		--begin
		--	put_line(si'img & " pulselen= " & t'img);
		--end unset_pin;
		--pragma inline(unset_pin);

			--time_0 := clocking;
			--for i in chan_id_type'range loop
			--	time_0 := time_0-time_1(i);
			--	set_pin(i);
			--	delay time_1(i);
			--	unset_pin(i);
			--end loop;
