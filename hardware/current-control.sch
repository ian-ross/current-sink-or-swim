EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title "Programmable current sink (current control)"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R?
U 1 1 5E5F12A4
P 5175 3625
AR Path="/5E5F12A4" Ref="R?"  Part="1" 
AR Path="/5E5EBC79/5E5F12A4" Ref="R203"  Part="1" 
F 0 "R203" H 5245 3671 50  0000 L CNN
F 1 "22K" H 5245 3580 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5105 3625 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/418/NG_DS_9-1773463-9_A-1358566.pdf" H 5175 3625 50  0001 C CNN
F 4 "CRGP0805F22K" H 5175 3625 50  0001 C CNN "MPN"
	1    5175 3625
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E5F12B6
P 7025 4100
AR Path="/5E5F12B6" Ref="R?"  Part="1" 
AR Path="/5E5EBC79/5E5F12B6" Ref="R205"  Part="1" 
F 0 "R205" H 7095 4146 50  0000 L CNN
F 1 "10m, 3W" H 7095 4055 50  0000 L CNN
F 2 "teensy-load:Sense_Resistor" V 6955 4100 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/611/rmc-series-1074317.pdf" H 7025 4100 50  0001 C CNN
F 4 "RMCJ2U00R01FS" H 7025 4100 50  0001 C CNN "MPN"
	1    7025 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E5F12C2
P 5100 4000
AR Path="/5E5F12C2" Ref="#PWR?"  Part="1" 
AR Path="/5E5EBC79/5E5F12C2" Ref="#PWR0204"  Part="1" 
F 0 "#PWR0204" H 5100 3750 50  0001 C CNN
F 1 "GND" H 5105 3827 50  0000 C CNN
F 2 "" H 5100 4000 50  0001 C CNN
F 3 "" H 5100 4000 50  0001 C CNN
	1    5100 4000
	1    0    0    -1  
$EndComp
$Comp
L teensy-load:BTS141 Q?
U 1 1 5E5F12C9
P 6925 3450
AR Path="/5E5F12C9" Ref="Q?"  Part="1" 
AR Path="/5E5EBC79/5E5F12C9" Ref="Q201"  Part="1" 
F 0 "Q201" H 7130 3496 50  0000 L CNN
F 1 "BTS141" H 7130 3405 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 7125 3375 50  0001 L CIN
F 3 "https://www.infineon.com/dgdl/Infineon-BTS141-DS-v01_00-EN.pdf" H 6925 3450 50  0001 L CNN
F 4 "BTS141BKSA1" H 6925 3450 50  0001 C CNN "MPN"
	1    6925 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E5F12DB
P 6450 3450
AR Path="/5E5F12DB" Ref="R?"  Part="1" 
AR Path="/5E5EBC79/5E5F12DB" Ref="R204"  Part="1" 
F 0 "R204" V 6243 3450 50  0000 C CNN
F 1 "1K" V 6334 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6380 3450 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/418/NG_DS_9-1773463-9_A-1358566.pdf" H 6450 3450 50  0001 C CNN
F 4 "CRGP0805F1K0" H 6450 3450 50  0001 C CNN "MPN"
	1    6450 3450
	0    1    1    0   
$EndComp
Text HLabel 8650 2700 2    50   Input ~ 0
IN+
Text HLabel 8650 5275 2    50   Input ~ 0
IN-
Text Notes 6775 6200 0    50   ~ 0
0.01Ω sense resistor => 1A current / 10mV of programming voltage\n\nSo max. programming voltage of 0.1V =>max. current 10A\n\nBTS141 max. I_D = 25 A\n\nI = 10A, R = 0.01Ω => Power = I^2 R = 1W\nUse 3W sense resistor to give margin
Text HLabel 3225 2475 0    50   Input ~ 0
I2C_SCL
Text HLabel 3225 2575 0    50   Input ~ 0
I2C_SDA
Text HLabel 8650 2450 2    50   Input ~ 0
FET_GATE
$Comp
L teensy-load:DAC6571 U201
U 1 1 5E610814
P 4175 2625
F 0 "U201" H 4275 3100 50  0000 L CNN
F 1 "DAC6571" H 4275 3000 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6_Handsoldering" H 4175 2625 50  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=26&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fdac6571" H 4175 2625 50  0001 C CNN
F 4 "DAC6571IDBVR" H 4175 2625 50  0001 C CNN "MPN"
	1    4175 2625
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0203
U 1 1 5E6115DE
P 4175 2050
F 0 "#PWR0203" H 4175 1900 50  0001 C CNN
F 1 "+3.3V" H 4190 2223 50  0000 C CNN
F 2 "" H 4175 2050 50  0001 C CNN
F 3 "" H 4175 2050 50  0001 C CNN
	1    4175 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4175 2225 4175 2050
