-- to be safe and portability-style compliant

package platform_constants is
	MAP_SHARED    : constant  := 1;
	PROT_RW       : constant  := 3;
	O_RW_SYNC     : constant  := 1052674;
	NULL_ADDRESS  : constant  := 0;
	MAP_FAILED    : constant  := -1;
end platform_constants;
