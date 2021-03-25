% Radio Frequency Lab 6
% Calculation of power gain for RF amplifier 
% MATLAB Version R2018a
% Date : 19-03-2021

clc;
clear;
close all;

% Defining the S matrix values
[x,y] = pol2cart(-44*pi/180,0.91);
s11 = x + 1i*y;

[x,y] = pol2cart(68*pi/180,0.06);
s12 = x + 1i*y;

[x,y] = pol2cart(149*pi/180,3.92);
s21 = x + 1i*y;

[x,y] = pol2cart(-17*pi/180,0.93);
s22 = x + 1i*y;

% Defining the given Impedences
Zs = 50;
Zl = 50;
Z0 = 50;

% Calculating reflection coefficients
gamma_s = (Zs-Z0)/(Zs+Z0);
gamma_l = (Zl-Z0)/(Zl+Z0);

gamma_in = s11 + ((s12*s21*gamma_l)/(1-s22*gamma_l));
gamma_out = s22 + ((s12*s21*gamma_s)/(1-s11*gamma_s));

% Calculating the gains of the designed antenna
G = (abs(s21)^2)*(1-abs(gamma_l)^2)/((1-abs(gamma_in)^2)*(abs(1-s22*gamma_l)^2));
G_A = (abs(s21)^2)*(1-abs(gamma_s)^2)/((1-abs(gamma_out)^2)*(abs(1-s11*gamma_s)^2));
G_T = (abs(s21)^2)*(1-abs(gamma_s)^2)*(1-abs(gamma_l)^2)/((abs(1-gamma_s*gamma_l)^2)*(abs(1-s22*gamma_l)^2));

% Displaying the output parameters
fprintf('The Gain of the antenna is : %f \n',G);
fprintf('The Available Power Gain of the antenna is : %f \n',G_A);
fprintf('The Transducer Power Gain of the antenna is : %f \n',G_T);