Wire Wire Line
	3225 2475 3725 2475
Wire Wire Line
	3225 2575 3725 2575
Wire Wire Line
	3725 2775 3550 2775
Wire Wire Line
	3550 2775 3550 3100
Wire Wire Line
	3550 3100 4175 3100
Connection ~ 4175 3100
Wire Wire Line
	4175 3100 4175 3025
Wire Wire Line
	6225 3450 6300 3450
Wire Wire Line
	6600 3450 6650 3450
Wire Wire Line
	8650 2450 6650 2450
Wire Wire Line
	6650 2450 6650 3450
Connection ~ 6650 3450
Wire Wire Line
	6650 3450 6725 3450
Wire Wire Line
	7025 3250 7025 2700
Wire Wire Line
	7025 2700 8650 2700
$Comp
L Device:R R?
U 1 1 5E61CCF9
P 5100 3025
AR Path="/5E61CCF9" Ref="R?"  Part="1" 
AR Path="/5E5EBC79/5E61CCF9" Ref="R202"  Part="1" 
F 0 "R202" H 5170 3071 50  0000 L CNN
F 1 "220K" H 5170 2980 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5030 3025 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/418/NG_DS_9-1773463-9_A-1358566.pdf" H 5100 3025 50  0001 C CNN
F 4 "CRGP0805F220K" H 5100 3025 50  0001 C CNN "MPN"
	1    5100 3025
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3175 5100 3350
Wire Wire Line
	5625 3350 5100 3350
Wire Wire Line
	5100 2875 5100 2625
Wire Wire Line
	5100 2625 4625 2625
Wire Wire Line
	7025 5275 8650 5275
Wire Wire Line
	7025 3650 7025 3750
Wire Wire Line
	5625 3550 5500 3550
Wire Wire Line
	5500 3550 5500 3750
Wire Wire Line
	5500 3750 7025 3750
Connection ~ 7025 3750
Text Notes 4825 2600 0    50   ~ 0
0-3.3V
Text Notes 5200 3325 0    50   ~ 0
0-0.1V
Wire Wire Line
	4175 3900 5100 3900
Wire Wire Line
	4175 3100 4175 3900
Wire Wire Line
	5100 3900 5100 4000
Text Notes 2950 2975 0    50   ~ 0
Other DAC6571\nhas A0 high
Text HLabel 8650 4000 2    50   Output ~ 0
I_SENSE
$Comp
L Device:C C201
U 1 1 5E618F6F
P 2050 2500
F 0 "C201" H 2165 2546 50  0000 L CNN
F 1 "0.1U" H 2165 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2088 2350 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/445/885012207098-1727748.pdf" H 2050 2500 50  0001 C CNN
F 4 "885012207098" H 2050 2500 50  0001 C CNN "MPN"
	1    2050 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0201
U 1 1 5E619260
P 2050 2125
F 0 "#PWR0201" H 2050 1975 50  0001 C CNN
F 1 "+3.3V" H 2065 2298 50  0000 C CNN
F 2 "" H 2050 2125 50  0001 C CNN
F 3 "" H 2050 2125 50  0001 C CNN
	1    2050 2125
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E619775
P 2050 2900
AR Path="/5E619775" Ref="#PWR?"  Part="1" 
AR Path="/5E5EBC79/5E619775" Ref="#PWR0202"  Part="1" 
F 0 "#PWR0202" H 2050 2650 50  0001 C CNN
F 1 "GND" H 2055 2727 50  0000 C CNN
F 2 "" H 2050 2900 50  0001 C CNN
F 3 "" H 2050 2900 50  0001 C CNN
	1    2050 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2900 2050 2650
