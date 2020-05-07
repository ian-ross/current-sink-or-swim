// Teensy Load firmware V0.1

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
