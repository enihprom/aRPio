--------------------------------
---- test_bcm2835_mmio (body) --
--------------------------------

with bcm2835_mmio;
with ada.text_io;    use ada.text_io;
with types;	use types;
with constants;	use constants;
with ada.command_line;	use ada.command_line;
with registers.gpio; use registers.gpio;



procedure test_sreg1 is
	package mmio renames bcm2835_mmio;
	byte   : byte_natural;
	config : mmio.hc164_config_type := ( 
		clk_pin   => RPI_V2_GPIO_P1_03,
		dsa_pin   => RPI_V2_GPIO_P1_05,
		clk_state => false
		);
begin

	-- mmio.set_mode(RPI_V2_GPIO_P1_03, pin_mode_output);
	-- mmio.set_mode(RPI_V2_GPIO_P1_05, pin_mode_output);
	-- mmio.set_mode(RPI_V2_GPIO_P1_07, pin_mode_output);
 
	--fixme remove
	mmio.set_state(RPI_V2_GPIO_P1_05, true);
	delay 1.0;
	mmio.set_state(RPI_V2_GPIO_P1_05, false);
	delay 1.0;

	mmio.set_state(RPI_V2_GPIO_P1_07, true);
	mmio.set_state(RPI_V2_GPIO_P1_07, false);
	begin
		byte := byte_natural'value(argument(1));
		put_line("byte=" & byte'img 
				& " '" & character'val(integer(byte)) 
				& "'");
		mmio.shift_byte(config, byte);
	exception
		when constraint_error =>
			for i in 0 .. 255 loop
				byte := byte_natural(i);
				mmio.shift_byte(config, byte);
				put_line("byte=" & byte'img 
						& " '" & character'val(integer(byte)) 
						& "'");
			end loop;
	end;

	mmio.set_state(RPI_V2_GPIO_P1_07, true);
	mmio.set_state(RPI_V2_GPIO_P1_07, false);

end test_sreg1;




