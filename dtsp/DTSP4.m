% Discrete Time Signal Processing Lab 4
% Fast Fourier Transform
% MATLAB version R2018a
% Date : 09-03-2021

clc;
clear;
close all;

x = [1j 0 -1j 0 1j];                                     
x = [1+1j 0 1-1j 0 2-2j 0 2 2j];


function X = DIT_FFT(x,N)
    X = zeros(1,length(x));
    
    G = zeros(1,length(x)/2);
    H = zeros(1,length(x)/2);
   
end
