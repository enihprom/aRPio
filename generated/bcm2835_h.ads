with Interfaces.C; use Interfaces.C;
with stdint_h;
with Interfaces.C.Strings;

package bcm2835_h is

   --  unsupported macro: HIGH 0x1
   --  unsupported macro: LOW 0x0
   --  unsupported macro: BCM2835_CORE_CLK_HZ 250000000
   --  unsupported macro: BCM2835_PERI_BASE 0x20000000
   --  unsupported macro: BCM2835_ST_BASE (BCM2835_PERI_BASE + 0x3000)
   --  unsupported macro: BCM2835_GPIO_PADS (BCM2835_PERI_BASE + 0x100000)
   --  unsupported macro: BCM2835_CLOCK_BASE (BCM2835_PERI_BASE + 0x101000)
   --  unsupported macro: BCM2835_GPIO_BASE (BCM2835_PERI_BASE + 0x200000)
   --  unsupported macro: BCM2835_SPI0_BASE (BCM2835_PERI_BASE + 0x204000)
   --  unsupported macro: BCM2835_BSC0_BASE (BCM2835_PERI_BASE + 0x205000)
   --  unsupported macro: BCM2835_GPIO_PWM (BCM2835_PERI_BASE + 0x20C000)
   --  unsupported macro: BCM2835_BSC1_BASE (BCM2835_PERI_BASE + 0x804000)
   --  unsupported macro: BCM2835_PAGE_SIZE (4*1024)
   --  unsupported macro: BCM2835_BLOCK_SIZE (4*1024)
   --  unsupported macro: BCM2835_GPFSEL0 0x0000
   --  unsupported macro: BCM2835_GPFSEL1 0x0004
   --  unsupported macro: BCM2835_GPFSEL2 0x0008
   --  unsupported macro: BCM2835_GPFSEL3 0x000c
   --  unsupported macro: BCM2835_GPFSEL4 0x0010
   --  unsupported macro: BCM2835_GPFSEL5 0x0014
   --  unsupported macro: BCM2835_GPSET0 0x001c
   --  unsupported macro: BCM2835_GPSET1 0x0020
   --  unsupported macro: BCM2835_GPCLR0 0x0028
   --  unsupported macro: BCM2835_GPCLR1 0x002c
   --  unsupported macro: BCM2835_GPLEV0 0x0034
   --  unsupported macro: BCM2835_GPLEV1 0x0038
   --  unsupported macro: BCM2835_GPEDS0 0x0040
   --  unsupported macro: BCM2835_GPEDS1 0x0044
   --  unsupported macro: BCM2835_GPREN0 0x004c
   --  unsupported macro: BCM2835_GPREN1 0x0050
   --  unsupported macro: BCM2835_GPFEN0 0x0058
   --  unsupported macro: BCM2835_GPFEN1 0x005c
   --  unsupported macro: BCM2835_GPHEN0 0x0064
   --  unsupported macro: BCM2835_GPHEN1 0x0068
   --  unsupported macro: BCM2835_GPLEN0 0x0070
   --  unsupported macro: BCM2835_GPLEN1 0x0074
   --  unsupported macro: BCM2835_GPAREN0 0x007c
   --  unsupported macro: BCM2835_GPAREN1 0x0080
   --  unsupported macro: BCM2835_GPAFEN0 0x0088
   --  unsupported macro: BCM2835_GPAFEN1 0x008c
   --  unsupported macro: BCM2835_GPPUD 0x0094
   --  unsupported macro: BCM2835_GPPUDCLK0 0x0098
   --  unsupported macro: BCM2835_GPPUDCLK1 0x009c
   --  unsupported macro: BCM2835_PADS_GPIO_0_27 0x002c
   --  unsupported macro: BCM2835_PADS_GPIO_28_45 0x0030
   --  unsupported macro: BCM2835_PADS_GPIO_46_53 0x0034
   --  unsupported macro: BCM2835_PAD_PASSWRD (0x5A << 24)
   --  unsupported macro: BCM2835_PAD_SLEW_RATE_UNLIMITED 0x10
   --  unsupported macro: BCM2835_PAD_HYSTERESIS_ENABLED 0x08
   --  unsupported macro: BCM2835_PAD_DRIVE_2mA 0x00
   --  unsupported macro: BCM2835_PAD_DRIVE_4mA 0x01
   --  unsupported macro: BCM2835_PAD_DRIVE_6mA 0x02
   --  unsupported macro: BCM2835_PAD_DRIVE_8mA 0x03
   --  unsupported macro: BCM2835_PAD_DRIVE_10mA 0x04
   --  unsupported macro: BCM2835_PAD_DRIVE_12mA 0x05
   --  unsupported macro: BCM2835_PAD_DRIVE_14mA 0x06
   --  unsupported macro: BCM2835_PAD_DRIVE_16mA 0x07
   --  unsupported macro: BCM2835_SPI0_CS 0x0000
   --  unsupported macro: BCM2835_SPI0_FIFO 0x0004
   --  unsupported macro: BCM2835_SPI0_CLK 0x0008
   --  unsupported macro: BCM2835_SPI0_DLEN 0x000c
   --  unsupported macro: BCM2835_SPI0_LTOH 0x0010
   --  unsupported macro: BCM2835_SPI0_DC 0x0014
   --  unsupported macro: BCM2835_SPI0_CS_LEN_LONG 0x02000000
   --  unsupported macro: BCM2835_SPI0_CS_DMA_LEN 0x01000000
   --  unsupported macro: BCM2835_SPI0_CS_CSPOL2 0x00800000
   --  unsupported macro: BCM2835_SPI0_CS_CSPOL1 0x00400000
   --  unsupported macro: BCM2835_SPI0_CS_CSPOL0 0x00200000
   --  unsupported macro: BCM2835_SPI0_CS_RXF 0x00100000
   --  unsupported macro: BCM2835_SPI0_CS_RXR 0x00080000
   --  unsupported macro: BCM2835_SPI0_CS_TXD 0x00040000
   --  unsupported macro: BCM2835_SPI0_CS_RXD 0x00020000
   --  unsupported macro: BCM2835_SPI0_CS_DONE 0x00010000
   --  unsupported macro: BCM2835_SPI0_CS_TE_EN 0x00008000
   --  unsupported macro: BCM2835_SPI0_CS_LMONO 0x00004000
   --  unsupported macro: BCM2835_SPI0_CS_LEN 0x00002000
   --  unsupported macro: BCM2835_SPI0_CS_REN 0x00001000
   --  unsupported macro: BCM2835_SPI0_CS_ADCS 0x00000800
   --  unsupported macro: BCM2835_SPI0_CS_INTR 0x00000400
   --  unsupported macro: BCM2835_SPI0_CS_INTD 0x00000200
   --  unsupported macro: BCM2835_SPI0_CS_DMAEN 0x00000100
   --  unsupported macro: BCM2835_SPI0_CS_TA 0x00000080
   --  unsupported macro: BCM2835_SPI0_CS_CSPOL 0x00000040
   --  unsupported macro: BCM2835_SPI0_CS_CLEAR 0x00000030
   --  unsupported macro: BCM2835_SPI0_CS_CLEAR_RX 0x00000020
   --  unsupported macro: BCM2835_SPI0_CS_CLEAR_TX 0x00000010
   --  unsupported macro: BCM2835_SPI0_CS_CPOL 0x00000008
   --  unsupported macro: BCM2835_SPI0_CS_CPHA 0x00000004
   --  unsupported macro: BCM2835_SPI0_CS_CS 0x00000003
   --  unsupported macro: BCM2835_BSC_C 0x0000
   --  unsupported macro: BCM2835_BSC_S 0x0004
   --  unsupported macro: BCM2835_BSC_DLEN 0x0008
   --  unsupported macro: BCM2835_BSC_A 0x000c
   --  unsupported macro: BCM2835_BSC_FIFO 0x0010
   --  unsupported macro: BCM2835_BSC_DIV 0x0014
   --  unsupported macro: BCM2835_BSC_DEL 0x0018
   --  unsupported macro: BCM2835_BSC_CLKT 0x001c
   --  unsupported macro: BCM2835_BSC_C_I2CEN 0x00008000
   --  unsupported macro: BCM2835_BSC_C_INTR 0x00000400
   --  unsupported macro: BCM2835_BSC_C_INTT 0x00000200
   --  unsupported macro: BCM2835_BSC_C_INTD 0x00000100
   --  unsupported macro: BCM2835_BSC_C_ST 0x00000080
   --  unsupported macro: BCM2835_BSC_C_CLEAR_1 0x00000020
   --  unsupported macro: BCM2835_BSC_C_CLEAR_2 0x00000010
   --  unsupported macro: BCM2835_BSC_C_READ 0x00000001
   --  unsupported macro: BCM2835_BSC_S_CLKT 0x00000200
   --  unsupported macro: BCM2835_BSC_S_ERR 0x00000100
   --  unsupported macro: BCM2835_BSC_S_RXF 0x00000080
   --  unsupported macro: BCM2835_BSC_S_TXE 0x00000040
   --  unsupported macro: BCM2835_BSC_S_RXD 0x00000020
   --  unsupported macro: BCM2835_BSC_S_TXD 0x00000010
   --  unsupported macro: BCM2835_BSC_S_RXR 0x00000008
   --  unsupported macro: BCM2835_BSC_S_TXW 0x00000004
   --  unsupported macro: BCM2835_BSC_S_DONE 0x00000002
   --  unsupported macro: BCM2835_BSC_S_TA 0x00000001
   --  unsupported macro: BCM2835_BSC_FIFO_SIZE 16
   --  unsupported macro: BCM2835_ST_CS 0x0000
   --  unsupported macro: BCM2835_ST_CLO 0x0004
   --  unsupported macro: BCM2835_ST_CHI 0x0008
   --  unsupported macro: BCM2835_PWM_CONTROL 0
   --  unsupported macro: BCM2835_PWM_STATUS 1
   --  unsupported macro: BCM2835_PWM0_RANGE 4
   --  unsupported macro: BCM2835_PWM0_DATA 5
   --  unsupported macro: BCM2835_PWM1_RANGE 8
   --  unsupported macro: BCM2835_PWM1_DATA 9
   --  unsupported macro: BCM2835_PWMCLK_CNTL 40
   --  unsupported macro: BCM2835_PWMCLK_DIV 41
   --  unsupported macro: BCM2835_PWM1_MS_MODE 0x8000
   --  unsupported macro: BCM2835_PWM1_USEFIFO 0x2000
   --  unsupported macro: BCM2835_PWM1_REVPOLAR 0x1000
   --  unsupported macro: BCM2835_PWM1_OFFSTATE 0x0800
   --  unsupported macro: BCM2835_PWM1_REPEATFF 0x0400
   --  unsupported macro: BCM2835_PWM1_SERIAL 0x0200
   --  unsupported macro: BCM2835_PWM1_ENABLE 0x0100
   --  unsupported macro: BCM2835_PWM0_MS_MODE 0x0080
   --  unsupported macro: BCM2835_PWM0_USEFIFO 0x0020
   --  unsupported macro: BCM2835_PWM0_REVPOLAR 0x0010
   --  unsupported macro: BCM2835_PWM0_OFFSTATE 0x0008
   --  unsupported macro: BCM2835_PWM0_REPEATFF 0x0004
   --  unsupported macro: BCM2835_PWM0_SERIAL 0x0002
   --  unsupported macro: BCM2835_PWM0_ENABLE 0x0001
   --  arg-macro: procedure delay (x)
   --    bcm2835_delay(x)
   --  arg-macro: procedure delayMicroseconds (x)
   --    bcm2835_delayMicroseconds(x)
  -- bcm2835.h
  -- C and C++ support for Broadcom BCM 2835 as used in Raspberry Pi
  -- Author: Mike McCauley
  -- Copyright (C) 2011-2013 Mike McCauley
  -- $Id: bcm2835.h,v 1.8 2013/02/15 22:06:09 mikem Exp mikem $
  --/ \mainpage C library for Broadcom BCM 2835 as used in Raspberry Pi
  --/
  --/ This is a C library for Raspberry Pi (RPi). It provides access to 
  --/ GPIO and other IO functions on the Broadcom BCM 2835 chip,
  --/ allowing access to the GPIO pins on the
  --/ 26 pin IDE plug on the RPi board so you can control and interface with various external devices.
  --/
  --/ It provides functions for reading digital inputs and setting digital outputs, using SPI and I2C,
  --/ and for accessing the system timers.
  --/ Pin event detection is supported by polling (interrupts are not supported).
  --/
  --/ It is C++ compatible, and installs as a header file and non-shared library on 
  --/ any Linux-based distro (but clearly is no use except on Raspberry Pi or another board with 
  --/ BCM 2835).
  --/
  --/ The version of the package that this documentation refers to can be downloaded 
  --/ from http://www.airspayce.com/mikem/bcm2835/bcm2835-1.26.tar.gz
  --/ You can find the latest version at http://www.airspayce.com/mikem/bcm2835
  --/
  --/ Several example programs are provided.
  --/
  --/ Based on data in http://elinux.org/RPi_Low-level_peripherals and 
  --/ http://www.raspberrypi.org/wp-content/uploads/2012/02/BCM2835-ARM-Peripherals.pdf
  --/ and http://www.scribd.com/doc/101830961/GPIO-Pads-Control2
  --/
  --/ You can also find online help and discussion at http://groups.google.com/group/bcm2835
  --/ Please use that group for all questions and discussions on this topic. 
  --/ Do not contact the author directly, unless it is to discuss commercial licensing.
  --/
  --/ Tested on debian6-19-04-2012, 2012-07-15-wheezy-raspbian and Occidentalisv01
  --/ CAUTION: it has been observed that when detect enables such as bcm2835_gpio_len() 
  --/ are used and the pin is pulled LOW
  --/ it can cause temporary hangs on 2012-07-15-wheezy-raspbian and Occidentalisv01.
  --/ Reason for this is not yet determined, but suspect that an interrupt handler is
  --/ hitting a hard loop on those OSs.
  --/ If you must use bcm2835_gpio_len() and friends, make sure you disable the pins with 
  --/ bcm2835_gpio_cler_len() and friends after use. 
  --/
  --/ \par Installation
  --/
  --/ This library consists of a single non-shared library and header file, which will be
  --/ installed in the usual places by make install
  --/
  --/ \code
  --/ # download the latest version of the library, say bcm2835-1.xx.tar.gz, then:
  --/ tar zxvf bcm2835-1.xx.tar.gz
  --/ cd bcm2835-1.xx
  --/ ./configure
  --/ make
  --/ sudo make check
  --/ sudo make install
  --/ \endcode
  --/
  --/ \par Physical Addresses
  --/
  --/ The functions bcm2835_peri_read(), bcm2835_peri_write() and bcm2835_peri_set_bits() 
  --/ are low level peripheral register access functions. They are designed to use
  --/ physical addresses as described in section 1.2.3 ARM physical addresses
  --/ of the BCM2835 ARM Peripherals manual. 
  --/ Physical addresses range from 0x20000000 to 0x20FFFFFF for peripherals. The bus
  --/ addresses for peripherals are set up to map onto the peripheral bus address range starting at
  --/ 0x7E000000. Thus a peripheral advertised in the manual at bus address 0x7Ennnnnn is available at
  --/ physical address 0x20nnnnnn.
  --/
  --/ The base address of the various peripheral registers are available with the following
  --/ externals:
  --/ bcm2835_gpio
  --/ bcm2835_pwm
  --/ bcm2835_clk
  --/ bcm2835_pads
  --/ bcm2835_spio0
  --/ bcm2835_st
  --/ bcm2835_bsc0
  --/ bcm2835_bsc1
  --/
  --/ \par Pin Numbering
  --/
  --/ The GPIO pin numbering as used by RPi is different to and inconsistent with the underlying 
  --/ BCM 2835 chip pin numbering. http://elinux.org/RPi_BCM2835_GPIOs
  --/ 
  --/ RPi has a 26 pin IDE header that provides access to some of the GPIO pins on the BCM 2835,
  --/ as well as power and ground pins. Not all GPIO pins on the BCM 2835 are available on the 
  --/ IDE header.
  --/
  --/ RPi Version 2 also has a P5 connector with 4 GPIO pins, 5V, 3.3V and Gnd.
  --/
  --/ The functions in this library are designed to be passed the BCM 2835 GPIO pin number and _not_ 
  --/ the RPi pin number. There are symbolic definitions for each of the available pins
  --/ that you should use for convenience. See \ref RPiGPIOPin.
  --/
  --/ \par SPI Pins
  --/ 
  --/ The bcm2835_spi_* functions allow you to control the BCM 2835 SPI0 interface, 
  --/ allowing you to send and received data by SPI (Serial Peripheral Interface).
  --/ For more information about SPI, see http://en.wikipedia.org/wiki/Serial_Peripheral_Interface_Bus
  --/
  --/ When bcm2835_spi_begin() is called it changes the bahaviour of the SPI interface pins from their 
  --/ default GPIO behaviour in order to support SPI. While SPI is in use, you will not be able 
  --/ to control the state of the SPI pins through the usual bcm2835_spi_gpio_write().
  --/ When bcm2835_spi_end() is called, the SPI pins will all revert to inputs, and can then be
  --/ configured and controled with the usual bcm2835_gpio_* calls.
  --/
  --/ The Raspberry Pi GPIO pins used for SPI are:
  --/ 
  --/ - P1-19 (MOSI)
  --/ - P1-21 (MISO) 
  --/ - P1-23 (CLK) 
  --/ - P1-24 (CE0) 
  --/ - P1-26 (CE1)
  --/
  --/ \par I2C Pins
  --/
  --/ The bcm2835_i2c_* functions allow you to control the BCM 2835 BSC interface,
  --/ allowing you to send and received data by I2C ("eye-squared cee"; generically referred to as "two-wire interface") .
  --/ For more information about I?C, see http://en.wikipedia.org/wiki/I%C2%B2C
  --/
  --/ The Raspberry Pi V2 GPIO pins used for I2C are:
  --/
  --/ - P1-03 (SDA)
  --/ - P1-05 (SLC)
  --/
  --/ \par Real Time performance constraints
  --/
  --/ The bcm2835 is a library for user programs (i.e. they run in 'userland'). 
  --/ Such programs are not part of the kernel and are usually
  --/ subject to paging and swapping by the kernel while it does other things besides running your program. 
  --/ This means that you should not expect to get real-time performance or 
  --/ real-time timing constraints from such programs. In particular, there is no guarantee that the 
  --/ bcm2835_delay() and bcm2835_delayMicroseconds() will return after exactly the time requested. 
  --/ In fact, depending on other activity on the host, IO etc, you might get significantly longer delay times
  --/ than the one you asked for. So please dont expect to get exactly the time delay you request.
  --/
  --/ Arjan reports that you can prevent swapping on Linux with the following code fragment:
  --/
  --/ \code
  --/  struct sched_param sp;
  --/  memset(&sp, 0, sizeof(sp));
  --/  sp.sched_priority = sched_get_priority_max(SCHED_FIFO);
  --/  sched_setscheduler(0, SCHED_FIFO, &sp);
  --/  mlockall(MCL_CURRENT | MCL_FUTURE);
  --/ \endcode
  --/
  --/ \par Open Source Licensing GPL V2
  --/
  --/ This is the appropriate option if you want to share the source code of your
  --/ application with everyone you distribute it to, and you also want to give them
  --/ the right to share who uses it. If you wish to use this software under Open
  --/ Source Licensing, you must contribute all your source code to the open source
  --/ community in accordance with the GPL Version 2 when your application is
  --/ distributed. See http://www.gnu.org/copyleft/gpl.html and COPYING
  --/
  --/ \par Acknowledgements
  --/
  --/ Some of this code has been inspired by Dom and Gert.
  --/ The I2C code has been inspired by Alan Barr.
  --/ 
  --/ \par Revision History
  --/
  --/ \version 1.0 Initial release
  --/ \version 1.1 Minor bug fixes
  --/ \version 1.2 Added support for SPI
  --/ \version 1.3 Added bcm2835_spi_transfern()
  --/ \version 1.4 Fixed a problem that prevented SPI CE1 being used. Reported by David Robinson.
  --/ \version 1.5 Added bcm2835_close() to deinit the library. Suggested by C?sar Ortiz
  --/ \version 1.6 Document testing on 2012-07-15-wheezy-raspbian and Occidentalisv01
  --/              Functions bcm2835_gpio_ren(), bcm2835_gpio_fen(), bcm2835_gpio_hen()
  --/               bcm2835_gpio_len(), bcm2835_gpio_aren() and bcm2835_gpio_afen() now 
  --/               changes only the pin specified. Other pins that were already previously
  --/               enabled stay enabled.
  --/              Added  bcm2835_gpio_clr_ren(), bcm2835_gpio_clr_fen(), bcm2835_gpio_clr_hen()
  --/                bcm2835_gpio_clr_len(), bcm2835_gpio_clr_aren(), bcm2835_gpio_clr_afen() 
  --/                to clear the enable for individual pins, suggested by Andreas Sundstrom.
  --/ \version 1.7 Added bcm2835_spi_transfernb to support different buffers for read and write.
  --/ \version 1.8 Improvements to read barrier, as suggested by maddin.
  --/ \version 1.9 Improvements contributed by mikew: 
  --/              I noticed that it was mallocing memory for the mmaps on /dev/mem.
  --/              It's not necessary to do that, you can just mmap the file directly,
  --/              so I've removed the mallocs (and frees).
  --/              I've also modified delayMicroseconds() to use nanosleep() for long waits,
  --/              and a busy wait on a high resolution timer for the rest. This is because
  --/              I've found that calling nanosleep() takes at least 100-200 us.
  --/              You need to link using '-lrt' using this version.
  --/              I've added some unsigned casts to the debug prints to silence compiler
  --/              warnings I was getting, fixed some typos, and changed the value of
  --/              BCM2835_PAD_HYSTERESIS_ENABLED to 0x08 as per Gert van Loo's doc at
  --/              http://www.scribd.com/doc/101830961/GPIO-Pads-Control2
  --/              Also added a define for the passwrd value that Gert says is needed to
  --/              change pad control settings.
  --/ \version 1.10 Changed the names of the delay functions to bcm2835_delay() 
  --/              and bcm2835_delayMicroseconds() to prevent collisions with wiringPi.
  --/              Macros to map delay()-> bcm2835_delay() and
  --/              Macros to map delayMicroseconds()-> bcm2835_delayMicroseconds(), which
  --/              can be disabled by defining BCM2835_NO_DELAY_COMPATIBILITY
  --/ \version 1.11 Fixed incorrect link to download file
  --/ \version 1.12 New GPIO pin definitions for RPi version 2 (which has a different GPIO mapping)             
  --/ \version 1.13 New GPIO pin definitions for RPi version 2 plug P5
  --/               Hardware base pointers are now available (after initialisation) externally as bcm2835_gpio
  --/               bcm2835_pwm bcm2835_clk bcm2835_pads bcm2835_spi0.
  --/ \version 1.14 Now compiles even if CLOCK_MONOTONIC_RAW is not available, uses CLOCK_MONOTONIC instead.
  --/               Fixed errors in documentation of SPI divider frequencies based on 250MHz clock. 
  --/               Reported by Ben Simpson.
  --/ \version 1.15 Added bcm2835_close() to end of examples as suggested by Mark Wolfe.
  --/ \version 1.16 Added bcm2835_gpio_set_multi, bcm2835_gpio_clr_multi and bcm2835_gpio_write_multi
  --/               to allow a mask of pins to be set all at once. Requested by Sebastian Loncar.
  --/ \version 1.17  Added bcm2835_gpio_write_mask. Requested by Sebastian Loncar.
  --/ \version 1.18 Added bcm2835_i2c_* functions. Changes to bcm2835_delayMicroseconds: 
  --/               now uses the RPi system timer counter, instead of clock_gettime, for improved accuracy. 
  --/               No need to link with -lrt now. Contributed by Arjan van Vught.
  --/ \version 1.19 Removed inlines added by previous patch since they don't seem to work everywhere. 
  --/               Reported by olly.
  --/ \version 1.20 Patch from Mark Dootson to close /dev/mem after access to the peripherals has been granted.
  --/ \version 1.21 delayMicroseconds is now not susceptible to 32 bit timer overruns. 
  --/               Patch courtesy Jeremy Mortis.
  --/ \version 1.22 Fixed incorrect definition of BCM2835_GPFEN0 which broke the ability to set 
  --/               falling edge events. Reported by Mark Dootson.
  --/ \version 1.23 Added bcm2835_i2c_set_baudrate and bcm2835_i2c_read_register_rs. 
  --/               Improvements to bcm2835_i2c_read and bcm2835_i2c_write functions
  --/               to fix ocasional reads not completing. Patched by Mark Dootson.
  --/ \version 1.24 Mark Dootson p[atched a problem with his previously submitted code
  --/               under high load from other processes. 
  --/ \version 1.25 Updated author and distribution location details to airspayce.com
  --/ \version 1.26 Added missing unmapmem for pads in bcm2835_close to prevent a memory leak. 
  --/               Reported by Hartmut Henkel.
  --/ \author  Mike McCauley (mikem@airspayce.com) DO NOT CONTACT THE AUTHOR DIRECTLY: USE THE LISTS
  -- Defines for BCM2835
  --/ \defgroup constants Constants for passing to and from library functions
  --/ The values here are designed to be passed to various functions in the bcm2835 library.
  --/ @{
  --/ This means pin HIGH, true, 3.3volts on a pin.
  --/ This means pin LOW, false, 0volts on a pin.
  --/ Speed of the core clock core_clk
  -- Physical addresses for various peripheral register sets
  --/ Base Physical Address of the BCM 2835 peripheral registers
  --/ Base Physical Address of the System Timer registers
  --/ Base Physical Address of the Pads registers
  --/ Base Physical Address of the Clock/timer registers
  --/ Base Physical Address of the GPIO registers
  --/ Base Physical Address of the SPI0 registers
  --/ Base Physical Address of the BSC0 registers
  --/ Base Physical Address of the PWM registers
  --/ Base Physical Address of the BSC1 registers
  --/ Base of the ST (System Timer) registers.
  --/ Available after bcm2835_init has been called
   bcm2835_st : access stdint_h.uint32_t;  -- /usr/local/include/bcm2835.h:278
   pragma Import (C, bcm2835_st, "bcm2835_st");

  --/ Base of the GPIO registers.
  --/ Available after bcm2835_init has been called
   bcm2835_gpio : access stdint_h.uint32_t;  -- /usr/local/include/bcm2835.h:282
   pragma Import (C, bcm2835_gpio, "bcm2835_gpio");

  --/ Base of the PWM registers.
  --/ Available after bcm2835_init has been called
   bcm2835_pwm : access stdint_h.uint32_t;  -- /usr/local/include/bcm2835.h:286
   pragma Import (C, bcm2835_pwm, "bcm2835_pwm");

  --/ Base of the CLK registers.
  --/ Available after bcm2835_init has been called
   bcm2835_clk : access stdint_h.uint32_t;  -- /usr/local/include/bcm2835.h:290
   pragma Import (C, bcm2835_clk, "bcm2835_clk");

  --/ Base of the PADS registers.
  --/ Available after bcm2835_init has been called
   bcm2835_pads : access stdint_h.uint32_t;  -- /usr/local/include/bcm2835.h:294
   pragma Import (C, bcm2835_pads, "bcm2835_pads");

  --/ Base of the SPI0 registers.
  --/ Available after bcm2835_init has been called
   bcm2835_spi0 : access stdint_h.uint32_t;  -- /usr/local/include/bcm2835.h:298
   pragma Import (C, bcm2835_spi0, "bcm2835_spi0");

  --/ Base of the BSC0 registers.
  --/ Available after bcm2835_init has been called
   bcm2835_bsc0 : access stdint_h.uint32_t;  -- /usr/local/include/bcm2835.h:302
   pragma Import (C, bcm2835_bsc0, "bcm2835_bsc0");

  --/ Base of the BSC1 registers.
  --/ Available after bcm2835_init has been called
   bcm2835_bsc1 : access stdint_h.uint32_t;  -- /usr/local/include/bcm2835.h:306
   pragma Import (C, bcm2835_bsc1, "bcm2835_bsc1");

  --/ Size of memory page on RPi
  --/ Size of memory block on RPi
  -- Defines for GPIO
  -- The BCM2835 has 54 GPIO pins.
  --      BCM2835 data sheet, Page 90 onwards.
  --/ GPIO register offsets from BCM2835_GPIO_BASE. Offsets into the GPIO Peripheral block in bytes per 6.1 Register View
  --/ \brief bcm2835PortFunction
  --/ Port function select modes for bcm2835_gpio_fsel()
  --/< Input
  --/< Output
  --/< Alternate function 0
  --/< Alternate function 1
  --/< Alternate function 2
  --/< Alternate function 3
  --/< Alternate function 4
  --/< Alternate function 5
  --/< Function select bits mask
   subtype bcm2835FunctionSelect is unsigned;
   BCM2835_GPIO_FSEL_INPT : constant bcm2835FunctionSelect := 0;
   BCM2835_GPIO_FSEL_OUTP : constant bcm2835FunctionSelect := 1;
   BCM2835_GPIO_FSEL_ALT0 : constant bcm2835FunctionSelect := 4;
   BCM2835_GPIO_FSEL_ALT1 : constant bcm2835FunctionSelect := 5;
   BCM2835_GPIO_FSEL_ALT2 : constant bcm2835FunctionSelect := 6;
   BCM2835_GPIO_FSEL_ALT3 : constant bcm2835FunctionSelect := 7;
   BCM2835_GPIO_FSEL_ALT4 : constant bcm2835FunctionSelect := 3;
   BCM2835_GPIO_FSEL_ALT5 : constant bcm2835FunctionSelect := 2;
   BCM2835_GPIO_FSEL_MASK : constant bcm2835FunctionSelect := 7;  -- /usr/local/include/bcm2835.h:361

  --/ \brief bcm2835PUDControl
  --/ Pullup/Pulldown defines for bcm2835_gpio_pud()
  --/< Off ? disable pull-up/down
  --/< Enable Pull Down control
  --/< Enable Pull Up control
   type bcm2835PUDControl is 
     (BCM2835_GPIO_PUD_OFF,
      BCM2835_GPIO_PUD_DOWN,
      BCM2835_GPIO_PUD_UP);
   pragma Convention (C, bcm2835PUDControl);  -- /usr/local/include/bcm2835.h:370

  --/ Pad control register offsets from BCM2835_GPIO_PADS
  --/ Pad Control masks
  --/ \brief bcm2835PadGroup
  --/ Pad group specification for bcm2835_gpio_pad()
  --/< Pad group for GPIO pads 0 to 27
  --/< Pad group for GPIO pads 28 to 45
  --/< Pad group for GPIO pads 46 to 53
   type bcm2835PadGroup is 
     (BCM2835_PAD_GROUP_GPIO_0_27,
      BCM2835_PAD_GROUP_GPIO_28_45,
      BCM2835_PAD_GROUP_GPIO_46_53);
   pragma Convention (C, bcm2835PadGroup);  -- /usr/local/include/bcm2835.h:397

  --/ \brief GPIO Pin Numbers
  --/
  --/ Here we define Raspberry Pin GPIO pins on P1 in terms of the underlying BCM GPIO pin numbers.
  --/ These can be passed as a pin number to any function requiring a pin.
  --/ Not all pins on the RPi 26 bin IDE plug are connected to GPIO pins
  --/ and some can adopt an alternate function.
  --/ RPi version 2 has some slightly different pinouts, and these are values RPI_V2_*.
  --/ At bootup, pins 8 and 10 are set to UART0_TXD, UART0_RXD (ie the alt0 function) respectively
  --/ When SPI0 is in use (ie after bcm2835_spi_begin()), pins 19, 21, 23, 24, 26 are dedicated to SPI
  --/ and cant be controlled independently
  --/< Version 1, Pin P1-03
  --/< Version 1, Pin P1-05
  --/< Version 1, Pin P1-07
  --/< Version 1, Pin P1-08, defaults to alt function 0 UART0_TXD
  --/< Version 1, Pin P1-10, defaults to alt function 0 UART0_RXD
  --/< Version 1, Pin P1-11
  --/< Version 1, Pin P1-12
  --/< Version 1, Pin P1-13
  --/< Version 1, Pin P1-15
  --/< Version 1, Pin P1-16
  --/< Version 1, Pin P1-18
  --/< Version 1, Pin P1-19, MOSI when SPI0 in use
  --/< Version 1, Pin P1-21, MISO when SPI0 in use
  --/< Version 1, Pin P1-22
  --/< Version 1, Pin P1-23, CLK when SPI0 in use
  --/< Version 1, Pin P1-24, CE0 when SPI0 in use
  --/< Version 1, Pin P1-26, CE1 when SPI0 in use
  -- RPi Version 2
  --/< Version 2, Pin P1-03
  --/< Version 2, Pin P1-05
  --/< Version 2, Pin P1-07
  --/< Version 2, Pin P1-08, defaults to alt function 0 UART0_TXD
  --/< Version 2, Pin P1-10, defaults to alt function 0 UART0_RXD
  --/< Version 2, Pin P1-11
  --/< Version 2, Pin P1-12
  --/< Version 2, Pin P1-13
  --/< Version 2, Pin P1-15
  --/< Version 2, Pin P1-16
  --/< Version 2, Pin P1-18
  --/< Version 2, Pin P1-19, MOSI when SPI0 in use
  --/< Version 2, Pin P1-21, MISO when SPI0 in use
  --/< Version 2, Pin P1-22
  --/< Version 2, Pin P1-23, CLK when SPI0 in use
  --/< Version 2, Pin P1-24, CE0 when SPI0 in use
  --/< Version 2, Pin P1-26, CE1 when SPI0 in use
  -- RPi Version 2, new plug P5
  --/< Version 2, Pin P5-03
  --/< Version 2, Pin P5-04
  --/< Version 2, Pin P5-05
  --/< Version 2, Pin P5-06
   subtype RPiGPIOPin is unsigned;
   RPI_GPIO_P1_03 : constant RPiGPIOPin := 0;
   RPI_GPIO_P1_05 : constant RPiGPIOPin := 1;
   RPI_GPIO_P1_07 : constant RPiGPIOPin := 4;
   RPI_GPIO_P1_08 : constant RPiGPIOPin := 14;
   RPI_GPIO_P1_10 : constant RPiGPIOPin := 15;
   RPI_GPIO_P1_11 : constant RPiGPIOPin := 17;
   RPI_GPIO_P1_12 : constant RPiGPIOPin := 18;
   RPI_GPIO_P1_13 : constant RPiGPIOPin := 21;
   RPI_GPIO_P1_15 : constant RPiGPIOPin := 22;
   RPI_GPIO_P1_16 : constant RPiGPIOPin := 23;
   RPI_GPIO_P1_18 : constant RPiGPIOPin := 24;
   RPI_GPIO_P1_19 : constant RPiGPIOPin := 10;
   RPI_GPIO_P1_21 : constant RPiGPIOPin := 9;
   RPI_GPIO_P1_22 : constant RPiGPIOPin := 25;
   RPI_GPIO_P1_23 : constant RPiGPIOPin := 11;
   RPI_GPIO_P1_24 : constant RPiGPIOPin := 8;
   RPI_GPIO_P1_26 : constant RPiGPIOPin := 7;
   RPI_V2_GPIO_P1_03 : constant RPiGPIOPin := 2;
   RPI_V2_GPIO_P1_05 : constant RPiGPIOPin := 3;
   RPI_V2_GPIO_P1_07 : constant RPiGPIOPin := 4;
   RPI_V2_GPIO_P1_08 : constant RPiGPIOPin := 14;
   RPI_V2_GPIO_P1_10 : constant RPiGPIOPin := 15;
   RPI_V2_GPIO_P1_11 : constant RPiGPIOPin := 17;
   RPI_V2_GPIO_P1_12 : constant RPiGPIOPin := 18;
   RPI_V2_GPIO_P1_13 : constant RPiGPIOPin := 27;
   RPI_V2_GPIO_P1_15 : constant RPiGPIOPin := 22;
   RPI_V2_GPIO_P1_16 : constant RPiGPIOPin := 23;
   RPI_V2_GPIO_P1_18 : constant RPiGPIOPin := 24;
   RPI_V2_GPIO_P1_19 : constant RPiGPIOPin := 10;
   RPI_V2_GPIO_P1_21 : constant RPiGPIOPin := 9;
   RPI_V2_GPIO_P1_22 : constant RPiGPIOPin := 25;
   RPI_V2_GPIO_P1_23 : constant RPiGPIOPin := 11;
   RPI_V2_GPIO_P1_24 : constant RPiGPIOPin := 8;
   RPI_V2_GPIO_P1_26 : constant RPiGPIOPin := 7;
   RPI_V2_GPIO_P5_03 : constant RPiGPIOPin := 28;
   RPI_V2_GPIO_P5_04 : constant RPiGPIOPin := 29;
   RPI_V2_GPIO_P5_05 : constant RPiGPIOPin := 30;
   RPI_V2_GPIO_P5_06 : constant RPiGPIOPin := 31;  -- /usr/local/include/bcm2835.h:454

  -- Defines for SPI
  -- GPIO register offsets from BCM2835_SPI0_BASE. 
  -- Offsets into the SPI Peripheral block in bytes per 10.5 SPI Register Map
  -- Register masks for SPI0_CS
  --/ \brief bcm2835SPIBitOrder SPI Bit order
  --/ Specifies the SPI data bit ordering for bcm2835_spi_setBitOrder()
  --/< LSB First
  --/< MSB First
   type bcm2835SPIBitOrder is 
     (BCM2835_SPI_BIT_ORDER_LSBFIRST,
      BCM2835_SPI_BIT_ORDER_MSBFIRST);
   pragma Convention (C, bcm2835SPIBitOrder);  -- /usr/local/include/bcm2835.h:500

  --/ \brief SPI Data mode
  --/ Specify the SPI data mode to be passed to bcm2835_spi_setDataMode()
  --/< CPOL = 0, CPHA = 0
  --/< CPOL = 0, CPHA = 1
  --/< CPOL = 1, CPHA = 0
  --/< CPOL = 1, CPHA = 1
   type bcm2835SPIMode is 
     (BCM2835_SPI_MODE0,
      BCM2835_SPI_MODE1,
      BCM2835_SPI_MODE2,
      BCM2835_SPI_MODE3);
   pragma Convention (C, bcm2835SPIMode);  -- /usr/local/include/bcm2835.h:510

  --/ \brief bcm2835SPIChipSelect
  --/ Specify the SPI chip select pin(s)
  --/< Chip Select 0
  --/< Chip Select 1
  --/< Chip Select 2 (ie pins CS1 and CS2 are asserted)
  --/< No CS, control it yourself
   type bcm2835SPIChipSelect is 
     (BCM2835_SPI_CS0,
      BCM2835_SPI_CS1,
      BCM2835_SPI_CS2,
      BCM2835_SPI_CS_NONE);
   pragma Convention (C, bcm2835SPIChipSelect);  -- /usr/local/include/bcm2835.h:520

  --/ \brief bcm2835SPIClockDivider
  --/ Specifies the divider used to generate the SPI clock from the system clock.
  --/ Figures below give the divider, clock period and clock frequency.
  --/ Clock divided is based on nominal base clock rate of 250MHz
  --/ It is reported that (contrary to the documentation) any even divider may used.
  --/ The frequencies shown for each divider have been confirmed by measurement
  --/< 65536 = 262.144us = 3.814697260kHz
  --/< 32768 = 131.072us = 7.629394531kHz
  --/< 16384 = 65.536us = 15.25878906kHz
  --/< 8192 = 32.768us = 30/51757813kHz
  --/< 4096 = 16.384us = 61.03515625kHz
  --/< 2048 = 8.192us = 122.0703125kHz
  --/< 1024 = 4.096us = 244.140625kHz
  --/< 512 = 2.048us = 488.28125kHz
  --/< 256 = 1.024us = 976.5625MHz
  --/< 128 = 512ns = = 1.953125MHz
  --/< 64 = 256ns = 3.90625MHz
  --/< 32 = 128ns = 7.8125MHz
  --/< 16 = 64ns = 15.625MHz
  --/< 8 = 32ns = 31.25MHz
  --/< 4 = 16ns = 62.5MHz
  --/< 2 = 8ns = 125MHz, fastest you can get
  --/< 0 = 262.144us = 3.814697260kHz, same as 0/65536
   subtype bcm2835SPIClockDivider is unsigned;
   BCM2835_SPI_CLOCK_DIVIDER_65536 : constant bcm2835SPIClockDivider := 0;
   BCM2835_SPI_CLOCK_DIVIDER_32768 : constant bcm2835SPIClockDivider := 32768;
   BCM2835_SPI_CLOCK_DIVIDER_16384 : constant bcm2835SPIClockDivider := 16384;
   BCM2835_SPI_CLOCK_DIVIDER_8192 : constant bcm2835SPIClockDivider := 8192;
   BCM2835_SPI_CLOCK_DIVIDER_4096 : constant bcm2835SPIClockDivider := 4096;
   BCM2835_SPI_CLOCK_DIVIDER_2048 : constant bcm2835SPIClockDivider := 2048;
   BCM2835_SPI_CLOCK_DIVIDER_1024 : constant bcm2835SPIClockDivider := 1024;
   BCM2835_SPI_CLOCK_DIVIDER_512 : constant bcm2835SPIClockDivider := 512;
   BCM2835_SPI_CLOCK_DIVIDER_256 : constant bcm2835SPIClockDivider := 256;
   BCM2835_SPI_CLOCK_DIVIDER_128 : constant bcm2835SPIClockDivider := 128;
   BCM2835_SPI_CLOCK_DIVIDER_64 : constant bcm2835SPIClockDivider := 64;
   BCM2835_SPI_CLOCK_DIVIDER_32 : constant bcm2835SPIClockDivider := 32;
   BCM2835_SPI_CLOCK_DIVIDER_16 : constant bcm2835SPIClockDivider := 16;
   BCM2835_SPI_CLOCK_DIVIDER_8 : constant bcm2835SPIClockDivider := 8;
   BCM2835_SPI_CLOCK_DIVIDER_4 : constant bcm2835SPIClockDivider := 4;
   BCM2835_SPI_CLOCK_DIVIDER_2 : constant bcm2835SPIClockDivider := 2;
   BCM2835_SPI_CLOCK_DIVIDER_1 : constant bcm2835SPIClockDivider := 1;  -- /usr/local/include/bcm2835.h:547

  -- Defines for I2C
  -- GPIO register offsets from BCM2835_BSC*_BASE.
  -- Offsets into the BSC Peripheral block in bytes per 3.1 BSC Register Map
  -- Register masks for BSC_C
  -- Register masks for BSC_S
  --/ \brief bcm2835I2CClockDivider
  --/ Specifies the divider used to generate the I2C clock from the system clock.
  --/ Clock divided is based on nominal base clock rate of 250MHz
  --/< 2500 = 10us = 100 kHz
  --/< 622 = 2.504us = 399.3610 kHz
  --/< 150 = 60ns = 1.666 MHz (default at reset)
  --/< 148 = 59ns = 1.689 MHz
   subtype bcm2835I2CClockDivider is unsigned;
   BCM2835_I2C_CLOCK_DIVIDER_2500 : constant bcm2835I2CClockDivider := 2500;
   BCM2835_I2C_CLOCK_DIVIDER_626 : constant bcm2835I2CClockDivider := 626;
   BCM2835_I2C_CLOCK_DIVIDER_150 : constant bcm2835I2CClockDivider := 150;
   BCM2835_I2C_CLOCK_DIVIDER_148 : constant bcm2835I2CClockDivider := 148;  -- /usr/local/include/bcm2835.h:594

  --/ \brief bcm2835I2CReasonCodes
  --/ Specifies the reason codes for the bcm2835_i2c_write and bcm2835_i2c_read functions.
  --/< Success
  --/< Received a NACK
  --/< Received Clock Stretch Timeout
  --/< Not all data is sent / received
   subtype bcm2835I2CReasonCodes is unsigned;
   BCM2835_I2C_REASON_OK : constant bcm2835I2CReasonCodes := 0;
   BCM2835_I2C_REASON_ERROR_NACK : constant bcm2835I2CReasonCodes := 1;
   BCM2835_I2C_REASON_ERROR_CLKT : constant bcm2835I2CReasonCodes := 2;
   BCM2835_I2C_REASON_ERROR_DATA : constant bcm2835I2CReasonCodes := 4;  -- /usr/local/include/bcm2835.h:604

  -- Defines for ST
  -- GPIO register offsets from BCM2835_ST_BASE.
  -- Offsets into the ST Peripheral block in bytes per 12.1 System Timer Registers
  -- The System Timer peripheral provides four 32-bit timer channels and a single 64-bit free running counter.
  -- BCM2835_ST_CLO is the System Timer Counter Lower bits register.
  -- The system timer free-running counter lower register is a read-only register that returns the current value
  -- of the lower 32-bits of the free running counter.
  -- BCM2835_ST_CHI is the System Timer Counter Upper bits register.
  -- The system timer free-running counter upper register is a read-only register that returns the current value
  -- of the upper 32-bits of the free running counter.
  --/ @}
  -- Defines for PWM
  -- Historical name compatibility
  --/ \defgroup init Library initialisation and management
  --/ These functions allow you to intialise and control the bcm2835 library
  --/ @{
  --/ Initialise the library by opening /dev/mem and getting pointers to the 
  --/ internal memory for BCM 2835 device registers. You must call this (successfully)
  --/ before calling any other 
  --/ functions in this library (except bcm2835_set_debug). 
  --/ If bcm2835_init() fails by returning 0, 
  --/ calling any other function may result in crashes or other failures.
  --/ Prints messages to stderr in case of errors.
  --/ \return 1 if successful else 0
   function bcm2835_init return int;  -- /usr/local/include/bcm2835.h:672
   pragma Import (C, bcm2835_init, "bcm2835_init");

  --/ Close the library, deallocating any allocated memory and closing /dev/mem
  --/ \return 1 if successful else 0
   function bcm2835_close return int;  -- /usr/local/include/bcm2835.h:676
   pragma Import (C, bcm2835_close, "bcm2835_close");

  --/ Sets the debug level of the library.
  --/ A value of 1 prevents mapping to /dev/mem, and makes the library print out
  --/ what it would do, rather than accessing the GPIO registers.
  --/ A value of 0, the default, causes normal operation.
  --/ Call this before calling bcm2835_init();
  --/ \param[in] debug The new debug level. 1 means debug
   procedure bcm2835_set_debug (debug : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:684
   pragma Import (C, bcm2835_set_debug, "bcm2835_set_debug");

  --/ @} // end of init
  --/ \defgroup lowlevel Low level register access
  --/ These functions provide low level register access, and should not generally
  --/ need to be used 
  --/ 
  --/ @{
  --/ Reads 32 bit value from a peripheral address
  --/ The read is done twice, and is therefore always safe in terms of 
  --/ manual section 1.3 Peripheral access precautions for correct memory ordering
  --/ \param[in] paddr Physical address to read from. See BCM2835_GPIO_BASE etc.
  --/ \return the value read from the 32 bit register
  --/ \sa Physical Addresses
   function bcm2835_peri_read (paddr : access stdint_h.uint32_t) return stdint_h.uint32_t;  -- /usr/local/include/bcm2835.h:700
   pragma Import (C, bcm2835_peri_read, "bcm2835_peri_read");

  --/ Reads 32 bit value from a peripheral address without the read barrier
  --/ You should only use this when your code has previously called bcm2835_peri_read()
  --/ within the same peripheral, and no other peripheral access has occurred since.
  --/ \param[in] paddr Physical address to read from. See BCM2835_GPIO_BASE etc.
  --/ \return the value read from the 32 bit register
  --/ \sa Physical Addresses
   function bcm2835_peri_read_nb (paddr : access stdint_h.uint32_t) return stdint_h.uint32_t;  -- /usr/local/include/bcm2835.h:709
   pragma Import (C, bcm2835_peri_read_nb, "bcm2835_peri_read_nb");

  --/ Writes 32 bit value from a peripheral address
  --/ The write is done twice, and is therefore always safe in terms of 
  --/ manual section 1.3 Peripheral access precautions for correct memory ordering
  --/ \param[in] paddr Physical address to read from. See BCM2835_GPIO_BASE etc.
  --/ \param[in] value The 32 bit value to write
  --/ \sa Physical Addresses
   procedure bcm2835_peri_write (paddr : access stdint_h.uint32_t; value : stdint_h.uint32_t);  -- /usr/local/include/bcm2835.h:718
   pragma Import (C, bcm2835_peri_write, "bcm2835_peri_write");

  --/ Writes 32 bit value from a peripheral address without the write barrier
  --/ You should only use this when your code has previously called bcm2835_peri_write()
  --/ within the same peripheral, and no other peripheral access has occurred since.
  --/ \param[in] paddr Physical address to read from. See BCM2835_GPIO_BASE etc.
  --/ \param[in] value The 32 bit value to write
  --/ \sa Physical Addresses
   procedure bcm2835_peri_write_nb (paddr : access stdint_h.uint32_t; value : stdint_h.uint32_t);  -- /usr/local/include/bcm2835.h:726
   pragma Import (C, bcm2835_peri_write_nb, "bcm2835_peri_write_nb");

  --/ Alters a number of bits in a 32 peripheral regsiter.
  --/ It reads the current valu and then alters the bits deines as 1 in mask, 
  --/ according to the bit value in value. 
  --/ All other bits that are 0 in the mask are unaffected.
  --/ Use this to alter a subset of the bits in a register.
  --/ The write is done twice, and is therefore always safe in terms of 
  --/ manual section 1.3 Peripheral access precautions for correct memory ordering
  --/ \param[in] paddr Physical address to read from. See BCM2835_GPIO_BASE etc.
  --/ \param[in] value The 32 bit value to write, masked in by mask.
  --/ \param[in] mask Bitmask that defines the bits that will be altered in the register.
  --/ \sa Physical Addresses
   procedure bcm2835_peri_set_bits
     (paddr : access stdint_h.uint32_t;
      value : stdint_h.uint32_t;
      mask : stdint_h.uint32_t);  -- /usr/local/include/bcm2835.h:739
   pragma Import (C, bcm2835_peri_set_bits, "bcm2835_peri_set_bits");

  --/ @} // end of lowlevel
  --/ \defgroup gpio GPIO register access
  --/ These functions allow you to control the GPIO interface. You can set the 
  --/ function of each GPIO pin, read the input state and set the output state.
  --/ @{
  --/ Sets the Function Select register for the given pin, which configures
  --/ the pin as Input, Output or one of the 6 alternate functions.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from RPiGPIOPin.
  --/ \param[in] mode Mode to set the pin to, one of BCM2835_GPIO_FSEL_* from \ref bcm2835FunctionSelect
   procedure bcm2835_gpio_fsel (pin : stdint_h.uint8_t; mode : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:751
   pragma Import (C, bcm2835_gpio_fsel, "bcm2835_gpio_fsel");

  --/ Sets the specified pin output to 
  --/ HIGH.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
  --/ \sa bcm2835_gpio_write()
   procedure bcm2835_gpio_set (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:757
   pragma Import (C, bcm2835_gpio_set, "bcm2835_gpio_set");

  --/ Sets the specified pin output to 
  --/ LOW.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
  --/ \sa bcm2835_gpio_write()
   procedure bcm2835_gpio_clr (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:763
   pragma Import (C, bcm2835_gpio_clr, "bcm2835_gpio_clr");

  --/ Sets any of the first 32 GPIO output pins specified in the mask to 
  --/ HIGH.
  --/ \param[in] mask Mask of pins to affect. Use eg: (1 << RPI_GPIO_P1_03) | (1 << RPI_GPIO_P1_05)
  --/ \sa bcm2835_gpio_write_multi()
   procedure bcm2835_gpio_set_multi (mask : stdint_h.uint32_t);  -- /usr/local/include/bcm2835.h:769
   pragma Import (C, bcm2835_gpio_set_multi, "bcm2835_gpio_set_multi");

  --/ Sets any of the first 32 GPIO output pins specified in the mask to 
  --/ LOW.
  --/ \param[in] mask Mask of pins to affect. Use eg: (1 << RPI_GPIO_P1_03) | (1 << RPI_GPIO_P1_05)
  --/ \sa bcm2835_gpio_write_multi()
   procedure bcm2835_gpio_clr_multi (mask : stdint_h.uint32_t);  -- /usr/local/include/bcm2835.h:775
   pragma Import (C, bcm2835_gpio_clr_multi, "bcm2835_gpio_clr_multi");

  --/ Reads the current level on the specified 
  --/ pin and returns either HIGH or LOW. Works whether or not the pin
  --/ is an input or an output.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
  --/ \return the current level  either HIGH or LOW
   function bcm2835_gpio_lev (pin : stdint_h.uint8_t) return stdint_h.uint8_t;  -- /usr/local/include/bcm2835.h:782
   pragma Import (C, bcm2835_gpio_lev, "bcm2835_gpio_lev");

  --/ Event Detect Status.
  --/ Tests whether the specified pin has detected a level or edge
  --/ as requested by bcm2835_gpio_ren(), bcm2835_gpio_fen(), bcm2835_gpio_hen(), 
  --/ bcm2835_gpio_len(), bcm2835_gpio_aren(), bcm2835_gpio_afen().
  --/ Clear the flag for a given pin by calling bcm2835_gpio_set_eds(pin);
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
  --/ \return HIGH if the event detect status for th given pin is true.
   function bcm2835_gpio_eds (pin : stdint_h.uint8_t) return stdint_h.uint8_t;  -- /usr/local/include/bcm2835.h:791
   pragma Import (C, bcm2835_gpio_eds, "bcm2835_gpio_eds");

  --/ Sets the Event Detect Status register for a given pin to 1, 
  --/ which has the effect of clearing the flag. Use this afer seeing
  --/ an Event Detect Status on the pin.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_set_eds (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:797
   pragma Import (C, bcm2835_gpio_set_eds, "bcm2835_gpio_set_eds");

  --/ Enable Rising Edge Detect Enable for the specified pin.
  --/ When a rising edge is detected, sets the appropriate pin in Event Detect Status.
  --/ The GPRENn registers use
  --/ synchronous edge detection. This means the input signal is sampled using the
  --/ system clock and then it is looking for a ?011? pattern on the sampled signal. This
  --/ has the effect of suppressing glitches.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_ren (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:806
   pragma Import (C, bcm2835_gpio_ren, "bcm2835_gpio_ren");

  --/ Disable Rising Edge Detect Enable for the specified pin.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_clr_ren (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:810
   pragma Import (C, bcm2835_gpio_clr_ren, "bcm2835_gpio_clr_ren");

  --/ Enable Falling Edge Detect Enable for the specified pin.
  --/ When a falling edge is detected, sets the appropriate pin in Event Detect Status.
  --/ The GPRENn registers use
  --/ synchronous edge detection. This means the input signal is sampled using the
  --/ system clock and then it is looking for a ?100? pattern on the sampled signal. This
  --/ has the effect of suppressing glitches.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_fen (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:819
   pragma Import (C, bcm2835_gpio_fen, "bcm2835_gpio_fen");

  --/ Disable Falling Edge Detect Enable for the specified pin.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_clr_fen (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:823
   pragma Import (C, bcm2835_gpio_clr_fen, "bcm2835_gpio_clr_fen");

  --/ Enable High Detect Enable for the specified pin.
  --/ When a HIGH level is detected on the pin, sets the appropriate pin in Event Detect Status.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_hen (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:828
   pragma Import (C, bcm2835_gpio_hen, "bcm2835_gpio_hen");

  --/ Disable High Detect Enable for the specified pin.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_clr_hen (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:832
   pragma Import (C, bcm2835_gpio_clr_hen, "bcm2835_gpio_clr_hen");

  --/ Enable Low Detect Enable for the specified pin.
  --/ When a LOW level is detected on the pin, sets the appropriate pin in Event Detect Status.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_len (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:837
   pragma Import (C, bcm2835_gpio_len, "bcm2835_gpio_len");

  --/ Disable Low Detect Enable for the specified pin.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_clr_len (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:841
   pragma Import (C, bcm2835_gpio_clr_len, "bcm2835_gpio_clr_len");

  --/ Enable Asynchronous Rising Edge Detect Enable for the specified pin.
  --/ When a rising edge is detected, sets the appropriate pin in Event Detect Status.
  --/ Asynchronous means the incoming signal is not sampled by the system clock. As such
  --/ rising edges of very short duration can be detected.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_aren (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:848
   pragma Import (C, bcm2835_gpio_aren, "bcm2835_gpio_aren");

  --/ Disable Asynchronous Rising Edge Detect Enable for the specified pin.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_clr_aren (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:852
   pragma Import (C, bcm2835_gpio_clr_aren, "bcm2835_gpio_clr_aren");

  --/ Enable Asynchronous Falling Edge Detect Enable for the specified pin.
  --/ When a falling edge is detected, sets the appropriate pin in Event Detect Status.
  --/ Asynchronous means the incoming signal is not sampled by the system clock. As such
  --/ falling edges of very short duration can be detected.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_afen (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:859
   pragma Import (C, bcm2835_gpio_afen, "bcm2835_gpio_afen");

  --/ Disable Asynchronous Falling Edge Detect Enable for the specified pin.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
   procedure bcm2835_gpio_clr_afen (pin : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:863
   pragma Import (C, bcm2835_gpio_clr_afen, "bcm2835_gpio_clr_afen");

  --/ Sets the Pull-up/down register for the given pin. This is
  --/ used with bcm2835_gpio_pudclk() to set the  Pull-up/down resistor for the given pin.
  --/ However, it is usually more convenient to use bcm2835_gpio_set_pud().
  --/ \param[in] pud The desired Pull-up/down mode. One of BCM2835_GPIO_PUD_* from bcm2835PUDControl
  --/ \sa bcm2835_gpio_set_pud()
   procedure bcm2835_gpio_pud (pud : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:870
   pragma Import (C, bcm2835_gpio_pud, "bcm2835_gpio_pud");

  --/ Clocks the Pull-up/down value set earlier by bcm2835_gpio_pud() into the pin.
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
  --/ \param[in] on HIGH to clock the value from bcm2835_gpio_pud() into the pin. 
  --/ LOW to remove the clock. 
  --/ \sa bcm2835_gpio_set_pud()
   procedure bcm2835_gpio_pudclk (pin : stdint_h.uint8_t; on : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:877
   pragma Import (C, bcm2835_gpio_pudclk, "bcm2835_gpio_pudclk");

  --/ Reads and returns the Pad Control for the given GPIO group.
  --/ \param[in] group The GPIO pad group number, one of BCM2835_PAD_GROUP_GPIO_*
  --/ \return Mask of bits from BCM2835_PAD_* from \ref bcm2835PadGroup
   function bcm2835_gpio_pad (group : stdint_h.uint8_t) return stdint_h.uint32_t;  -- /usr/local/include/bcm2835.h:882
   pragma Import (C, bcm2835_gpio_pad, "bcm2835_gpio_pad");

  --/ Sets the Pad Control for the given GPIO group.
  --/ \param[in] group The GPIO pad group number, one of BCM2835_PAD_GROUP_GPIO_*
  --/ \param[in] control Mask of bits from BCM2835_PAD_* from \ref bcm2835PadGroup
   procedure bcm2835_gpio_set_pad (group : stdint_h.uint8_t; control : stdint_h.uint32_t);  -- /usr/local/include/bcm2835.h:887
   pragma Import (C, bcm2835_gpio_set_pad, "bcm2835_gpio_set_pad");

  --/ Delays for the specified number of milliseconds.
  --/ Uses nanosleep(), and therefore does not use CPU until the time is up.
  --/ However, you are at the mercy of nanosleep(). From the manual for nanosleep():
  --/ If the interval specified in req is not an exact multiple of the granularity  
  --/ underlying  clock  (see  time(7)),  then the interval will be
  --/ rounded up to the next multiple. Furthermore, after the sleep completes, 
  --/ there may still be a delay before the CPU becomes free to once
  --/ again execute the calling thread.
  --/ \param[in] millis Delay in milliseconds
   procedure bcm2835_delay (millis : unsigned);  -- /usr/local/include/bcm2835.h:898
   pragma Import (C, bcm2835_delay, "bcm2835_delay");

  --/ Delays for the specified number of microseconds.
  --/ Uses a combination of nanosleep() and a busy wait loop on the BCM2835 system timers,
  --/ However, you are at the mercy of nanosleep(). From the manual for nanosleep():
  --/ If the interval specified in req is not an exact multiple of the granularity  
  --/ underlying  clock  (see  time(7)),  then the interval will be
  --/ rounded up to the next multiple. Furthermore, after the sleep completes, 
  --/ there may still be a delay before the CPU becomes free to once
  --/ again execute the calling thread.
  --/ For times less than about 450 microseconds, uses a busy wait on the System Timer.
  --/ It is reported that a delay of 0 microseconds on RaspberryPi will in fact
  --/ result in a delay of about 80 microseconds. Your mileage may vary.
  --/ \param[in] micros Delay in microseconds
   procedure bcm2835_delayMicroseconds (micros : stdint_h.uint64_t);  -- /usr/local/include/bcm2835.h:912
   pragma Import (C, bcm2835_delayMicroseconds, "bcm2835_delayMicroseconds");

  --/ Sets the output state of the specified pin
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
  --/ \param[in] on HIGH sets the output to HIGH and LOW to LOW.
   procedure bcm2835_gpio_write (pin : stdint_h.uint8_t; on : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:917
   pragma Import (C, bcm2835_gpio_write, "bcm2835_gpio_write");

  --/ Sets any of the first 32 GPIO output pins specified in the mask to the state given by on
  --/ \param[in] mask Mask of pins to affect. Use eg: (1 << RPI_GPIO_P1_03) | (1 << RPI_GPIO_P1_05)
  --/ \param[in] on HIGH sets the output to HIGH and LOW to LOW.
   procedure bcm2835_gpio_write_multi (mask : stdint_h.uint32_t; on : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:922
   pragma Import (C, bcm2835_gpio_write_multi, "bcm2835_gpio_write_multi");

  --/ Sets the first 32 GPIO output pins specified in the mask to the value given by value
  --/ \param[in] value values required for each bit masked in by mask, eg: (1 << RPI_GPIO_P1_03) | (1 << RPI_GPIO_P1_05)
  --/ \param[in] mask Mask of pins to affect. Use eg: (1 << RPI_GPIO_P1_03) | (1 << RPI_GPIO_P1_05)
   procedure bcm2835_gpio_write_mask (value : stdint_h.uint32_t; mask : stdint_h.uint32_t);  -- /usr/local/include/bcm2835.h:927
   pragma Import (C, bcm2835_gpio_write_mask, "bcm2835_gpio_write_mask");

  --/ Sets the Pull-up/down mode for the specified pin. This is more convenient than
  --/ clocking the mode in with bcm2835_gpio_pud() and bcm2835_gpio_pudclk().
  --/ \param[in] pin GPIO number, or one of RPI_GPIO_P1_* from \ref RPiGPIOPin.
  --/ \param[in] pud The desired Pull-up/down mode. One of BCM2835_GPIO_PUD_* from bcm2835PUDControl
   procedure bcm2835_gpio_set_pud (pin : stdint_h.uint8_t; pud : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:933
   pragma Import (C, bcm2835_gpio_set_pud, "bcm2835_gpio_set_pud");

  --/ @} 
  --/ \defgroup spi SPI access
  --/ These functions let you use SPI0 (Serial Peripheral Interface) to 
  --/ interface with an external SPI device.
  --/ @{
  --/ Start SPI operations.
  --/ Forces RPi SPI0 pins P1-19 (MOSI), P1-21 (MISO), P1-23 (CLK), P1-24 (CE0) and P1-26 (CE1)
  --/ to alternate function ALT0, which enables those pins for SPI interface.
  --/ You should call bcm2835_spi_end() when all SPI funcitons are complete to return the pins to 
  --/ their default functions
  --/ \sa  bcm2835_spi_end()
   procedure bcm2835_spi_begin;  -- /usr/local/include/bcm2835.h:948
   pragma Import (C, bcm2835_spi_begin, "bcm2835_spi_begin");

  --/ End SPI operations.
  --/ SPI0 pins P1-19 (MOSI), P1-21 (MISO), P1-23 (CLK), P1-24 (CE0) and P1-26 (CE1)
  --/ are returned to their default INPUT behaviour.
   procedure bcm2835_spi_end;  -- /usr/local/include/bcm2835.h:953
   pragma Import (C, bcm2835_spi_end, "bcm2835_spi_end");

  --/ Sets the SPI bit order
  --/ NOTE: has no effect. Not supported by SPI0.
  --/ Defaults to 
  --/ \param[in] order The desired bit order, one of BCM2835_SPI_BIT_ORDER_*, 
  --/ see \ref bcm2835SPIBitOrder
   procedure bcm2835_spi_setBitOrder (order : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:960
   pragma Import (C, bcm2835_spi_setBitOrder, "bcm2835_spi_setBitOrder");

  --/ Sets the SPI clock divider and therefore the 
  --/ SPI clock speed. 
  --/ \param[in] divider The desired SPI clock divider, one of BCM2835_SPI_CLOCK_DIVIDER_*, 
  --/ see \ref bcm2835SPIClockDivider
   procedure bcm2835_spi_setClockDivider (divider : stdint_h.uint16_t);  -- /usr/local/include/bcm2835.h:966
   pragma Import (C, bcm2835_spi_setClockDivider, "bcm2835_spi_setClockDivider");

  --/ Sets the SPI data mode
  --/ Sets the clock polariy and phase
  --/ \param[in] mode The desired data mode, one of BCM2835_SPI_MODE*, 
  --/ see \ref bcm2835SPIMode
   procedure bcm2835_spi_setDataMode (mode : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:972
   pragma Import (C, bcm2835_spi_setDataMode, "bcm2835_spi_setDataMode");

  --/ Sets the chip select pin(s)
  --/ When an bcm2835_spi_transfer() is made, the selected pin(s) will be asserted during the
  --/ transfer.
  --/ \param[in] cs Specifies the CS pins(s) that are used to activate the desired slave. 
  --/   One of BCM2835_SPI_CS*, see \ref bcm2835SPIChipSelect
   procedure bcm2835_spi_chipSelect (cs : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:979
   pragma Import (C, bcm2835_spi_chipSelect, "bcm2835_spi_chipSelect");

  --/ Sets the chip select pin polarity for a given pin
  --/ When an bcm2835_spi_transfer() occurs, the currently selected chip select pin(s) 
  --/ will be asserted to the 
  --/ value given by active. When transfers are not happening, the chip select pin(s) 
  --/ return to the complement (inactive) value.
  --/ \param[in] cs The chip select pin to affect
  --/ \param[in] active Whether the chip select pin is to be active HIGH
   procedure bcm2835_spi_setChipSelectPolarity (cs : stdint_h.uint8_t; active : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:988
   pragma Import (C, bcm2835_spi_setChipSelectPolarity, "bcm2835_spi_setChipSelectPolarity");

  --/ Transfers one byte to and from the currently selected SPI slave.
  --/ Asserts the currently selected CS pins (as previously set by bcm2835_spi_chipSelect) 
  --/ during the transfer.
  --/ Clocks the 8 bit value out on MOSI, and simultaneously clocks in data from MISO. 
  --/ Returns the read data byte from the slave.
  --/ Uses polled transfer as per section 10.6.1 of the BCM 2835 ARM Peripherls manual
  --/ \param[in] value The 8 bit data byte to write to MOSI
  --/ \return The 8 bit byte simultaneously read from  MISO
  --/ \sa bcm2835_spi_transfern()
   function bcm2835_spi_transfer (value : stdint_h.uint8_t) return stdint_h.uint8_t;  -- /usr/local/include/bcm2835.h:999
   pragma Import (C, bcm2835_spi_transfer, "bcm2835_spi_transfer");

  --/ Transfers any number of bytes to and from the currently selected SPI slave.
  --/ Asserts the currently selected CS pins (as previously set by bcm2835_spi_chipSelect) 
  --/ during the transfer.
  --/ Clocks the len 8 bit bytes out on MOSI, and simultaneously clocks in data from MISO. 
  --/ The data read read from the slave is placed into rbuf. rbuf must be at least len bytes long
  --/ Uses polled transfer as per section 10.6.1 of the BCM 2835 ARM Peripherls manual
  --/ \param[in] tbuf Buffer of bytes to send. 
  --/ \param[out] rbuf Received bytes will by put in this buffer
  --/ \param[in] len Number of bytes in the tbuf buffer, and the number of bytes to send/received
  --/ \sa bcm2835_spi_transfer()
   procedure bcm2835_spi_transfernb
     (tbuf : Interfaces.C.Strings.chars_ptr;
      rbuf : Interfaces.C.Strings.chars_ptr;
      len : stdint_h.uint32_t);  -- /usr/local/include/bcm2835.h:1011
   pragma Import (C, bcm2835_spi_transfernb, "bcm2835_spi_transfernb");

  --/ Transfers any number of bytes to and from the currently selected SPI slave
  --/ using bcm2835_spi_transfernb.
  --/ The returned data from the slave replaces the transmitted data in the buffer.
  --/ \param[in,out] buf Buffer of bytes to send. Received bytes will replace the contents
  --/ \param[in] len Number of bytes int eh buffer, and the number of bytes to send/received
  --/ \sa bcm2835_spi_transfer()
   procedure bcm2835_spi_transfern (buf : Interfaces.C.Strings.chars_ptr; len : stdint_h.uint32_t);  -- /usr/local/include/bcm2835.h:1019
   pragma Import (C, bcm2835_spi_transfern, "bcm2835_spi_transfern");

  --/ Transfers any number of bytes to the currently selected SPI slave.
  --/ Asserts the currently selected CS pins (as previously set by bcm2835_spi_chipSelect)
  --/ during the transfer.
  --/ \param[in] buf Buffer of bytes to send.
  --/ \param[in] len Number of bytes in the tbuf buffer, and the number of bytes to send
   procedure bcm2835_spi_writenb (buf : Interfaces.C.Strings.chars_ptr; len : stdint_h.uint32_t);  -- /usr/local/include/bcm2835.h:1026
   pragma Import (C, bcm2835_spi_writenb, "bcm2835_spi_writenb");

  --/ @}
  --/ \defgroup i2c I2C access
  --/ These functions let you use I2C (The Broadcom Serial Control bus with the Philips
  --/ I2C bus/interface version 2.1 January 2000.) to interface with an external I2C device.
  --/ @{
  --/ Start I2C operations.
  --/ Forces RPi I2C pins P1-03 (SDA) and P1-05 (SCL)
  --/ to alternate function ALT0, which enables those pins for I2C interface.
  --/ You should call bcm2835_i2c_end() when all I2C functions are complete to return the pins to
  --/ their default functions
  --/ \sa  bcm2835_i2c_end()
   procedure bcm2835_i2c_begin;  -- /usr/local/include/bcm2835.h:1041
   pragma Import (C, bcm2835_i2c_begin, "bcm2835_i2c_begin");

  --/ End I2C operations.
  --/ I2C pins P1-03 (SDA) and P1-05 (SCL)
  --/ are returned to their default INPUT behaviour.
   procedure bcm2835_i2c_end;  -- /usr/local/include/bcm2835.h:1046
   pragma Import (C, bcm2835_i2c_end, "bcm2835_i2c_end");

  --/ Sets the I2C slave address.
  --/ \param[in] addr The I2C slave address.
   procedure bcm2835_i2c_setSlaveAddress (addr : stdint_h.uint8_t);  -- /usr/local/include/bcm2835.h:1050
   pragma Import (C, bcm2835_i2c_setSlaveAddress, "bcm2835_i2c_setSlaveAddress");

  --/ Sets the I2C clock divider and therefore the I2C clock speed.
  --/ \param[in] divider The desired I2C clock divider, one of BCM2835_I2C_CLOCK_DIVIDER_*,
  --/ see \ref bcm2835I2CClockDivider
   procedure bcm2835_i2c_setClockDivider (divider : stdint_h.uint16_t);  -- /usr/local/include/bcm2835.h:1055
   pragma Import (C, bcm2835_i2c_setClockDivider, "bcm2835_i2c_setClockDivider");

  --/ Sets the I2C clock divider by converting the baudrate parameter to
  --/ the equivalent I2C clock divider. ( see \sa bcm2835_i2c_setClockDivider)
  --/ For the I2C standard 100khz you would set baudrate to 100000
  --/ The use of baudrate corresponds to its use in the I2C kernel device
  --/ driver. (Of course, bcm2835 has nothing to do with the kernel driver)
   procedure bcm2835_i2c_set_baudrate (baudrate : stdint_h.uint32_t);  -- /usr/local/include/bcm2835.h:1062
   pragma Import (C, bcm2835_i2c_set_baudrate, "bcm2835_i2c_set_baudrate");

  --/ Transfers any number of bytes to the currently selected I2C slave.
  --/ (as previously set by \sa bcm2835_i2c_setSlaveAddress)
  --/ \param[in] buf Buffer of bytes to send.
  --/ \param[in] len Number of bytes in the buf buffer, and the number of bytes to send.
  --/ \return reason see \ref bcm2835I2CReasonCodes
   function bcm2835_i2c_write (buf : Interfaces.C.Strings.chars_ptr; len : stdint_h.uint32_t) return stdint_h.uint8_t;  -- /usr/local/include/bcm2835.h:1069
   pragma Import (C, bcm2835_i2c_write, "bcm2835_i2c_write");

  --/ Transfers any number of bytes from the currently selected I2C slave.
  --/ (as previously set by \sa bcm2835_i2c_setSlaveAddress)
  --/ \param[in] buf Buffer of bytes to receive.
  --/ \param[in] len Number of bytes in the buf buffer, and the number of bytes to received.
  --/ \return reason see \ref bcm2835I2CReasonCodes
   function bcm2835_i2c_read (buf : Interfaces.C.Strings.chars_ptr; len : stdint_h.uint32_t) return stdint_h.uint8_t;  -- /usr/local/include/bcm2835.h:1076
   pragma Import (C, bcm2835_i2c_read, "bcm2835_i2c_read");

  --/ Allows reading from I2C slaves that require a repeated start (without any prior stop)
  --/ to read after the required slave register has been set. For example, the popular
  --/ MPL3115A2 pressure and temperature sensor. Note that your device must support or
  --/ require this mode. If your device does not require this mode then the standard
  --/ combined:
  --/   \sa bcm2835_i2c_write
  --/   \sa bcm2835_i2c_read
  --/ are a better choice.
  --/ Will read from the slave previously set by \sa bcm2835_i2c_setSlaveAddress
  --/ \param[in] regaddr Buffer containing the slave register you wish to read from.
  --/ \param[in] buf Buffer of bytes to receive.
  --/ \param[in] len Number of bytes in the buf buffer, and the number of bytes to received.
  --/ \return reason see \ref bcm2835I2CReasonCodes
   function bcm2835_i2c_read_register_rs
     (regaddr : Interfaces.C.Strings.chars_ptr;
      buf : Interfaces.C.Strings.chars_ptr;
      len : stdint_h.uint32_t) return stdint_h.uint8_t;  -- /usr/local/include/bcm2835.h:1091
   pragma Import (C, bcm2835_i2c_read_register_rs, "bcm2835_i2c_read_register_rs");

  --/ @}
  --/ \defgroup st System Timer access
  --/ Allows access to and delays using the System Timer Counter.
  --/ @{
  --/ Read the System Timer Counter register.
  --/ \return the value read from the System Timer Counter Lower 32 bits register
   function bcm2835_st_read return stdint_h.uint64_t;  -- /usr/local/include/bcm2835.h:1101
   pragma Import (C, bcm2835_st_read, "bcm2835_st_read");

  --/ Delays for the specified number of microseconds with offset.
  --/ \param[in] offset_micros Offset in microseconds
  --/ \param[in] micros Delay in microseconds
   procedure bcm2835_st_delay (offset_micros : stdint_h.uint64_t; micros : stdint_h.uint64_t);  -- /usr/local/include/bcm2835.h:1106
   pragma Import (C, bcm2835_st_delay, "bcm2835_st_delay");

  --/ @} 
  --/ @example blink.c
  --/ Blinks RPi GPIO pin 11 on and off
  --/ @example input.c
  --/ Reads the state of an RPi input pin
  --/ @example event.c
  --/ Shows how to use event detection on an input pin
  --/ @example spi.c
  --/ Shows how to use SPI interface to transfer a byte to and from an SPI device
  --/ @example spin.c
  --/ Shows how to use SPI interface to transfer a number of bytes to and from an SPI device
end bcm2835_h;
