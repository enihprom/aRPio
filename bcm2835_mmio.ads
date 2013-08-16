
with interfaces.c;	use interfaces.c;
with interfaces;	use interfaces;
with system;
with platform_mmio;
with constants;	use constants;
with types; use types;
with registers.i2c;
with registers.gpio;

with ada.real_time;	use ada.real_time;



package bcm2835_mmio is

	use registers;

	i2c_regs  : aliased i2c.i2c_address_map;
	for i2c_regs'address use platform_mmio.init(BCM2835_BSC1_OFFSET);
	pragma volatile(i2c_regs);

	gpio_regs : aliased gpio.gpio_address_map;
	for gpio_regs'address use platform_mmio.init(BCM2835_GPIO_OFFSET);
	pragma volatile(gpio_regs);

	-- todo map all devices
	-- ...

	-- function select fields to directly assign pin_mode's --------
	---------------------------------------------- function names --
	fpin_sda_fsel : gpio.pin_mode renames gpio_regs.fsel.pin02;
	fpin_scl_fsel : gpio.pin_mode renames gpio_regs.fsel.pin03;

	-- function select fields to directly assign pin_mode's --------
	---------------------------------------------- breakout names --
	bo_v1p1_03_fsel : gpio.pin_mode renames gpio_regs.fsel.pin00;
	bo_v1p1_05_fsel : gpio.pin_mode renames gpio_regs.fsel.pin01;
	bo_v1p1_07_fsel : gpio.pin_mode renames gpio_regs.fsel.pin04;
	bo_v1p1_08_fsel : gpio.pin_mode renames gpio_regs.fsel.pin14;
	bo_v1p1_10_fsel : gpio.pin_mode renames gpio_regs.fsel.pin15;
	bo_v1p1_11_fsel : gpio.pin_mode renames gpio_regs.fsel.pin17;
	bo_v1p1_12_fsel : gpio.pin_mode renames gpio_regs.fsel.pin18;
	bo_v1p1_13_fsel : gpio.pin_mode renames gpio_regs.fsel.pin21;
	bo_v1p1_15_fsel : gpio.pin_mode renames gpio_regs.fsel.pin22;
	bo_v1p1_16_fsel : gpio.pin_mode renames gpio_regs.fsel.pin23;
	bo_v1p1_18_fsel : gpio.pin_mode renames gpio_regs.fsel.pin24;
	bo_v1p1_19_fsel : gpio.pin_mode renames gpio_regs.fsel.pin10;
	bo_v1p1_21_fsel : gpio.pin_mode renames gpio_regs.fsel.pin09;
	bo_v1p1_22_fsel : gpio.pin_mode renames gpio_regs.fsel.pin25;
	bo_v1p1_23_fsel : gpio.pin_mode renames gpio_regs.fsel.pin11;
	bo_v1p1_24_fsel : gpio.pin_mode renames gpio_regs.fsel.pin08;
	bo_v1p1_26_fsel : gpio.pin_mode renames gpio_regs.fsel.pin07;

	bo_v2p1_03_fsel : gpio.pin_mode renames gpio_regs.fsel.pin02;
   bo_v2p1_05_fsel : gpio.pin_mode renames gpio_regs.fsel.pin03;
   bo_v2p1_07_fsel : gpio.pin_mode renames gpio_regs.fsel.pin04;
   bo_v2p1_08_fsel : gpio.pin_mode renames gpio_regs.fsel.pin14;
   bo_v2p1_10_fsel : gpio.pin_mode renames gpio_regs.fsel.pin15;
   bo_v2p1_11_fsel : gpio.pin_mode renames gpio_regs.fsel.pin17;
   bo_v2p1_12_fsel : gpio.pin_mode renames gpio_regs.fsel.pin18;
   bo_v2p1_13_fsel : gpio.pin_mode renames gpio_regs.fsel.pin27;
   bo_v2p1_15_fsel : gpio.pin_mode renames gpio_regs.fsel.pin22;
   bo_v2p1_16_fsel : gpio.pin_mode renames gpio_regs.fsel.pin23;
   bo_v2p1_18_fsel : gpio.pin_mode renames gpio_regs.fsel.pin24;
   bo_v2p1_19_fsel : gpio.pin_mode renames gpio_regs.fsel.pin10;
   bo_v2p1_21_fsel : gpio.pin_mode renames gpio_regs.fsel.pin09;
   bo_v2p1_22_fsel : gpio.pin_mode renames gpio_regs.fsel.pin25;
   bo_v2p1_23_fsel : gpio.pin_mode renames gpio_regs.fsel.pin11;
   bo_v2p1_24_fsel : gpio.pin_mode renames gpio_regs.fsel.pin08;
   bo_v2p1_26_fsel : gpio.pin_mode renames gpio_regs.fsel.pin07;
   bo_v2p5_03_fsel : gpio.pin_mode renames gpio_regs.fsel.pin28;
   bo_v2p5_04_fsel : gpio.pin_mode renames gpio_regs.fsel.pin29;
   bo_v2p5_05_fsel : gpio.pin_mode renames gpio_regs.fsel.pin30;
   bo_v2p5_06_fsel : gpio.pin_mode renames gpio_regs.fsel.pin31;


	-- high level convenience subprograms --------------------------
	------------------------------------------------- i2c-related --
	
	procedure i2c_begin;

	procedure i2c_end;

	procedure i2c_set_baudrate(baud : in     short_natural);

	procedure i2c_tx_send(
		data    : in     fifo_bytes;
		addr    : in     natural_7bit := i2c_regs.a.addr; 
		timeout : in     time_span    := to_time_span(0.1) );

	procedure i2c_tx_send(
		byte    : in    byte_natural;
		addr    : in    natural_7bit  := i2c_regs.a.addr;
		timeout : in    time_span     := to_time_span(0.1) );

	function  i2c_tx_read(
		addr    : in    natural_7bit  := i2c_regs.a.addr;
		timeout : in    time_span     := to_time_span(0.1) )
		return byte_natural;

	pragma inline_always(i2c_begin);
	pragma inline_always(i2c_end);
	pragma inline_always(i2c_set_baudrate);
	pragma inline_always(i2c_tx_send);
	pragma inline_always(i2c_tx_read);
	--pragma inline(i2c_tx_protocol);


	-- high level convenience subprograms --------------------------
	------------------------------------------------ gpio-related --

	procedure set_mode (pi :  in pin_index; mode  : in gpio.pin_mode);

	procedure set_state(pi :  in pin_index; state : in boolean);

	procedure flip_state(pi : in pin_index);

	procedure set (pi :  in pin_index);

	procedure clr (pi :  in pin_index);

	procedure mset(pm : in pin_mask);
	
	procedure mclr(pm : in pin_mask);

	function  get (pi :  in pin_index) return boolean;

	function  lev (pi :  in pin_index) return boolean 
		renames get;

	pragma inline_always(set_mode);
	pragma inline_always(set_state);
	pragma inline_always(flip_state);
	pragma inline_always(set);
	pragma inline_always(clr);
	pragma inline_always(mset);
	pragma inline_always(mclr);
	pragma inline_always(get);
	--pragma inline();
	
	-- todo 

end bcm2835_mmio;




