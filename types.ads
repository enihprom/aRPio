--------------------
---- types (spec) --
--------------------
with system;
with interfaces;	use interfaces;


package types is

	i2c_exception,
	not_implemented : exception;

	subtype      portaddr_type   is system.address;
	
	subtype   pin_mask_word_32   is unsigned_32;

	type nulx1_type is range 0 .. 0; --    this is it, the very
	for nulx1_type'size use 1;       -- <= smallest datatype ever

	type nulx3_type is range 0 .. 0;
	for nulx3_type'size use 3;

	type nulx4_type is range 0 .. 0;
	for nulx4_type'size use 4;

	type nulx11_type is range 0 .. 0;
	for nulx11_type'size use 11;

	type nulx16_type is range 0 .. 0;
	for nulx16_type'size use 16;

	type nulx24_type is range 0 .. 0;
	for nulx24_type'size use 24;

	type nulx25_type is range 0 .. 0;
	for nulx25_type'size use 25;

	type short_natural is range 0 .. 2**16-1;
	for short_natural'size use 16;

	type byte_natural  is range 0 .. 2**8-1;
	for byte_natural'size use 8;
 
	type natural_6bit  is range 0 .. 2**6-1;
	for natural_6bit'size use 6;

	type natural_7bit  is range 0 .. 2**7-1;
	for natural_7bit'size use 7;

	type natural_12bit is range 0 .. 2**12-1;
	for natural_12bit'size use 12;

	type byte_type is mod 2**8;

	-- i2c specific FIXME move
	subtype fifo_index is positive range 1 .. 16;
	type fifo_bytes is array (fifo_index) of byte_natural;

	subtype buffer_index is positive range 1 .. 2**16;
	type buffer_bytes is array (buffer_index) of byte_natural;
	--------------------------

	subtype bitindex_64 is natural range 0 .. 63;
	subtype bitindex_54 is natural range 0 .. 53;

	type bitarray_64 is array (bitindex_64) of boolean;
	type bitarray_54 is array (bitindex_54) of boolean;

	pragma pack(bitarray_64);
	pragma pack(bitarray_54);

	subtype   pin_index          is bitindex_54;
	subtype   pin_mask           is bitarray_54;

	
	


end types;



