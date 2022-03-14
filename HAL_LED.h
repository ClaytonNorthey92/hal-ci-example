#define ADDR_GPIOC_START 0x40011000
#define GPIOC_ODR_OFFSET 3
#define LED_ON 0x00002000
#define LED_OFF 0xFFFFDFFF

void turn_led_off(void);

void turn_led_on(void);