with ada.real_time; 
use  ada.real_time; 

generic

	type steerings is (<>);
	half_range   : float    := 45.0;
	ts_min       : duration := 0.001;        --0.00025
	ts_range     : duration := 0.001;         --0.00150

	n_servos : natural := steerings'pos(steerings'last);

	clocking     : duration := 
		0.020 - to_duration(to_time_span(ts_range)*n_servos);

	
package rpiservo is

	subtype degrees_type is float range -half_range .. half_range;
	subtype pulselen_type is duration range ts_min .. ts_min+ts_range;
	subtype chan_id_type is positive range 1 .. n_servos;
	type timeslice_array is array (chan_id_type) of pulselen_type;

	time_half  : duration := ts_min + (ts_range/2.0);
	time_0     : duration;
	time_1     : timeslice_array := (others => time_half);

	
	task type servo_task;

	procedure steer(
		servo_id    : in chan_id_type;
		new_degrees : in degrees_type);

	procedure center_all;

	procedure full_range_test_all;

	procedure set_t1(
		servo_id    : in chan_id_type;
		new_ts      : in pulselen_type);

	--todo
	--
	--procedure center(id : chan_id_type);
	--procedure steer_discrete_up(servo_id : chan_id_type);
	--procedure steer_discrete_down(servo_id : chan_id_type);
	--procedure steer_relative(servo_id : chan_id_type; d : in float);
	--procedure release(servo_id : chan_id_type);
	--function get_steering return pulselen_type;
	--function get_steering_as_degrees return degrees_type;

private
	sst :  servo_task;


end rpiservo;
