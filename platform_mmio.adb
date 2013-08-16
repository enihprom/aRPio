---------------------------
---- bcm2835_mmio (body) --
---------------------------

with system;	use system;
with system.address_image;
with system.storage_elements;
with interfaces;	use interfaces;
with interfaces.c;	use interfaces.c;
with interfaces.c.strings;	use interfaces.c.strings;
with types;	use types;
with constants;	use constants;
with ada.text_io;	use ada.text_io;


package body platform_mmio is

	map_error,
	mmio_error,
	bullshit_error
		: exception;

	package sse renames system.storage_elements;

	function init(
			subsystem_offset : in sse.storage_offset)
		return system.address 
	is
		subtype off_t is long;
		subtype c_string is interfaces.c.strings.chars_ptr;

   	type mmap_prot is mod interfaces.c.int'last;
	   for mmap_prot'size use interfaces.c.int'size;
		type mmap_flags is mod interfaces.c.int'last;
		for mmap_flags'size use interfaces.c.int'size;
		type open_flags is mod interfaces.c.int'last;
		for open_flags'size use interfaces.c.int'size;

		NEUTRAL_ADDRESS    : constant system.address
				:= system.null_address;

		-- MAP_FAILED         : constant system.address
		-- 		:= sse.to_address(sse.storage_offset(pf.MAP_FAILED));

		MAP_FAILED         : constant system.address
				:= sse.to_address(-1);

		PROT_RW            : constant mmap_prot  := pf.PROT_RW;
		O_RW_SYNC          : constant open_flags := pf.O_RW_SYNC;
		MAP_SHARED         : constant mmap_flags := pf.MAP_SHARED;

		BCM2835_PAGE_SIZE  : constant := (4*1024);
		BCM2835_BLOCK_SIZE : constant := (4*1024);

		BCM2835_PERI_BASE  : constant := 16#20_000_000#;
		BCM2835_GPIO_BASE  : constant := (BCM2835_PERI_BASE + 16#200_000#);

		BCM2835_BSC0_BASE  : constant := (BCM2835_PERI_BASE + 16#205_000#);


		function open(path : c_string; flags : open_flags)
			return int;

		function getpagesize return int;

		function mmap
			 (addr : system.address := NEUTRAL_ADDRESS;
			  len : size_t;
			  prot : mmap_prot;
			  flags : mmap_flags;
			  fd : int; 
			  offset : off_t)
			  return system.address; 

		function munmap(
			addr : system.address;
			len : size_t) return int;

		pragma import(c, mmap);
		pragma import(c, munmap);
		pragma import(c, open);
		pragma import(c, getpagesize);

		procedure memory_unmap(addr : in system.address; len : in natural) is
		begin
			if munmap(addr, size_t(len)) = int(-1) then
				raise map_error with "munmap failed";
			end if;
		end memory_unmap;

	begin
		declare
			memfd : int;
		begin

			#if Test_Build'Defined
			memfd := open( new_string("./fake_dev_mem"), pf.O_RW_SYNC );
			#else
			memfd := open( new_string("/dev/mem"), pf.O_RW_SYNC );
			#end if;

			if memfd < int(0) then
				raise mmio_error with "open failed";
			end if;
			declare
				use sse; -- for "+"
				PERI_BASE : constant system.address
					:= to_address(BCM2835_PERI_BASE);

				-- change the base address to fit in fake_mem
				-- for the size reduced control-register tests to run
				#if Test_Build'Defined
				subsystem_address : system.address 
					:= NEUTRAL_ADDRESS + subsystem_offset;
				#else
				subsystem_address : system.address 
					:= PERI_BASE + subsystem_offset;
				#end if;

				off_int : off_t := 
					off_t(to_integer(subsystem_address));

				io_address : constant system.address 
					:= mmap(
					NEUTRAL_ADDRESS, BCM2835_BLOCK_SIZE, pf.PROT_RW,
					pf.MAP_SHARED, memfd, off_int);
			begin
				if	io_address = MAP_FAILED then
					raise map_error with "mmap failed";
				end if;
				return io_address;
			end;
		end;
	end init;

	function init0 return unsigned_32 is
	begin
		return 16#0#;
	end init0;

end platform_mmio;


-- snippet to examine vars before calling mmap

-- put_line(
-- 		" PERI_BASE=" & address_image(PERI_BASE) &
-- 		" subsystem_offset=" & subsystem_offset'img &
-- 		" subsystem_address=" & address_image(subsystem_address) &
-- 		" off_int=" & off_int'img &
-- 		" io_address=" & address_image(io_address) &
-- 		" MAP_FAILED=" & address_image(MAP_FAILED) );
