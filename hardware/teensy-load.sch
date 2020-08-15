EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 3
Title "Programmable current sink"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x02 J101
U 1 1 5E5A20A7
P 8425 3550
F 0 "J101" H 8505 3542 50  0000 L CNN
F 1 "Conn_01x02" H 8505 3451 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-3-2-5.08_1x02_P5.08mm_Horizontal" H 8425 3550 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/670/tb010-508-1550629.pdf" H 8425 3550 50  0001 C CNN
F 4 "TB010-508-02BE" H 8425 3550 50  0001 C CNN "MPN"
	1    8425 3550
	1    0    0    -1  
$EndComp
Text Notes 1700 2425 0    50   ~ 0
IDEAS\n\n - Power from Teensy\n - Expose current and voltage for measurement by Teensy ADCs\n - Program current and maximum voltage from Teensy using I2C DACs\n\nUSE CASES\n\n - Single measurements\n - Scan programming voltage, record test item voltage and current to give V/I curve\n - Fix programming voltage, record current and test item voltage over time\n\nLIMITATIONS\n\n - Current 0 - 10A (full range of current setting DAC)\n - Max. voltage 0 - 20V (full range of max. voltage setting DAC)\n - Max. power 0 - 20W (limit by firmware)
Text Notes 2000 5075 0    50   ~ 0
Teensy supply: 3.3V, 250mA max.
$Sheet
S 6600 3425 950  475 
U 5E5EBC79
F0 "Current control" 50
F1 "current-control.sch" 50
F2 "IN+" I R 7550 3550 50 
F3 "IN-" I R 7550 3650 50 
F4 "I2C_SCL" I L 6600 3550 50 
F5 "I2C_SDA" I L 6600 3650 50 
F6 "FET_GATE" I R 7550 3800 50 
F7 "I_SENSE" O L 6600 3800 50 
$EndSheet
Wire Wire Line
	8225 3550 7975 3550
Wire Wire Line
	8225 3650 8075 3650
$Comp
L teensy-load:TEENSY_4.0 U101
U 1 1 5E5F881B
P 3650 4000
F 0 "U101" H 3650 4965 50  0000 C CNN
F 1 "TEENSY_4.0" H 3650 4874 50  0000 C CNN
F 2 "teensy-load:TEENSY_4.0" H 3650 4000 50  0001 C CNN
F 3 "https://www.pjrc.com/store/teensy40.html" H 3650 4000 50  0001 C CNN
F 4 "TEENSY 4.0" H 3650 4000 50  0001 C CNN "MPN"
	1    3650 4000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0102
U 1 1 5E5FB19A
P 3550 5025
F 0 "#PWR0102" H 3550 4875 50  0001 C CNN
F 1 "+3.3V" H 3565 5198 50  0000 C CNN
F 2 "" H 3550 5025 50  0001 C CNN
F 3 "" H 3550 5025 50  0001 C CNN
	1    3550 5025
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5E5FBEC2
P 3650 5300
F 0 "#PWR0103" H 3650 5050 50  0001 C CNN
F 1 "GND" H 3655 5127 50  0000 C CNN
F 2 "" H 3650 5300 50  0001 C CNN
F 3 "" H 3650 5300 50  0001 C CNN
	1    3650 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5025 3550 4900
Wire Wire Line
	3650 5300 3650 4900
NoConn ~ 3450 4900
NoConn ~ 3750 4900
$Comp
L power:GND #PWR0101
U 1 1 5E5FDD5C
P 1950 3500
F 0 "#PWR0101" H 1950 3250 50  0001 C CNN
F 1 "GND" H 1955 3327 50  0000 C CNN
F 2 "" H 1950 3500 50  0001 C CNN
F 3 "" H 1950 3500 50  0001 C CNN
	1    1950 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3300 1950 3300
Wire Wire Line
	1950 3300 1950 3500
$Comp
L power:GND #PWR0105
U 1 1 5E5FE4E5
P 5375 3525
F 0 "#PWR0105" H 5375 3275 50  0001 C CNN
F 1 "GND" H 5380 3352 50  0000 C CNN
F 2 "" H 5375 3525 50  0001 C CNN
F 3 "" H 5375 3525 50  0001 C CNN
	1    5375 3525
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3400 5375 3400
Wire Wire Line
	5375 3400 5375 3525
$Comp
L power:+3.3V #PWR0104
U 1 1 5E5FEF8C
P 5250 3125
F 0 "#PWR0104" H 5250 2975 50  0001 C CNN
F 1 "+3.3V" H 5265 3298 50  0000 C CNN
F 2 "" H 5250 3125 50  0001 C CNN
F 3 "" H 5250 3125 50  0001 C CNN
	1    5250 3125
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3500 5250 3500
Wire Wire Line
	5250 3500 5250 3125
