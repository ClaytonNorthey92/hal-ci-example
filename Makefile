compile-host:
	gcc -I Unity -I . Unity/src/*.c *.c

run-host: compile-host
	./a.out

assemble-arm:
	arm-none-eabi-as -mcpu=cortex-m3 startup.s -g -o  startup.o


compile-arm : assemble-arm
	arm-none-eabi-gcc \
		-Tcortex-m3-tests.ld \
		-mcpu=cortex-m3 \
		-mthumb \
		-include output.h \
		-I Unity \
		-I . \
		startup.o \
		Unity/src/*.c cortex-m3/*.c *.c \
		-g -o led_test.elf

run-arm: compile-arm
	qemu-system-arm \
	-device loader,addr=0x08000001,cpu-num=0 \
	-machine stm32vldiscovery -cpu cortex-m3 -nographic -kernel led_test.elf

docker-build:
	docker build -t hal_ci_example .

docker-test:
	docker run hal_ci_example:latest $(timeout 5 make run-arm > test_log.txt)
	cat test_log.txt
