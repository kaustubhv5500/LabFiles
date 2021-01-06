% Defining the vectors
x = [0,1,2,3,4,5,6,7,8,9,10];
y = [0.628,0.501,0.426,0.313,0.225,0.143,0.0986,0.05,0.02,0.01,0.001];

x1 = [0,0.5,1,1.25,1.5,1.75,2,2.5];
y1 = [0.646,0.448,0.163,0.128,0.0530,0.032,0.012,0.001];

semilogy(x,y,'g',x1,y1,'r','LineWidth',2);
grid on;
title('Plot of BER vs Eb/N0');
legend('Without Conv. Encoder','With Conv. Encoder');
xlabel('Eb/N0 (dB)');
ylabel('BER');
set(gca,'FontSize',15);

