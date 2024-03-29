assemble-arm:
	arm-none-eabi-as -mcpu=cortex-m3 startup.s -g -o  startup.o


compile-arm : assemble-arm
	arm-none-eabi-gcc \
		-D HAL_INTERCEPT \
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
	rm -f test_log.txt
	qemu-system-arm \
	-device loader,addr=0x08000001,cpu-num=0 \
	-machine stm32vldiscovery -cpu cortex-m3 -nographic -kernel led_test.elf > test_log.txt

docker-build:
	docker build -t hal_ci_example .

docker-test:
	docker run -v $(shell pwd):/app hal_ci_example:latest python3 evaluate_tests.py

docker-build-and-test: docker-build docker-test