%Fundamentals of Antenna LAB 3
%Pyramidal Horn Antenna 
%MATLAB version R2020a
%Date : 08-09-2020

% Design a pyramidal horn antenna in E and H plane. 
% Consider the E plane aperture (Ae=10) is fed with a rectangular wave guide with  TE10 mode. 
% The dimensions of the three rectangular wave guide are a =0.2 in E plane and b = 0.375 in the. H plane.
% Compute the following : 
% 1) length of the horn antenna
% 2) H plane aperture
% 3) flare angle for E and H plane
% 4) HPBW and FNBW in E and H plane.
% 5) Directivity

%Freq = 4.4 GHz


clear all;
clc;
close all;

f = input("Enter Operating Frequency in GHz : ");
aE1 = input("Enter E-plane aperture : ");
a = input("Dimension of rectangular waveguide in E-plane (a) : ");
b = input("Dimension of rectangular waveguide in H-plane (b) : ");

wave_length = (3e8)/(f*1e9);
aE = aE1 * wave_length;
deltaE = a * wave_length;
deltaH = b * wave_length;

l = (aE*aE)/(8*deltaE);
disp("Length of horn antenna : " + num2str(l) + " m");

aH = sqrt(l*8*deltaH);
disp("H-Plane Aperture : " + num2str(aH));

b1 = aE/(2*l);
c = aH/(2*l);

thetaE = 2*(atan(b1))*(180/pi);
disp("Flare angle in E-plane : " + num2str(thetaE) + " Degrees");

thetaH = 2*(atan(c))*(180/pi);
disp("Flare angle in H-plane : " + num2str(thetaH) + " Degrees");

HPBWE = 56/aE;
disp("HPBW in E-plane : " + num2str(HPBWE) + " Degrees");

HPBWH = 67/aH;
disp("HPBW in H-plane : " + num2str(HPBWH) + " Degrees");

FNBWE = 115/aE;
disp("FNBW in E-plane : " + num2str(FNBWE) + " Degrees");

FNBWH = 172/aH;
disp("FNBW in E-plane : " + num2str(FNBWH) + " Degrees");

Ap = aE*aH;
D = 10*(log10(7.5*Ap));
disp("Directivity : " + num2str(D) + " dB");

clear all;