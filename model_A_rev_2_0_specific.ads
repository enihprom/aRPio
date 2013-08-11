-- model_A_rev_2_0_specific;

with interfaces; use interfaces;

package model_specific is

	type p1_port_pins is 
		record
		       pin2,  pin3,  pin4,            pin7,  pin8,  pin9,  pin10, 
		pin11,               pin14, pin15,    pin17, pin18, 
		       pin22, pin23, pin24, pin25,    pin27 
				 
				 : boolean;
		end record;

	subtype pin_index is natural range 0 .. 31;
	subtype reg_pin_index is natural range 0 .. 9;
	subtype reg_index is unsigned_32 range 16#20200000# .. 16#20200014#;

	pragma pack(p1_port_pins);
	for p1_port_pins'size use 32;

	for p1_port_pins use 
		record
			pin2 at 0 range 2..2;
			pin3 at 0 range 3..3;
			pin4 at 0 range 4..4;
			pin7 at 0 range 7..7;
			pin8 at 0 range 8..8;
			pin9 at 0 range 9..9;
			pin10 at 0 range 10..10;
			pin11 at 0 range 11..11;
			pin14 at 0 range 14..14;
			pin15 at 0 range 15..15;
			pin17 at 0 range 17..17;
			pin18 at 0 range 18..18;
			pin22 at 0 range 22..22;
			pin23 at 0 range 23..23;
			pin24 at 0 range 24..24;
			pin25 at 0 range 25..25;
			pin27 at 0 range 27..27;
		end record;
	

end model_specific;
