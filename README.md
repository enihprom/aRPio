aRPio
=====

ada library for (RaspberryPi's) bcm2835 gpio

project status:
  - thin binding to bcm2835.c serving as door opener to play with
      including transition fragments for full-adaification
      existing but yet untested regarding electric in/out
  - softpwm package rpiservo. timing tests on a raspian PREEMTible kernel say jittering up to t_1*100 ;)
  - 2 test routines:
    test_gpio.adb 
    test_rpiservo.adb
  - fsel_example.adb - a preview of my further design approach - but essentially useless & will go away

further roadmap:
  currently in progress:
  - design considerations for adaification/purification
  - creating specific types for manipulating the function select bits, getting/setting pin states +  
      a new init-routine
  - project files
  planned:
  - portability branches or build-switches optimizing either kerneled/bareboard software
  - a complete bare-metal-near but high-level io framework like wiringPi + x with x primary aiming at 
      robotics, fabbing, research, micro-footprint-industry, engineering, etc.
