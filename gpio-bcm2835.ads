with model_specific; use model_specific;
with interfaces; use interfaces;
with interfaces.c; use interfaces.c;

-- broadcomm 2835 GPIO
-- mixed thick/thin binding 
-- cherrypicking and tightrope walking
-- 	overhead avoidance by type-safety vs. overhead ;)

package gpio is

	pragma linker_options("/usr/local/lib/libbcm2835.a");

	
	-- types 
	subtype   pin_mask           is unsigned_32;
	subtype   pin_control_index  is natural range 0 .. 9;
	type      pin_mode           is range 0 .. 7;
	for       pin_mode'size      use 3;
	type      port_type      	  is access unsigned_32;
	type      fsel_reg_type      is array (pin_control_index)
		                             of     pin_mode;
	type      fsel_regs_type     is array 
		(pinset10_control_index, pin_control_index) --?
		of     pin_mode;

	use type interfaces.c.int;


	-- constants
	HIGH : constant := 16#1#;  -- pin HIGH  =  true   =  3.3 V
	LOW  : constant := 16#0#;  -- pin LOW   =  false  =    0 V
	BCM2835_CORE_CLK_HZ : constant := 250000000; --< 250 MHz
	BCM2835_PERI_BASE   : constant := 16#20000000#;
	BCM2835_ST_BASE     : constant := (BCM2835_PERI_BASE + 16#3000#);
	BCM2835_GPIO_PADS   : constant := (BCM2835_PERI_BASE + 16#100000#);
	BCM2835_CLOCK_BASE  : constant := (BCM2835_PERI_BASE + 16#101000#);
	BCM2835_GPIO_BASE   : constant := (BCM2835_PERI_BASE + 16#200000#);
	BCM2835_SPI0_BASE   : constant := (BCM2835_PERI_BASE + 16#204000#);
	BCM2835_BSC0_BASE   : constant := (BCM2835_PERI_BASE + 16#205000#);
	BCM2835_GPIO_PWM    : constant := (BCM2835_PERI_BASE + 16#20C000#);
	BCM2835_BSC1_BASE   : constant := (BCM2835_PERI_BASE + 16#804000#);

	BCM2835_GPSET0      : constant := 16#001c#;
	BCM2835_GPCLR0      : constant := 16#0028#;
	BCM2835_GPSET0_by4      : constant := 16#001c#/4;
	BCM2835_GPCLR0_by4      : constant := 16#0028#/4;

	pin_mode_input  : pin_mode := 2#000#;
	pin_mode_output : pin_mode := 2#001#;
	pin_mode_alt_0  : pin_mode := 2#100#;
	pin_mode_alt_1  : pin_mode := 2#101#;
	pin_mode_alt_2  : pin_mode := 2#110#;
	pin_mode_alt_3  : pin_mode := 2#111#;
	pin_mode_alt_4  : pin_mode := 2#011#;
	pin_mode_alt_5  : pin_mode := 2#010#;


	-- hardware registers
	bcm2835_gpio  :  port_type;
	bcm2835_pwm   :  port_type;
	bcm2835_clk   :  port_type;
	bcm2835_pads  :  port_type;
	bcm2835_spi0  :  port_type;
	bcm2835_bsc0  :  port_type;
	bcm2835_bsc1  :  port_type;
	bcm2835_st    :  port_type;

	-- for the pure-ada solution drop this {
	pragma volatile(bcm2835_gpio);
	pragma volatile(bcm2835_pwm );
	pragma volatile(bcm2835_clk );
	pragma volatile(bcm2835_pads);
	pragma volatile(bcm2835_spi0);
	pragma volatile(bcm2835_bsc0);
	pragma volatile(bcm2835_bsc1);
	pragma volatile(bcm2835_st  );

	pragma import (c, bcm2835_gpio);
	pragma import (c, bcm2835_pwm );
	pragma import (c, bcm2835_clk );
	pragma import (c, bcm2835_pads);
	pragma import (c, bcm2835_spi0);
	pragma import (c, bcm2835_bsc0);
	pragma import (c, bcm2835_bsc1);
	pragma import (c, bcm2835_st  );
	-- } and start like this {
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
	--- i2c_byte_wait_us : interfaces.c.int;
	--- pragma import (c, i2c_byte_wait_us);

	-- thins
	function bcm2835_init return int;
	pragma import(c, bcm2835_init);

	function bcm2835_close return int;
	pragma import(c, bcm2835_close);

	procedure bcm2835_set_debug(debug : in unsigned_8);
	pragma import(c, bcm2835_set_debug);

	procedure bcm2835_gpio_fsel(pin, mode : in unsigned_8);
	pragma import(c, bcm2835_gpio_fsel);

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

	procedure bcm2835_gpio_set(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_set);

	procedure bcm2835_gpio_clr(pin : in unsigned_8);
	pragma import(c, bcm2835_gpio_clr);

	procedure bcm2835_gpio_set_multi(mask: in unsigned_32);
	pragma import(c, bcm2835_gpio_set_multi);

	procedure bcm2835_gpio_clr_multi(mask: in unsigned_32);
	pragma import(c, bcm2835_gpio_clr_multi);

	function bcm2835_gpio_lev(pin : in unsigned_8) return unsigned_8;
	pragma import(c, bcm2835_gpio_lev);

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


	-- encapsulations to make use of exceptions
	procedure init;
	procedure close;
	procedure set_debug(debug : in boolean := true);


	-- improved implementations renamed or de-prefix for distinction
	-- mostly untested and maybe dangerous 
	procedure set_mode(pi : in pin_index; mode : pin_mode); --fsel
	procedure set(pi : in pin_index);	pragma inline(set);
	procedure clr(pi : in pin_index);	pragma inline(clr);
	procedure mset(pm : in pin_mask);
	procedure mclr(pm : in pin_mask);
	function get(pi : in pin_index) return boolean;
	

	--todo encapsulate in protected type
	-- procedure peri_write (pa    : in paddr_type;	value : in unsigned_32);
	-- function  peri_read  (pa    : in paddr_type) return unsigned_32;

	gpio_error : exception;
	
end gpio;

