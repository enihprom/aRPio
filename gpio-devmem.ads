
with
	model_specific, 
	interfaces,     
	interfaces.c,   
	types,
	constants;

use 
	model_specific,
	interfaces,
	interfaces.c, -- todo package if_c renames interfaces.c
	types,
	constants; 


-- skeleton package - officially declared as junk
-- left over for planned experiments with direct_io'ing on busses

package gpio is

	pragma linker_options("/usr/local/lib/libbcm2835.a");
	--todo pragma linker_options("support.a");

	-- todo mapped : bcm2835_mmio.mappings;
	-- mapped addresses
	bcm2835_gpio  :  system.address;
	for bcm2835_gpio'address use system.to_address(mapped.bcm2835_gpio_base);

	bcm2835_pwm   :  system.address;
	bcm2835_clk   :  system.address;
	bcm2835_pads  :  system.address;
	bcm2835_spi0  :  system.address;
	bcm2835_bsc0  :  system.address;
	bcm2835_bsc1  :  system.address;
	bcm2835_st    :  system.address;

	-- set(pin :..) is
	-- 	
	--    for bcm2835_gpio'address use mapped_bcm2835_gpio_gp;
	-- begin
	-- ...
	--
	-- fsel(pin : pin_control_index; mode : ...) is
	-- 	fsel_reg : fsel_reg_type := to_fsel_reg(pin/3);
	-- 	for fsel_reg'address use ...
	-- begin
	-- 	fsel_reg(pin) := mode;
	-- end
	-- ...
	-- or even
	-- ...
	-- fsel(pin : pin_index; mode : ...) is
	-- 	fsel_regs : fsel_regs_type;
	-- 	for fsel_regs'address use ...
	-- begin
	-- 	fsel_regs(pin) := mode;
	-- end
	-- }
	
	-- status variables
	debug_mode            : boolean := false;

	-- native versions
	function init return system.address;
	procedure close;
	procedure set_debug(debug : in boolean := true);
	procedure set_mode(pi : in pin_index; mode : pin_mode); --fsel
	procedure set(pi : in pin_index);
	procedure clr(pi : in pin_index);
	procedure mset(pm : in pin_mask);
	procedure mclr(pm : in pin_mask);
	function get(pi : in pin_index) return boolean;
	
	pragma inline(init);
	pragma inline(close);
	pragma inline(set_debug);
	pragma inline(set_mode);
	pragma inline(set);
	pragma inline(clr);
	pragma inline(mset);
	pragma inline(mclr);
	pragma inline(get);
	

	--todo encapsulate in protected type
	-- procedure peri_write (pa    : in paddr_type;	value : in unsigned_32);
	-- function  peri_read  (pa    : in paddr_type) return unsigned_32;

	gpio_error : exception;


	-- todo these are lleft to reimplement
	procedure bcm2835_peri_set_bits(
		paddr         :     portaddr_type;
		value, mask   : in     unsigned_32);
	pragma import(c, bcm2835_peri_set_bits);

	procedure bcm2835_peri_read(
		paddr         :     portaddr_type);
	pragma import(c, bcm2835_peri_read);

	procedure bcm2835_peri_write(
		paddr         :     portaddr_type;
		value         : in     unsigned_32);
	pragma import(c, bcm2835_peri_write);

	procedure bcm2835_peri_read_nb(
		paddr         :     portaddr_type);
	pragma import(c, bcm2835_peri_read_nb);

	procedure bcm2835_peri_write_nb(
		paddr         :     portaddr_type;
		value         : in     unsigned_32);
	pragma import(c, bcm2835_peri_write_nb);


	function bcm2835_gpio_eds(pin : in unsigned_8) return unsigned_8;
	pragma import(c, bcm2835_gpio_eds);

	procedure bcm2835_gpio_set_eds(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_set_eds);

	procedure bcm2835_gpio_ren(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_ren);

	procedure bcm2835_gpio_clr_ren(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_clr_ren);

	procedure bcm2835_gpio_fen(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_fen);

	procedure bcm2835_gpio_clr_fen(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_clr_fen);

	procedure bcm2835_gpio_hen(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_hen);

	procedure bcm2835_gpio_clr_hen(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_clr_hen);

	procedure bcm2835_gpio_len(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_len);

	procedure bcm2835_gpio_clr_len(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_clr_len);

	procedure bcm2835_gpio_aren(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_aren);

	procedure bcm2835_gpio_clr_aren(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_clr_aren);

	procedure bcm2835_gpio_afen(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_afen);

	procedure bcm2835_gpio_clr_afen(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_clr_afen);

	procedure bcm2835_gpio_pud(pud : in unsigned_8);
	pragma import(c, bcm2835_gpio_pud);

	procedure bcm2835_gpio_pudclk(pud : in unsigned_8);
	pragma import(c, bcm2835_gpio_pudclk);

	function bcm2835_gpio_pad(group : in unsigned_8) return unsigned_32;	
	pragma import(c, bcm2835_gpio_pad);

	procedure bcm2835_gpio_set_pad(
		group : in unsigned_8; control : in unsigned_32);
	pragma import(c, bcm2835_gpio_set_pad);



	
end gpio;

