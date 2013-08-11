with ada.text_io; use ada.text_io;
with gpio;
with model_specific;
with ada.real_time; use ada.real_time;

procedure test_gpio is
	pin_a, pin_b : model_specific.pin_index;
	b            : boolean := false;
begin

	pin_a := 4;
	pin_a := 7;

	gpio.init;

	gpio.set(pin_a);

	for i in 1 .. 15 loop
		gpio.set(pin_b);
		b := not b;
		delay duration(1.0);
	end loop;
end test_gpio;
