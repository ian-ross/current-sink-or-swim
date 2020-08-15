# Software for Teensy active load

Software can run in three modes:

1. Meter mode (`tl-meter`): real-time adjustment of current and
   voltage limits and real-time display of current sense and voltage
   sense values. Options to set sample rates.

2. I/V curve mode (`tl-iv`): collects voltage sense values for a range
   of current settings to create an I/V curve for a device. Options to
   set sampling intervals at each current, number of current points to
   use, more stringent power, current and/or voltage limits. Interface
   to view data as it comes in, to save, load and print I/V curves.

3. Discharge mode (`tl-discharge`): collects time series of sense
   current and voltage for pre-programmed discharge scenarios.
   Initially, most basic scenario is constant current load, but might
   like to define other scenarios with pulsed loads, etc. Options to
   program load scenarios and to control frequency of data sampling.
   Interface to write data to files as it comes in, and to save, load
   and print discharge graphs.

## Calibration

There's also a calibration program called `tl-cal` that should be run
before taking real measurements.

This asks you to take some measurements from the Teensy Load with a
multimeter to derive DAC and ADC calibraition constants. The
calibration data is stored in a configuration file (in
`~/.local/share/tl-cal/tl-cal.json` on Linux) and is used by the other
programs.

## Meter mode

Running `tl-meter` opens a Gtk GUI that can be used to set current
demand and voltage limit in real-time. There are options to modify
sample rates and averaging for display and to save data into a file
for later processing. (It's also possible to add comments to the file
as you go along so that you can mark places to split the data if
you're doing a series of measurements.)

## I/V curves

The `tl-iv` program is a command-line utility to collect voltage and
current supplied by a device at different levels of current demand. It
takes the following options (all currents are specified in mA, all
voltages in V, all times in ms):

 - `output`: data filename prefix for output files (see "Data file
   format" below) [required];
 - `current`: specifies current demand values to use (see "Current
   demand option" below) [required];
 - `current-tolerance`: a percentage tolerance that says how far the
   current supplied by the DUT may fall below the demanded current
   before the test sequence is terminated [optional, default: 1.0];
 - `voltage-min`: a lower voltage limit that says how low the voltage
   supply from the DUT is allowed to fall before the test sequence is
   terminated [required];
 - `voltage-max`: voltage limit to set for all measurements, with the
   test sequence being terminated if the voltage supply from the DUT
   exceeds this [optional, default: 20.0W / max current demand];
 - `sample-interval`: interval between current and voltage supply
   samples [optional, default: 50];
 - `sample-count`: number of current and voltage supply samples to
   collect per current deman value [optional, default: 50].

The normal way that this works is that you set an upper voltage limit
based on the maximum power you want the device under test to supply, a
lower voltage limit based on how much you want to stress the device
under test (in terms of a large current demand pulling the supply
voltage lower because of the supply's internal resistance), a
sequence of current demand values to use, and an output file. The
`tl-iv` program then runs a test sequence to collect device under test
supply voltage and current values for all the current demand values
and writes the resulting measurements out to a data file.

An example command is:

```
tl-iv
  --output test1
  --current 0-100/5,125-250/25,500,1000,1500
  --current-tolerance 5.0
  --voltage-min 3.0
  --voltage-max 6.0
  --sample-interval 100
  --sample-count 50
```

### Current demand option

The `current` current demand option is of the format

```
current ::= <current-spec> ( , <current-spec> )*
current-spec ::= <current-val>
              |  <current-min>-<current-max>/<current-step>
```

Examples are:

```
0,500,1000
0-1000/10
0-100/5,125-250/25,500,1000,1500
```

### Data file format

The `tl-iv` program writes two output files, one containing raw
readings and one I/V curve data. Given an `output` option with value
`test`, these files are given names `test.raw` and `test.dat`.

The raw file has the following columns:

 - `current_demand`: the current demand (mA);
 - `sample`: the index of the sample for this measurement (1 -
   `sample-count`);
 - `current_supply`: the current supplied by the device under test
   (mA);
 - `voltage_supply`: the voltage supplied by the device under test
   (V).

The I/V data file has the following columns:

 - `current_demand`: the current demanded from the device under test
   (mA);
 - `current`: the current supplied by the device under test (mA);
 - `voltage`: the voltage supplied by the device under test (V);
 - `current_sd`: the standard deviation of the supplied current
   samples across the samples collected for this current demand (mA);
 - `voltage_sd`: the standard deviation of the supplied voltage
   samples across the samples collected for this current demand (V).
