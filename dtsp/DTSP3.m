% Discrete Time Signal Processing Lab 3
% Discrete Fourier  Transform
% MATLAB version R2018a
% Date : 09-02-2021

clc;
clear;
close all;

x = [1+2j,3+4j,-1-2j,5-2j];
N = length(x);

% Plotting the input signal
stem(abs(x),'g','LineWidth',3);
ax = gca();
title('Plot of magnitude of x(n)','FontSize',15);
xlabel('n','FontSize',15);
ylabel('|x|','FontSize',15);
set(ax,'xlim',[0 N+1],'fontsize',15);
grid on;
figure();

stem(angle(x),'b','LineWidth',3);
ax = gca();
title('Plot of phase of x(n)','FontSize',15);
xlabel('n','FontSize',15);
ylabel('\angle x','FontSize',15);
set(ax,'xlim',[0 N+1],'fontsize',15);
grid on;
figure();

% polarscatter(angle(x),abs(x),75,'filled','r');
% title('Polar plot of x','FontSize',15);
% set(gca,'FontSize',15);
% figure();

% Calculating the DFT of the input signal
X = DFT(x,N);
disp('DFT of input signal : ');
disp(X);

% polarscatter(angle(X),abs(X),75,'filled','r');
% title('Polar plot of X','FontSize',15);
% set(gca,'FontSize',15);
% figure();

% Plotting the DFT of input signal
stem(abs(X),'r','LineWidth',3);
ax = gca();
title('Plot of magnitude of X(k)','FontSize',15);
xlabel('n','FontSize',15);
ylabel('|X|','FontSize',15);
set(ax,'xlim',[0 N+1],'fontsize',15);
grid on;
figure();

stem(angle(X),'b','LineWidth',3);
ax = gca();
title('Plot of phase of X(k)','FontSize',15);
xlabel('n','FontSize',15);
ylabel('\angle X','FontSize',15);
set(ax,'xlim',[0 N+1],'fontsize',15);
grid on;
figure();

% Calculating the IDFT of the spectrum
x_ = IDFT(X,N);
disp('Retrieved signal after IDFT : ');
disp(x_);

% Plotting the IDFT of input signal
stem(abs(x_),'r','LineWidth',3);
ax = gca();
title('Plot of magnitude of IDFT of X(k)','FontSize',15);
xlabel('n','FontSize',15);
ylabel('|x|','FontSize',15);
set(ax,'xlim',[0 length(X)+1],'fontsize',15);
grid on;
figure();

stem(angle(X),'b','LineWidth',3);
ax = gca();
title('Plot of phase of IDFT of X(k)','FontSize',15);
xlabel('n','FontSize',15);
ylabel('\angle x','FontSize',15);
set(ax,'xlim',[0 length(X)+1],'fontsize',15);
grid on;
figure();

% Adding zeros at alternate indices and calculating DFT
x_alt = reshape([x; zeros(size(x))],[],1);
X = DFT(x_alt,length(x_alt));
disp('DFT of x with alternate zeros : ');
disp(X);

% Plotting the DFT of input signal
stem(abs(X),'r','LineWidth',3);
ax = gca();
title('Plot of magnitude of X(k) with alternate zeros','FontSize',15);
xlabel('n','FontSize',15);
ylabel('|X|','FontSize',15);
set(ax,'xlim',[0 length(X)+1],'fontsize',15);
grid on;
figure();

stem(angle(X),'b','LineWidth',3);
ax = gca();
title('Plot of phase of X(k) with alternate zeros','FontSize',15);
xlabel('n','FontSize',15);
ylabel('\angle X','FontSize',15);
set(ax,'xlim',[0 length(X)+1],'fontsize',15);
grid on;
figure();

% Appending zeros to the input signal and calculating DFT
zeros_n = 4;
x_ = [x, zeros(1,zeros_n)];
X = DFT(x_,length(x_));
disp('DFT of x with zeros appended at the end : ');
disp(X);

% Plotting the DFT of input signal
stem(abs(X),'r','LineWidth',3);
ax = gca();
title('Plot of magnitude of X(k) with zeros appended','FontSize',15);
xlabel('n','FontSize',15);
ylabel('|X|','FontSize',15);
set(ax,'xlim',[0 length(X)+1],'fontsize',15);
grid on;
figure();

stem(angle(X),'b','LineWidth',3);
ax = gca();
title('Plot of phase of X(k) with zeros appended','FontSize',15);
xlabel('n','FontSize',15);
ylabel('\angle X','FontSize',15);
set(ax,'xlim',[0 length(X)+1],'fontsize',15);
grid on;

% Function to implement Discrete Fourier Transform
function X = DFT(x,N)
    X = zeros(1,N);
    for k=0:N-1
        for j=0:N-1
            X(k+1) = X(k+1)+ x(j+1)*(cos(2*pi*k*j/N)-sin(2*pi*k*j/N)*1i);
        end
    end 
end

% Function to implement Inverse Discrete Fourier Transform
function x = IDFT(X,N)
    x = zeros(1,N);
    for k=0:N-1
        for j=0:N-1
            x(k+1) = x(k+1)+ X(j+1)*(cos(2*pi*k*j/N)+sin(2*pi*k*j/N)*1i);
        end
        x(k+1) = x(k+1)/N;
    end
end
    
