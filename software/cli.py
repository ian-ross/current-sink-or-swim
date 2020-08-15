from threading import Thread
from queue import Queue, Empty

import comms

class CLI:
    def __init__(self):
        self.teensy_load = comms.TeensyLoad()
        self.running = False
        self.collecting = False
        self.data_queue = self.teensy_load.data_queue()
        self.collect_queue = Queue()
        self.usb_handler = Thread(target=self.handle_usb)
        self.usb_handler.setDaemon(True)
        self.usb_handler.start()

    def __del__(self):
        self.teensy_load.stop()

    def handle_usb(self):
        while True:
            vals = self.data_queue.get()
            if self.collecting:
                self.collect_queue.put(vals)

    def start_raw(self, sample_ms, dac_current, dac_voltage):
        self.teensy_load.start_raw(sample_ms, dac_current, dac_voltage)
        self.running = sample_ms > 0

    def start(self, sample_ms, current, voltage):
        self.teensy_load.start(sample_ms, current, voltage)
        self.running = sample_ms > 0

    def stop(self):
        self.teensy_load.stop()
        self.running = False

    def collect(self, count):
        if not self.running:
            return []
        self.collecting = True
        vals = []
        for i in range(count):
            vals.append(self.collect_queue.get())
        self.collecting = False
        try:
            while True:
                self.collect_queue.get_nowait()
        except Empty:
            pass
        return vals
