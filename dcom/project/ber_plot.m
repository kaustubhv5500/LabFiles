% Defining the vectors
x = [-1.75,-1.54,-1.375,-1.232,0,0.365,0.782,2.212,3.233,5.446,7.4472,8.434,10];
y = [-0.512,-0.543,-0.602,-0.645,-0.7302,-0.813,-0.9203,-1.2189,-1.6232,-2.272,-3.52,-4.143,-5.45];
y = 10.^y;

% ber plot of DNN and linear models for QPSK modulation
snr = [-1.33,0.75,3.15,4.5,5.25,6.3,7.55];
ber_dnn = [0.0146,0.00977,0.004522,0.0016767,0.000669,5.810e-05,1.9779e-06];
ber_linear = [0.07669,0.03999,0.0096408,0.0050023,0.0027223,0.0007193, 8.629475e-05];
model_difference = [0.0921,0.075832,0.05697997,0.03037,0.01113753,0.00042733,0.00418475];
 
semilogy(x,y,'b',snr,ber_dnn,'g',snr,ber_linear,'r','LineWidth',2);
grid on;
title('Plot of BER vs SNR');
legend('Without ML','DNN','Linear');
xlabel('SNR (dB)');
ylabel('BER');
set(gca,'FontSize',15,'xlim',[-2 10],'ylim',[1e-6 1]);

