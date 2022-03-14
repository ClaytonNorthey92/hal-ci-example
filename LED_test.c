#include <stdio.h>
#include "Unity/src/unity.h"
#include "LED.h"
#include "HAL_LED_mock.h"


void setUp() {
	printf("setting up\n");
	reset_mocks();
}

void tearDown() {
	printf("tearing down\n");
}

void test_turn_led_off(void) {
	printf("going to turn led off...\n");
	turn_led("off");
	int * calls = get_calls();
	TEST_ASSERT_EQUAL(calls[0], CALL_ID_mock_turn_led_off);
}

void test_turn_led_on(void) {
	printf("going to turn led on...\n");
	turn_led("on");
	int * calls = get_calls();
	TEST_ASSERT_EQUAL(calls[0], CALL_ID_mock_turn_led_on);
}