%Fundamentals of Antenna LAB 6
%N-element Uniform Amplitude Ordinary End-fire Array
%MATLAB version R2020a
%Date : 29-09-2020

% Design an N-element Ordinary Endfire array with the elements placed
% symmetrically along the z-axis at distance d = 3*lambda/4 apart. 
% For an array factor calculate the : 
% 1)Progressive phase excitation between the elements
% 2)Angles where nulls of the array factor occurs in degrees
% 3)Angles where maximas of the array factor occurs in degrees
% 4)Half Power beamwidth and directivity
% 5)Plot the radiation pattern of the array factor
% Operational parameters : N = 6

clc;
clear all;
close all;

%Variables
lambda = 1;
N = 6;
theta = 0:0.01:2*pi;
d = input("Enter the spacing between the antennas in terms of wavelength (d) : ");
d = d*lambda;
k = 2*pi/lambda;
beta = -k*d; %End-fire directed towards theta = 0 degrees

%Progressive phase excitation
ppe = beta;
disp("Progressive phase excitation : " + ppe + " radians");

%calculating the normalized array factor
af = abs(cos(1.5*(k*d*cos(theta) + beta)).*(2*cos(k*d*cos(theta)+beta) + 1));
% af = sin(5*(k*d*cos(theta) + beta))./sin(0.5*(k*d*cos(theta) + beta));
af = af./3;


%Calculating the nulls
syms x
nulls = solve(cos(1.5*(k*d*cos(x) + beta)).*(2*cos(k*d*cos(x)+beta) + 1)== 0,x);
disp("The nulls are : ");

%Checking if nulls exist
flag = 0;

for i=1:length(nulls)
    if isreal(nulls(i))
        temp = 180*nulls(i)/pi;
        fprintf("%d) %.3f Degrees\n",i,temp);
        flag = 1;
    end
end
        
if flag==0
    disp("Nulls do not exist");
end

%Caclulating the maximas
maximas = find(af == max(af));
disp("The maximas are : ");
for i=1:length(maximas)
    temp = theta(maximas(i))*180/pi;
    fprintf("%d) %.3f Degrees\n",i,temp);
end

%Calculating Half Power Beam Width
hpbw = acos(1 - ((1.391*lambda)/(pi*N*d)));
hpbw = 2*180*hpbw/pi;
fprintf("Half Power Beam Width : %.3f Degrees\n", hpbw);

%Calculating directivity
D = 4*N*d/lambda;
fprintf("Directivity : %.3f \n", D);
D = 10*log10(D);
fprintf("in dB : %.3f dB \n", D);

%Plotting the graph
polarplot(theta, af, 'r','LineWidth',2);
title('Polar Plot(Array Factor : Normalized)','FontSize',15);
set(gca,'FontSize',15);

