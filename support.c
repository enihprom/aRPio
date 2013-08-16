#include <fcntl.h>
#include <unistd.h>
#include <sys/mman.h>
#include <stdio.h>

//#include <sys/stat.h>
//#include <sys/types.h>

#define BCM2835_PAGE_SIZE               (4*1024)
#define BCM2835_BLOCK_SIZE              (4*1024)

inline int flags_map_shared(void) {
	return MAP_SHARED;
}

inline int flags_prot_readwrite(void) {
	return (PROT_READ | PROT_WRITE);
}

inline int flags_o_readwritesync(void) {
	return (O_RDWR | O_SYNC);
}

int aRPio_memopen(const char *path, int flags) {
	if ((memfd = open(path, O_RDWR | O_SYNC) ) < 0)
	{    
		fprintf(stderr, 
				"aRPio_memopen: Unable to open /dev/mem: %s\n",
				strerror(errno)) ;
	}      
	return memfd;
}

static void *aRPio_memory_map(const char *subsys_name, size_t size, int fd, off_t off) 
{
	void *map = mmap(NULL, size, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, off);
	if (MAP_FAILED == map)
	{
		fprintf(stderr, "aRPio_memory_map: %s mmap failed: %s\n", subsys_name, strerror(errno));
	}
	return map;
}

static void aRPio_memory_unmap(void **pmem, size_t size)
{
	if (*pmem == MAP_FAILED) return;
	munmap(*pmem, size);
	*pmem = MAP_FAILED;
}

