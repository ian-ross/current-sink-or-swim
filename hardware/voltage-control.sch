EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title "Programmable current sink (voltage control)"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 8700 3575 2    50   Input ~ 0
FET_GATE
Text HLabel 8700 4025 2    50   Output ~ 0
V_SENSE
$Comp
L power:GND #PWR?
U 1 1 5E6085EF
P 5200 4125
AR Path="/5E6085EF" Ref="#PWR?"  Part="1" 
AR Path="/5E5EBC79/5E6085EF" Ref="#PWR?"  Part="1" 
AR Path="/5E5EBE75/5E6085EF" Ref="#PWR0304"  Part="1" 
F 0 "#PWR0304" H 5200 3875 50  0001 C CNN
F 1 "GND" H 5205 3952 50  0000 C CNN
F 2 "" H 5200 4125 50  0001 C CNN
F 3 "" H 5200 4125 50  0001 C CNN
	1    5200 4125
	1    0    0    -1  
$EndComp
Text HLabel 3325 2600 0    50   Input ~ 0
I2C_SCL
Text HLabel 3325 2700 0    50   Input ~ 0
I2C_SDA
$Comp
L teensy-load:DAC6571 U?
U 1 1 5E6085F7
P 4275 2750
AR Path="/5E5EBC79/5E6085F7" Ref="U?"  Part="1" 
AR Path="/5E5EBE75/5E6085F7" Ref="U301"  Part="1" 
F 0 "U301" H 4375 3225 50  0000 L CNN
F 1 "DAC6571" H 4375 3125 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6_Handsoldering" H 4275 2750 50  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=26&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fdac6571" H 4275 2750 50  0001 C CNN
F 4 "DAC6571IDBVR" H 4275 2750 50  0001 C CNN "MPN"
	1    4275 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E6085FD
P 4275 2175
AR Path="/5E5EBC79/5E6085FD" Ref="#PWR?"  Part="1" 
AR Path="/5E5EBE75/5E6085FD" Ref="#PWR0303"  Part="1" 
F 0 "#PWR0303" H 4275 2025 50  0001 C CNN
F 1 "+3.3V" H 4290 2348 50  0000 C CNN
F 2 "" H 4275 2175 50  0001 C CNN
F 3 "" H 4275 2175 50  0001 C CNN
	1    4275 2175
	1    0    0    -1  
$EndComp
Wire Wire Line
	4275 2350 4275 2275
Wire Wire Line
	3325 2600 3825 2600
Wire Wire Line
	3325 2700 3825 2700
Wire Wire Line
	3825 2900 3650 2900
Wire Wire Line
	5200 3300 5200 3475
Connection ~ 5200 3475
Wire Wire Line
	5200 3475 5200 3600
Wire Wire Line
	5200 3000 5200 2750
Wire Wire Line
	5200 2750 4725 2750
Wire Wire Line
	5200 3900 5200 4025
Text Notes 4925 2725 0    50   ~ 0
0-3.3V
Text Notes 5425 3450 0    50   ~ 0
0-2V
Wire Wire Line
	4275 4025 5200 4025
Connection ~ 5200 4025
Wire Wire Line
	5200 4025 5200 4125
Text Notes 3050 3100 0    50   ~ 0
Other DAC6571\nhas A0 low
Wire Wire Line
	4275 3150 4275 4025
Wire Wire Line
	3650 2900 3650 2275
Wire Wire Line
	3650 2275 4275 2275
Connection ~ 4275 2275
Wire Wire Line
	4275 2275 4275 2175
$Comp
L Device:R R301
U 1 1 5E608A62
P 5200 3150
F 0 "R301" H 5270 3196 50  0000 L CNN
F 1 "10K" H 5270 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5130 3150 50  0001 C CNN
F 3 "~" H 5200 3150 50  0001 C CNN
	1    5200 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R302
U 1 1 5E608F1F
P 5200 3750
F 0 "R302" H 5270 3796 50  0000 L CNN
F 1 "15K" H 5270 3705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5130 3750 50  0001 C CNN
F 3 "~" H 5200 3750 50  0001 C CNN
	1    5200 3750
	1    0    0    -1  
$EndComp
Text HLabel 8700 5775 2    50   Input ~ 0
IN-
Text HLabel 8700 4475 2    50   Input ~ 0
IN+
$Comp
L pspice:DIODE D301
U 1 1 5E609CDF
P 7575 3575
F 0 "D301" H 7575 3310 50  0000 C CNN
F 1 "1N914" H 7575 3401 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123F" H 7575 3575 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/395/1N4148W_SERIES_K1804-1519318.pdf" H 7575 3575 50  0001 C CNN
F 4 "1N914BW RH" H 7575 3575 50  0001 C CNN "MPN"
	1    7575 3575
	-1   0    0    1   