Wire Wire Line
	2050 2350 2050 2125
Wire Wire Line
	7025 3750 7025 3825
Connection ~ 7025 3900
Wire Wire Line
	7025 3900 7025 3950
$Comp
L teensy-load:TLV4333 U102
U 2 1 5E62FB6E
P 8000 4000
F 0 "U102" H 8000 4365 50  0000 C CNN
F 1 "TLV4333" H 8000 4274 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8000 4025 50  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=26&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftlv4333" H 8000 4025 50  0001 C CNN
F 4 "TLV4333IDR" H 8000 4000 50  0001 C CNN "MPN"
	2    8000 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7025 3900 7700 3900
Wire Wire Line
	8300 4000 8375 4000
Wire Wire Line
	7600 4100 7700 4100
Connection ~ 8375 4000
Wire Wire Line
	8375 4000 8650 4000
Text Notes 7075 3900 0    50   ~ 10
A
Text Notes 1825 4975 0    50   ~ 10
THERMAL DESIGN
Text Notes 1825 5800 0    50   ~ 0
For P = 20 W:\n\nT_A = 25 deg. C\nT_H = 87 deg. C\nT_C = 97 deg. C\nT_J = 113.8 deg. C\n\nBTS141 max. junction temperature = 150 deg. C\nBTS141 max. power dissipation = 149 W
Text Notes 2650 5475 0    50   ~ 0
R_th_H-A = 3.1 K/W (Ohmite RA-T2X-64E)\nR_th_C-H = 0.5 K/W (Wakefield-Vette 120-SA compound)\nR_th_J-C = 0.84 K/W (BTS141)
Wire Notes Line
	1800 4850 1800 6100
Wire Notes Line
	4975 6100 4975 4850
Wire Notes Line
	4975 4850 1800 4850
Wire Notes Line
	1800 6100 4975 6100
Text Notes 1825 6050 0    50   ~ 10
Firmware should limit joint programmed current and maximum voltage\nsettings to give P <= 20W.
$Comp
L teensy-load:TLV4333 U102
U 1 1 5E62F02B
P 5925 3450
F 0 "U102" H 5925 3815 50  0000 C CNN
F 1 "TLV4333" H 5925 3724 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5925 3475 50  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=26&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Ftlv4333" H 5925 3475 50  0001 C CNN
F 4 "TLV4333IDR" H 5925 3450 50  0001 C CNN "MPN"
	1    5925 3450
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J201
U 1 1 5E696BFD
P 7700 3175
F 0 "J201" H 7808 3356 50  0000 C CNN
F 1 "Conn_01x01_Male" H 7808 3265 50  0000 C CNN
F 2 "teensy-load:HeatSink_RA_T2X_64E" H 7700 3175 50  0001 C CNN
F 3 "https://www.ohmite.com/assets/docs/sink_f_r.pdf" H 7700 3175 50  0001 C CNN
F 4 "RA-T2X-64E" H 7700 3175 50  0001 C CNN "MPN"
	1    7700 3175
	1    0    0    -1  
$EndComp
NoConn ~ 7900 3175
Text Notes 7625 3300 0    50   ~ 0
Heat sink
Text Notes 7825 5000 0    50   ~ 0
Amplification of 33 here gives full range\nADC input for sense voltage range of 0-0.1V.
$Comp
L Device:R R208
U 1 1 5E7C1E35
P 8075 4400
F 0 "R208" V 8175 4400 50  0000 C CNN
F 1 "220K" V 8275 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8005 4400 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/418/NG_DS_9-1773463-9_A-1358566.pdf" H 8075 4400 50  0001 C CNN
F 4 "CRGP0805F220K" H 8075 4400 50  0001 C CNN "MPN"
	1    8075 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	7600 4100 7600 4400
