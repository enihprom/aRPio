--------------------------------
---- test_bcm2835_mmio (body) --
--------------------------------

with bcm2835_mmio;
with ada.text_io;    use ada.text_io;
with types;	use types;
with registers.gpio;	use registers.gpio;
with constants;	use constants;



procedure test_mmio1 is
	bit : boolean := false;
	package mmio renames bcm2835_mmio;
begin

	put_line("mmio.bo_v1p1_03 := pin_mode_output;");
	mmio.bo_v1p1_03_fsel := pin_mode_output;
	delay 1.0;

	put_line("mmio.i2c_begin;");
	mmio.i2c_begin;
	delay 1.0;

	for b in byte_natural'range loop

		bit := not bit;

		put_line("mmio.set_state(RPI_GPIO_P1_03, " & bit'img & ");");
		mmio.set_state(RPI_GPIO_P1_03, bit);
		delay 1.0;

		put_line(
			"mmio.i2c_tx_send( " &
			byte_natural( b )'img & ", natural_7bit(16#0#) );");
		mmio.i2c_tx_send( byte_natural( b ), natural_7bit(16#0#) );
		delay 1.0;

	end loop;

	put_line("mmio.i2c_end;");
	mmio.i2c_end;
	delay 1.0;


	-- loop
	-- 	bit := not bit;
	-- 	mmio.i2c_regs.c.read := bit;
	-- 	put("bsc0_c read bit toggled to " & mmio.i2c_regs.c.read'img);
	-- 	delay 2.0;
	-- 	new_line;
	-- end loop;
end test_mmio1;




