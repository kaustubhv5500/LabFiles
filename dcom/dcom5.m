% DCom Lab 5
% Aim : Implementation of Linear block code for 4 bit input sequence
% MATLAB Version : R2020a
% Date : 21-10-2020

clc;
clear;
close all;

% Input Generator Matrix
% G = input('Enter The Generator Matrix: ');

G = [1 0 0 0 1 0 1; 0 1 0 0 1 1 1; 0 0 1 0 1 1 0; 0 0 0 1 0 1 1];
disp ('G = ');
disp(G);

[n,k] = size(transpose(G));
disp ("The Order of Linear block Code for given Generator Matrix is:" + n + " x " + k);

for i = 1:2^k
    for j = k:-1:1
        if mod(i-1,2^(-j+k+1))>=2^(-j+k)
            u(i,j)=1;
        else
            u(i,j)=0;
        end
    end
end

disp('The Possible Codewords are :');
c = mod(u*G,2)
disp('The Minimum Hamming Distance dmin for given Block Code is : ');
d_min = min(sum((c(2:2^k,:))));
d_min = log2(d_min)

% Input the message signal
m = input("Enter the message signal : ");
disp("Transmitted codeword : ");
c_out = mod(m*G,2)

% Received Code Word
r = input('Enter the Received Code Word : ');
p = [G(:,n-k+2:n)];
h = [transpose(p),eye(n-k)];
disp('Hamming Code : ')
ht = transpose(h)

% Displaying the syndrome of the received codeword
disp('Syndrome of the Given Codeword is :')
s = mod(r*ht,2)

for i = 1:1:size(ht)
    if(ht(i,1:3)== s)
        r(i) = 1 - r(i);
        break;
    end
end

if s == [0 0 0]
    i = "Error not found";
end

disp("The Error is in bit : ");
disp(i);
disp('The Corrected Codeword is :');
disp(r);
