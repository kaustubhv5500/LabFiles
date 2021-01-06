%Fundamentals of Antenna LAB 5
%N-element Uniform Amplitude Broadside Array
%MATLAB version R2020a
%Date : 22-09-2020

% A uniform array of N elements is designed so that its maximum is directed
% towards the broad side. The spacing between the elements is lambda/10. For
% the array factor of the antenna, compute the : 
% 1)progressive phase excitation,
% 2)all the angles in degrees where the nulls will occur. 
% 3)All the angles in degrees where all the maximas will occur
% 4)Half Power beam width
% 5)Directivity in dimensionless and dB
% 6)Plot the radiation pattern of the array factor
% The elements are oriented along the z-axis symmetrically
% Operational Parameters : N = 6

clc;
clear all;
close all;

%Variables
lambda = 1;
N = 6;
theta = linspace(0,2*pi,1000);
d = input("Enter the spacing between the antennas in terms of wavelength (d) : ");
beta = input("Enter the phase difference between the elements (β) : ");

k = 2*pi/lambda;
theta_broadside = 90; %For broadside direction, theta is 90 degrees

%Progressive phase excitation
ppe = k*d*cosd(theta_broadside) + beta;

%calculating the normalized array factor
af = abs(cos(1.5*(k*d*cos(theta) + beta)).*(2*cos(k*d*cos(theta)+beta) + 1));
%af = sin(3*(k*d*cos(theta) + beta))./sin(0.5*(k*d*cos(theta) + beta));
af = af/N;

%Calculating the nulls
syms x
nulls = solve(cos(1.5*(k*d*cos(x) + beta)).*(2*cos(k*d*cos(x)+beta) + 1)== 0,x);
disp("The nulls are : ");

%Checking if nulls exist
flag = 0;
if isreal(nulls)
    flag = 1;
end

if flag==0
    disp("Nulls do not exist");
else
    for i=1:length(nulls)
        temp = 180*nulls(i)/pi;
        fprintf("%d) %.3f Degrees\n",i,temp);
    end
end

%Caclulating the maximas
maximas = find(af == max(af));
disp("The maximas are : ");
for i=1:length(maximas)
    temp = theta(maximas(i))*180/pi;
    fprintf("%d) %.3f Degrees\n",i,temp);
end

%Calculating Half Power Beam Width
hpbw = 180*2*(pi/2 - acos((1.391*lambda)/(pi*N*d)))/pi;
fprintf("Half Power Beam Width : %.3f Degrees\n", hpbw);

% h = find(abs(af-0.707)<0.002);
% idx = min(h);
% minVal= abs(theta(idx));
% minVal = abs(pi/2 - minVal);
% hpbw = 2*180*minVal/pi;

%Calculating directivity
D = 2*N*d/lambda;
fprintf("Directivity : %.3f \n", D);
D = 10*log10(D);
fprintf("in dB : %.3f dB \n", D);

%Plotting the graph
polarplot(theta, af, 'r','LineWidth',2);
title('Polar Plot(Array Factor : Normalized)','FontSize',15);
set(gca,'FontSize',15);


