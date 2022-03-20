ENTRY(ResetHandler)
SECTIONS {
	/* put our startup file where qemu first executes code */
	. = 0x08000001;
	.startup : { startup.o(.text) }

	/* put our program in flash memory */
	.text : { *(.text) }

	/* set up our RAM */
	. = 0x20000000;
	__bss_start__ = .;
	.bss : { *(.bss) }
	__bss_end__ = .;
	.data : { *(.data) }
}