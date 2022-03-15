ENTRY(ResetHandler)
SECTIONS {
	. = 0x08000001;
	.startup : { startup.o(.text) }
	.text : { *(.text) }
	. = 0x20000000;
	__bss_start__ = .;
	.bss : { *(.bss) }
	__bss_end__ = .;
	.data : { *(.data) }
	. = . + 0x100;
	stack_top = .;
}