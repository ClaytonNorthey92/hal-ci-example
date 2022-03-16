#include <stdlib.h>
#include "LED_test.h"
#include "Unity/src/unity.h"
#include "output.h"

int call_count = 0;


int main() {
	UnityBegin("LED_test.c");
	RUN_TEST(test_turn_led_off);
	RUN_TEST(test_turn_led_on);
	return UnityEnd();
}

void print_something(char s) {
volatile unsigned int * const UART0DR = (unsigned int *)0x40013804;
 call_count++;
 *UART0DR = (unsigned int)(s); /* Transmit char */
}

