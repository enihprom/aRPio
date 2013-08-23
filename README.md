aRPio
=====

Ada library for (RaspberryPi's) bcm2835 gpio


project status:

  - thin binding to bcm2835.c serving as door opener to play with
      including transition fragments for full-adaification
      existing but yet untested regarding electric in/out

  - softpwm package rpiservo. timing tests on a raspian PREEMTible kernel say jittering up to t_1*100 ;)

  - 2 test routines:
    test_gpio.adb 
    test_rpiservo.adb

  - 2 more important test routines:
    test_mmio1.adb
    test_mmio2.adb (an attempts to drive a harddisc motor)
	 and rpi_discmotor.c using libbcm2835.a as comparison
	 test_mmio3.adb (communicating w/ i2c-servo-driver)

  - many experimental main programs - stuff evolving to a test suite

  - real-hardware tests with real-burning transistors ;) expected and unexpected results 
    still being investigated


further roadmap:

 currently in progress:
  - gpio-/i2c-/pwm-/uart-routines 
  - yet more design considerations advantaging ada features
  - creating yet more specific types for manipulating higher level devices (almost done)
  - project files
  - remaking AdaFruit's PCA9685 pwm driver lib. well in ... Ada ;)

 planned:
  - portability branches or build-switches optimizing either kerneled/bareboard software
  - a complete bare-metal-near but high-level io framework like wiringPi + x with x primary aiming at 
      robotics, fabbing, research, micro-footprint-industry, engineering, etc.
