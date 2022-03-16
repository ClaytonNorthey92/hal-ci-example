#include <string.h>
#include <stdio.h>
#include "HAL_LED_mock.h"

static int calls [MAX_CALLS_EXPECTED] = {0};
static int call = 0;

void mock_turn_led_off(void) {
	calls[call] = CALL_ID_mock_turn_led_off;
	call++;
}

void mock_turn_led_on(void) {
	calls[call] = CALL_ID_mock_turn_led_on;
	call++;
}

void reset_mocks(void) {
	call = 0;
	memset(calls, 0, MAX_CALLS_EXPECTED * sizeof(int));
}

int * get_calls(void) {
	return calls;
}