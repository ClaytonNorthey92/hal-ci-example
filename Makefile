compile-host:
	gcc -I Unity -I . Unity/src/*.c *.c

run-host: compile-host
	./a.out

compile-arm :
	arm-none-eabi-as -mcpu=cortex-m3 startup.s -g -o  startup.o
	arm-none-eabi-gcc \
		-g \
		-Tcortex-m3-tests.ld \
		-mcpu=cortex-m3 \
		-mthumb \
		-I Unity \
		-I . \
		startup.o \
		Unity/src/*.c cortex-m3/*.c *.c \
		-o led_test.elf
	arm-none-eabi-objcopy led_test.elf led_test.bin

run-arm: compile-arm
	qemu-system-arm -S -s -machine netduino2 -cpu cortex-m3 -nographic -kernel led_test.bin