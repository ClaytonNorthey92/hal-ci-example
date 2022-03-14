#define MAX_CALLS_EXPECTED 5
#define CALL_ID_mock_turn_led_off 1
#define CALL_ID_mock_turn_led_on 2

void mock_turn_led_off(void);

void mock_turn_led_on(void);

void reset_mocks(void);

int * get_calls(void);