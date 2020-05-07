#include <Wire.h>
#include "common.h"


// ----------------------------------------------------------------------
//
//  PIN AND ADDRESS ASSIGNMENTS
//

// Standard analogue input pins (need to be in 12-bit mode).
#define CURRENT_ADC_PIN 0
#define VOLTAGE_ADC_PIN 1

// The DACs are I2C devices with addresses of the form:
//
//    1 0 0  1 1 0 A0

// Current setting DAC has A0 low.
#define CURRENT_DAC_ADDR 0x4C

// Current setting DAC has A0 high.
#define VOLTAGE_DAC_ADDR 0x4D


static void dac_write(int addr, int val);


// ----------------------------------------------------------------------
//
//  SETUP
//

void setup()
{
  common_setup();

 // Scaling factors calculated above all rely on 12-bit ADC range.
  analogReadResolution(12);

  // Initialise I2C library for talking to DACs.
  Wire.begin();
}

// ----------------------------------------------------------------------
//
//  HARDWARE ACCESS
//

// Read current value.

int read_current(void)
{
  return analogRead(CURRENT_ADC_PIN);
}


// Read voltage value.

int read_voltage(void)
{
  return analogRead(VOLTAGE_ADC_PIN);
}


// Set voltage limit.

void set_voltage_limit(int limit)
{
  dac_write(VOLTAGE_DAC_ADDR, limit);
}


// Set current value.

void set_current_value(int value)
{
  dac_write(CURRENT_DAC_ADDR, value);
}


// Write value to DAC over I2C.
//
// Given a 10-bit data value (D0:LSB - D9:MSB), the DAC value is set
// by sending a two byte I2C message with bytes:
//
//   MSB: 0    0 PD1 PD0  D9  D8  D7  D6
//
//   LSB: D5  D4  D3  D2  D1  D0   X   X
//
// (PD1 and PD0 are power-down flags, both of which we set to zero)
//
// These can be generated from the 10-bit data value as:
//
//   9 8  7 6 5 4  3 2 1 0
//   X X  X X               => 0x3C0 mask, right shift 6
//            X X  X X X X  => 0x03F mask, left shift 2

static void dac_write(int addr, int val)
{
  Wire.beginTransmission(addr);
  Wire.write((val & 0x3C0) >> 6);
  Wire.write((val & 0x03F) << 2);
  Wire.endTransmission();
}
