% Discrete Time Signal Processing Lab 1
% Discrete Convolution
% MATLAB version R2018a
% Date : 12-01-2021

clc;
clear;
close all;

x =[-14,-12,10,-8];
h = [1,5,10];

disp('Input signal : ');
disp(x);
disp('Impulse response : ');
disp(h);

% Plotting x 
stem(x,'g','LineWidth',3);
ax = gca();
title('Plot of discrete signal x(n)','FontSize',20);
xlabel('n','FontSize',20);
ylabel('Magnitude','FontSize',20);
set(ax,'xlim',[0 5],'ylim',[-15 11],'xtick',[0:1:5],'fontsize',20);
grid on;
figure();

% Plotting h
stem(h,'r','LineWidth',3);
ax = gca();
title('Plot of impulse signal h(n)','FontSize',20);
xlabel('n','FontSize',20);
ylabel('Magnitude','FontSize',20);
set(ax,'xlim',[0 4],'ylim',[0 11],'xtick',[0:1:4],'fontsize',20);
grid on;
figure();

% Calculating linear convolution of x and h
n = length(h) + length(x) - 1;
y(1,n) = 0;

for i=1:n
    sum = 0;
    for j=1:i
        if (((i- j+ 1) <= length(h) ) &&(j <= length(x) ))
            sum = sum + x(j)* h(i- j+ 1);
        end
    end
    y(i) = sum;
end

disp('Linear Convolution Output : ');
disp(y);

stem(y,'r','LineWidth',3);
ax = gca();
title('Plot of Linear convolution output y(n)','FontSize',20);
xlabel('n','FontSize',20);
ylabel('Magnitude','FontSize',20);
set(ax,'xlim',[0 7],'ylim',[min(y) max(y)],'xtick',[0:1:7],'fontsize',20);
grid on;
figure();


% Calculating Circular convolution of x and h
clear i j y n;
n = max(length(x),length(h));

% Appending zeros to incomplete vectors
if length(h) < n
    h = [h, zeros(n - length(h))];
else
    x = [x, zeros(n - length(x))];
end

for i=1:n
    y(1,n) = 0;
    for j=1:n
    k = i - j + 1;
        if k <= 0 
            k = n + k;
        end
       y(i) = y(i) + x(j) * h(k);
    end
end

disp('Circular Convolution Output : ');
disp(y);

stem(y,'r','LineWidth',3);
ax = gca();
title('Plot of Circular convolution output y(n)','FontSize',20);
xlabel('n','FontSize',20);
ylabel('Magnitude','FontSize',20);
set(ax,'xlim',[0 7],'ylim',[min(y) max(y)],'xtick',[0:1:7],'fontsize',20);
grid on;


        

        