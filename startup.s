// startup.s

.thumb
.syntax unified

// this will be our entrypoint, what instructions our processor first executes
.global ResetHandler
ResetHandler:
	// init the stack pointer to start-of-ram + 0x1000
	LDR SP, =0x20001000
	// branch to our code's entry point
	BL main
	B .