.thumb
.syntax unified

.global ResetHandler
ResetHandler:
	LDR SP, =0x20001000
	NOP
	BL main
	B .