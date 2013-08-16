VARIANT=bcm2835_mmio
LRM=-gnato -gnatE -fstack-check
OPTI=-O2
#
# variants:
# thin    =  gpio-bcm2835.{a,so}
# native  =  bcm2835_mmio.{a,so}

all: build_all

build_all: build_tests build_libs

build_libs:	build_static_libs$(VARIANT) build_shared_libs$(VARIANT)

build_static_libs$(VARIANT):
	gnatmake $(LRM) $(OPTI) -static $(VARIANT)

build_shared_libs$(VARIANT):
	gnatmake $(LRM) $(OPTI) -shared $(VARIANT)


build_tests: build_test_mmio1 build_test_mmio2

clean:
	for f in test_*.adb ; do gnat clean $$f ; done

fake_mem:
	dd if=/dev/zero of=fake_dev_mem bs=4096 count=2053
	#use this size if you want to do original size mmio-testing
	#dd if=/dev/zero of=fake_dev_mem bs=4096 count=133132
	gnatmake -O3 bindump

mrproper: clean
	rm fake_dev_mem
	#rm *.dat

tests: test_mmio1 test_mmio2

build_test_mmio1:
	gnatmake -g -gnateDTest_Build test_mmio1

build_test_mmio2:
	gnatmake -g -gnateDTest_Build test_mmio2

test_mmio1: build_test_mmio1
	xterm -T "mmio1" -e ./fakememmon &
	./test_mmio1

test_mmio2: build_test_mmio2
	xterm -T "mmio2" -e ./fakememmon &
	./test_mmio2

help:
	@echo "(default)         build_tests"
	@echo "clean             runs gnatclean on test_*"
	@echo "fake_mem          creates a simulation memory file"
	@echo "test_XXX          builds and runs test_XXX"
	@echo "build_tests       builds all tests"
	@echo "build_libs        builds all libs"

