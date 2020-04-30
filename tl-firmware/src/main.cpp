// Teensy Load firmware V0.1

#include <Arduino.h>
#include "shared.h"


// ----------------------------------------------------------------------
//
//  DESIGN LIMITS
//

// Maximum load current (A).
#define MAX_CURRENT 10.0

// Maximum load voltage (V).
#define MAX_VOLTAGE 20.0

// Maximum load power (W).
#define MAX_POWER 20.0


// ----------------------------------------------------------------------
//
//  ADC AND DAC CONVERSION FACTORS
//

// Current sense input:
//  * Current range 0-10A across 0.01 ohm sense resistor
//      => sense resistor voltage range = 0-0.1V
//  * ADC pre-amplification = 33
//      => ADC input voltage range = 0-3.3V (full range)
//  * 12-bit ADC
//
// CURRENT_ADC_SCALE gives overall scale (A / ADC division).
#define CURRENT_ADC_SCALE (MAX_CURRENT / 4095.0)

// Voltage sense input:
//  * Voltage range 0-20V
//  * 1:10 voltage divider for comparison with voltage limit
//      => sense voltage range = 0-2V
//  * ADC pre-amplification = 1.65
//      => ADC voltage range = 0-3.3V (full range)
//  * 12 bit ADC
//
// VOLTAGE_ADC_SCALE gives overall scale (V / ADC division).
#define VOLTAGE_ADC_SCALE (MAX_VOLTAGE / 4095.0)

// Current setting output:
//  * Current range 0-10A across 0.01 ohm sense resistor
//      => current setting voltage range = 0-0.1V
//  * 1:33 voltage divider
//      => DAC output voltage range = 0-3.3V (full range)
//  * 10-bit DAC
//
// CURRENT_DAC_SCALE gives overall scale (A / DAC division).
#define CURRENT_DAC_SCALE (MAX_CURRENT / 1023.0)

// Voltage limit output:
//  * Voltage range 0-20V
//  * 1:10 voltage divider for comparison with voltage limit
//      => limit setting op amp input voltage range = 0-2V
//  * 1:1.65 voltage divider passing DAC output to op amp
//      => DAC output voltage range = 0-3.3V (full range)
//
// VOLTAGE_DAC_SCALE gives overall scale (V / DAC division).
#define VOLTAGE_DAC_SCALE (MAX_VOLTAGE / 1023.0)

// DAC power scale is simply the product of the current and voltage
// scales.
#define POWER_DAC_SCALE (CURRENT_DAC_SCALE * VOLTAGE_DAC_SCALE)

// In order to limit the overall power dissipated by the load, the
// voltage limit must be reduced if the product of the current setting
// and the voltage limit setting would exceed the maximum permitted
// poswer.
//
// MAX_POWER_SCALED gives the maximum permitted power in units of
// (current DAC divisions) * (voltage DAC divisions). When processing
// new current and voltage limit settings, we should check whether the
// product of the demanded current setting (as a DAC division count,
// from 0-1023) and the voltage limit setting (as a DAC division
// count, from 0-1023) exceed MAX_POWER_SCALED. If so, the settings
// are invalid and should be rejected.
#define MAX_POWER_SCALED ((int)(MAX_POWER / POWER_DAC_SCALE))


// ----------------------------------------------------------------------
//
//  STATE
//

// Are we currently sampling and writing samples to the serial port?
bool sampling = false;

// Sample interval (ms).
int sample_ms = 0;

// Are there new settings to apply, passed to us via the serial port?
bool new_settings = false;

// Load current setting received from serial port, in DAC divisions.
int current_setting = 0;

// Voltage limit setting received from serial port, in DAC divisions.
int voltage_setting = 0;

// Next sample time (set when valid current and voltage settings are
// first received from the serial port).
unsigned int next_sample_millis = 0;


// ----------------------------------------------------------------------
//
//  INITIALISATION
//

void setup()
{
  // Serial communications with host PC.
  Serial.begin(115200);

  // Perform simulator/hardware-specific setup.
  io_setup();
}


// ----------------------------------------------------------------------
//
//  MAIN LOOP
//

void loop()
{
  if (new_settings) {
    // If new settings have been received from a serial event...

    // Write voltage setting to DAC.
    set_voltage_limit(voltage_setting);

    // Write current setting to DAC.
    set_current_value(current_setting);

    // Set up sampling.
    next_sample_millis = millis() + sample_ms;
    sampling = sample_ms > 0;
  } else if (sampling && millis() >= next_sample_millis) {
    // ...otherwise, if we've reached the next sample time...

    // Set up next sample time right away to make sampling as even as
    // possible.
    next_sample_millis += sample_ms;

    // Read current ADC.
    int current_reading = read_current();

    // Read voltage ADC.
    int voltage_reading = read_voltage();

    // Send sample data message over serial port.
    Serial.print(current_reading);
    Serial.print(" ");
    Serial.println(voltage_reading);
  }
}


// ----------------------------------------------------------------------
//
//  SERIAL PORT HANDLER
//

void serialEvent()
{
  // Read full LF-terminated line, handling blank lines as "hello" lines.
  String line = Serial.readStringUntil('\n');
  line = line.trim();
  if (line.length() == 0) {
    Serial.println("+version 0.1");
    return;
  }
  
  // Parse as 3 integers separated by spaces.
  int space1 = line.indexOf(" ");
  if (space1 < 0) {
    Serial.println("+error invalid-message");
    return;
  }
  String new_sample_ms_s = line.substring(0, space1);
  int new_sample_ms = new_sample_ms_s.toInt();
  if (new_sample_ms == 0 && new_sample_ms_s != "0") {
    Serial.println("+error invalid-sample-ms");
  }
  line = line.substring(space1 + 1);
  int space2 = line.indexOf(" ");
  if (space2 < 0) {
    Serial.println("+error invalid-message");
    return;
  }
  String new_current_setting_s = line.substring(0, space2);
  int new_current_setting = new_current_setting_s.toInt();
  if (new_current_setting == 0 && new_current_setting_s != "0") {
    Serial.println("+error invalid-current-setting");
  }
  String new_voltage_setting_s = line.substring(space2 + 1);
  int new_voltage_setting = new_voltage_setting_s.toInt();
  if (new_voltage_setting == 0 && new_voltage_setting_s != "0") {
    Serial.println("+error invalid-voltage-setting");
  }

  // Check values are OK and send error message if not.
  if (new_sample_ms < 0 || new_sample_ms > 100000) {
    Serial.println("+error invalid-sample-ms");
    return;
  }
  if (new_current_setting < 0 || new_current_setting > 1023) {
    Serial.println("+error invalid-current-setting");
    return;
  }
  if (new_voltage_setting < 0 || new_voltage_setting > 1023) {
    Serial.println("+error invalid-voltage-setting");
    return;
  }

  // Check the the maximum power limit will not be exceeded and send
  // an error message if so.
  if (new_current_setting * new_voltage_setting > MAX_POWER_SCALED) {
    Serial.println("+error power-limit-exceeded");
    return;
  }

  // We have a good message from the host PC.
  Serial.println("+ok");

  // Set up sampling and new current and voltage settings to be
  // processed in next loop.
  sample_ms = new_sample_ms;
  current_setting = new_current_setting;
  voltage_setting = new_voltage_setting;
  if (sample_ms == 0) {
    sampling = false;
    current_setting = 0;
    voltage_setting = 0;
  }

  // Trigger settings processing in next loop.
  new_settings = true;
}
