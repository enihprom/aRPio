all: tests

tests:
	for f in test_*.adb ; do gnatmake -T0 $$f ; done

