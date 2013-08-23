------------------------------
---- registers-i2c (spec) ----
------------------------------
with types;	use types;



package registers.i2c is

	-- type delaration are spec-reading forward (BCM2835 ARM Peripherals)
	-- representation clauses are bit-counting upwards

	type bsc_c_reg is 
		record
			i2cen,
			intr,   
			intt,   
			intd,   
			st,     
			clear2, 
			clear,  
			read   : boolean; 
		end record;

	for bsc_c_reg use
		record
			read    at 0 range 0..0;
			clear   at 0 range 4..4;
			clear2  at 0 range 5..5;
			st      at 0 range 7..7;
			intd    at 0 range 8..8;
			intt    at 0 range 9..9;
			intr    at 0 range 10..10;
			i2cen   at 0 range 15..15;
		end record;

	for bsc_c_reg'size use 32;
	for bsc_c_reg'alignment use 4;
	pragma atomic(bsc_c_reg);

	type bsc_s_reg is
		record
			clkt,
			err, 
			rxf, 
			txe, 
			rxd,
			txd,
			rxr,
			txw,
			done,
			ta     :  boolean;
		end record;

	for bsc_s_reg use
		record
			ta    at 0 range 0 .. 0;
			done  at 0 range 1 .. 1;
			txw   at 0 range 2 .. 2;
			rxr   at 0 range 3 .. 3;
			txd   at 0 range 4 .. 4;
         rxd   at 0 range 5 .. 5; 
         txe   at 0 range 6 .. 6;
         rxf   at 0 range 7 .. 7;
			err   at 0 range 8 .. 8;
			clkt  at 0 range 9 .. 9;
		end record;

	for bsc_s_reg'size use 32;
	for bsc_s_reg'alignment use 4;
	pragma atomic(bsc_s_reg);

	type bsc_dlen_reg is
		record
			dlen : short_natural;
		end record;

	for bsc_dlen_reg use
		record
			dlen  at 0 range 0 .. 15;
		end record;

	for bsc_dlen_reg'size use 32;
	for bsc_dlen_reg'alignment use 4;
	pragma atomic(bsc_dlen_reg);

	type bsc_a_reg is
		record
			addr : natural_7bit;
		end record;

	for bsc_a_reg use
		record
			addr  at 0 range 0 .. 6;
		end record;

	for bsc_a_reg'size use 32;
	for bsc_a_reg'alignment use 4;
	pragma atomic(bsc_a_reg);

	type bsc_fifo_reg is
		record
			data : byte_natural;
			--nulx : nulx24_type; --if
		end record;

	for bsc_fifo_reg use
		record
			data  at 0 range 0 .. 7;
			--nulx  at 0 range 8 .. 31; --if
		end record;

	for bsc_fifo_reg'size use 32;
	for bsc_fifo_reg'alignment use 4;
	pragma atomic(bsc_fifo_reg);

	type bsc_div_reg is
		record
			cdiv : short_natural;
		end record;

	for bsc_div_reg use
		record
			cdiv  at 0 range 0 .. 15;
		end record;

	for bsc_div_reg'size use 32;
	for bsc_div_reg'alignment use 4;
	pragma atomic(bsc_div_reg);

	type bsc_del_reg is
		record
			fedl: short_natural;
			redl: short_natural;
		end record;

	for bsc_del_reg use
		record
			redl  at 0 range  0 .. 15;
			fedl  at 0 range 16 .. 31;
		end record;

	for bsc_del_reg'size use 32;
	for bsc_del_reg'alignment use 4;
	pragma atomic(bsc_del_reg);

	type bsc_clkt_reg is
		record
			tout : short_natural;
		end record;

	for bsc_clkt_reg use
		record
			tout  at 0 range 0 .. 15;
		end record;

	for bsc_clkt_reg'size use 32;
	for bsc_clkt_reg'alignment use 4;
	pragma atomic(bsc_clkt_reg);

	type i2c_address_map is
		record
			c    : bsc_c_reg;
			s    : bsc_s_reg;
			dlen : bsc_dlen_reg;
			a    : bsc_a_reg;
			fifo : bsc_fifo_reg;
			div  : bsc_div_reg;
			del  : bsc_del_reg;
			clkt : bsc_clkt_reg;
		end record;

	for i2c_address_map use
		record
			c     at 16#00# range 0 .. 31;
			s     at 16#04# range 0 .. 31; 
			dlen  at 16#08# range 0 .. 31;
			a     at 16#0c# range 0 .. 31;
			fifo  at 16#10# range 0 .. 31;
			div   at 16#14# range 0 .. 31;
			del   at 16#18# range 0 .. 31;
			clkt  at 16#1c# range 0 .. 31;
		end record;

	for i2c_address_map'size use 32*8;

end registers.i2c;



