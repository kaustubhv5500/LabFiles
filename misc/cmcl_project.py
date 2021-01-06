import matplotlib.pyplot as plt
import numpy as np
import scipy as sc
from scipy.signal import freqz

t = np.arange(700)
n = np.zeros((700,), dtype=complex)
n[50:650] = np.exp(1j*np.random.uniform(0, 2*np.pi, (600,)))
s = np.fft.fft(n)

#Original Signal
plt.subplot(521)
plt.xlabel('time')
plt.title("Time Domain Waveform")
plt.ylabel('amplitude')
plt.plot(t, n)

plt.subplot(522)
plt.xlabel('frequency')
plt.ylabel('amplitude')
plt.title("Fourier Frequency Spectrum")
plt.plot(t, s.real, 'b-', t, s.imag, 'r--')

#High-Pass Filter
s1 = np.copy(s)
s1[0:200]=0
plt.subplot(524)
plt.xlabel('frequency')
plt.ylabel('amplitude')
plt.plot(t, s1.real, 'b-', t, s1.imag, 'r--')

n1=np.fft.ifft(s1)
plt.subplot(523)
plt.xlabel('time')
plt.ylabel('amplitude')
plt.plot(t, n1)

#Low-Pass Filter
s2 = np.copy(s)
s2[500:]=0
plt.subplot(526)
plt.xlabel('frequency')
plt.ylabel('amplitude')
plt.plot(t, s2.real, 'b-', t, s2.imag, 'r--')

n2=np.fft.ifft(s2)
plt.subplot(525)
plt.xlabel('time')
plt.ylabel('amplitude')
plt.plot(t, n2)

#Band-Pass Filter
s3 = np.copy(s)
s3[:250] = 0
s3[350:] = 0
plt.subplot(528)
plt.xlabel('frequency')
plt.ylabel('amplitude')
plt.plot(t, s3.real, 'b-', t, s3.imag, 'r--')

n3=np.fft.ifft(s3)
plt.subplot(527)
plt.xlabel('time')
plt.ylabel('amplitude')
plt.plot(t, n3)

#Band-Reject Filter
s4 = np.copy(s)
s4[250:350] = 0
plt.subplot(5,2,10)
plt.xlabel('frequency')
plt.ylabel('amplitude')
plt.plot(t, s4.real, 'b-', t, s4.imag, 'r--')

n4=np.fft.ifft(s4)
plt.subplot(529)
plt.xlabel('time')
plt.ylabel('amplitude')
plt.plot(t, n3)

plt.show()