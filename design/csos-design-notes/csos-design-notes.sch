EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Amplifier_Operational:AD8603 U2
U 1 1 5E552ADC
P 4900 3600
F 0 "U2" H 4940 3750 50  0000 L CNN
F 1 "AD8603" H 4910 3460 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-5" H 4900 3600 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/AD8603_8607_8609.pdf" H 4900 3800 50  0001 C CNN
	1    4900 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5E553092
P 5840 4120
F 0 "R3" H 5910 4166 50  0000 L CNN
F 1 "0.1" H 5910 4075 50  0000 L CNN
F 2 "" V 5770 4120 50  0001 C CNN
F 3 "~" H 5840 4120 50  0001 C CNN
	1    5840 4120
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E55363F
P 5840 4470
F 0 "#PWR04" H 5840 4220 50  0001 C CNN
F 1 "GND" H 5845 4297 50  0000 C CNN
F 2 "" H 5840 4470 50  0001 C CNN
F 3 "" H 5840 4470 50  0001 C CNN
	1    5840 4470
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5E5539DE
P 4800 4025
F 0 "#PWR03" H 4800 3775 50  0001 C CNN
F 1 "GND" H 4805 3852 50  0000 C CNN
F 2 "" H 4800 4025 50  0001 C CNN
F 3 "" H 4800 4025 50  0001 C CNN
	1    4800 4025
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 4025 4800 3900
$Comp
L Transistor_FET:2N7000 Q1
U 1 1 5E55451B
P 5740 3600
F 0 "Q1" H 5944 3646 50  0000 L CNN
F 1 "2N7000" H 5944 3555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5940 3525 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7000.pdf" H 5740 3600 50  0001 L CNN
	1    5740 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5540 3600 5200 3600
Wire Wire Line
	5840 4470 5840 4270
Wire Wire Line
	5840 3970 5840 3930
Wire Wire Line
	4600 3700 4510 3700
Wire Wire Line
	4510 3700 4510 3930
Wire Wire Line
	4510 3930 5840 3930
Connection ~ 5840 3930
Wire Wire Line
	5840 3930 5840 3800
$Comp
L Device:Battery BT1
U 1 1 5E558ECA
P 6600 3850
F 0 "BT1" H 6708 3896 50  0000 L CNN
F 1 "Battery" H 6708 3805 50  0000 L CNN
F 2 "" V 6600 3910 50  0001 C CNN
F 3 "~" V 6600 3910 50  0001 C CNN
	1    6600 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5E559BB4
P 6600 4480
F 0 "#PWR05" H 6600 4230 50  0001 C CNN
F 1 "GND" H 6605 4307 50  0000 C CNN
F 2 "" H 6600 4480 50  0001 C CNN
F 3 "" H 6600 4480 50  0001 C CNN
	1    6600 4480
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4480 6600 4050
Wire Wire Line
	6600 3650 6600 3020
Wire Wire Line
	6600 3020 5840 3020
Wire Wire Line
	5840 3020 5840 3400
$Comp
L Regulator_Linear:AMS1117-1.5 U1
U 1 1 5E55B3A5
P 2930 2880
F 0 "U1" H 2930 3122 50  0000 C CNN
F 1 "AMS1117-1.5" H 2930 3031 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2930 3080 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 3030 2630 50  0001 C CNN
	1    2930 2880
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5E55C36A
P 2930 3280
F 0 "#PWR01" H 2930 3030 50  0001 C CNN
F 1 "GND" H 2935 3107 50  0000 C CNN
F 2 "" H 2930 3280 50  0001 C CNN
F 3 "" H 2930 3280 50  0001 C CNN
	1    2930 3280
	1    0    0    -1  
$EndComp
Wire Wire Line
	2930 3280 2930 3180
Wire Wire Line
	2630 2880 2340 2880
Wire Wire Line
	3230 2880 3520 2880
Wire Wire Line
	6600 3020 6740 3020