Wire Wire Line
	8375 4000 8375 4400
$Comp
L power:GND #PWR?
U 1 1 5E7C4D35
P 7600 4950
AR Path="/5E7C4D35" Ref="#PWR?"  Part="1" 
AR Path="/5E5EBC79/5E7C4D35" Ref="#PWR0205"  Part="1" 
F 0 "#PWR0205" H 7600 4700 50  0001 C CNN
F 1 "GND" H 7605 4777 50  0000 C CNN
F 2 "" H 7600 4950 50  0001 C CNN
F 3 "" H 7600 4950 50  0001 C CNN
	1    7600 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7025 4250 7025 5275
$Comp
L Device:R R?
U 1 1 5E7D5DFF
P 5025 3625
AR Path="/5E7D5DFF" Ref="R?"  Part="1" 
AR Path="/5E5EBC79/5E7D5DFF" Ref="R201"  Part="1" 
F 0 "R201" H 4775 3675 50  0000 L CNN
F 1 "10K" H 4775 3575 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4955 3625 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/418/NG_DS_9-1773463-9_A-1358566.pdf" H 5025 3625 50  0001 C CNN
F 4 "CRGP0805F1K0" H 5025 3625 50  0001 C CNN "MPN"
	1    5025 3625
	1    0    0    -1  
$EndComp
Wire Wire Line
	5175 3450 5100 3450
Wire Wire Line
	5100 3450 5025 3450
Connection ~ 5100 3450
Wire Wire Line
	5025 3800 5100 3800
Connection ~ 5100 3800
Wire Wire Line
	5100 3800 5175 3800
Wire Wire Line
	5025 3800 5025 3775
Wire Wire Line
	5175 3800 5175 3775
Wire Wire Line
	5100 3800 5100 3900
Connection ~ 5100 3900
Wire Wire Line
	5100 3350 5100 3450
Connection ~ 5100 3350
Wire Wire Line
	5025 3450 5025 3475
Wire Wire Line
	5175 3450 5175 3475
$Comp
L Device:R R?
U 1 1 5E7EBF3C
P 7675 4675
AR Path="/5E7EBF3C" Ref="R?"  Part="1" 
AR Path="/5E5EBC79/5E7EBF3C" Ref="R207"  Part="1" 
F 0 "R207" H 7745 4721 50  0000 L CNN
F 1 "22K" H 7745 4630 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7605 4675 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/418/NG_DS_9-1773463-9_A-1358566.pdf" H 7675 4675 50  0001 C CNN
F 4 "CRGP0805F22K" H 7675 4675 50  0001 C CNN "MPN"
	1    7675 4675
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E7EBF43
P 7525 4675
AR Path="/5E7EBF43" Ref="R?"  Part="1" 
AR Path="/5E5EBC79/5E7EBF43" Ref="R206"  Part="1" 
F 0 "R206" H 7275 4725 50  0000 L CNN
F 1 "10K" H 7275 4625 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7455 4675 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/418/NG_DS_9-1773463-9_A-1358566.pdf" H 7525 4675 50  0001 C CNN
F 4 "CRGP0805F1K0" H 7525 4675 50  0001 C CNN "MPN"
	1    7525 4675
	1    0    0    -1  
$EndComp
Wire Wire Line
	7675 4500 7600 4500
Wire Wire Line
	7600 4500 7525 4500
Connection ~ 7600 4500
Wire Wire Line
	7525 4850 7600 4850
Connection ~ 7600 4850
Wire Wire Line
	7600 4850 7675 4850
Wire Wire Line
	7525 4850 7525 4825
Wire Wire Line
	7675 4850 7675 4825
Wire Wire Line
	7600 4850 7600 4950
Wire Wire Line
	7600 4400 7600 4500
Wire Wire Line
	7525 4500 7525 4525
Wire Wire Line
	7675 4500 7675 4525
Connection ~ 7600 4400
Wire Wire Line
	7600 4400 7925 4400