NoConn ~ 5050 4600
NoConn ~ 5050 3300
NoConn ~ 2250 4600
NoConn ~ 2250 4500
NoConn ~ 2250 4400
NoConn ~ 2250 4300
NoConn ~ 2250 4200
NoConn ~ 2250 4100
NoConn ~ 2250 4000
NoConn ~ 2250 3900
NoConn ~ 5050 3900
NoConn ~ 5050 3800
NoConn ~ 5050 3700
Wire Wire Line
	5750 4000 5750 3550
Wire Wire Line
	5750 3550 6600 3550
Wire Wire Line
	5050 4000 5750 4000
Wire Wire Line
	5850 4100 5850 3650
Wire Wire Line
	5850 3650 6600 3650
Wire Wire Line
	5050 4100 5850 4100
Wire Wire Line
	6600 4575 5750 4575
Wire Wire Line
	5750 4575 5750 4000
Connection ~ 5750 4000
Wire Wire Line
	6600 4675 5850 4675
Wire Wire Line
	5850 4675 5850 4100
Connection ~ 5850 4100
Wire Wire Line
	7550 4575 7975 4575
Wire Wire Line
	7975 4575 7975 3550
Connection ~ 7975 3550
Wire Wire Line
	7975 3550 7550 3550
Wire Wire Line
	7550 4675 8075 4675
Wire Wire Line
	8075 4675 8075 3650
Connection ~ 8075 3650
Wire Wire Line
	8075 3650 7550 3650
Wire Wire Line
	7550 4825 7750 4825
Wire Wire Line
	7750 4825 7750 3800
Wire Wire Line
	7750 3800 7550 3800
$Comp
L power:GND #PWR0106
U 1 1 5E628581
P 8075 5125
F 0 "#PWR0106" H 8075 4875 50  0001 C CNN
F 1 "GND" H 8080 4952 50  0000 C CNN
F 2 "" H 8075 5125 50  0001 C CNN
F 3 "" H 8075 5125 50  0001 C CNN
	1    8075 5125
	1    0    0    -1  
$EndComp
Wire Wire Line
	8075 5125 8075 4675
Connection ~ 8075 4675
Wire Wire Line
	6600 3800 6125 3800
Wire Wire Line
	6125 3800 6125 4500
Wire Wire Line
	5050 4500 6125 4500
Wire Wire Line
	6600 4825 6000 4825
Wire Wire Line
	6000 4825 6000 4400
Wire Wire Line
	5050 4400 6000 4400
$Sheet
S 6600 4450 950  475 
U 5E5EBE75
F0 "Voltage control" 50
F1 "voltage-control.sch" 50
F2 "I2C_SCL" I L 6600 4575 50 
F3 "I2C_SDA" I L 6600 4675 50 
F4 "IN+" I R 7550 4575 50 
F5 "IN-" I R 7550 4675 50 
F6 "FET_GATE" I R 7550 4825 50 
F7 "V_SENSE" O L 6600 4825 50 
$EndSheet
Text Notes 8375 3450 0    50   ~ 0
Device under test\nconnects here
Text Notes 4100 5275 0    50   ~ 0
Input impedance of Teensy ADC inputs is\nca. 7kΩ, giving an input current of about\n0.5mA on each of the two inputs used.\n(Signals going to these have op amp\ndrivers to buffer them.)
Text Notes 1450 6200 0    50   ~ 10
POWER
Text Notes 1450 6600 0    50   ~ 0
DAC output current\nFET gate input current\nOp amp input current\nADC drive current
Text Notes 1450 6750 0    50   ~ 10
TOTAL: < 2 mA
Text Notes 2400 6600 0    50   ~ 0
0.2 mA x 2\n0.1 mA\n0.03 mA? x 4\n0.5 mA x 2
Text Notes 3050 6600 0    50   ~ 0
0.4 mA\n0.1 mA\n0.12 mA?\n1 mA
Text Notes 1450 7075 0    50   ~ 0
Is this in any way realistic at all?  It's based on nominal\nvalues from datasheets, but doesn't account for switching,\ndissipation in passives, or anything else!
Wire Notes Line
	1425 6075 1425 7150
Wire Notes Line
	1425 7150 3750 7150
Wire Notes Line
	3750 7150 3750 6075
Wire Notes Line
	3750 6075 1425 6075
Text Notes 5775 1575 0    50   ~ 10
QUESTIONS\n\n - Is there any good way to calculate power consumption?\n - Are DACs the best way to set the reference levels?  Would a PWM output + LP filter be good enough?
NoConn ~ 2250 3400
NoConn ~ 2250 3500
NoConn ~ 2250 3600
NoConn ~ 2250 3700
NoConn ~ 2250 3800
NoConn ~ 5050 3600
NoConn ~ 5050 4200
NoConn ~ 5050 4300
NoConn ~ 3850 4900
$EndSCHEMATC
