----------------
-- binary.ads --
----------------

with ada.text_io; use ada.text_io;
with interfaces;  use interfaces;
with system;

package binary is 

	function bitfield_image(ui : in unsigned_32) return string;

end binary;


