-----------------------------
---- registers-uart (spec) --
-----------------------------

--
package registers.uart is

	type lchr_wlen_type is range 0 .. 3;
	for lchr_wlen_type'size use 2;

	type dr_reg is
		record
			oe, be, pe, fe	: boolean;
			data   			: byte_natural;
		end record;

	for dr_reg use
		record
			oe		at 0 range	 11 .. 11;
			be		at 0 range	 10 .. 10;
			pe		at 0 range	  9 ..  9;
			fe		at 0 range	  8 ..  8;
			data	at 0 range	  0 ..  7;
		end record;

	for dr_reg'size use 32;
	for dr_reg'alignment use 4;
	pragma atomic(dr_reg);


	type rsrecr_reg is
		record
			oe, be, pe, fe : boolean;
		end record;

	for rsrecr_reg use
		record
			oe		at 0 range	 3 .. 3;
			be		at 0 range	 2 .. 2;
			pe		at 0 range	 1 .. 1;
			fe		at 0 range	 0 .. 0;
		end record;

	for rsrecr_reg'size use 32;
	for rsrecr_reg'alignment use 4;
	pragma atomic(rsrecr_reg);


	type fr_reg is
		record
			ri, txfe, rxff, txff, rxfe, busy, dcd, dsr, cts : boolean;
		end record;

	for fr_reg use
		record
			ri			at 0 range  8 .. 8;
			txfe		at 0 range  7 .. 7;
			rxff		at 0 range  6 .. 6;
			txff		at 0 range  5 .. 5;
			rxfe		at 0 range  4 .. 4;
			busy		at 0 range  3 .. 3;
			dcd		at 0 range  2 .. 2;
			dsr		at 0 range  1 .. 1;
			cts		at 0 range  0 .. 0;
		end record;

	for fr_reg'size use 32;
	for fr_reg'alignment use 4;
	pragma atomic(fr_reg);


	-- type ilpr_reg is
	-- 	record
	-- 	end record;

	-- for ilpr_reg use
	-- 	record
	-- 	end record;

	-- for ilpr_reg'size use 32;
	-- for ilpr_reg'alignment use 4;


	type ibrd_reg is
		record
			ibrd  :  short_natural;
		end record;

	for ibrd_reg use
		record
			ibrd   at 0 range 0 .. 31;
		end record;

	for ibrd_reg'size use 32;
	for ibrd_reg'alignment use 4;
	pragma atomic(ibrd_reg);


	type fbrd_reg is
		record
			fbrd  :  natural_6bit;
		end record;

	for fbrd_reg use
		record
			fbrd   at 0 range 0 .. 5;
		end record;

	for fbrd_reg'size use 32;
	for fbrd_reg'alignment use 4;
	pragma atomic(fbrd_reg);


	type lcrh_reg is
		record
			sps                      :  boolean;
			wlen                     :  lchr_wlen_type;
			fen, stp2, eps, pen, brk :  boolean;
		end record;

	for lcrh_reg use
		record
			sps		at 0 range  7 .. 7;
			wlen		at 0 range  5 .. 6;
			fen		at 0 range  4 .. 4;
			stp2		at 0 range  3 .. 3;
			eps		at 0 range  2 .. 2;
			pen		at 0 range  1 .. 1;
			brk		at 0 range  0 .. 0;
 
		end record;

	for lcrh_reg'size use 32;
	for lcrh_reg'alignment use 4;
	pragma atomic(lcrh_reg);


	type cr_reg is
		record
			ctsen, rtsen, out2, out1, rts, dtr, rxe, txe, lbe, sirlp, siren, uarten;		
		end record;

	for cr_reg use
		record
			-- w0hole
			ctsen  at 0 range 15 .. 15;
			rtsen  at 0 range 14 .. 14;
			out2   at 0 range 13 .. 13;
			out1   at 0 range 12 .. 12;
			rts    at 0 range 11 .. 11;
			dtr    at 0 range 10 .. 10;
			rxe    at 0 range 9 .. 9;
			txe    at 0 range 8 .. 8;
			lbe    at 0 range 7 .. 7;
			-- w0hole
			sirlp  at 0 range 2 .. 2;
			siren  at 0 range 1 .. 1;
			uarten at 0 range 0 .. 0;		
		end record;

	for cr_reg'size use 32;
	for cr_reg'alignment use 4;
	pragma atomic(cr_reg);


	type ifls_reg is
		record
		end record;

	for ifls_reg use
		record
		end record;

	for ifls_reg'size use 32;
	for ifls_reg'alignment use 4;
	pragma atomic(ifls_reg);


	type imsc_reg is
		record
		end record;

	for imsc_reg use
		record
		end record;

	for imsc_reg'size use 32;
	for imsc_reg'alignment use 4;
	pragma atomic(imsc_reg);


	type ris_reg is
		record
		end record;

	for ris_reg use
		record
		end record;

	for ris_reg'size use 32;
	for ris_reg'alignment use 4;
	pragma atomic(ris_reg);


	type mis_reg is
		record
		end record;

	for mis_reg use
		record
		end record;

	for mis_reg'size use 32;
	for mis_reg'alignment use 4;
	pragma atomic(mis_reg);


	type icr_reg is
		record
		end record;

	for icr_reg use
		record
		end record;

	for icr_reg'size use 32;
	for icr_reg'alignment use 4;
	pragma atomic(icr_reg);


	type dmacr_reg is
		record
		end record;

	for dmacr_reg use
		record
		end record;

	for dmacr_reg'size use 32;
	for dmacr_reg'alignment use 4;
	pragma atomic(dmacr_reg);


	type itcr_reg is
		record
		end record;

	for itcr_reg use
		record
		end record;

	for itcr_reg'size use 32;
	for itcr_reg'alignment use 4;
	pragma atomic(itcr_reg);


	type itip_reg is
		record
		end record;

	for itip_reg use
		record
		end record;

	for itip_reg'size use 32;
	for itip_reg'alignment use 4;
	pragma atomic(itip_reg);


	type itop_reg is
		record
		end record;

	for itop_reg use
		record
		end record;

	for itop_reg'size use 32;
	for itop_reg'alignment use 4;
	pragma atomic(itop_reg);


	type tdr_reg is
		record
		end record;

	for tdr_reg use
		record
		end record;

	for tdr_reg'size use 32;
	for tdr_reg'alignment use 4;
	pragma atomic(tdr_reg);


	type uart_address_mapping is
		record
			dr       :   dr_reg;
			rsrecr   :   rsrecr_reg;
			fr       :   fr_reg;
			-- ilpr    :   not_in_use_reg;
			ibrd		:	ibrd_reg;
			fbrd		:	fbrd_reg;
			lcrh		:	lcrh_reg;
			cr			:	cr_reg;
			ifls		:	ifls_reg;
			imsc		:	imsc_reg;
			ris		:	ris_reg;
			mis		:	mis_reg;
			icr		:	icr_reg;
			dmacr		:	dmacr_reg;
			itcr		:	itcr_reg;
			itip		:	itip_reg;
			itop		:	itop_reg;
			tdr		:	tdr_reg;
		end record;

	for uart_address_mapping use
		record
			dr			at 16#00# range	 0 .. 31;
			rsrecr	at 16#04# range	 0 .. 31;
			fr			at 16#18# range	 0 .. 31;
			--ilpr		at 16#00# range	 0 .. 31;
			ibrd		at 16#24# range	 0 .. 31;
			fbrd		at 16#28# range	 0 .. 31;
			lcrh		at 16#2c# range	 0 .. 31;
			cr			at 16#30# range	 0 .. 31;
			ifls		at 16#34# range	 0 .. 31;
			imsc		at 16#38# range	 0 .. 31;
			ris		at 16#3c# range	 0 .. 31;
			mis		at 16#40# range	 0 .. 31;
			icr		at 16#44# range	 0 .. 31;
			dmacr		at 16#48# range	 0 .. 31;
			itcr		at 16#80# range	 0 .. 31;
			itip		at 16#84# range	 0 .. 31;
			itop		at 16#88# range	 0 .. 31;
			tdr		at 16#8c# range	 0 .. 31;
		end record;

end registers.uart;



