% Discrete Time Signal Processing Lab 5
% Design of Butterworth IIR Filter design
% MATLAB version R2018a
% Date : 16-02-2021

clc;
clear;
close all;

wp = 0.2*pi;
ws = 0.3*pi;
Ap = 1;
As = 15;
F = 1;
T = 1/F;

ohm_p = 2*tan(wp/2)/T;
ohm_s = 2*tan(ws/2)/T;

N = 0.5*log10((10^(0.1*As)-1)/(10^(0.1^Ap)-1))/log10(ohm_s/ohm_p);
N = ceil(N);

ohm_c = ohm_p/(10^(0.1*Ap)-1);

% Calculating location of poles
poles = zeros(1,N);
zeroes = [];

for k=0:N-1
    poles(k+1) = ohm_c*(cos((N+2*k+1)*pi/N)+sin((N+2*k+1)*pi/N)*1i);
end

% Calculating and plotting the anaglog transfer function (s-domain)
[num, den] = zp2tf(zeroes,poles,ohm_c^N);
den = round(den);
sys = tf(num,den);
pzmap(sys);
figure();

numerator = ((ohm_c*T)^N).*[1 6 15 20 15 6 1];
denominator = [2^N -6*2^N 15*2^N -20*2^N 15*2^N -6*2^N 2^N+ohm_c^N*T^N];

H_z = tf(numerator,denominator,T);
pzmap(H_z);
figure();

[h,w] = freqz(flip(numerator),flip(denominator),'whole',2001);

plot(w,20*log10(abs(h)),'r','LineWidth',3);
ax = gca();
set(ax,'xlim',[0 pi],'FontSize',12);
title('Magnitude response in dB');
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
grid on;
figure();

h = h./abs(h);

% freqz(numerator,denominator);
% figure();

plot(w,h,'r','LineWidth',3);
ax = gca();
set(ax,'xlim',[0 pi],'FontSize',12);
title('Magnitude response');
xlabel('Frequency (rad/s)');
ylabel('Magnitude');
set(ax,'YTickLabel',{'0','0.25','0.5','0.75','1'});
grid on;
figure();

phasez(flip(numerator),flip(denominator));
figure();

w = 0:0.01:pi;
z = cos(w) + sin(w)*1i;
H = zeros(1,length(w));

for k=1:length(w)
    z(k) = cos(w(k)) + sin(w(k))*1i;
    H(k) = evalfr(H_z,z(k));
end

H = H./max(H);
plot(w,abs(H),'r','LineWidth',2);
ax = gca();
set(ax,'xlim',[0 pi],'ytick',0:0.2:1);
title('Magnitude response','FontSize',15);
xlabel('Frequency (rad/s)','FontSize',15);
ylabel('Magnitude','FontSize',15);
grid on;
