-------------------------------
---- registers-gpio (spec) ----
-------------------------------

with types;	use types;
with constants;	use constants;
with model_specific;

package registers.gpio is

	A_W   : constant := 4;
	M_b   : constant := 3;
	P_b   : constant := 2;
	T_b   : constant := 4;
	CTL_REG_NBITS : constant := 32*6;

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

	-- index the 3bit pin_modes -----------------------------------
	------------------------------------------------ nominalally --

	type control_register_flat_record is
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

	for control_register_flat_record use
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
	for control_register_flat_record'size use CTL_REG_NBITS;
	for control_register_flat_record'alignment use 4;


	-- index the 3bit pin_modes -----------------------------------
	------------------------------------------------ numerically --

	subtype   fsel_mode_index    is natural range 0 .. 9;
	type      fsel_mode_array    is array (fsel_mode_index)
			of     pin_mode;
	pragma pack(fsel_mode_array);
	for fsel_mode_array'size use 30;

	type fsel_register_type is
		record
			mpins : fsel_mode_array;
		end record;

	for fsel_register_type use
		record
			mpins at 0 range 0 .. 29;
		end record;
	for fsel_register_type'size use 32;
   
	subtype   fsel_register_index    is natural range 0 .. 5;
	type      fsel_register_array    is array
			(fsel_register_index)
			of     fsel_register_type;
	pragma pack(fsel_register_array);
	
	type control_register_array_record is
		record
			words : fsel_register_array;
		end record;

	for control_register_array_record use
		record
			words  at 0 range 0 .. CTL_REG_NBITS-1;
		end record;
	for control_register_array_record'size use CTL_REG_NBITS;
	for control_register_array_record'alignment use 4;

	type nc_type is (empty, reserved);

	-- todo into model_specific
	-- type pin_mode_ref(i : pin_index) is separate;
	type pin_mode_ref(i : pin_index := 0) is
		record
			case i is
				when 
					-- todo
					RPI_V2_GPIO_P1_03  |
					RPI_V2_GPIO_P1_05  |
					RPI_V2_GPIO_P1_07  |
					RPI_V2_GPIO_P1_08  |
					RPI_V2_GPIO_P1_10  |
					RPI_V2_GPIO_P1_11  |
					RPI_V2_GPIO_P1_12  |
					RPI_V2_GPIO_P1_13  |
					RPI_V2_GPIO_P1_15  |
					RPI_V2_GPIO_P1_16  |
					RPI_V2_GPIO_P1_18  |
					RPI_V2_GPIO_P1_19  |
					RPI_V2_GPIO_P1_21  |
					RPI_V2_GPIO_P1_22  |
					RPI_V2_GPIO_P1_23  |
					RPI_V2_GPIO_P1_24  |
					RPI_V2_GPIO_P1_26  |
					RPI_V2_GPIO_P5_03  |
					RPI_V2_GPIO_P5_04  |
					RPI_V2_GPIO_P5_05  |
					RPI_V2_GPIO_P5_06 =>

					i_mpin    : fsel_mode_index := i mod 10;
					i_word    : fsel_register_index := i / 10;
					
				when others =>
					not_connected  : nc_type;
			end case;
		end record;
	
	type pin_mode_ref_access is access pin_mode_ref;
	type fsel_mapping_array is array (pin_index) of pin_mode_ref;

	subtype continous_pin_index is natural 
		range 0 .. model_specific.continous_absolute_pin_number-1;

   type continous_fsel_mapping_array is array
		(continous_pin_index) of pin_mode_ref;
	
	type gpio_address_map is
		record
			--fsel    : control_register_flat_record;
			fsel    : control_register_array_record;
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
			fsel    at 16#00# range 0 .. CTL_REG_NBITS - 1;
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

	----------------------------------------------------------------
	-- numerically index pins
	----------------------------------------------------------------
	
	-- todo create it
	--fsel_mapping : constant fsel_mapping_array renames model_specific.fsel_mapping;

	RPI_V2_GPIO_P1_03_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_03);
	RPI_V2_GPIO_P1_05_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_05);
	RPI_V2_GPIO_P1_07_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_07);
	RPI_V2_GPIO_P1_08_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_08);
	RPI_V2_GPIO_P1_10_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_10);
	RPI_V2_GPIO_P1_11_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_11);
	RPI_V2_GPIO_P1_12_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_12);
	RPI_V2_GPIO_P1_13_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_13);
	RPI_V2_GPIO_P1_15_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_15);
	RPI_V2_GPIO_P1_16_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_16);
	RPI_V2_GPIO_P1_18_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_18);
	RPI_V2_GPIO_P1_19_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_19);
	RPI_V2_GPIO_P1_21_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_21);
	RPI_V2_GPIO_P1_22_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_22);
	RPI_V2_GPIO_P1_23_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_23);
	RPI_V2_GPIO_P1_24_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_24);
	RPI_V2_GPIO_P1_26_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P1_26);
	RPI_V2_GPIO_P5_03_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P5_03);
	RPI_V2_GPIO_P5_04_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P5_04);
	RPI_V2_GPIO_P5_05_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P5_05);
	RPI_V2_GPIO_P5_06_mode_ref : pin_mode_ref(i => RPI_V2_GPIO_P5_06);

	fsel_mapping : constant fsel_mapping_array := 
		(
			RPI_V2_GPIO_P1_03 =>	RPI_V2_GPIO_P1_03_mode_ref,
			RPI_V2_GPIO_P1_05 =>	RPI_V2_GPIO_P1_05_mode_ref,
			RPI_V2_GPIO_P1_07 =>	RPI_V2_GPIO_P1_07_mode_ref,
			RPI_V2_GPIO_P1_08 =>	RPI_V2_GPIO_P1_08_mode_ref,
			RPI_V2_GPIO_P1_10 =>	RPI_V2_GPIO_P1_10_mode_ref,
			RPI_V2_GPIO_P1_11 =>	RPI_V2_GPIO_P1_11_mode_ref,
			RPI_V2_GPIO_P1_12 =>	RPI_V2_GPIO_P1_12_mode_ref,
			RPI_V2_GPIO_P1_13 =>	RPI_V2_GPIO_P1_13_mode_ref,
			RPI_V2_GPIO_P1_15 =>	RPI_V2_GPIO_P1_15_mode_ref,
			RPI_V2_GPIO_P1_16 =>	RPI_V2_GPIO_P1_16_mode_ref,
			RPI_V2_GPIO_P1_18 =>	RPI_V2_GPIO_P1_18_mode_ref,
			RPI_V2_GPIO_P1_19 =>	RPI_V2_GPIO_P1_19_mode_ref,
			RPI_V2_GPIO_P1_21 =>	RPI_V2_GPIO_P1_21_mode_ref,
			RPI_V2_GPIO_P1_22 =>	RPI_V2_GPIO_P1_22_mode_ref,
			RPI_V2_GPIO_P1_23 =>	RPI_V2_GPIO_P1_23_mode_ref,
			RPI_V2_GPIO_P1_24 =>	RPI_V2_GPIO_P1_24_mode_ref,
			RPI_V2_GPIO_P1_26 =>	RPI_V2_GPIO_P1_26_mode_ref,
			RPI_V2_GPIO_P5_03 =>	RPI_V2_GPIO_P5_03_mode_ref,
			RPI_V2_GPIO_P5_04 =>	RPI_V2_GPIO_P5_04_mode_ref,
			RPI_V2_GPIO_P5_05 =>	RPI_V2_GPIO_P5_05_mode_ref,
			RPI_V2_GPIO_P5_06 =>	RPI_V2_GPIO_P5_06_mode_ref,
			others =>  (i => 0, not_connected => empty)

			-- 1 => (i => 1, not_connected => empty),
			-- 6 => (i => 6, not_connected => empty)

		);

	for gpio_address_map'size use 16#b0# * 8 + 32;
	for gpio_address_map'alignment use 4;

end registers.gpio;



