clear;
clc;
close all;

x = [0:0.1:2*pi];
y = sin(x);

% Plotting Continuous sine wave
figure();
plot(x,y,'r','LineWidth',3);
title("Plot of Continuous Sine Wave",'FontSize',20);
xlabel('Angle in radians','FontSize',20);
ylabel('Sine','FontSize',20);
grid on;
ax = gca();
set(ax, 'xlim', [0 2*pi], 'ylim', [-1 1], 'fontsize', 20, 'xtick', [0:0.5:2*pi], 'ytick', [-1:0.5:1]);

% Plotting Discrete sine wave
figure();
stem(x,y,'g','linewidth',3);
title("Plot of Discrete Sine Wave",'FontSize',20);
xlabel('Angle in radians','FontSize',20);
ylabel('Sine','FontSize',20);
ax = gca();
set(ax,'xlim',[0 2*pi],'ylim',[-1 1],'fontsize',20);
grid on;