$EndComp
Wire Wire Line
	7375 3575 7175 3575
$Comp
L Device:R R303
U 1 1 5E60E589
P 8125 4800
F 0 "R303" H 8195 4846 50  0000 L CNN
F 1 "9K" H 8195 4755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8055 4800 50  0001 C CNN
F 3 "~" H 8125 4800 50  0001 C CNN
	1    8125 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R304
U 1 1 5E60E864
P 8125 5475
F 0 "R304" H 8195 5521 50  0000 L CNN
F 1 "1K" H 8195 5430 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8055 5475 50  0001 C CNN
F 3 "~" H 8125 5475 50  0001 C CNN
	1    8125 5475
	1    0    0    -1  
$EndComp
Wire Wire Line
	8125 5775 8125 5625
Wire Wire Line
	8125 5325 8125 5125
Wire Wire Line
	8125 5125 6175 5125
Wire Wire Line
	6175 3675 6575 3675
Connection ~ 8125 5125
Text Notes 8200 4450 0    50   ~ 0
0-20V
Text Notes 7200 5100 0    50   ~ 0
0-2V
Wire Wire Line
	8700 3575 7775 3575
Wire Wire Line
	8125 5775 8700 5775
Wire Wire Line
	8125 4475 8700 4475
Wire Wire Line
	8125 4475 8125 4650
Wire Wire Line
	8125 4950 8125 5125
Wire Wire Line
	5200 3475 6575 3475
$Comp
L Device:C C?
U 1 1 5E61BA38
P 2275 2725
AR Path="/5E5EBC79/5E61BA38" Ref="C?"  Part="1" 
AR Path="/5E5EBE75/5E61BA38" Ref="C301"  Part="1" 
F 0 "C301" H 2390 2771 50  0000 L CNN
F 1 "0.1U" H 2390 2680 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2313 2575 50  0001 C CNN
F 3 "~" H 2275 2725 50  0001 C CNN
	1    2275 2725
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E61BA3E
P 2275 2350
AR Path="/5E5EBC79/5E61BA3E" Ref="#PWR?"  Part="1" 
AR Path="/5E5EBE75/5E61BA3E" Ref="#PWR0301"  Part="1" 
F 0 "#PWR0301" H 2275 2200 50  0001 C CNN
F 1 "+3.3V" H 2290 2523 50  0000 C CNN
F 2 "" H 2275 2350 50  0001 C CNN
F 3 "" H 2275 2350 50  0001 C CNN
	1    2275 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E61BA44
P 2275 3125
AR Path="/5E61BA44" Ref="#PWR?"  Part="1" 
AR Path="/5E5EBC79/5E61BA44" Ref="#PWR?"  Part="1" 
AR Path="/5E5EBE75/5E61BA44" Ref="#PWR0302"  Part="1" 
F 0 "#PWR0302" H 2275 2875 50  0001 C CNN
F 1 "GND" H 2280 2952 50  0000 C CNN
F 2 "" H 2275 3125 50  0001 C CNN
F 3 "" H 2275 3125 50  0001 C CNN
	1    2275 3125
	1    0    0    -1  
$EndComp
Wire Wire Line
	2275 3125 2275 2875
Wire Wire Line
	2275 2575 2275 2350
Text Notes 6300 3000 0    50   ~ 0
When device under test voltage exceeds maximum level\nset from DAC, FET gate current is sunk by op amp.
$Comp
L teensy-load:TLV4333 U102
U 3 1 5E63483F
P 6875 3575
F 0 "U102" H 6875 3940 50  0000 C CNN
F 1 "TLV4333" H 6875 3849 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6875 3600 50  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=26&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftlv4333" H 6875 3600 50  0001 C CNN
F 4 "TLV4333IDR" H 6875 3575 50  0001 C CNN "MPN"
	3    6875 3575
	1    0    0    -1  
$EndComp
Wire Wire Line
	6175 3675 6175 3925
$Comp
L teensy-load:TLV4333 U102
U 4 1 5E635235
P 7975 4025
F 0 "U102" H 7975 4390 50  0000 C CNN
F 1 "TLV4333" H 7975 4299 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7975 4050 50  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=26&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftlv4333" H 7975 4050 50  0001 C CNN
F 4 "TLV4333IDR" H 7975 4025 50  0001 C CNN "MPN"
	4    7975 4025
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 4025 8375 4025
Wire Wire Line
	7675 3925 6175 3925
Connection ~ 6175 3925
Wire Wire Line
	6175 3925 6175 5125
Wire Wire Line
	8375 4025 8375 4325
Wire Wire Line
	8375 4325 7550 4325
Wire Wire Line
	7550 4325 7550 4125
Wire Wire Line
	7550 4125 7675 4125
Connection ~ 8375 4025
Wire Wire Line
	8375 4025 8275 4025
$EndSCHEMATC
