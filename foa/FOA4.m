%Fundamentals of Antenna LAB 4
%Pattern Multiplication Phenomenon
%MATLAB version R2020a
%Date : 15-09-2020

% Given an array of two infinitesimal dipoles positioned along the z-axis,
% the normalized total field radiated by the two elements assuming no
% coupling between the elements is :
% Etn = cos(theta)*cos(k*d*cos(theta)+ beta)/2)

% Operational Parameters : 
% d = lambda
% beta = +pi/2

clear all;
clc;
close all;

%Variables 
lambda = 1;
theta = linspace(0,2*pi,1000);
c = input("Enter the distance between the antenna in terms of wavelength (d) : ");
d = lambda*c;
beta = input("Enter the phase difference in radians (β): ");
k = 2*pi/lambda;
N = length(theta);

%The antenna array equation
Et_1 = abs(cos(theta));
Et_2 = [];

for i=1:N
    Et_2(i) = abs(cos(0.5*(k*d*cos(theta(i))+beta)));
end

%Total Pattern multiplication
Et = Et_1.*Et_2;

%Calculating the nulls of the plot
syms x
nulls = solve(cos(0.5*(k*d*cos(x)+beta)) == 0,x);

disp("The nulls are : ");

for i=1:length(nulls)
    temp = 180*nulls(i)/pi;
    fprintf("%d) %.3f Degrees\n",i,temp);
end

%Plotting the graph
subplot(131);
polarplot(theta, Et_1, 'r','LineWidth',2);
title('Polar Plot(Radiation Pattern)','FontSize',15);
set(gca,'FontSize',15);

subplot(132);
polarplot(theta, Et_2, 'g', 'LineWidth', 2);
title('Polar Plot(Array Factor)','FontSize',15);
set(gca,'FontSize',15);

subplot(133);
polarplot(theta, Et, 'b', 'LineWidth', 2);
title('Polar Plot(Combined Plot)','FontSize',15);
set(gca,'FontSize',15);
thetaticks(0:30:360);

clear all;