.thumb
.syntax unified

.global ResetHandler
ResetHandler:
	LDR SP, =stack_top
	BL main
	B .