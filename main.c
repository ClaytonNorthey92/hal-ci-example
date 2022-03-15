#include "LED_test.h"
#include "Unity/src/unity.h"

volatile unsigned int * const UART0DR = (unsigned int *)0x40013804;


static void print_something(char s) {
 *UART0DR = (unsigned int)(s); /* Transmit char */
}

int main() {
	print_something('h');
	UnityBegin("LED_test.c");
	RUN_TEST(test_turn_led_off);
	RUN_TEST(test_turn_led_on);
	return UnityEnd();
}
