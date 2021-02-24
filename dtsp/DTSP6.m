% Discrete Time Signal Processing Lab 6
% Design of Chebyshev IIR Filter
% MATLAB version R2018a
% Date : 23-02-2021

clc;
clear;
close all;

% Initializing all the parameters
wp = 0.2*pi;
ws = 0.3*pi;
Ap = 1;
As = 15;
F = 1;
T = 1/F;

del_1 = 10^(-Ap/20);
del_2 = 10^(-As/20);
eps = sqrt((del_1^-2)-1);

ohm_p = 2*tan(wp/2)/T;
ohm_s = 2*tan(ws/2)/T;
ohm_c = ohm_p;

N = acosh(sqrt((del_2^-2)-1)/eps)/acosh(ohm_s/ohm_p);
N = ceil(N);

A = ((eps^-1) + sqrt((eps^-2)+1))^(1/N);
B = ((eps^-1) + sqrt((eps^-2)+1))^(-1/N);
yN = 0.5*(A-B);

c = zeros(1,N/2);
b = zeros(1,N/2);

% Calculating the Cehbyshev coefficients
for k=1:N/2
    c(k) = yN^2 + (cos((2*k-1)*pi/(2*N)))^2;
    b(k) = 2*yN*sin((2*k-1)*pi/(2*N));
end

clear B;
%B = c.*A/sqrt(1+eps^2);
B = c.*(del_1^2);

clear k;
H = 1;

% Calculating the transfer function of the analog filter
for k=1:N/2
    num = B(k)*(ohm_c^2);
    den = [1, b(k)*ohm_c, c(k)*(ohm_c^2)];
    sys = tf(num,den);
    H = H*sys;
end

pzmap(H);
ax = gca();
set(ax,'FontSize',13);
figure();

% Designing the digital filter using bilinear transformation

[numerator,denominator] = tfdata(H);
[z,p,k] = tf2zp(numerator{1,1},denominator{1,1});
[A,B,C,D] = zp2ss(z,p,k);

[Ad,Bd,Cd,Dd] = bilinear(A,B,C,D,F);
[bz,az] = ss2tf(Ad,Bd,Cd,Dd);
Hz = tf(bz,az,T);

% Plotting the pole-zero plot of the digital filter
pzmap(Hz);
ax = gca();
set(ax,'FontSize',13);
figure();

% Plotting the magnitude and phase response of the filter
w = 0:0.01:pi;
z = zeros(1,length(w));
s = zeros(1,length(w));
H_z = zeros(1,length(w));
 
for k=1:length(w)
    z(k) = cos(w(k)) + sin(w(k))*1i;
    s(k) = 2*(z(k)-1)/((z(k)+1)*T);
    H_z(k) = evalfr(H,s(k));
end

H_z = H_z./abs(H_z(1));

plot(w,abs(H_z),'r','LineWidth',2);
ax = gca();
set(ax,'FontSize',15);
title('Magnitude response (Normalized)','FontSize',15);
xlabel('Frequency (rad/s)','FontSize',15);
ylabel('Magnitude','FontSize',15);
grid on;
figure();

plot(w,20*log10(abs(H_z)),'r','LineWidth',2);
ax = gca();
set(ax,'FontSize',15);
title('Magnitude response in dB','FontSize',15);
xlabel('Frequency (rad/s)','FontSize',15);
ylabel('Magnitude','FontSize',15);
grid on;
figure();

phasez(bz,az);
ax = gca();
set(ax,'FontSize',13);






    
