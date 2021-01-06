%FCE Project : Voice Encryption using MATLAB R2020a
%SE EXTC : SPIT Sem 4

%1. Voice encryption by Frequency Scrambling 

filename = 'speech.wav';      %Input your own file here : Sample given here
[x,y1] = audioread(filename); %modulating signal input

Ts = 1/y1;              %Sampling Period
Na = length(x);         %number of samples
fc = 30e3;              %carrier frequency is 30kHz
t = [0:Ts:Na*Ts];       %time axis

t = t(1:Na);            %slicing vectors to make them of uniform sizes
x = x(1:Na);

carrier = 7*cos(2*pi*fc*t);   %carrier signal with amplitude 7V

figure();
subplot(2,1,1);
plot(t,x);
title("Modulating Input");
xlabel('Time');
ylabel('Amplitude');

%xh = imag(hilbert(x)); %hilbert transform of audio signal
dsb_sc = [];

for i=1:Na
    dsb_sc(i) = x(i)*carrier(i);
end

%for  i = 1:Na
    %dsb_sc(i) = x(i)*carrier(i) - xh(i)*carrier(i);
%end

subplot(2,1,2);
plot(t,dsb_sc);
title('Resultant DSB-SC waveform');
xlabel('Time');
ylabel('Amplitude');

n = floor(log(length(dsb_sc))/log(2));
N1 = 2^n;
Y1 = abs(fft(dsb_sc(1:N1)));
f2 = (-N1/2:N1/2-1)/(Ts*N1);

figure();
stem(f2,fftshift(Y1)); %FFT for frequency Spectrum
title('Spectrum of DSB-SC signal produced');
xlabel('Frequency');
ylabel('Amplitude');

filtered_signal = filter(Hd, dsb_sc);

clear n N1 Y1 f2 i

n = floor(log(length(filtered_signal))/log(2));
N1 = 2^n;
Y1 = abs(fft(filtered_signal(1:N1)));
f2 = (-N1/2:N1/2-1)/(Ts*N1);

figure();
stem(f2,fftshift(Y1)); %FFT for frequency Spectrum
title('Spectrum after passing through Low Pass Filter');
xlabel('Frequency');
ylabel('Amplitude');

%Uncomment to hear original and encrypted signal
%sound(x,y1);
%sound(filtered_signal,y1);

%2. Decryption to get original message

%fvtool(Hf,'Analysis','magnitude');figure(gcf);
%fvtool(Hd,'Analysis','magnitude');figure(gcf);

temp_signal = [];

%hx = hilbert(imag(filtered_signal));

for j=1:Na
    temp_signal(j) = filtered_signal(j)*carrier(j);
end

decrypted_signal = filter(Hf, temp_signal);
decrypted_signal = filter(Hf, decrypted_signal);

%disp(decrypted_signal);
figure();
plot(t,decrypted_signal);

%Decrypted signal which has the original message ; Uncomment to hear
%sound(decrypted_signal,y1); 





