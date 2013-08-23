---- fsel_control (body) --
---------------------------

with ada.text_io;
use ada.text_io;
with system;
with interfaces;	use interfaces;
with gnat.memory_dump;	use gnat.memory_dump;
with binary;	use binary;

-- this one represents my concept of control register manipulation
-- something like this will be built into the library
procedure fsel_control is

	A_W   : constant := system.word_size/system.storage_unit;
	M_b   : constant := 3;

	subtype   pin_mask           is unsigned_32;
	type      pin_mode           is range 0..7;
	for       pin_mode'size      use M_b;

	subtype      portaddr_type      is system.address;

	subtype   ctl_word_index     is natural range 0 .. 9;
	type      ctl_word_type      is array (ctl_word_index)
			of     pin_mode;

	subtype   ctl_block_index    is natural range 0 .. 5;
	type      ctl_block_type     is array
			(ctl_block_index, ctl_word_index)
			of     pin_mode;

	subtype   pin_index          is natural range 0 .. 53;
	type      bwm_map_pair       is
		record
			block : ctl_block_type;
			word  : ctl_word_type;
		end record;
	type      bwm_map_array      is array
			(pin_index)	of bwm_map_pair;

	type      ctl_ref            is access all pin_mode;
	type      ctl_ref_array      is array (pin_index)
			of ctl_ref;

	subtype   vctl_bit_index     is natural 
			range 0 .. (ctl_block_index'last+1-ctl_block_index'first)*32;
	type      vctl_array          is array (vctl_bit_index)
			of boolean;

	pin_mode_input  : pin_mode := 2#000#;
	pin_mode_output : pin_mode := 2#001#;
	pin_mode_alt_0  : pin_mode := 2#100#;
	pin_mode_alt_1  : pin_mode := 2#101#;
	pin_mode_alt_2  : pin_mode := 2#110#;
	pin_mode_alt_3  : pin_mode := 2#111#;
	pin_mode_alt_4  : pin_mode := 2#011#;
	pin_mode_alt_5  : pin_mode := 2#010#;

	type control_register is
		record
			pin00 :  pin_mode := pin_mode_input;
			pin01 :  pin_mode := pin_mode_input;
			pin02 :  pin_mode := pin_mode_input;
			pin03 :  pin_mode := pin_mode_input;
			pin04 :  pin_mode := pin_mode_input;
			pin05 :  pin_mode := pin_mode_input;
			pin06 :  pin_mode := pin_mode_input;
			pin07 :  pin_mode := pin_mode_input;
			pin08 :  pin_mode := pin_mode_input;
			pin09 :  pin_mode := pin_mode_input;
			pin10 :  pin_mode := pin_mode_input;
			pin11 :  pin_mode := pin_mode_input;
			pin12 :  pin_mode := pin_mode_input;
			pin13 :  pin_mode := pin_mode_input;
			pin14 :  pin_mode := pin_mode_input;
			pin15 :  pin_mode := pin_mode_input;
			pin16 :  pin_mode := pin_mode_input;
			pin17 :  pin_mode := pin_mode_input;
			pin18 :  pin_mode := pin_mode_input;
			pin19 :  pin_mode := pin_mode_input;
			pin20 :  pin_mode := pin_mode_input;
			pin21 :  pin_mode := pin_mode_input;
			pin22 :  pin_mode := pin_mode_input;
			pin23 :  pin_mode := pin_mode_input;
			pin24 :  pin_mode := pin_mode_input;
			pin25 :  pin_mode := pin_mode_input;
			pin26 :  pin_mode := pin_mode_input;
			pin27 :  pin_mode := pin_mode_input;
			pin28 :  pin_mode := pin_mode_input;
			pin29 :  pin_mode := pin_mode_input;
			pin30 :  pin_mode := pin_mode_input;
			pin31 :  pin_mode := pin_mode_input;
			pin32 :  pin_mode := pin_mode_input;
			pin33 :  pin_mode := pin_mode_input;
			pin34 :  pin_mode := pin_mode_input;
			pin35 :  pin_mode := pin_mode_input;
			pin36 :  pin_mode := pin_mode_input;
			pin37 :  pin_mode := pin_mode_input;
			pin38 :  pin_mode := pin_mode_input;
			pin39 :  pin_mode := pin_mode_input;
			pin40 :  pin_mode := pin_mode_input;
			pin41 :  pin_mode := pin_mode_input;
			pin42 :  pin_mode := pin_mode_input;
			pin43 :  pin_mode := pin_mode_input;
			pin44 :  pin_mode := pin_mode_input;
			pin45 :  pin_mode := pin_mode_input;
			pin46 :  pin_mode := pin_mode_input;
			pin47 :  pin_mode := pin_mode_input;
			pin48 :  pin_mode := pin_mode_input;
			pin49 :  pin_mode := pin_mode_input;
			pin50 :  pin_mode := pin_mode_input;
			pin51 :  pin_mode := pin_mode_input;
			pin52 :  pin_mode := pin_mode_input;
			pin53 :  pin_mode := pin_mode_input;
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

	fsel_reg : aliased control_register;

	-- ctl_n : bwm_map_array := (
	-- 	4 => (block => 0, word => 4),
	-- 	16 = (block => 16#20200000#, 18),
	-- 	);

	type inspect_array is array (ctl_block_index) of unsigned_32;
	pragma pack(inspect_array);
	ia : inspect_array := (ctl_block_index'first .. ctl_block_index'last => 0);
	--for fsel_reg'address use ia'address;
	for fsel_reg'alignment use 4;
	for ia'alignment use 4;
	for ia'address use fsel_reg'address;
	--pragma import( convention => ada, entity => ia );

	--for bit_array'bit_order use system.high_order_first;
	
	procedure fsel_4and7_out is
	begin
		fsel_reg.pin04 := pin_mode_output;
		fsel_reg.pin07 := pin_mode_output;
	end fsel_4and7_out;
                               
	procedure fsel_40and45_pwm is
	begin
		fsel_reg.pin00 := pin_mode_alt_3;
		fsel_reg.pin40 := pin_mode_alt_0;
		fsel_reg.pin45 := pin_mode_alt_0;
	end fsel_40and45_pwm;
                               
begin                          
	put_line("st_unit=" & A_W'img);
	dump(fsel_reg'address, (ctl_block_index'last+1)*A_W);
	dump(ia'address, (ctl_block_index'last+1)*A_W);
	for i in ctl_block_index'range loop
		put_line(bitfield_image(ia(i)));
	end loop;
	new_line;                
	fsel_4and7_out;
	dump(fsel_reg'address, (ctl_block_index'last+1)*A_W);
	dump(ia'address, (ctl_block_index'last+1)*A_W);
	for i in ctl_block_index'range loop
		put_line(bitfield_image(ia(i)));
	end loop;
	new_line;                
	fsel_40and45_pwm;
	dump(fsel_reg'address, (ctl_block_index'last+1)*A_W);
	dump(ia'address, (ctl_block_index'last+1)*A_W);
	for i in ctl_block_index'range loop
		put_line(bitfield_image(ia(i)));
	end loop;
	new_line;                
end fsel_control;              
                               



