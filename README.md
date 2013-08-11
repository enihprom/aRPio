aRPio
=====

Ada library for bcm2835 gpio

project status:
  - thin binding to bcm2835.c including transition fragments for full-adaification
      existing but yet untested regarding electric in/out
  - softpwm package rpiservo. timing tests on a raspian PREEMTible kernel say jittering up to t_1*100 ;)
  2 test routines:
    test_gpio.adb 
    test_rpiservo.adb

further roadmap:
  currently in progress:
  - design considerations for adaification/purification
  - creating specific types for manipulating the function select bits, getting/setting pin states +  
      a new init-routine
  - project files
  planned:
  - portability branches or build-switches optimizing either kerneled/bareboard software
  - a complete bare-metal near but high level io framework like wiringPi
