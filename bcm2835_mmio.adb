---------------------------
---- bcm2835_mmio (body) --
---------------------------

with 
	ada.real_time,
	constants,
	registers,
	registers.gpio;	 

use 
	ada.real_time,
	constants,
	registers;

with ada.text_io; use ada.text_io;
-- native ada implementation 
--
package body bcm2835_mmio is


	-- high level convenience subprograms --------------------------
	------------------------------------------------ gpio-related --

	procedure set_mode(pi : in pin_index; mode : in gpio.pin_mode) is
		use gpio;
	begin
		fsel_trep.words(
			fsel_mapping(pi).i_word
			).mpins(fsel_mapping(pi).i_mpin)	:= mode;
	exception
		when constraint_error =>
			raise nc_error with fsel_mapping(pi).not_connected'img;
	end set_mode;

	function  get_mode (pi :  in pin_index) return gpio.pin_mode is
		use gpio;
	begin
		return fsel_trep.words(
			fsel_mapping(pi).i_word
			).mpins(fsel_mapping(pi).i_mpin);
	exception
		when constraint_error =>
			raise nc_error with fsel_mapping(pi).not_connected'img;
	end get_mode;
	----------------------------------------------------------------	

	procedure set_state(pi :   in pin_index; state : in boolean) is
	begin
		case state is
			when true =>
				set(pi);
			when false =>
				clr(pi);
		end case;
	end set_state;

	----------------------------------------------------------------	

	procedure flip_state(pi : in pin_index) is
	begin
		set_state(pi, not lev(pi));
	end flip_state;

	----------------------------------------------------------------	

	procedure set_pedantic(pi :   in pin_index) is
		ba : pin_mask := (others => false);
	begin
		ba(pi) := true;
		pragma inspection_point(ba);
		gpio_regs.set := ba;
		gpio_regs.set := ba;
	end set_pedantic;

	----------------------------------------------------------------	

	procedure clr_pedantic(pi : in pin_index) is
		ba : pin_mask := (others => false);
	begin
		ba(pi) := true;
		pragma inspection_point(ba);
		gpio_regs.clr := ba;
		gpio_regs.clr := ba;
	end clr_pedantic;

	----------------------------------------------------------------	

	procedure set_lazy(pi :   in pin_index) is
	begin
		gpio_regs.set(pi) := true;
		gpio_regs.set(pi) := true;
	end set_lazy;

	----------------------------------------------------------------	

	procedure clr_lazy(pi : in pin_index) is
	begin
		gpio_regs.clr(pi) := true;
		gpio_regs.clr(pi) := true;
	end clr_lazy;

	----------------------------------------------------------------	

	procedure mset(pm : in pin_mask) is
	begin
		gpio_regs.set := pm;
		--gpio_regs.set := pm;
	end mset;
	
	----------------------------------------------------------------	

	procedure mclr(pm : in pin_mask) is
	begin
		gpio_regs.clr := pm;
		--gpio_regs.clr := pm;
	end mclr;

	----------------------------------------------------------------	

	function get(pi : in pin_index) return boolean is
	begin
		return gpio_regs.lev(pi);
	end get;



	-- high level convenience subprograms --------------------------
	------------------------------------------------- i2c-related --
	
	
	procedure i2c_begin is
	begin
		fpin_sda_fsel := gpio.pin_mode_alt_0;
		fpin_scl_fsel := gpio.pin_mode_alt_0;
		i2c_byte_wait_us := natural(
			(float(i2c_regs.div.cdiv) / float(BCM2835_CORE_CLK_HZ)) * 1000000.0 * 9.0);
	end i2c_begin;

	----------------------------------------------------------------	

	procedure i2c_end is 
	begin
		--fpin_sda_fsel := gpio.pin_mode_input;
		--fpin_scl_fsel := gpio.pin_mode_input;
		null;
	end i2c_end;

	----------------------------------------------------------------	

	procedure i2c_set_baudrate(baud : in short_natural)  is
		divider : short_natural := BCM2835_CORE_CLK_HZ/baud;
		--irgendwas mit ohv hp
	begin
		i2c_regs.div.cdiv := divider - (divider rem 2);
		-- i2c_byte_wait_us = 
		-- 	((float)divider / BCM2835_CORE_CLK_HZ) * 1000000 * 9;
	end i2c_set_baudrate;

	----------------------------------------------------------------	

	procedure i2c_tx_send(
		data     : in     fifo_bytes;
		addr     : in     natural_7bit  := i2c_regs.a.addr;
		timeout  : in     time_span     := to_time_span(0.1) )
	is
		enter : constant time := clock;
	begin
		begin
			i2c_regs.a.addr    := addr;
			i2c_regs.c.clear   := true;
			i2c_regs.s.clkt    := true;  
			i2c_regs.s.err     := true;
			i2c_regs.s.done    := true;
			i2c_regs.dlen.dlen := data'length;
		end;

		for b in data'range loop
			i2c_regs.fifo.data := byte_natural(b);
			--i2c_regs.fifo.nulx := nulx24_type'first;
		end loop;

		i2c_regs.c.i2cen   := true;
		i2c_regs.c.st      := true;

		loop
			exit when i2c_regs.s.done;
			if i2c_regs.s.err then
				raise i2c_exception with "S.ERR = HIGH";
			end if;
			if i2c_regs.s.clkt then
				raise i2c_exception with "S.CLKT = HIGH";
			end if;
			if clock > enter + timeout then
				raise i2c_timeout with "timeout";
			end if;
		end loop;
	end i2c_tx_send;

	----------------------------------------------------------------

	procedure i2c_tx_send(
		byte     : in     byte_natural;
		addr     : in     natural_7bit  := i2c_regs.a.addr;
		timeout  : in     time_span     := to_time_span(0.1) )
	is
		enter : constant time := clock;
	begin
		i2c_regs.a.addr    := addr;
		i2c_regs.c.clear   := true;
		i2c_regs.s.clkt    := true;  
		i2c_regs.s.err     := true;
		i2c_regs.s.done    := true;
		i2c_regs.dlen.dlen := 1;

		i2c_regs.fifo.data := byte_natural(byte);
		--i2c_regs.fifo.nulx := nulx24_type'first;

		i2c_regs.c.i2cen   := true;
		i2c_regs.c.st      := true;

		loop
			exit when i2c_regs.s.done;
			if i2c_regs.s.err then
				raise i2c_exception with "S.ERR = HIGH";
			end if;
			if i2c_regs.s.clkt then
				raise i2c_exception with "S.CLKT = HIGH";
			end if;
			if clock > enter + timeout then
				raise i2c_timeout with "timeout";
			end if;
		end loop;
	end i2c_tx_send;

	----------------------------------------------------------------

  	function i2c_tx_read(
  		addr     : in     natural_7bit  := i2c_regs.a.addr;
  		timeout  : in     time_span     := to_time_span(0.1) )
  		return byte_natural
  	is
  		enter : constant time := clock;
  		byte  : byte_natural;
  	begin
		byte := i2c_regs.fifo.data;
		if i2c_regs.s.done then
			return byte;
		else
			raise unexpected_data;
		end if;
  	end i2c_tx_read;

	----------------------------------------------------------------	

	function i2c_tx_read(
		addr     : in     natural_7bit  := i2c_regs.a.addr;
		nbytes   : in     short_natural  := 1;
		timeout  : in     time_span     := to_time_span(0.1) )
		return buffer_bytes
	is
		enter : constant time := clock;
		byte_buffer  : buffer_bytes(1 .. integer(nbytes));
		i     : buffer_index  := 0;
	begin

		i2c_regs.c.clear   := true;
		i2c_regs.s.clkt    := true;
		i2c_regs.s.err     := true;
		i2c_regs.s.done    := true;
		i2c_regs.dlen.dlen := nbytes;

		while not i2c_regs.s.done loop
			while i2c_regs.s.rxd loop
				byte_buffer(i) := i2c_regs.fifo.data;
				i := i+1;
			end loop;
		end loop;
		return byte_buffer;
	end i2c_tx_read;

	-- todo i2c_tx_protocol(seq : in protocol_type) is
	-- todo i2c_tx_... versions with modular_types

	----------------------------------------------------------------
	
	procedure shift_byte(
		hc164_config : in out hc164_config_type;
		byte         : in byte_natural)
	is
		type bits_array is array (1..8) of boolean;
		pragma pack(bits_array);
		ab : bits_array;
		bb : byte_natural;
		for bb'address use ab'address;
	begin
		bb := byte;
		for i in bits_array'first .. bits_array'last loop
			set_state(hc164_config.dsa_pin, ab(i));
			put(boolean'pos(ab(i))'img);
			delay 2.777e-08; -- ensure clock frequency below 36MHz
			set_state(hc164_config.clk_pin, true);
			delay 2.777e-08;
			set_state(hc164_config.clk_pin, false);
			delay 2.777e-08;
		end loop;
		new_line;
		-- todo asynchronous version of this procedure
	end shift_byte;

end bcm2835_mmio;
