with model_specific; use model_specific;
with interfaces; use interfaces;

package gpio  is

	type port is array (pin_index) of boolean;
	pragma pack(port);

	procedure init;

	procedure set_debug(debug : in boolean := true);

	procedure set(pi   : in pin_index; state : in boolean := true);
	procedure unset(pi : in pin_index);

	function get(pi : in pin_index) return boolean;
	
	procedure close;

	gpio_error : exception;
	
end gpio;
