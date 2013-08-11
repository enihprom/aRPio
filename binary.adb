----------------
-- binary.adb --
----------------

with ada.text_io; use ada.text_io;
with interfaces;  use interfaces;
with system;

package body binary is 

	function bitfield_image(ui : in unsigned_32) return string is 
		type bit_array is array (1..32) of boolean;
		pragma pack(bit_array);
		uint : unsigned_32 := ui ;
		bits : bit_array;
		for bits'address use uint'address;
		image_str : string(1..32);
		--for bit_array'bit_order use system.low_order_first;
		for bit_array'bit_order use system.high_order_first;
	begin

		--for i in reverse 1..32 loop
		for i in 1..32 loop
			if bits(i) then
				image_str(i) := '1';
			else
				image_str(i) := '0';
			end if;
		end loop;
		return image_str;
	end bitfield_image;

end binary;


