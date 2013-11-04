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

	type short_natural is range 0 .. 2**16-1;
	for short_natural'size use 16;

	type byte_natural  is range 0 .. 2**8-1;
	for byte_natural'size use 8;
 
	type natural_7bit  is range 0 .. 2**7-1;
	for natural_7bit'size use 7;

	type natural_12bit is range 0 .. 2**12-1;
	for natural_12bit'size use 12;

	subtype fifo_index is positive range 1 .. 16;
	type fifo_bytes is array (fifo_index) of byte_natural;

	subtype bitindex_64 is natural range 0 .. 63;
	subtype bitindex_54 is natural range 0 .. 53;

	type bitarray_64 is array (bitindex_64) of boolean;
	type bitarray_54 is array (bitindex_54) of boolean;

	pragma pack(bitarray_64);
	pragma pack(bitarray_54);

	subtype   pin_index          is bitindex_54;
	subtype   pin_mask           is bitarray_54;

	
	


end types;



