#!/usr/bin/env python

from math import sin, pi, cos
from bitstring import BitArray

table_size = 256

phase_counter_max = 65535
fmaster = 5e4
fmax = fmaster / 2



fs = [ 523.251, 587.330, 659.255, 698.456, 783.991, 880.000, 987.767, 1046.50 ]
fs = [ f/2 for f in fs ]

sin_codes = [ int(120*(sin(2.0*pi*i / table_size) ) ) for i in range(table_size) ]
sqr_codes = [ int(120*( i < table_size/2 and 1 or -1 ) ) for i in range(table_size) ]

codes = sin_codes

phases_incr = [ int(phase_counter_max / (fmax / f))  for f in fs]

format = lambda c: "0x" + BitArray(int=c, length=8).hex


format_lo = lambda c: "0x" + BitArray(uint=c, length=16).hex[2:4]
format_hi = lambda c: "0x" + BitArray(uint=c, length=16).hex[0:2]
print "TABLE_ph_incr_lo"
print "	addwf PCL,F"
print "	dt	" + ",".join([ format_lo(c) for c in phases_incr  ])
print 

print "TABLE_ph_incr_hi"
print "	addwf PCL,F"
print "	dt	" + ",".join([ format_hi(c) for c in phases_incr  ])
print


print "TABLE_sin"
print "	movwf taboff"
print "	bcf STATUS,C"
print "	rlcf taboff,F"
print "	movlw HIGH(TABLE_START_sinetable)"
print "	btfsc STATUS,C"
print "	incf WREG,W"
print "	movwf PCLATH"
print "	movlw LOW(TABLE_START_sinetable)"
print "	addwf taboff,W"
print "	btfsc STATUS,C"
print "	incf PCLATH,F"
print "	movwf PCL"
print "TABLE_START_sinetable"

step = 8
for i in range(table_size/step):
  #print i, i*8, (i+1)*8
  print "	dt	" + ",".join([format(c) for c in codes[i*8 : (i+1)*8] ])
print


