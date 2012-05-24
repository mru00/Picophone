EESchema Schematic File Version 2  date Thu 24 May 2012 12:25:42 PM CEST
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
EELAYER 43  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title "picophone"
Date "24 may 2012"
Rev "1"
Comp "mru"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 1350 6100 0    60   ~ 0
finger input switch
Text Notes 5150 5200 0    60   ~ 0
super simple digital analog converter
Text Notes 7850 2200 0    60   ~ 0
Reset pullup
Text Notes 7850 3500 0    60   ~ 0
20MHz crystal
Wire Wire Line
	2200 2400 2200 2200
Connection ~ 6000 5750
Wire Wire Line
	6000 5750 6000 5500
Wire Wire Line
	6000 5500 5700 5500
Wire Wire Line
	5700 5500 5700 5600
Wire Wire Line
	5950 5750 6200 5750
Wire Wire Line
	6200 5750 6200 5950
Wire Wire Line
	6200 7300 6200 6900
Connection ~ 2350 6150
Wire Wire Line
	2350 6150 3250 6150
Wire Wire Line
	1500 6550 1500 6500
Wire Wire Line
	1500 6500 2050 6500
Wire Wire Line
	2350 6300 2350 5950
Wire Wire Line
	2350 6700 2350 7100
Wire Wire Line
	2350 5300 2350 5450
Wire Wire Line
	1500 7100 1500 6950
Wire Wire Line
	8650 4000 8200 4000
Wire Wire Line
	6200 6700 6200 6350
Wire Wire Line
	5450 5750 5000 5750
Wire Wire Line
	2200 3400 2200 3000
$Comp
L GND #PWR2
U 1 1 4FBE0BE8
P 2200 3400
F 0 "#PWR2" H 2200 3400 30  0001 C CNN
F 1 "GND" H 2200 3330 30  0001 C CNN
	1    2200 3400
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR1
U 1 1 4FBE0BE3
P 2200 2200
F 0 "#PWR1" H 2200 2300 30  0001 C CNN
F 1 "VCC" H 2200 2300 30  0000 C CNN
	1    2200 2200
	1    0    0    -1  
$EndComp
$Comp
L BATTERY BT1
U 1 1 4FBE0BD0
P 2200 2700
F 0 "BT1" H 2200 2900 50  0000 C CNN
F 1 "BATTERY 3*AA" H 2200 2510 50  0000 C CNN
	1    2200 2700
	0    1    1    0   
$EndComp
Text Label 5000 5750 0    60   ~ 0
PWM
$Comp
L GND #PWR6
U 1 1 4FBE0B67
P 6200 7300
F 0 "#PWR6" H 6200 7300 30  0001 C CNN
F 1 "GND" H 6200 7230 30  0001 C CNN
	1    6200 7300
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P2
U 1 1 4FBE0B60
P 6550 6800
F 0 "P2" V 6500 6800 40  0000 C CNN
F 1 "Speaker" V 6600 6800 40  0000 C CNN
	1    6550 6800
	1    0    0    -1  
$EndComp
$Comp
L CP1 C1
U 1 1 4FBE0B4C
P 6200 6150
F 0 "C1" H 6250 6250 50  0000 L CNN
F 1 "1000u" H 6250 6050 50  0000 L CNN
	1    6200 6150
	1    0    0    -1  
$EndComp
$Comp
L POT RV1
U 1 1 4FBE0B2B
P 5700 5750
F 0 "RV1" H 5700 5650 50  0000 C CNN
F 1 "5k" H 5700 5750 50  0000 C CNN
	1    5700 5750
	1    0    0    -1  
$EndComp
Text Label 8200 4000 0    60   ~ 0
Switch_0
Text Label 3250 6150 0    60   ~ 0
Switch_i
$Comp
L TEST W1
U 1 1 4FBE0A7E
P 1500 6750
F 0 "W1" H 1500 6810 40  0000 C CNN
F 1 "Finger Switch" H 1500 6680 40  0000 C CNN
	1    1500 6750
	0    1    1    0   
$EndComp
$Comp
L GND #PWR3
U 1 1 4FBE0A54
P 1500 7100
F 0 "#PWR3" H 1500 7100 30  0001 C CNN
F 1 "GND" H 1500 7030 30  0001 C CNN
	1    1500 7100
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR4
U 1 1 4FBE0A34
P 2350 5300
F 0 "#PWR4" H 2350 5400 30  0001 C CNN
F 1 "VCC" H 2350 5400 30  0000 C CNN
	1    2350 5300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR5
U 1 1 4FBE0A26
P 2350 7100
F 0 "#PWR5" H 2350 7100 30  0001 C CNN
F 1 "GND" H 2350 7030 30  0001 C CNN
	1    2350 7100
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 4FBE0A18
P 2350 5700
F 0 "R1" V 2430 5700 50  0000 C CNN
F 1 "390k" V 2350 5700 50  0000 C CNN
	1    2350 5700
	1    0    0    -1  
$EndComp
$Comp
L BC237 Q1
U 1 1 4FBE0A0A
P 2250 6500
F 0 "Q1" H 2450 6400 50  0000 C CNN
F 1 "BC237" H 2500 6650 50  0000 C CNN
F 2 "TO92-EBC" H 2440 6500 30  0001 C CNN
	1    2250 6500
	1    0    0    -1  
$EndComp
$Comp
L DIL40 P1
U 1 1 4FBE09AB
P 9000 3150
F 0 "P1" H 9000 4200 70  0000 C CNN
F 1 "PIC18F4450" V 9000 3150 60  0000 C CNN
	1    9000 3150
	1    0    0    -1  
$EndComp
$EndSCHEMATC
