---------------------------
---- test_mmio2 (body) ----
---------------------------

with bcm2835_mmio;
with ada.text_io;    use ada.text_io;
with types;	use types;
with registers.gpio;	use registers.gpio;
with constants;	use constants;



procedure test_mmio2 is

	bit : boolean := false;
	package mmio renames bcm2835_mmio;

	PCA9685_SUBADR1   :  constant  :=  16#2#;
	PCA9685_SUBADR2   :  constant  :=  16#3#;
	PCA9685_SUBADR3   :  constant  :=  16#4#; 
	PCA9685_MODE1     :  constant  :=  16#0#;
	PCA9685_PRESCALE  :  constant  :=  16#FE#;
	LED0_ON_L         :  constant  :=  16#6#; 
	LED0_ON_H         :  constant  :=  16#7#; 
	LED0_OFF_L        :  constant  :=  16#8#; 
	LED0_OFF_H        :  constant  :=  16#9#; 
	ALLLED_ON_L       :  constant  :=  16#FA#;
	ALLLED_ON_H       :  constant  :=  16#FB#;
	ALLLED_OFF_L      :  constant  :=  16#FC#;
	ALLLED_OFF_H      :  constant  :=  16#FD#;

begin

	put_line("mmio.bo_v1p1_07_fsel := pin_mode_output;");
	mmio.bo_v1p1_07_fsel := pin_mode_output;
	delay 1.0;

	put_line("mmio.i2c_begin;");
	mmio.i2c_begin;
	delay 1.0;

	for b in byte_natural'range loop

		mmio.flip_state(RPI_GPIO_P1_07);

		put_line("mmio.flip_state(RPI_GPIO_P1_07)'ed lev="
						& mmio.lev(RPI_GPIO_P1_07)'img & ");");
	
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
end test_mmio2;




