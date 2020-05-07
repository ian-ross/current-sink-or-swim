#include "common.h"


// ----------------------------------------------------------------------
//
//  HARDWARE-SPECIFIC SETUP
//

void setup(void)
{
  common_setup();
  randomSeed(analogRead(0));
}


// ----------------------------------------------------------------------
//
//  HARDWARE ACCESS
//

double current_setting_a = 0.0;
double voltage_limit_setting_v = 0.0;


// Read current value.

int read_current(void)
{
  double current, voltage;
  simulate(&current, &voltage);
  int current_val = (int)(current / CURRENT_ADC_SCALE);
  return current_val > 4095 ? 4095 : current_val;
}


// Read voltage value.

int read_voltage(void)
{
  double current, voltage;
  simulate(&current, &voltage);
  int voltage_val = (int)(voltage / VOLTAGE_ADC_SCALE);
  return voltage_val > 4095 ? 4095 : voltage_val;
}


// Set voltage limit.

void set_voltage_limit(int limit)
{
  voltage_limit_setting_v = VOLTAGE_DAC_SCALE * limit;
}


// Set current value.

void set_current_value(int value)
{
  current_setting_a = CURRENT_DAC_SCALE * value;
}


void simulate(double *current, double *voltage)
{
  if (current_setting_a < 250E-3) {
    // Current setting < 250 mA => voltage = 3.7 V
    *current = current_setting_a;
    *voltage = 3.7;
  } else if (current_setting_a < 500E-3) {
    // Current setting 250 mA - 500 mA => voltage ramps down to 0
    *current = current_setting_a;
    *voltage = 3.7 * (1.0 - (current_setting_a - 250E-3) / 250E-3);
  } else {
    *current = 500E-3;
    *voltage = 0.0;
  }

  double rc = 1.0 + 0.02 * (double)random(-1000, 1001) / 1000.0;
  double rv = 1.0 + 0.02 * (double)random(-1000, 1001) / 1000.0;
  *current *= rc;
  *voltage *= rv;
  if (*current < 0.0) *current = 0.0;
  if (*voltage < 0.0) *voltage = 0.0;
}
