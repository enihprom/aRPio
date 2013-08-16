#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdio.h>

#ifdef LET_THERE_BE_A_TYPE
static const char *_a_type = LET_THERE_BE_C_TYPE;
#define pkg_before "with interfaces.c; use interfaces.c;\n\n"
#else
static const char *_a_type = "";
#define pkg_before "-- to be safe and portability-style compliant\n\n"
#endif

#ifdef LET_THERE_BE_C_TYPE
typedef LET_THERE_BE_C_TYPE   const_type;
#else                          
typedef int                   const_type;
#endif

#define pkg_begin  "package platform_constants is\n"

#define pkg_end    "end platform_constants;\n"


static const const_type _platform_map_shared = MAP_SHARED;
static const const_type _platform_prot_rw    = (PROT_READ | PROT_WRITE);
static const const_type _platform_open_rw    = (O_RDWR | O_SYNC);
static const const_type _platform_null       = (const_type)NULL;
static const const_type _platform_map_failed = (const_type)MAP_FAILED;

int main(void) {

	printf(pkg_before);
	printf(pkg_begin);

	printf(  "\tMAP_SHARED    : constant %s := %d;\n", _a_type, (int)_platform_map_shared  ); 
	printf(  "\tPROT_RW       : constant %s := %d;\n", _a_type, (int)_platform_prot_rw     ); 
	printf(  "\tO_RW_SYNC     : constant %s := %d;\n", _a_type, (int)_platform_open_rw     ); 
	printf(  "\tNULL_ADDRESS  : constant %s := %d;\n", _a_type, (int)_platform_null        ); 
	printf(  "\tMAP_FAILED    : constant %s := %d;\n", _a_type, (int)_platform_map_failed  ); 

	printf(pkg_end);

	return(0);
}
