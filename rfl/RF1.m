% Radio Frequency Lab 1
% Interconversion between network parameters
% MATLAB Version R2018a
% Date : 15-01-2021

% Program to convert S parameters to ABCD parameters
clc;
clear;
close all;

% Defining the S matrix and impedence values
s11 = 1 + 1i;
s12 = 0.5 + 0.5i;
s21 = 0.5 + 0.5i;
s22 = 2 + 1i;

R01 = 50;
X01 = 0;
R02 = 50;
X02 = 0;

Z01 = R01 + X01*1i;
Z02 = R02 + X02*1i;

S = [s11 s12 ; s21 s22];
disp('Input S Parameter Matrix : ');
S

% Calculating ABCD Parameters
a = ((conj(Z01) + s11*Z01)*(1-s22) + s12*s21*Z01)/(2*s21*sqrt(R01*R02));
b = ((conj(Z01) + s11*Z01)*(conj(Z02) + s22*Z02) - s12*s21*Z01*Z02)/(2*s21*sqrt(R01*R02));
c = ((1 - s11)*(1 - s22) - s12*s21)/(2*s21*sqrt(R01*R02));
d = ((1 - s11)*(conj(Z02) + s22*Z02) + s12*s21*Z02)/(2*s21*sqrt(R01*R02));

ABCD = [a b;c d];
% ABCD_ = s2abcd(S,Z01);
disp('ABCD Parameter Matrix after conversion : ');
ABCD




