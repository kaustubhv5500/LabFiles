%Temp file for refernce to store unused code!
%!!!!!! DO NOT RUN!!!!!!!

filename = 'speech.wav';
[y,fs] = audioread(filename);
%sound(y,fs);
fs2= fs/4; %reducing sampling rate by factor of 4
newfile = 'D:/Downloads/scramble/final.wav';
audiowrite(newfile, y, fs2);

[x,y1] = audioread('final.wav'); 
Na = length(x);
Ts = 1/y1;
t = [0:Ts:Na*Ts];
t = t(1:Na);
figure();
plot(t,x);
disp(Na);
%sound(x,y*4); %playing back at original sampling rate

Fs = 96e3;
Fpass = 29e3;
Fstop = 30e3;
Apass = 0.01;
Astop = 80;

filtSpecs = fdesign.lowpass(Fpass,Fstop,Apass,Astop,Fs);
filt = design(filtSpecs,'ellip','SystemObject',true);


Fs = y1;
Fn = y1/2;
Wp = [1.0   20]/Fn;                                         % Passband Frequency (Normalised)
Ws = [0.5   21]/Fn;                                         % Stopband Frequency (Normalised)
Rp =   1;                                                   % Passband Ripple (dB)
Rs = 150;                                                   % Stopband Ripple (dB)
[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);                             % Filter Order
[z,p,k] = cheby2(n,Rs,Ws);                                  % Filter Design
[sosbp,gbp] = zp2sos(z,p,k);                                % Convert To Second-Order-Section For Stability
filtered_signal = filtfilt(sosbp, gbp, dsb_sc);             % Filter Signal