#include <stdint.h>

#include "HAL_LED.h"

uint32_t * GPIOC_start = (uint32_t *) ADDR_GPIOC_START;

void turn_led_off(void) {
  GPIOC_start[GPIOC_ODR_OFFSET] = \
    GPIOC_start[GPIOC_ODR_OFFSET] | LED_ON;
}

void turn_led_on(void) {
  GPIOC_start[GPIOC_ODR_OFFSET] = \
    GPIOC_start[GPIOC_ODR_OFFSET] & LED_OFF;
}
