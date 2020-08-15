import math
import serial
import serial.tools.list_ports
from threading import Thread
from queue import Queue
from cal import Calibration


class TeensyLoadError(Exception):
    def __init__(self, message):
        self.message = message

class CommsError(TeensyLoadError):
    def __init__(self, message):
        super(CommsError, self).__init__(message)

class TeensyLoad:
    def __init__(self):
        self.cmd_queue = Queue()
        self.data_queues = []
        self.cal = Calibration()
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
        if current < 0 or current > self.cal.CURRENT_MAX:
            raise CommsError('current out of range')
        if voltage < 0 or voltage > self.cal.VOLTAGE_MAX:
            raise CommsError('voltage out of range')
        dac_current = math.floor(current * self.cal.current_dac_scale)
        dac_voltage = math.floor(voltage * self.cal.voltage_dac_scale)
        self.start_raw(sample_ms, dac_current, dac_voltage)

    def start_raw(self, sample_ms, dac_current, dac_voltage):
        msg = '{} {} {}'.format(sample_ms, dac_current, dac_voltage)
        resp = self.command(msg)
        if resp == '+ok':
            return
        if resp.startswith('+error '):
            raise TeensyLoadError(resp.split(' ')[1])
        raise CommsError('unexpected response: "' + resp + '"')

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
                vals = (adc_current / self.cal.current_adc_scale,
                        adc_voltage / self.cal.voltage_adc_scale)
                for q in self.data_queues:
                    q.put(vals)
