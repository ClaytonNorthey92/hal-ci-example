#include <stdio.h>
#include "Unity/src/unity.h"
#include "LED.h"
#include "HAL_LED_mock.h"


void setUp() {
	reset_mocks();
}

void tearDown() {
}

void test_turn_led_off(void) {
	turn_led("off");
	int * calls = get_calls();
	TEST_ASSERT_EQUAL(calls[0], CALL_ID_mock_turn_led_off);
}

void test_turn_led_on(void) {
	turn_led("on");
	int * calls = get_calls();
	TEST_ASSERT_EQUAL(calls[0], CALL_ID_mock_turn_led_on);
}