---------------------------
---- bcm2835_mmio (body) --
---------------------------

with 
	ada.real_time,
	constants,
	registers;	 

use 
	ada.real_time,
	constants,
	registers;


package body bcm2835_mmio is

	procedure i2c_begin is
	begin
		fpin_sda_fsel := gpio.pin_mode_alt_0;
		fpin_scl_fsel := gpio.pin_mode_alt_0;
		--i2c_regs.div.cdiv;
		-- i2c_byte_wait_us = 
		-- 	((float)cdiv / BCM2835_CORE_CLK_HZ) * 1000000 * 9;
	end i2c_begin;

	procedure i2c_end is 
	begin
		fpin_sda_fsel := gpio.pin_mode_input;
		fpin_scl_fsel := gpio.pin_mode_input;
	end i2c_end;

	procedure i2c_set_baudrate(baud : in short_natural)  is
		divider : short_natural := BCM2835_CORE_CLK_HZ/baud;
		--irgendwas mit ohv hp
	begin
		i2c_regs.div.cdiv := divider - (divider rem 2);
		-- i2c_byte_wait_us = 
		-- 	((float)divider / BCM2835_CORE_CLK_HZ) * 1000000 * 9;
	end i2c_set_baudrate;

	procedure i2c_tx_send(
		data     : in     fifo_bytes;
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
		i2c_regs.dlen.dlen := data'length;

		for b in data'range loop
			i2c_regs.fifo.data := byte_natural(b);
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
			exit when clock > enter + timeout;
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
			exit when clock > enter + timeout;
		end loop;
	end i2c_tx_send;

	----------------------------------------------------------------

	function i2c_tx_read(
		addr     : in     natural_7bit  := i2c_regs.a.addr;
		timeout  : in     time_span     := to_time_span(0.1) )
		return byte_natural
	is
		enter : constant time := clock;
	begin
		return byte_natural(0);
	end i2c_tx_read;

	-- todo i2c_tx_protocol(seq : in protocol_type) is


	----------------------------------------------------------------
	----------------------------------------------------------------


	procedure set_mode(pi : in pin_index; mode : in gpio.pin_mode) is
	begin
		raise not_implemented with 
			"use breakout named fields instead " &
			"(like 'bo_v2p1_21_fsel := pin_mode_input;')" &
			"or implement it";
		--fsel_mapping(pi) := mode;
	end set_mode;

	procedure set_state(pi :   in pin_index; state : in boolean) is
	begin
		case state is
			when true =>
				gpio_regs.set(pi) := true;
			when false =>
				gpio_regs.clr(pi) := true;
		end case;
	end set_state;

	procedure flip_state(pi : in pin_index) is
	begin
		set_state(pi, not lev(pi));
	end flip_state;

	procedure set(pi :   in pin_index) is
	begin
		gpio_regs.set(pi) := true;
	end set;

	procedure clr(pi : in pin_index) is
	begin
		gpio_regs.clr(pi) := true;
	end clr;

	procedure mset(pm : in pin_mask) is
	begin
		gpio_regs.set := pm;
	end mset;
	
	procedure mclr(pm : in pin_mask) is
	begin
		gpio_regs.clr := pm;
	end mclr;

	function get(pi : in pin_index) return boolean is
	begin
		return gpio_regs.lev(pi);
	end get;
	
end bcm2835_mmio;



