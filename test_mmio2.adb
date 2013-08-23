---------------------------
---- test_mmio2 (body) ----
---------------------------

with bcm2835_mmio;
with ada.text_io;    use ada.text_io;
with types;	use types;
with registers.gpio;	use registers.gpio;
with constants;	use constants;



procedure test_mmio2 is

	package mmio renames bcm2835_mmio;

	subtype lines_type is positive range 1 .. 3;
	subtype stepindex_type is positive range 1 .. 6;
	type step_type is array (lines_type) of boolean;
	type steps_type is array (stepindex_type) of step_type;

	steps : constant steps_type := 
		(
			1 => (true, false, false),
			2 => (true, true, false),
			3 => (false, true, false),
			4 => (false, true, true),
			5 => (false, false, true),
			6 => (true, false, true)
			-- 1 => (true, false, false),
			-- 1 => (true, false, false),
		);

	m03, m05, m07 : pin_mode;
begin

	m03 := mmio.bo_v2p1_03_fsel;
	m05 := mmio.bo_v2p1_05_fsel;
	m07 := mmio.bo_v2p1_07_fsel;

	mmio.bo_v2p1_03_fsel := pin_mode_output;
	mmio.bo_v2p1_05_fsel := pin_mode_output;
	mmio.bo_v2p1_07_fsel := pin_mode_output;
	put_line("bo_v1p1_0[3,5,7]_fsel := pin_mode_output;");

	for i in 1 .. 25 loop
		for k in steps_type'range loop
			mmio.set_state(RPI_V2_GPIO_P1_03, steps(k)(1));
			mmio.set_state(RPI_V2_GPIO_P1_05, steps(k)(2));
			mmio.set_state(RPI_V2_GPIO_P1_07, steps(k)(3));
			delay 0.1;
		end loop;
	end loop;

	mmio.bo_v2p1_03_fsel := m03;
	mmio.bo_v2p1_05_fsel := m05;
	mmio.bo_v2p1_07_fsel := m07;

end test_mmio2;




