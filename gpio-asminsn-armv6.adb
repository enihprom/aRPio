with interfaces; use interfaces;
with ada.text_io; use ada.text_io;
with system.machine_code; use system.machine_code;
with model_specific; use model_specific;


-- todo get the asm code working against and in spite of the asminsn-stuff
--      or understand it - in a lifetime

package body gpio is

	--function "+"(l,r : in natural) return unsigned_32 is
	--begin	
	--	return unsigned_32(l+r);
	--end "+";
	--pragma inline("+");

	--function "*"(l,r : in natural) return unsigned_32 is
	--begin	
	--	return unsigned_32(l+r);
	--end "*";
	--pragma inline("*");

	--procedure init(reg : unsigned_32 := 16#0#) is
	--	reg : unsigned_32 := unsigned_32((pi-rpi)/10*4);
	--begin
	--	asm ("ldr r0,=%0",
	--		inputs  => unsigned_32'asm_input ("a", reg+16#20200000#));
	--end init;
	--pragma inline(init);

	procedure set(pi :   in pin_index; state : in boolean := true) is
		rpi : reg_pin_index := pi rem 10;
		reg : unsigned_32 := unsigned_32((pi-rpi)/10*4);
	begin
		-- set control register
		asm ("ldr r0,%0",
			inputs  => unsigned_32'asm_input ("a", reg+16#20200000#),
			volatile => true);
		-- set control bits
		asm("mov r1,#1", volatile => true);
		asm("lsl r1,%0",
			inputs => unsigned_32'asm_input ("a", unsigned_32(rpi*3)),
			volatile => true);
		asm("str r1,[r0,#%0]",
			inputs => unsigned_32'asm_input ("a", reg),
			volatile => true);
		-- clear pin
		asm("mov r1,#1", volatile => true);
		asm("lsl r1,#%0",
			inputs => unsigned_32'asm_input ("a", unsigned_32(pi)),
			volatile => true);
		asm("str r1,[r0,#%0]",
			inputs => unsigned_32'asm_input ("a", 16#20200028#),
			volatile => true);
	end set;
	pragma inline(set);

	--procedure gset(pi :   in pin_index; state : in boolean := true) is
	--begin
	--	set(pi,state);
	--end gset;
	--pragma inline(gset);

	procedure unset(pi : in pin_index) is
	begin
		set(pi, false);
	end unset;
	pragma inline(unset);

	function get(pi : in pin_index) return boolean is
		not_impl : exception;
	begin
		raise not_impl;
		return false;
	end get;
	
end gpio;
