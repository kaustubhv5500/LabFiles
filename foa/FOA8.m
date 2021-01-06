%Fundamentals of Antenna LAB 5
%N-element Dolph-Tschebyscheff array
%MATLAB version R2020a
%Date : 13-10-2020

% Design a non uniform N- element -50 dB side lobe levels Dolph-Tschebyscheff array of
% isotropic elements placed symmetrically along the z-axis with a distance d= λ/2 apart.
% Compute for array factor :
% 1. Amplitude excitation coefficient
% 2. Array factor
% 3. Angles in degrees where all the null occurs
% 4. Angles in degrees where all the maxima occurs
% 5. Plot the radiation pattern of the array factor
% Operational Parameters : N = 6

clc;
clear;
close all;

%Variables
lambda = 1;
N = 6;
theta = 0:0.01:2*pi;
d = input("Enter the spacing between the antennas in terms of wavelength (d) : ");
beta = input("Enter the phase difference between the elements (β) : ");
k = 2*pi/lambda;

%Calculating the amplitude excitation coefficients
R0 = 10^(50/20);
z0 = cosh(0.2*acosh(R0));
a3 = z0^5;
a2 = (20*a3 - 20*(z0^3))/4;
a1 = z0 + 3*a2 - 5*a3;

a1 = a1/a3;
a2 = a2/a3;
a3 = a3/a3;

disp("The amplitude excitation coefficients are :");
disp(a1 + "   " + a2 + "   " + a3);

%Calculating the normalized array factor
u = (k*d*cos(theta) + beta)./2;
af = abs(a1*cos(u) + a2*cos(3.*u) + a3*cos(5.*u));
af = af/max(af);

%Calculating the nulls
syms x
nulls = solve(a1*cos(0.5*(k*d*cos(x)+beta))+a2*(cos(1.5*(k*d*cos(x)+beta)))+a3*cos(2.5*(k*d*cos(x)+beta))== 0,x);
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

%Calculating the half power beamwidth and directivity
f = 1+0.636*(2/R0*cosh(sqrt((acosh(R0))^2-pi^2)))^2; %beam broadening factor

D0 = 2*R0^2/(1+(R0^2-1)*f/(d*N));
fprintf("Directivity : %.3f \n", D0);
D = 10*log10(D0);
fprintf("in dB : %.3f dB \n", D);

hpbw = 101.5/D0;
fprintf("Half Power Beam Width : %.3f Degrees\n", hpbw);

%Plotting the polar graph
figure();
polarplot(theta, af, 'r','LineWidth',2);
title('Polar Plot(Array Factor : Normalized)','FontSize',15);
set(gca,'FontSize',15);

%plotting the linear graph
x = theta*180/pi;
x = x(1:316);
y = af(1:316);
figure();
semilogy(x,y,'b','LineWidth',2);
title('Linear Plot of Normalized Array Factor','FontSize',15);
xlabel('Theta in Degrees');
ylabel('Amplitude of array factor in dB');
xlim([0 180]);
grid on;
set(gca,'FontSize',12);



