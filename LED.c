#include <string.h>
#include <stdio.h>
#include "HAL_LED.h"
#include "HAL_LED_mock.h"
#include "HAL_LED_mock_intercepts.h"

void turn_led(char * state) {
	if (strcmp(state, "on") == 0) {
		turn_led_on();
	} else if (strcmp(state, "off") == 0) {
		turn_led_off();
	}
}