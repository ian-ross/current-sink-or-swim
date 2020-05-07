// Teensy Load firmware V0.1

#include "common.h"


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

void common_setup()
{
  // Serial communications with host PC.
  Serial.begin(115200);
}


// ----------------------------------------------------------------------
//
//  MAIN LOOP
//

void loop()
{
  if (new_settings) {
    // If new settings have been received from a serial event...
    new_settings = false;

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
    return;
  }
  String new_voltage_setting_s = line.substring(space2 + 1);
  int new_voltage_setting = new_voltage_setting_s.toInt();
  if (new_voltage_setting == 0 && new_voltage_setting_s != "0") {
    Serial.println("+error invalid-voltage-setting");
    return;
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
