-------------------------------
---- registers-gpio (spec) ----
-------------------------------

with types;	use types;


package registers.gpio is

	A_W   : constant := 4;
	M_b   : constant := 3;
	P_b   : constant := 2;
	T_b   : constant := 4;
	CTL_REG_NBYTES : constant := 32*6;

	type      pin_mode           is range 0..7;
	for       pin_mode'size      use M_b;

	type      pud_mode           is range 0..2;
	for       pud_mode'size      use P_b;

	type      test_type          is range 0..15;
	for       test_type'size     use T_b;

	pin_mode_input  : constant pin_mode := 2#000#;
	pin_mode_output : constant pin_mode := 2#001#;
	pin_mode_alt_0  : constant pin_mode := 2#100#;
	pin_mode_alt_1  : constant pin_mode := 2#101#;
	pin_mode_alt_2  : constant pin_mode := 2#110#;
	pin_mode_alt_3  : constant pin_mode := 2#111#;
	pin_mode_alt_4  : constant pin_mode := 2#011#;
	pin_mode_alt_5  : constant pin_mode := 2#010#;

	pud_mode_off    : constant pud_mode :=  2#00#;
	pud_mode_down   : constant pud_mode :=  2#01#; 
	pud_mode_up     : constant pud_mode :=  2#10#; 

	-- todo model specific
	type control_register is
		record
			pin00 :  pin_mode;
			pin01 :  pin_mode;
			pin02 :  pin_mode;
			pin03 :  pin_mode;
			pin04 :  pin_mode;
			pin05 :  pin_mode;
			pin06 :  pin_mode;
			pin07 :  pin_mode;
			pin08 :  pin_mode;
			pin09 :  pin_mode;
			pin10 :  pin_mode;
			pin11 :  pin_mode;
			pin12 :  pin_mode;
			pin13 :  pin_mode;
			pin14 :  pin_mode;
			pin15 :  pin_mode;
			pin16 :  pin_mode;
			pin17 :  pin_mode;
			pin18 :  pin_mode;
			pin19 :  pin_mode;
			pin20 :  pin_mode;
			pin21 :  pin_mode;
			pin22 :  pin_mode;
			pin23 :  pin_mode;
			pin24 :  pin_mode;
			pin25 :  pin_mode;
			pin26 :  pin_mode;
			pin27 :  pin_mode;
			pin28 :  pin_mode;
			pin29 :  pin_mode;
			pin30 :  pin_mode;
			pin31 :  pin_mode;
			pin32 :  pin_mode;
			pin33 :  pin_mode;
			pin34 :  pin_mode;
			pin35 :  pin_mode;
			pin36 :  pin_mode;
			pin37 :  pin_mode;
			pin38 :  pin_mode;
			pin39 :  pin_mode;
			pin40 :  pin_mode;
			pin41 :  pin_mode;
			pin42 :  pin_mode;
			pin43 :  pin_mode;
			pin44 :  pin_mode;
			pin45 :  pin_mode;
			pin46 :  pin_mode;
			pin47 :  pin_mode;
			pin48 :  pin_mode;
			pin49 :  pin_mode;
			pin50 :  pin_mode;
			pin51 :  pin_mode;
			pin52 :  pin_mode;
			pin53 :  pin_mode;
		end record;

	for control_register use
		record
			-- pin_n @ n*addr-words range n*mode-bits .. (") + mode-bits
			pin00  at 0*A_W range 0*M_b .. 0*M_b + M_b - 1;                  
			pin01  at 0*A_W range 1*M_b .. 1*M_b + M_b - 1;
			pin02  at 0*A_W range 2*M_b .. 2*M_b + M_b - 1;
			pin03  at 0*A_W range 3*M_b .. 3*M_b + M_b - 1;
			pin04  at 0*A_W range 4*M_b .. 4*M_b + M_b - 1;
			pin05  at 0*A_W range 5*M_b .. 5*M_b + M_b - 1;
			pin06  at 0*A_W range 6*M_b .. 6*M_b + M_b - 1;
			pin07  at 0*A_W range 7*M_b .. 7*M_b + M_b - 1;
			pin08  at 0*A_W range 8*M_b .. 8*M_b + M_b - 1;
			pin09  at 0*A_W range 9*M_b .. 9*M_b + M_b - 1;
			pin10  at 1*A_W range 0*M_b .. 0*M_b + M_b - 1;
			pin11  at 1*A_W range 1*M_b .. 1*M_b + M_b - 1;
			pin12  at 1*A_W range 2*M_b .. 2*M_b + M_b - 1;
			pin13  at 1*A_W range 3*M_b .. 3*M_b + M_b - 1;
			pin14  at 1*A_W range 4*M_b .. 4*M_b + M_b - 1;
			pin15  at 1*A_W range 5*M_b .. 5*M_b + M_b - 1;
			pin16  at 1*A_W range 6*M_b .. 6*M_b + M_b - 1;
			pin17  at 1*A_W range 7*M_b .. 7*M_b + M_b - 1;
			pin18  at 1*A_W range 8*M_b .. 8*M_b + M_b - 1;
			pin19  at 1*A_W range 9*M_b .. 9*M_b + M_b - 1;
			pin20  at 2*A_W range 0*M_b .. 0*M_b + M_b - 1;
			pin21  at 2*A_W range 1*M_b .. 1*M_b + M_b - 1;
			pin22  at 2*A_W range 2*M_b .. 2*M_b + M_b - 1;
			pin23  at 2*A_W range 3*M_b .. 3*M_b + M_b - 1;
			pin24  at 2*A_W range 4*M_b .. 4*M_b + M_b - 1;
			pin25  at 2*A_W range 5*M_b .. 5*M_b + M_b - 1;
			pin26  at 2*A_W range 6*M_b .. 6*M_b + M_b - 1;
			pin27  at 2*A_W range 7*M_b .. 7*M_b + M_b - 1;
			pin28  at 2*A_W range 8*M_b .. 8*M_b + M_b - 1;
			pin29  at 2*A_W range 9*M_b .. 9*M_b + M_b - 1;
			pin30  at 3*A_W range 0*M_b .. 0*M_b + M_b - 1;
			pin31  at 3*A_W range 1*M_b .. 1*M_b + M_b - 1;
			pin32  at 3*A_W range 2*M_b .. 2*M_b + M_b - 1;
			pin33  at 3*A_W range 3*M_b .. 3*M_b + M_b - 1;
			pin34  at 3*A_W range 4*M_b .. 4*M_b + M_b - 1;
			pin35  at 3*A_W range 5*M_b .. 5*M_b + M_b - 1;
			pin36  at 3*A_W range 6*M_b .. 6*M_b + M_b - 1;
			pin37  at 3*A_W range 7*M_b .. 7*M_b + M_b - 1;
			pin38  at 3*A_W range 8*M_b .. 8*M_b + M_b - 1;
			pin39  at 3*A_W range 9*M_b .. 9*M_b + M_b - 1;
			pin40  at 4*A_W range 0*M_b .. 0*M_b + M_b - 1;
			pin41  at 4*A_W range 1*M_b .. 1*M_b + M_b - 1;
			pin42  at 4*A_W range 2*M_b .. 2*M_b + M_b - 1;
			pin43  at 4*A_W range 3*M_b .. 3*M_b + M_b - 1;
			pin44  at 4*A_W range 4*M_b .. 4*M_b + M_b - 1;
			pin45  at 4*A_W range 5*M_b .. 5*M_b + M_b - 1;
			pin46  at 4*A_W range 6*M_b .. 6*M_b + M_b - 1;
			pin47  at 4*A_W range 7*M_b .. 7*M_b + M_b - 1;
			pin48  at 4*A_W range 8*M_b .. 8*M_b + M_b - 1;
			pin49  at 4*A_W range 9*M_b .. 9*M_b + M_b - 1;
			pin50  at 5*A_W range 0*M_b .. 0*M_b + M_b - 1;
			pin51  at 5*A_W range 1*M_b .. 1*M_b + M_b - 1;
			pin52  at 5*A_W range 2*M_b .. 2*M_b + M_b - 1;
			pin53  at 5*A_W range 3*M_b .. 3*M_b + M_b - 1;
		end record;
	for control_register'size use CTL_REG_NBYTES;
	for control_register'alignment use 4;

	----------------------------------------------------------------
	-- for an approach to numerically index the 3bit pin_modes
	-- in a function select register, these are some guiding
	-- snippets
	----------------------------------------------------------------

	-- gpfsel : aliased control_register;
	-- pragma volatile(gpfsel);
	--
	-- subtype   fsel_mode_index    is natural range 0 .. 9;
	-- type      fsel_mode_array    is array (fsel_mode_index)
	-- 		of     pin_mode;
   --
	-- subtype   fsel_word_index    is natural range 0 .. 5;
	-- type      fsel_table         is array
	-- 		(fsel_word_index, fsel_mode_index)
	-- 		of     pin_mode;
	--
	-- type pin_mode_ref is 
	--		record
	-- 		i_mpin    : fsel_mode_index;
	-- 		i_word    : fsel_word_index;
	--		end record;
	--
   -- type fsel_mapping_array is array (pin_index) of pin_mode_ref;
	--
	-- fsel_trep : fsel_table
	-- for fsel_trep'address use gpfsel'address;
	--
	--
	-- fsel_trep(fsel_mapping(PIN).i_word, fsel_mapping(PIN).i_mpin);

	type gpio_address_map is
		record
			fsel    : control_register;
			set,  
			clr,  
			lev,  
			ped,  
			ren,  
			fen,  
			hen,  
			len,  
			paren,
			pafen   : bitarray_54;
			pud     : pud_mode;
			pudclk  : bitarray_54;
			test    : test_type;
		end record;

	for gpio_address_map use
		record
			fsel    at 16#00# range 0 .. CTL_REG_NBYTES - 1;
			set     at 16#1c# range 0 .. bitarray_54'length-1;
			clr     at 16#28# range 0 .. bitarray_54'length-1;
			lev     at 16#34# range 0 .. bitarray_54'length-1;
			ped     at 16#40# range 0 .. bitarray_54'length-1;
			ren     at 16#4c# range 0 .. bitarray_54'length-1;
			fen     at 16#58# range 0 .. bitarray_54'length-1;
			hen     at 16#64# range 0 .. bitarray_54'length-1;
			len     at 16#70# range 0 .. bitarray_54'length-1;
			paren   at 16#7c# range 0 .. bitarray_54'length-1;
		   pafen   at 16#88# range 0 .. bitarray_54'length-1;
			pud     at 16#94# range 0 .. pud_mode'size-1;
			pudclk  at 16#98# range 0 .. bitarray_54'length-1;
			test    at 16#b0# range 0 .. 3;
		end record;

	for gpio_address_map'size use 16#b0#*8+32;
	for gpio_address_map'alignment use 4;

end registers.gpio;



