import json
import os
import os.path
import appdirs


class Calibration:
    APPNAME = 'tl-cal'
    APPAUTHOR = 'teensy-load'
    CALFILE = 'tl-cal.json'

    CURRENT_MAX = 10.0
    VOLTAGE_MAX = 20.0
    POWER_LIMIT = 20.0

    DAC_MAX = 1023
    ADC_MAX = 4095

    # DEFAULT VALUES FOR UNCALIBRATED DEVICE
    CURRENT_DAC_SCALE = DAC_MAX / CURRENT_MAX
    VOLTAGE_DAC_SCALE = DAC_MAX / VOLTAGE_MAX
    CURRENT_ADC_SCALE = ADC_MAX / CURRENT_MAX
    VOLTAGE_ADC_SCALE = ADC_MAX / VOLTAGE_MAX

    def __init__(self):
        self.calibrated = False

        # if the tl-cal.json file exists, read it.
        d = appdirs.user_data_dir(self.APPNAME, self.APPAUTHOR)
        calfile = os.path.join(d, self.CALFILE)
        try:
            with open(calfile) as fp:
                cal = json.load(fp)
            self.current_dac_scale = cal['current_dac_scale']
            self.voltage_dac_scale = cal['voltage_dac_scale']
            self.current_adc_scale = cal['current_adc_scale']
            self.voltage_adc_scale = cal['voltage_adc_scale']
            self.calibrated = True
        except:
            # Otherwise set default values.
            self.current_dac_scale = self.CURRENT_DAC_SCALE
            self.voltage_dac_scale = self.VOLTAGE_DAC_SCALE
            self.current_adc_scale = self.CURRENT_ADC_SCALE
            self.voltage_adc_scale = self.VOLTAGE_ADC_SCALE

    def save(self):
        d = appdirs.user_data_dir(self.APPNAME, self.APPAUTHOR)
        os.makedirs(d, exist_ok=True)
        calfile = os.path.join(d, self.CALFILE)
        cal = {
            'current_dac_scale': self.current_dac_scale,
            'voltage_dac_scale': self.voltage_dac_scale,
            'current_adc_scale': self.current_adc_scale,
            'voltage_adc_scale': self.voltage_adc_scale
        }
        with open(calfile, 'w') as fp:
            json.dump(cal, fp, indent=2)
