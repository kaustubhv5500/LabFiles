% Discrete Time Signal Processing Lab 8
% Spectrum estimation of a random signal
% MATLAB version R2018a
% Date : 23-03-2021

clc;
clear;
close all;

A = 20;
w0 = 0.2*pi;
N = [64 128]; % Number of data points used.

for j=1:length(N)
    n = 0:N(j)-1;
    
    % Plot of periodogram of sinusoid with noise
    noise = randn(1,N(j));
    x = A*sin(n*w0) + noise;
    [pxx_s,w_s] = periodogram(x);
    
    % Plot of periodogram using Bartlett method
    bw = bartlett(N(j));
    [pxx_b,w_b] = periodogram(x,bw);
    
    % Plot of periodogram using Welch method
    [pxx_w,w_w] = pwelch(x,N(j));
    
    % Plotting the graphs
    plot(w_s,10*log10(pxx_s),'b',w_b,10*log10(pxx_b),'r',w_w,10*log10(pxx_w),'g','LineWidth',2);
    xlabel('Frequency (rad)','FontSize',15);
    ylabel('Magnitude (dB)','FontSize',15);
    title("Periodogram of Sinusoid with noise ; N = " + num2str(N(j)),'FontSize',15);
    legend('Periodogram','Bartlett','Welch');
    ax = gca();
    set(ax,'FontSize',15);
    grid on;
    figure();
    
    % Plot of periodogram of white noise
    plot(n,10*log10(abs(noise)),'b','LineWidth',2);
    xlabel('Frequency (rad)','FontSize',15);
    ylabel('Magnitude (dB)','FontSize',15);
    title("Periodogram of White Noise ; N = " + num2str(N(j)),'FontSize',15);
    ax = gca();
    set(ax,'FontSize',15);
    grid on;
    figure();
    
    % Plot of periodogram using Yule-Walker method (AR)
    [pxx_y,w_y] = pyulear(x,2);
    plot(w_y,10*log10(pxx_y),'b','LineWidth',2);
    xlabel('Frequency (rad)','FontSize',15);
    ylabel('Magnitude (dB)','FontSize',15);
    title("Periodogram using Yule-walker method ; N = " + num2str(N(j)),'FontSize',15);
    ax = gca();
    set(ax,'FontSize',15);
    grid on;
    figure();
    
end
close;
