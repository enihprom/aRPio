------------------------
---- constants (spec) --
------------------------

with platform_constants;

package constants is

	package pf renames platform_constants;

	HIGH : constant := 16#1#;  -- pin HIGH  =  true   =  3.3 V
	LOW  : constant := 16#0#;  -- pin LOW   =  false  =    0 V

	BCM2835_ST_OFFSET         : constant := 16#3000#;  
	BCM2835_GPIO_PADS_OFFSET  : constant := 16#100000#;
	BCM2835_CLOCK_OFFSET      : constant := 16#101000#;
	BCM2835_GPIO_OFFSET       : constant := 16#200000#;
	BCM2835_SPI0_OFFSET       : constant := 16#204000#;
	BCM2835_BSC0_OFFSET       : constant := 16#205000#;
	BCM2835_BSC1_OFFSET       : constant := 16#804000#;
	BCM2835_GPIO_PWM_OFFSET   : constant := 16#20C000#;

	BCM2835_CORE_CLK_HZ : constant := 250000000; --< 250 MHz
	BCM2835_PERI_BASE   : constant := 16#20000000#;
	BCM2835_ST_BASE     : constant := (BCM2835_PERI_BASE + BCM2835_ST_OFFSET);
	BCM2835_GPIO_PADS   : constant := (BCM2835_PERI_BASE + BCM2835_GPIO_PADS_OFFSET);
	BCM2835_CLOCK_BASE  : constant := (BCM2835_PERI_BASE + BCM2835_CLOCK_OFFSET);
	BCM2835_GPIO_BASE   : constant := (BCM2835_PERI_BASE + BCM2835_GPIO_OFFSET);
	BCM2835_SPI0_BASE   : constant := (BCM2835_PERI_BASE + BCM2835_SPI0_OFFSET);
	BCM2835_BSC0_BASE   : constant := (BCM2835_PERI_BASE + BCM2835_BSC0_OFFSET);
	BCM2835_GPIO_PWM    : constant := (BCM2835_PERI_BASE + BCM2835_GPIO_PWM_OFFSET);
	BCM2835_BSC1_BASE   : constant := (BCM2835_PERI_BASE + BCM2835_BSC1_OFFSET);

	-- one should not need that -- TODO consider remove
	BCM2835_GPFSEL0     : constant := 16#0000#;
	BCM2835_GPFSEL1     : constant := 16#0004#;
	BCM2835_GPFSEL2     : constant := 16#0008#;
	BCM2835_GPFSEL3     : constant := 16#000c#;
	BCM2835_GPFSEL4     : constant := 16#0010#;
	BCM2835_GPFSEL5     : constant := 16#0014#;

	BCM2835_GPSET0      : constant := 16#001c#;
	BCM2835_GPCLR0      : constant := 16#0028#;

	BCM2835_GPSET0_by4  : constant := 16#001c#/4;
	BCM2835_GPCLR0_by4  : constant := 16#0028#/4;

	-- pin mappings
   RPI_GPIO_P1_03     : constant :=  0;  -- < Version 1, Pin P1-03
   RPI_GPIO_P1_05     : constant :=  1;  -- < Version 1, Pin P1-05
   RPI_GPIO_P1_07     : constant :=  4;  -- < Version 1, Pin P1-07
	
   RPI_GPIO_P1_08     : constant := 14;  -- < Version 1, Pin P1-08,
	                                      --   defaults to alt function 0 UART0_TXD
	
   RPI_GPIO_P1_10     : constant := 15;  -- < Version 1, Pin P1-10,
	                                      --   defaults to alt function 0 UART0_RXD
	
   RPI_GPIO_P1_11     : constant := 17;  -- < Version 1, Pin P1-11
   RPI_GPIO_P1_12     : constant := 18;  -- < Version 1, Pin P1-12
   RPI_GPIO_P1_13     : constant := 21;  -- < Version 1, Pin P1-13
   RPI_GPIO_P1_15     : constant := 22;  -- < Version 1, Pin P1-15
   RPI_GPIO_P1_16     : constant := 23;  -- < Version 1, Pin P1-16
   RPI_GPIO_P1_18     : constant := 24;  -- < Version 1, Pin P1-18
	
   RPI_GPIO_P1_19     : constant := 10;  -- < Version 1, Pin P1-19, 
                                         --   MOSI when SPI0 in use
	
   RPI_GPIO_P1_21     : constant :=  9;  -- < Version 1, Pin P1-21, 
                                         --   MISO when SPI0 in use
	
   RPI_GPIO_P1_22     : constant := 25;  -- < Version 1, Pin P1-22
	
   RPI_GPIO_P1_23     : constant := 11;  -- < Version 1, Pin P1-23,
                                         --   CLK when SPI0 in use
	
   RPI_GPIO_P1_24     : constant :=  8;  -- < Version 1, Pin P1-24,
                                         --   CE0 when SPI0 in use
	
   RPI_GPIO_P1_26     : constant :=  7;  -- < Version 1, Pin P1-26,
                                         --   CE1 when SPI0 in use

   RPI_V2_GPIO_P1_03  : constant :=  2;  -- < Version 2, Pin P1-03
   RPI_V2_GPIO_P1_05  : constant :=  3;  -- < Version 2, Pin P1-05
   RPI_V2_GPIO_P1_07  : constant :=  4;  -- < Version 2, Pin P1-07
	
   RPI_V2_GPIO_P1_08  : constant := 14;  -- < Version 2, Pin P1-08,
	                                      --   defaults to alt function 0 UART0_TXD
	
   RPI_V2_GPIO_P1_10  : constant := 15;  -- < Version 2, Pin P1-10, 
	                                      --   defaults to alt function 0 UART0_RXD
	
   RPI_V2_GPIO_P1_11  : constant := 17;  -- < Version 2, Pin P1-11
   RPI_V2_GPIO_P1_12  : constant := 18;  -- < Version 2, Pin P1-12
   RPI_V2_GPIO_P1_13  : constant := 27;  -- < Version 2, Pin P1-13
   RPI_V2_GPIO_P1_15  : constant := 22;  -- < Version 2, Pin P1-15
   RPI_V2_GPIO_P1_16  : constant := 23;  -- < Version 2, Pin P1-16
   RPI_V2_GPIO_P1_18  : constant := 24;  -- < Version 2, Pin P1-18
	
   RPI_V2_GPIO_P1_19  : constant := 10;  -- < Version 2, Pin P1-19,
                                         --   MOSI when SPI0 in use
	
   RPI_V2_GPIO_P1_21  : constant :=  9;  -- < Version 2, Pin P1-21,
                                         --   MISO when SPI0 in use
	
   RPI_V2_GPIO_P1_22  : constant := 25;  -- < Version 2, Pin P1-22
	
   RPI_V2_GPIO_P1_23  : constant := 11;  -- < Version 2, Pin P1-23,
                                         --   CLK when SPI0 in use
	
   RPI_V2_GPIO_P1_24  : constant :=  8;  -- < Version 2, Pin P1-24,
                                         --   CE0 when SPI0 in use
	
   RPI_V2_GPIO_P1_26  : constant :=  7;  -- < Version 2, Pin P1-26,
                                         --   CE1 when SPI0 in use

   RPI_V2_GPIO_P5_03  : constant := 28;  -- < Version 2, Pin P5-03
   RPI_V2_GPIO_P5_04  : constant := 29;  -- < Version 2, Pin P5-04
   RPI_V2_GPIO_P5_05  : constant := 30;  -- < Version 2, Pin P5-05
   RPI_V2_GPIO_P5_06  : constant := 31;  -- < Version 2, Pin P5-06

end constants;

