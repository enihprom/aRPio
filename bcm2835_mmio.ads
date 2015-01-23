
--with interfaces.c;	use interfaces.c;
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

	i2c_regs  : i2c.i2c_address_map;
	for i2c_regs'address use platform_mmio.init(BCM2835_BSC1_OFFSET);
	pragma volatile(i2c_regs);

	gpio_regs : gpio.gpio_address_map;
	for gpio_regs'address use platform_mmio.init(BCM2835_GPIO_OFFSET);
	pragma volatile(gpio_regs);

	--fsel_trep : gpio.fsel_table;
	--for fsel_trep'address use gpio_regs.fsel'address;
	
	fsel_trep : gpio.control_register_array_record renames gpio_regs.fsel;

	-- todo map all devices
	-- ...

	-- function select fields to directly assign pin_mode's --------
	---------------------------------------------- breakout names --
	
	fsel_headerp1_pin03 : gpio.pin_mode renames fsel_trep.words(gpio.fsel_mapping(RPI_V2_GPIO_P1_03).i_word).mpins(gpio.fsel_mapping(RPI_V2_GPIO_P1_03).i_mpin);

	fsel_headerp1_pin05 : gpio.pin_mode renames fsel_trep.words(gpio.fsel_mapping(RPI_V2_GPIO_P1_05).i_word).mpins(gpio.fsel_mapping(RPI_V2_GPIO_P1_05).i_mpin);

	fsel_headerp1_pin07 : gpio.pin_mode renames fsel_trep.words(gpio.fsel_mapping(RPI_V2_GPIO_P1_07).i_word).mpins(gpio.fsel_mapping(RPI_V2_GPIO_P1_07).i_mpin);

	--todo
