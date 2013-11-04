----------------------------
---- registers-spi (spec) --
----------------------------
--

package registers.spi is

	subtype clear_fifo_type  is natural_2bit;
	subtype chip_select_type is natural_2bit;
	subtype output_hold_type is natural_4bit;

	type cs_reg is
		record
			len_long, dma_len, cspol2, cspol1, cspol0,
			rxr, rxf, txd, rxd, done, te_en, lmono, len, ren,
			adcs, intr, intd, dmaen, ta, cspol 
				: boolean;
			
			clear : clear_fifo_type;

			cpol, cpha :boolean;

			cs    : chip_select_type;
		end record;

	for cs_reg use
		record
			len_long    at 0 range 25 .. 25; 
			dma_len     at 0 range 24 .. 24; 
			cspol2      at 0 range 23 .. 23;
			cspol1      at 0 range 22 .. 22; 
			cspol0      at 0 range 21 .. 21;
			rxr         at 0 range 20 .. 20; 
			rxf         at 0 range 19 .. 19; 
			txd         at 0 range 18 .. 18; 
			rxd         at 0 range 17 .. 17; 
			done        at 0 range 16 .. 16;
			-- te_en       at 0 range 15 .. 15; 
			-- lmono       at 0 range 14 .. 14; 
			len         at 0 range 13 .. 13; 
			ren         at 0 range 12 .. 12; 
			adcs        at 0 range 11 .. 11; 
			intr        at 0 range 10 .. 10;
			intd        at 0 range  9 ..  9;
			dmaen       at 0 range  8 ..  8; 
			ta          at 0 range  7 ..  7;   
			cspol       at 0 range  6 ..  6;
			clear       at 0 range  4 ..  5;
			cpol        at 0 range  3 ..  3;
			cpha        at 0 range  2 ..  2;
			cs          at 0 range  0 ..  1;
		end record;

	for cs_reg'size use 32;
	for cs_reg'alignment use 4;
	pragma atomic(cs_reg);

	type fifo_reg is 
		record
			data : int_natural;
		end record;

	for fifo_reg use
		record
			data  at 0 range 0 .. 31;
		end record;

	for fifo_reg'size use 32;
	for fifo_reg'alignment use 4;

	type clk_reg is 
		record
			cdiv: short_natural;
		end record;

	for clk_reg use
		record
			cdiv  at 0 range 0 .. 31;
		end record;

	for clk_reg'size use 32;
	for clk_reg'alignment use 4;

	type dlen_reg is 
		record
			len: short_natural;
		end record;

	for dlen_reg use
		record
			len  at 0 range 0 .. 31;
		end record;

	for dlen_reg'size use 32;
	for dlen_reg'alignment use 4;


	-- todo
	
	type spi_address_map is
		record
			cs     : cs_reg;
			fifo   : fifo_reg;
			clk    : clk_reg;
			dlen   : dlen_reg;
			ltoh   : ltoh_reg;
			dc     : dc_reg;
		end record;

	for spi_address_map use
		record
			cs      at 16#00# range 0 .. 31; 
			fifo    at 16#04# range 0 .. 31; 
			clk     at 16#08# range 0 .. 31; 
			dlen    at 16#0c# range 0 .. 31; 
			ltoh    at 16#10# range 0 .. 31; 
			dc      at 16#14# range 0 .. 31; 
		end record;

	for spi_address_map'size use 32*6;
	for spi_address_map'alignment use 4;



end registers.spi;