Wire Wire Line
	8225 4400 8375 4400
$Comp
L power:GND #PWR?
U 1 1 5F10D516
P 5750 5025
AR Path="/5F10D516" Ref="#PWR?"  Part="1" 
AR Path="/5E5EBC79/5F10D516" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 5750 4775 50  0001 C CNN
F 1 "GND" H 5755 4852 50  0000 C CNN
F 2 "" H 5750 5025 50  0001 C CNN
F 3 "" H 5750 5025 50  0001 C CNN
	1    5750 5025
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR01
U 1 1 5F10DB53
P 5750 4100
F 0 "#PWR01" H 5750 3950 50  0001 C CNN
F 1 "+3.3V" H 5765 4273 50  0000 C CNN
F 2 "" H 5750 4100 50  0001 C CNN
F 3 "" H 5750 4100 50  0001 C CNN
	1    5750 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4100 5750 4200
Wire Wire Line
	5750 4500 5750 4550
Wire Wire Line
	5750 4925 5750 5025
Wire Wire Line
	6025 4550 5750 4550
Connection ~ 5750 4550
Wire Wire Line
	5750 4550 5750 4625
Wire Wire Line
	6325 4550 6525 4550
Wire Wire Line
	6525 4550 6525 3825
Wire Wire Line
	6525 3825 7025 3825
Connection ~ 7025 3825
Wire Wire Line
	7025 3825 7025 3900
$Comp
L Device:R R?
U 1 1 5F10C69E
P 5750 4350
AR Path="/5F10C69E" Ref="R?"  Part="1" 
AR Path="/5E5EBC79/5F10C69E" Ref="R209"  Part="1" 
F 0 "R209" H 5925 4375 50  0000 C CNN
F 1 "100K" H 5925 4300 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5680 4350 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/418/NG_DS_9-1773463-9_A-1358566.pdf" H 5750 4350 50  0001 C CNN
F 4 "CRGP0805F1K0" H 5750 4350 50  0001 C CNN "MPN"
	1    5750 4350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5F10CB4F
P 5750 4775
AR Path="/5F10CB4F" Ref="R?"  Part="1" 
AR Path="/5E5EBC79/5F10CB4F" Ref="R211"  Part="1" 
F 0 "R211" H 5925 4800 50  0000 C CNN
F 1 "1.5K" H 5925 4725 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5680 4775 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/418/NG_DS_9-1773463-9_A-1358566.pdf" H 5750 4775 50  0001 C CNN
F 4 "CRGP0805F1K0" H 5750 4775 50  0001 C CNN "MPN"
	1    5750 4775
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5F10CFCE
P 6175 4550
AR Path="/5F10CFCE" Ref="R?"  Part="1" 
AR Path="/5E5EBC79/5F10CFCE" Ref="R210"  Part="1" 
F 0 "R210" V 5968 4550 50  0000 C CNN
F 1 "10K" V 6059 4550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6105 4550 50  0001 C CNN
F 3 "https://www.mouser.at/datasheet/2/418/NG_DS_9-1773463-9_A-1358566.pdf" H 6175 4550 50  0001 C CNN
F 4 "CRGP0805F1K0" H 6175 4550 50  0001 C CNN "MPN"
	1    6175 4550
	0    -1   -1   0   
$EndComp
Text Notes 5875 5150 0    50   ~ 0
Generate bias voltage\nof 50mV\n\n(actually 48.7 mV)
Text Notes 5100 5600 0    50   ~ 0
This loses half the DAC range to biasing,\nbut it ought to bring the inputs to the\nopamp above into a range where the\nopamp can work correctly.
Wire Notes Line
	6750 5650 5050 5650
Wire Notes Line
	5050 5650 5050 5225
Wire Notes Line
	5050 5225 5400 5225
Wire Notes Line
	5400 5225 5400 3875
Text Notes 5050 5750 0    50   ~ 10
POSSIBLE MODIFICATION
Wire Notes Line
	6750 3875 6750 5650
Wire Notes Line
	6750 3875 5400 3875
$EndSCHEMATC
