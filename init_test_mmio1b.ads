-------------------------------
---- init_test_mmio1b (spec) --
-------------------------------

with platform_mmio;
with types;       use types;
with constants;	use constants;


package init_test_mmio1b is

	type counter_write_reg is 
		record
			yte  : byte_natural;
			bte  : byte_natural;
			bye  : byte_natural;
			byt  : byte_natural;
			byte : byte_natural;
			te   : byte_natural;
			be   : byte_natural;
			by   : byte_natural;
		end record;

	for counter_write_reg use
		record
			yte  at 16#00# range 24 .. 31;
			bte  at 16#04# range 24 .. 31;
			bye  at 16#08# range 24 .. 31;
			byt  at 16#0c# range 24 .. 31;
			byte at 16#10# range 20 .. 27;
			te   at 16#14# range 24 .. 31;
			be   at 16#18# range 24 .. 31;
			by   at 16#1c# range 24 .. 31;
		end record;

	for counter_write_reg'size use 32*8;
	for counter_write_reg'alignment use 4;
	
	xword : aliased counter_write_reg;

	for xword'address use platform_mmio.init(BCM2835_BSC1_OFFSET);
		--(16#804010#);
	pragma volatile(xword);


	procedure punch(b : in byte_natural);

end init_test_mmio1b;



