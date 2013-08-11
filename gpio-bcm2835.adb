with interfaces; use interfaces;
with interfaces.c; --use interfaces.c;
with ada.text_io; use ada.text_io;
with system.machine_code; use system.machine_code;
with model_specific; use model_specific;
with system; use system;
with system.address_image;

package body gpio is
	

	procedure init is
	begin
		if bcm2835_init = 0 then
			raise gpio_error;
		end if;
		if debug_mode then
			put_line("aRPio: printing debug info");
			put_line("gpio-base-address=" & address_image(bcm2835_gpio'address));
		end if;
	end init;

	procedure close is
	begin
		if bcm2835_close = 0 then 
			raise gpio_error;
		end if;
	end close;

	procedure set_debug(debug : in boolean := true) is
	begin
		bcm2835_set_debug(unsigned_8(boolean'pos(debug)));
		debug_mode := debug;
	end set_debug;

	procedure set_mode(pi : in pin_index; mode : in pin_mode) is
	begin
		bcm2835_gpio_fsel(unsigned_8(pi), unsigned_8(mode));
	end set_mode;

	procedure set(pi :   in pin_index) is
	begin
		-- bcm2835_peri_write(bcm2835_gpio+BCM2835_GPSET0_by4, 
		-- 	shift_left(unsigned_8(pi)));
		-- todo
		-- test against
		bcm2835_gpio_set(unsigned_8(pi));
	end set;

	procedure clr(pi : in pin_index) is
	begin
		-- bcm2835_peri_write(bcm2835_gpio+BCM2835_GPSET0_by4, 
		-- 	shift_left(unsigned_8(pi)));
		bcm2835_gpio_set(unsigned_8(pi));
	end clr;

	procedure mset(pm : in pin_mask) is
	begin
		--bcm2835_peri_write(bcm2835_gpio+BCM2835_GPSET0_by4, pm);
		bcm2835_gpio_set_multi(unsigned_32(pm)); 
	end mset;
	
	procedure mclr(pm : in pin_mask) is
	begin
		--bcm2835_peri_write(bcm2835_gpio+BCM2835_GPCLR0_by4, pm);
		bcm2835_gpio_clr_multi(unsigned_32(pm)); 
	end mclr;

	function get(pi : in pin_index) return boolean is
	begin
		return boolean'val(bcm2835_gpio_lev(unsigned_8(pi))); 
	end get;
	
end gpio;
