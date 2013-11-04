----------------------------
---- registers-pwm (spec) --
----------------------------

with types;	use types;



package registers.pwm is

	type ctl_reg is
		record
			msen2, usef2, pola2, sbit2, rptl2, mode2, pwen2,
			msen1, clrf1, usef1, pola1, sbit1, rptl1, mode1, pwen1
				:  boolean;
		end record;

	for ctl_reg use
		record
			mode1   at 0 range  0 ..  0; 
		   rptl1   at 0 range  1 ..  1; 
		   sbit1   at 0 range  2 ..  2; 
		   pola1   at 0 range  3 ..  3; 
		   usef1   at 0 range  4 ..  4; 
		   clrf1   at 0 range  5 ..  5; 
		   msen1   at 0 range  6 ..  6; 
		   pwen2   at 0 range  7 ..  7; 
		   mode2   at 0 range  8 ..  8; 
		   rptl2   at 0 range  9 ..  9; 
		   sbit2   at 0 range 10 .. 10; 
		   pola2   at 0 range 11 .. 11; 
		   usef2   at 0 range 12 .. 12; 
		   msen2   at 0 range 13 .. 13;
		end record;

	for ctl_reg'size use 32;
	for ctl_reg'alignment use 4;
	pragma atomic(ctl_reg);


	type sta_reg is
		record
			sta4, sta3, sta2, sta1, berr, gapo4, gapo3,
			gapo2, gapo1, rerr1, werr1, empt1, full1  
					: boolean;
		end record;

	for sta_reg use
		record
			sta4   at 0 range 12 .. 12;
			sta3   at 0 range 11 .. 11;
			sta2   at 0 range 10 .. 10;
			sta1   at 0 range  9 ..  9;
			berr   at 0 range  8 ..  8;
			gapo4  at 0 range  7 ..  7;
			gapo3  at 0 range  6 ..  6;
			gapo2  at 0 range  5 ..  5;
			gapo1  at 0 range  4 ..  4;
			rerr1  at 0 range  3 ..  3;
			werr1  at 0 range  2 ..  2;
			empt1  at 0 range  1 ..  1;
			full1  at 0 range  0 ..  0;
		end record;

	for sta_reg'size use 32;
	for sta_reg'alignment use 4;
	pragma atomic(sta_reg);


	type dmac_reg is
		record
			enab  :    boolean;
			panic :    byte_natural;
			dreq  :    byte_natural;
			--http://imgur.com/EbDVOwG.jpg
		end record;

	for dmac_reg use
		record
			enab   at 0 range 31 .. 31;
			panic  at 0 range  8 .. 15;
			dreq   at 0 range  0 ..  7;
		end record;

	for dmac_reg'size use 32;
	for dmac_reg'alignment use 4;
	pragma atomic(dmac_reg);


	type rng1_reg is
		record
			pwm_rngi  :  int_natural;
		end record;

	for rng1_reg use
		record
			pwm_rngi  at 0 range 0 .. 31;
		end record;

	for rng1_reg'size use 32;
	for rng1_reg'alignment use 4;
	pragma atomic(rng1_reg);


	type dat1_reg is
		record
			pwm_dati  :  int_natural;
		end record;

	for dat1_reg use
		record
			pwm_dati  at 0 range 0 .. 31;
		end record;

	for dat1_reg'size use 32;
	for dat1_reg'alignment use 4;
	pragma atomic(dat1_reg);


	type fif1_reg is
		record
			pwm_fifo  :  int_natural;
		end record;

	for fif1_reg use
		record
			pwm_fifo  at 0 range 0 .. 31;
		end record;

	for fif1_reg'size use 32;
	for fif1_reg'alignment use 4;
	pragma atomic(fif1_reg);


	type rng2_reg is
		record
			pwm_rngi  :  int_natural;
		end record;

	for rng2_reg use
		record
			pwm_rngi  at 0 range 0 .. 31;
		end record;

	for rng2_reg'size use 32;
	for rng2_reg'alignment use 4;
	pragma atomic(rng2_reg);


	type dat2_reg is
		record
			pwm_dati  :  int_natural;
		end record;

	for dat2_reg use
		record
			pwm_dati  at 0 range 0 .. 31;
		end record;

	for dat2_reg'size use 32;
	for dat2_reg'alignment use 4;
	pragma atomic(dat2_reg);


	
	type pwm_address_map is
		record
			ctl   :  ctl_reg;
			sta   :  sta_reg;
			dmac  :  dmac_reg;
			rng1  :  rng1_reg;
			dat1  :  dat1_reg;
			fif1  :  fif1_reg;
			rng2  :  rng2_reg;
			dat2  :  dat2_reg;
		end record;

	for pwm_address_map use
		record
			ctl     at  16#00#   range  0 .. 31; 
			sta     at  16#04#   range  0 .. 31; 
			dmac    at  16#08#   range  0 .. 31; 
			rng1    at  16#10#   range  0 .. 31; 
			dat1    at  16#14#   range  0 .. 31; 
			fif1    at  16#18#   range  0 .. 31; 
			rng2    at  16#20#   range  0 .. 31; 
			dat2    at  16#24#   range  0 .. 31; 
		end record;

	for pwm_address_map'size use 32*6;
	for pwm_address_map'alignment use 4;
end registers.pwm;



