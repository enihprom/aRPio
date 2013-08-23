-------------------------------
---- init_test_mmio1b (body) --
-------------------------------
with types;	use types;


package body init_test_mmio1b is

	procedure punch(b : in byte_natural) is
	begin
		xword.byte := b;
	end punch;
end init_test_mmio1b;



