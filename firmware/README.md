# Firmware for Teensy active load

## Communications between PC and Teensy

The Teensy is connected to a PC over a USB connection, appearing as a
USB serial port on the PC.  The user interface software PC and the
firmware on the Teensy communicate using a simple ASCII protocol.

All messages in either direction are single LF-terminated ASCII lines.

### PC-to-Teensy messages

Messages from the PC to the Teensy are LF-terminated lines of the
form:

```
<sample-ms> <current-setting> <voltage-setting>
```

where:

 * `<sample-ms>` gives the number of milliseconds between ADC samples
   to be collected by the Teensy; setting this to zero stops sampling.

 * `<current-setting>` is the DAC value to use for the current setting
   DAC (0-1023).

 * `<voltage-setting>` is the DAC value to use for the voltage limit
   setting DAC (0-1023).


### Teensy-to-PC response messages

The Teensy replies to commands from the PC with a message of the form:

```
+ok <version>
```

if the command was processed successfully, where `<version>` is the
Git version of the firmware, or

```
+error <error-code>
```

if there was a problem processing the command, where `<error-code>` is
one of:

 * `invalid-message`
 * `invalid-sample-ms`
 * `invalid-current-setting`
 * `invalid-voltage-setting`
 * `power-limit-exceeded`


### Teensy-to-PC data messages

Once the PC has set a non-zero `<sample-ms>` value, the Teensy reads
the current and voltage sense ADCs every `<sample-ms>` milliseconds
and outputs a message of the form

```
<current-sense-value> <voltage-sense-value>
```

where both `<current-sense-value>` and `<voltage-sense-value>` are raw
12-bit ADC counts (i.e. integers from 0-4095).
