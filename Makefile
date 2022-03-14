compile-host: HAL_LED.h HAL_LED.c HAL_LED_MOCK.h HAL_LED_MOCK.c Unity HAL_LED_mock_intercepts.h
	gcc -I Unity -I . Unity/src/*.c *.c 

compile-arm : LED.c LED.h Unity/src/unity.h Unity/src/unity.c
	arm-none-eabi-gcc --mcpu=cortex-m3