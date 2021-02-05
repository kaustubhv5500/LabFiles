# -*- coding: utf-8 -*-

# Program to calculate the parameters of a Rectangular microstrip antenna
import json
import patch_antenna as pa
from patch_util.patch import design_patch, input_impedance, inset_feed_position
from patch_util.patch import get_directivity, patch_eh_plane_plot, surface_plot, getGs

# Defining antenna parameters
freq = 3 * 10 ** 9
er = 2.1 # Di-electric constant of Teflon at 20 degrees C
h = 1.27 * 10 ** -3
result = pa.design(freq, er, h)

print("Calculated Antenna Parameters : ")
print(json.dumps(result, indent=4))

v = 3 * 10 ** 8

W, L = design_patch(er, h, freq)

Rin = input_impedance(freq, W, L)
print('Inset Feed Position : ', inset_feed_position(Rin, L))

G1, G12 = getGs(freq, W, L)
print('G1 : ', G1)
print('G12 : ', G12)

I1 = 1.863
I2 = 3.59801

d1, d2 = get_directivity(G1, G12, W, freq, I1, I2)

print('Directivity : ')
print('D1 : ', d1, ' dB')
print('D2 : ', d2, ' dB')
fields = patch_eh_plane_plot(freq, W, L, h, er)
surface_plot(fields)