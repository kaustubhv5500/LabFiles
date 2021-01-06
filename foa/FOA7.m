%Fundamentals of Antenna LAB 6
%N-element Binomial Ordinary End-fire Array
%MATLAB version R2020a
%Date : 06-10-2020

% Design a endfire non uniform N- element binomial array of isotropic elements positioned
% symmetrically along the z-axis with a distance d= λ/2 apart. Compute for array factor :
% 1. Amplitude excitation coefficient
% 2. Progressive phase excitation
% 3. Array factor
% 4. Angles in degrees where all the null occurs
% 5. Angles in degrees where all the maxima occurs
% 6. HPBW and Directivity
% 7. Plot the radiation pattern of the array factor

% Operational Parameters : N = 6

clc;
clear all;
close all;

%Variables
lambda = 1;
N = 6;
theta = 0:0.01:2*pi;
d = input("Enter the spacing between the antennas in terms of wavelength (d) : ");
k = 2*pi/lambda;
beta = -k*d; %End-fire directed towards theta = 0 degrees

%Amplitude Excitation Coefficients
aem = [1 5 10];
fprintf("The Amplitude Excitation Coefficients are : ");
disp(aem);

%Progressive phase excitation
ppe = beta;
disp("Progressive phase excitation : " + ppe + " radians");

%Calculating the normalized array factor for N = 6
u = (k*d*cos(theta) + beta)/2;
af = abs(2*(cos(u) + 5*cos(3*u) + 10*cos(5*u))); %Always take absolute value
af = af/max(af);

%Calculating the nulls
syms x
nulls = solve((cos(0.5*(k*d*cos(x)+beta)) + 5*cos(1.5*(k*d*cos(x)+beta)) + 10*cos(2.5*(k*d*cos(x)+beta)))== 0,x);
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
hpbw = 1.06/sqrt(N-1);
hpbw = 2*180*hpbw/pi;
fprintf("Half Power Beam Width : %.3f Degrees\n", hpbw);

%Calculating directivity
D = 1.77*sqrt(N);
fprintf("Directivity : %.3f \n", D);
D = 10*log10(D);
fprintf("in dB : %.3f dB \n", D);

%Plotting the graph
polarplot(theta, af, 'r','LineWidth',2);
title('Polar Plot(Array Factor : Normalized)','FontSize',15);
set(gca,'FontSize',15);

    