--	bo_v1p1_03_fsel : gpio.pin_mode renames gpio.fsel_mapping(00);
--	bo_v1p1_05_fsel : gpio.pin_mode renames gpio.fsel_mapping(01);
--	bo_v1p1_07_fsel : gpio.pin_mode renames gpio.fsel_mapping(04);
--	bo_v1p1_08_fsel : gpio.pin_mode renames gpio.fsel_mapping(14);
--	bo_v1p1_10_fsel : gpio.pin_mode renames gpio.fsel_mapping(15);
--	bo_v1p1_11_fsel : gpio.pin_mode renames gpio.fsel_mapping(17);
--	bo_v1p1_12_fsel : gpio.pin_mode renames gpio.fsel_mapping(18);
--	bo_v1p1_13_fsel : gpio.pin_mode renames gpio.fsel_mapping(21);
--	bo_v1p1_15_fsel : gpio.pin_mode renames gpio.fsel_mapping(22);
--	bo_v1p1_16_fsel : gpio.pin_mode renames gpio.fsel_mapping(23);
--	bo_v1p1_18_fsel : gpio.pin_mode renames gpio.fsel_mapping(24);
--	bo_v1p1_19_fsel : gpio.pin_mode renames gpio.fsel_mapping(10);
--	bo_v1p1_21_fsel : gpio.pin_mode renames gpio.fsel_mapping(09);
--	bo_v1p1_22_fsel : gpio.pin_mode renames gpio.fsel_mapping(25);
--	bo_v1p1_23_fsel : gpio.pin_mode renames gpio.fsel_mapping(11);
--	bo_v1p1_24_fsel : gpio.pin_mode renames gpio.fsel_mapping(08);
--	bo_v1p1_26_fsel : gpio.pin_mode renames gpio.fsel_mapping(07);
--
--	bo_v2p1_03_fsel : gpio.pin_mode renames gpio.fsel_mapping(02);
--   bo_v2p1_05_fsel : gpio.pin_mode renames gpio.fsel_mapping(03);
--   bo_v2p1_07_fsel : gpio.pin_mode renames gpio.fsel_mapping(04);
--   bo_v2p1_08_fsel : gpio.pin_mode renames gpio.fsel_mapping(14);
--   bo_v2p1_10_fsel : gpio.pin_mode renames gpio.fsel_mapping(15);
--   bo_v2p1_11_fsel : gpio.pin_mode renames gpio.fsel_mapping(17);
--   bo_v2p1_12_fsel : gpio.pin_mode renames gpio.fsel_mapping(18);
--   bo_v2p1_13_fsel : gpio.pin_mode renames gpio.fsel_mapping(27);
--   bo_v2p1_15_fsel : gpio.pin_mode renames gpio.fsel_mapping(22);
--   bo_v2p1_16_fsel : gpio.pin_mode renames gpio.fsel_mapping(23);
--   bo_v2p1_18_fsel : gpio.pin_mode renames gpio.fsel_mapping(24);
--   bo_v2p1_19_fsel : gpio.pin_mode renames gpio.fsel_mapping(10);
--   bo_v2p1_21_fsel : gpio.pin_mode renames gpio.fsel_mapping(09);
--   bo_v2p1_22_fsel : gpio.pin_mode renames gpio.fsel_mapping(25);
--   bo_v2p1_23_fsel : gpio.pin_mode renames gpio.fsel_mapping(11);
--   bo_v2p1_24_fsel : gpio.pin_mode renames gpio.fsel_mapping(08);
--   bo_v2p1_26_fsel : gpio.pin_mode renames gpio.fsel_mapping(07);
--   bo_v2p5_03_fsel : gpio.pin_mode renames gpio.fsel_mapping(28);
--   bo_v2p5_04_fsel : gpio.pin_mode renames gpio.fsel_mapping(29);
--   bo_v2p5_05_fsel : gpio.pin_mode renames gpio.fsel_mapping(30);
--   bo_v2p5_06_fsel : gpio.pin_mode renames gpio.fsel_mapping(31);

	-- function select fields to directly assign pin_mode's --------
	---------------------------------------------- function names --
	------------------------- (pins having that function on alt0) --
	fpin_sda_fsel   : gpio.pin_mode renames fsel_trep.words(gpio.fsel_mapping(RPI_V2_GPIO_P1_03).i_word).mpins(gpio.fsel_mapping(RPI_V2_GPIO_P1_03).i_mpin);

	fpin_scl_fsel   : gpio.pin_mode renames fsel_trep.words(gpio.fsel_mapping(RPI_V2_GPIO_P1_05).i_word).mpins(gpio.fsel_mapping(RPI_V2_GPIO_P1_05).i_mpin);

	--fpin_txd0_fsel  : gpio.pin_mode renames gpio_regs.fsel.pin14;
	--fpin_rxd0_fsel  : gpio.pin_mode renames gpio_regs.fsel.pin15;



	-- high level convenience subprograms --------------------------
	------------------------------------------------ gpio-related --

	procedure set_mode (pi :  in pin_index; mode  : in gpio.pin_mode);
	function  get_mode (pi :  in pin_index) return gpio.pin_mode;

	procedure set_state(pi :  in pin_index; state : in boolean);

	procedure flip_state(pi : in pin_index);

	procedure set_lazy (pi :  in pin_index);

	procedure clr_lazy (pi :  in pin_index);

	procedure set_pedantic (pi :  in pin_index);

	procedure clr_pedantic (pi :  in pin_index);

	procedure clr(pi : in pin_index) renames clr_pedantic;
	
	procedure set(pi : in pin_index) renames set_pedantic;

	procedure mset(pm : in pin_mask);
	
	procedure mclr(pm : in pin_mask);

	function  get (pi :  in pin_index) return boolean;

	function  lev (pi :  in pin_index) return boolean 
		renames get;

	--pragma inline_always(set_state);
	pragma inline_always(flip_state);
	pragma inline_always(set);
	pragma inline_always(clr);
	--pragma inline_always(set_lazy);
	--pragma inline_always(clr_lazy);
	--pragma inline_always(mset);
	--pragma inline_always(mclr);
	pragma inline_always(get);
	--pragma inline();
	
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

	function i2c_tx_read(
		addr     : in     natural_7bit  := i2c_regs.a.addr;
		nbytes   : in     short_natural  := 1;
		timeout  : in     time_span     := to_time_span(0.1) )
		return buffer_bytes;

	--pragma inline_always(i2c_begin);
	--pragma inline_always(i2c_end);
	--pragma inline_always(i2c_set_baudrate);
	--pragma inline_always(i2c_tx_send);
	--pragma inline_always(i2c_tx_read);
	--pragma inline(i2c_tx_protocol);

	i2c_byte_wait_us : natural;

	-- todo 
	

	type hc164_config_type is
		record
			dsa_pin   : pin_index;
			clk_pin   : pin_index;
			clk_state : boolean;
		end record;

	procedure shift_byte(
		hc164_config : in out hc164_config_type;
		byte         : in byte_natural);

end bcm2835_mmio;




