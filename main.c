#include "Unity/src/unity.h"
#include "LED_test.h"

int main() {
	UnityBegin("LED_test.c");
	RUN_TEST(test_turn_led_off);
	RUN_TEST(test_turn_led_on);
	return UnityEnd();
}
