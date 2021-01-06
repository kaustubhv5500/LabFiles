
fs = 22050;  %Sampling Frequency 
Ts = 1/fs;   %Sampling Period
Na = 750;    
t = [0:Ts:Na*Ts];   %time axis
fc = 400;           %carrier frequency
fm = 50;            %baseband Frequency
m = 7;              %modulation index

x = cos(2*pi*fm*t); %modulating signal
carrier = cos(2*pi*fc*t);   %carrier signal
figure();
subplot(3,1,1);
plot(t,carrier)
title('Carrier Wave');
xlabel('Time');
ylabel('Amplitude');

m_t = cos(2*pi*fc*t + m*sin(2*pi*fm*t)); %Expression of FM Signal
subplot(3,1,2);
plot(t,x);
title("Modulating Input");
xlabel('Time');
ylabel('Amplitude');

subplot(3,1,3);
plot(t,m_t);
title('Frequency Modulation');
xlabel('Time');
ylabel('FM');

n = floor(log(length(m_t))/log(2));
N1 = 2^n;
Y1 = abs(fft(m_t(1:N1)));
f2 = (-N1/2:N1/2-1)/(Ts*N1);

display(f2);
figure();
stem(f2,fftshift(Y1)); %FFT for frequency Spectrum
title('FM Frequency Spectrum');
xlabel('Frequency');
ylabel('Amplitude');