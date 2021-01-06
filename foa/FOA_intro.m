clear all;
clc;

x = [0:0.1:2*pi];
y = sin(x);
z = cos(x);
figure();
plot(x,y,x,z,'r','LineWidth',3);
title("Plot of Sine Wave",'FontSize',20);
xlabel('Angle in radians','FontSize',20);
ylabel('Sine and Cos x','FontSize',20);
legend('sin(x)','cos(x)');


ax = gca;
ax.FontSize = 13;
ax.TickDir = 'in';
ax.XTick = [0:0.5:2*pi];
ax.YTick = [-1:0.2:1];
ax.YLim = [-1 1];
ax.XLim = [0 2*pi];
grid on;

figure();
polarplot(x,y.*z,'g','LineWidth',3);
set(gca,'FontSize',20)

clc;
clear all;
