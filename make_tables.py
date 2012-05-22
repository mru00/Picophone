#!/usr/bin/env python

from math import sin, pi

table_size = 256

codes = [ int(100*(1.0 + sin(2.0*pi*i / table_size) ) ) for i in range(table_size) ]

phases_incr = []

print "sinetable	db	", ", ".join(["D'%d'" %(c,) for c in codes])

step = 8
for i in range(table_size/step):
  #print i, i*8, (i+1)*8
  print "	dt	" + ",".join(["0x%02x" %(1+c,) for c in codes[i*8 : (i+1)*8] ])

