#include <string.h>
#include <stdio.h>
#include "HAL_LED.h"

// if we define HAL_INTERCEPT in our compilation process,
// we mock our HAL
// this is up for debate on how to intercept/mock HAL calls,
// but this is a simple way that works for demonstration purposes
#ifdef HAL_INTERCEPT
#include "HAL_LED_mock.h"
#include "HAL_LED_mock_intercepts.h"
#endif

void turn_led(char * state) {
	if (strcmp(state, "on") == 0) {
		turn_led_on();
	} else if (strcmp(state, "off") == 0) {
		turn_led_off();
	}
}