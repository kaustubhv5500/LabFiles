% Discrete Time Signal Processing Lab 2
% Discrete Correlation
% MATLAB version R2018a
% Date : 19-01-2021

clc;
clear;
close all;

x =[10,-12,1,-8,-7];
disp('Input signal : ');
disp(x);

% Plotting x 
stem(x,'g','LineWidth',3);
ax = gca();
title('Plot of discrete signal x(n)','FontSize',20);
xlabel('n','FontSize',20);
ylabel('Magnitude','FontSize',20);
set(ax,'xlim',[0 length(x)],'ylim',[min(x) max(x)],'xtick',[0:1:max(x)],'fontsize',15);
grid on;
figure();

% Calculating and plotting the auto-correlation of input x
auto_corr = CorRelation(x,x);
disp('Auto Correlation of the input signal :');
disp(auto_corr);

stem(auto_corr,'b','LineWidth',2);
xlabel('n','FontSize',20);
ylabel('Magnitude','FontSize',20);
title('Plot of Auto-Correlation','FontSize',15);
grid on;
figure();

% Calculating the auto-correlation of delayed input x
% delaying the input based on the variable delay
delay = 3;
x_ = [zeros(1,delay),x];
disp('Delayed signal : ');
disp(x_);
stem(x_,'k','LineWidth',2);
xlabel('n','FontSize',20);
ylabel('Magnitude','FontSize',20);
title('Plot of Delayed signal','FontSize',15);
grid on;
figure();

delayed_auto_corr = CorRelation(x_,x_);
disp('Auto Correlation of the delayed signal :');
disp(delayed_auto_corr);

stem(delayed_auto_corr,'k','LineWidth',2);
xlabel('n','FontSize',20);
ylabel('Magnitude','FontSize',20);
title('Plot of Auto-Correlation of delayed signal','FontSize',15);
grid on;
figure();

% Calculating the cross-correlation of delayed x and input signal x
cross_corr = CorRelation(x,x_);
disp('Cross Correlation of the input and delayed signal :');
disp(cross_corr);
cross_corr_coeff = corrcoef(x_,[x,zeros(1,length(x_)-length(x))]);
fprintf('Correlation coefficient : %3f\n',cross_corr_coeff(1,2));

stem(cross_corr,'r','LineWidth',2);
xlabel('n','FontSize',20);
ylabel('Magnitude','FontSize',20);
title('Plot of Cross Correlation between delayed & input x','FontSize',15);
grid on;
figure();

% Calculating cross-correlation of scaled delayed x and input x
clear x_ delay;
scale = 2.75;
delay = 3;

x_ = [zeros(1,delay),x];
x_ = scale.*x_;
disp('Scaled and Delayed signal');
disp(x_);
stem(x_,'k','LineWidth',2);
xlabel('n','FontSize',20);
ylabel('Magnitude','FontSize',20);
title('Plot of scaled and delayed signal','FontSize',15);
grid on;
figure();

scaled_cross_corr = CorRelation(x,x_);
disp('Cross Correlation of the input and delayed signal :');
for itr=1:length(scaled_cross_corr)
    fprintf('%.2f  ',scaled_cross_corr(itr));
end
scaled_cross_corr_coeff = corrcoef(x_,[x,zeros(1,length(x_)-length(x))]);
fprintf('\n\nCorrelation coefficient : %3f\n',scaled_cross_corr_coeff(1,2));

stem(scaled_cross_corr,'b','LineWidth',2);
xlabel('n','FontSize',20);
ylabel('Magnitude','FontSize',20);
title('Plot of Cross Correlation (delayed, scaled with x)','FontSize',15);
grid on;

% Function to calculate the Correlation between two discrete signals
function y = CorRelation(x,h)
    N = length(x)+length(h)-1;
    y = zeros(1,N);
    h_ = zeros(1,length(h));
    x = [x, zeros(1,(N - length(x)))];
    
    % Reversing and padding the impulse signal
    for p=1:length(h)
        h_(length(h)-p+1) = h(p);
    end
    h_ = [h_, zeros(1,(N - length(h)))];
   
    for i=1:N
        for j=1:N
            if i>=j
                y(i) = y(i) + x(i-j+1)*h_(j);
            end
        end
    end 
end
            


