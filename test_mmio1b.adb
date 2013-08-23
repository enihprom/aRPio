--------------------------------
---- test_bcm2835b_mmio (body) --
--------------------------------

with ada.text_io;    use ada.text_io;
with types;	use types;
with registers.gpio;	use registers.gpio;
with constants;	use constants;
with ada.command_line; use ada.command_line;
with init_test_mmio1b;	use init_test_mmio1b;



procedure test_mmio1b is

begin
	punch(byte_natural'value(argument(1)));
	put_line("dr?cking ze speicherschrott aufs auge b?h!");

end test_mmio1b;




