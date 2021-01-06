%Fundamentals of Antenna LAB 1
%Calculation of Antenna Parameters
%Date : 18-08-2020

clear all;
clc;
close all;

theta = [-pi/2:0.01:pi/2];
N = length(theta);
rad_pat = [];

for i=1:N
    rad_pat(i) = (cos(2*theta(i))*cos(3*theta(i)))^2;
end

polarplot(theta,rad_pat,'g','LineWidth',2);
title('Polar Plot of Radiation Pattern');
set(gca,'FontSize',15);
thetaticks(0:30:360);

%Calculating the value of B0
Prad = 10;
r = 1000;
fun = @(x,y)(cos(2*x).*cos(3*x)).^2.*sin(x);
ymax = 2*pi;
q = integral2(fun,0,pi/2,0,ymax);
B0 = Prad/q;
fprintf("Value of B0 ie. Max value of U : %.5f W/sr", B0);

%Value of Maximum Power density
W = B0/(r^2);
fprintf("\nValue of Maximum Power density : %d W/m2", W);

%Calculating directivity
D = 4*pi*B0/Prad;
fprintf("\nValue of Directivity : %.5f ", D);

D = 10*log10(D);
fprintf("\nin dB : %.5f ", D);

%Calculating gain
ecd = 1;
Gain = D*ecd;
fprintf("\nSince the antenna is lossless, gain is the same as D.");
fprintf("\nValue of Gain : %.5f ", Gain);

%Calculating half power beamwidth

[val,idx]= min(abs(rad_pat-0.5));
minVal= abs(theta(idx));
hpbw = 2*180*minVal/pi;
fprintf("\nValue of Half Power Beam Width : %.5f Degrees", hpbw);

syms x
fnbw = solve(((cos(2*x).*cos(3*x)).^2) == 0,x);
fnbw = min(fnbw)*2*180/pi;
fprintf("\nValue of First Null Beamwidth : %.5f Degrees\n", fnbw);
clear all;