Connection ~ 6600 3020
Text Label 6740 3020 0    50   ~ 0
VBAT
Text Label 2340 2880 2    50   ~ 0
VBAT
Text Label 3520 2880 0    50   ~ 0
V+
Wire Wire Line
	4800 3300 4800 3090
Text Label 4800 3090 0    50   ~ 0
V+
$Comp
L Device:R R2
U 1 1 5E55DA39
P 4210 3180
F 0 "R2" H 4280 3226 50  0000 L CNN
F 1 "250K" H 4280 3135 50  0000 L CNN
F 2 "" V 4140 3180 50  0001 C CNN
F 3 "~" H 4210 3180 50  0001 C CNN
	1    4210 3180
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5E55E02B
P 4210 4430
F 0 "#PWR02" H 4210 4180 50  0001 C CNN
F 1 "GND" H 4215 4257 50  0000 C CNN
F 2 "" H 4210 4430 50  0001 C CNN
F 3 "" H 4210 4430 50  0001 C CNN
	1    4210 4430
	1    0    0    -1  
$EndComp
Wire Wire Line
	4210 4430 4210 3990
$Comp
L Device:R_Variable R1
U 1 1 5E55E8C5
P 4210 3840
F 0 "R1" H 4338 3886 50  0000 L CNN
F 1 "10K" H 4338 3795 50  0000 L CNN
F 2 "" V 4140 3840 50  0001 C CNN
F 3 "~" H 4210 3840 50  0001 C CNN
	1    4210 3840
	1    0    0    -1  
$EndComp
Wire Wire Line
	4210 3030 4210 2760
Text Label 4210 2760 0    50   ~ 0
V+
Wire Wire Line
	4210 3330 4210 3500
Wire Wire Line
	4600 3500 4210 3500
Connection ~ 4210 3500
Wire Wire Line
	4210 3500 4210 3690
Text Label 4340 3500 0    50   ~ 0
Vref
Text Notes 5940 4420 0    50   ~ 0
Sense resistor\n0.1 ohm, 1W
Text Notes 6700 4070 0    50   ~ 0
Battery under test
Text Notes 6790 3360 0    50   ~ 0
Minimum values:\nLi-ion => 3V/cell\nLiFePO4 => 2.7V/cell\nNi-X => 1V/cell
Text Notes 2410 2530 0    50   ~ 0
LDO regulator:\nVoltage drop = 0.2V?\nADP3338 has drop <= 0.2V\nChoose ADP3338 with Vout = 2.5V
Text Notes 4480 2820 0    50   ~ 0
Op amp:\nSingle-supply\nRail-to-rail\nV+ <= VBAT - LDO drop = 2.7 - 0.2 = 2.5V?\nMCP6291/2/3 can run at V+ = 2.4V\nThat means 2.7V battery OK with 0.2V drop on LDO\n\n(Dual package for current measurement?)
Text Notes 2170 4230 0    50   ~ 0
Allowing 0V <= Vref <= 0.1V means:\nRsense(max) = 0.1/0.1 = 1A\nP(Rsense) = 0.1W\nVds(Q1) = 2.9V (for Li-ion cell)\nP(Q1) = 2.9W\nSo Ptotal = 3W
Text Notes 2170 4810 0    50   ~ 0
With V+ = 2.5V, choose R1 and R2:\nVref(min) = 0V\nVref(max) = 0.1V => R1(max)/R2*V+ = 0.1V\nR1(max)/R2 = 0.1/2.5 = 0.04\nR1(max) = 0.04 R2\nR1(max) = 10K => R2 = 250K
Text Notes 5870 3440 0    50   ~ 0
BTS141 low-side\nswitch
Wire Notes Line
	7800 2900 7800 4800
Wire Notes Line
	7800 4800 5600 4800
Wire Notes Line
	5600 4800 5600 2900
Wire Notes Line
	5600 2900 7800 2900
Text Notes 6900 2875 0    50   ~ 0
HIGH CURRENT SECTION
$EndSCHEMATC
