## Software for Teensy active load

Software can run in three modes:

1. Meter mode: real-time adjustment of current and voltage limits and
   real-time display of current sense and voltage sense values.
   Options to set sample rates.

2. I/V curve mode: collects voltage sense values for a range of
   current settings to create an I/V curve for a device.  Options to
   set sampling intervals at each current, number of current points to
   use, more stringent power, current and/or voltage limits.
   Interface to view data as it comes in, to save, load and print I/V
   curves.

3. Discharge mode: collects time series of sense current and voltage
   for pre-programmed discharge scenarios.  Initially, most basic
   scenario is constant current load, but might like to define other
   scenarios with pulsed loads, etc.  Options to program load
   scenarios and to control frequency of data sampling.  Interface to
   write data to files as it comes in, and to save, load and print
   discharge graphs.

Language: Python + Kivy?
