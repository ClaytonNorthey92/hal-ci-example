#include <stdlib.h>
#include "LED_test.h"
#include "Unity/src/unity.h"
#include "output.h"

int main() {
	UnityBegin("LED_test.c");
	RUN_TEST(test_turn_led_off);
	RUN_TEST(test_turn_led_on);
	return UnityEnd();
}

// in order to print to stdout, qemu forwards the first serial port to stdout, so we
// need to send data to that port's data register
void print_something(char s) {
	unsigned int * first_serial = (unsigned int *)0x40013804;
 	*first_serial = (unsigned int)(s); /* Transmit char */
}

