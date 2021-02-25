import matplotlib.pyplot as plt
import SchemDraw as schem
import SchemDraw.elements as elm
import math

d = schem.Drawing(unit=2.5)

V = d.add(elm.SOURCE_SIN, d='up', label='10V, 50Hz')
d.add(elm.LINE, d='left', l=6)

R = d.add(elm.RES, d='down', botlabel='100$\Omega$')
d.add(elm.LINE, d='right', l=2)

C = d.add(elm.CAP, d='up', botlabel='10$\mu$F')
d.add(elm.LINE, d='right', l=2)

L = d.add(elm.INDUCTOR,d='down', label='1H')
d.add(elm.LINE, d='left', l=2)
d.add(elm.LINE, d='right', l=4)
#d.draw()

V = 10
R = 100
C = 10e-6
L = 1

Xl = 2*math.pi*50*L
Xc = 1/(2*math.pi*50*C)

Il = V/Xl
Ic = V/Xc
Ir = V/R
Is = math.sqrt((Il-Ic)**2+Ir**2)
p = math.atan(Xl/Xc)*180/math.pi

print("Current in the circuit is : ")
print("Through Resistor : {} A ".format(round(Ir,3)))
print("Through Inductor : {} A".format(round(Il,3)))
print("Through Capacior :  {} A".format(round(Ic,3)))
print("Total Current : {} A with a phase lag of {} Degrees".format(round(Is,3),round(p,3)))



