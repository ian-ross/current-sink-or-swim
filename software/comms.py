import math
import serial
import serial.tools.list_ports
from threading import Thread
from queue import Queue

CURRENT_MAX = 10.0
VOLTAGE_MAX = 20.0

DAC_MAX = 1023
ADC_MAX = 4095

CURRENT_DAC_SCALE = DAC_MAX / CURRENT_MAX
VOLTAGE_DAC_SCALE = DAC_MAX / VOLTAGE_MAX

CURRENT_ADC_SCALE = ADC_MAX / CURRENT_MAX
VOLTAGE_ADC_SCALE = ADC_MAX / VOLTAGE_MAX


class CommsError(Exception):
    def __init__(self, message):
        self.message = message

class TeensyLoad:
    def __init__(self):
        self.cmd_queue = Queue()
        self.data_queues = []
        try:
            for p in serial.tools.list_ports.comports():
                if p.vid == 0x16C0 and p.pid == 0x0483:
                    self.usb = serial.Serial(p.device, 115200, timeout=1)
                    self.reader = Thread(target=self.read)
                    self.reader.setDaemon(True)
                    self.reader.start()
                    if self.command('') != '+version 0.1':
                        raise CommsError('firmware version mismatch')
                    self.stop()
                    return
            raise FileNotFoundError('cannot find Teensy Load USB device')
        except:
            self.usb = None
            raise

    def start(self, sample_ms, current, voltage):
        if current < 0 or current > CURRENT_MAX:
            raise CommsError('current out of range')
        if voltage < 0 or voltage > VOLTAGE_MAX:
            raise CommsError('voltage out of range')
        dac_current = math.floor(current * CURRENT_DAC_SCALE)
        dac_voltage = math.floor(voltage * CURRENT_DAC_SCALE)
        msg = '{} {} {}'.format(sample_ms, dac_current, dac_voltage)
        if self.command(msg) != '+ok':
            raise CommsError('unexpected response')

    def stop(self):
        if self.command('0 0 0') != '+ok':
            raise CommsError('unexpected response')

    def command(self, cmd):
        self.usb.write((cmd + '\n').encode())
        return self.cmd_queue.get()

    def data_queue(self):
        q = Queue()
        self.data_queues.append(q)
        return q

    def read(self):
        while True:
            while True:
                line = self.usb.readline().strip().decode()
                if line != '':
                    break
            if line[0] == '+':
                self.cmd_queue.put(line)
            else:
                current_str, voltage_str = line.split()
                adc_current = int(current_str)
                adc_voltage = int(voltage_str)
                vals = (adc_current / CURRENT_ADC_SCALE,
                        adc_voltage / VOLTAGE_ADC_SCALE)
                for q in self.data_queues:
                    q.put(vals)
