% Defining the vectors
x = [-1.75,-1.54,-1.375,-1.232,0,0.365,0.782,2.212,3.233,5.446,7.4472,8.434,10];
y = [-0.512,-0.543,-0.602,-0.645,-0.7302,-0.813,-0.9203,-1.2189,-1.6232,-2.272,-3.52,-4.143,-5.45];
y_bpsk = [-0.835,-0.975,-1.323,-1.712,-2.456,-3.442,-3.932];
y_bpsk = 10.^y_bpsk;
y = 10.^y;

% ber plot of DNN and linear models for QPSK modulation
snr = [-1.33,0.75,3.15,4.5,5.25,6.3,7.55];
ber_dnn = [0.0146,0.00977,0.004522,0.0016767,0.000669,5.810e-05,1.9779e-06];
ber_linear = [0.07669,0.03999,0.0096408,0.0050023,0.0027223,0.0007193, 8.629475e-05];
model_difference = [0.0921,0.075832,0.05697997,0.03037,0.01113753,0.00042733,0.0000418475];

semilogy(x,y,'-o',snr,ber_dnn,'-s',snr,ber_linear,'-^','LineWidth',2);
grid on;
title('Plot of BER vs SNR for QPSK');
legend('Without ML','DNN','Linear');
xlabel('SNR (dB)');
ylabel('BER');
set(gca,'FontSize',15,'xlim',[-2 10],'ylim',[1e-6 1]);
figure();

% ber plot of ML models for BPSK modulation
snr_bpsk = [-0.75,1.35,2.5,3,4,5,5.25];
ber_bpsk = [];
ber_dnn_bpsk = [0.001366,0.0002505,6.643e-5,2.292e-05,9.56e-07,1.1621e-09,0.5178e-10];
ber_linear_bpsk = [0.00437,0.000743,1.584e-04,4.584e-05,3.244e-06,3.486e-07,4.276e-08];
model_difference_bpsk = [0.05494846,0.006031,0.000733,7.434e-04,5.345e-05,3.718e-06,1.214e-07];

semilogy(snr_bpsk,y_bpsk,'-o',snr_bpsk,ber_dnn_bpsk,'-s',snr_bpsk,ber_linear_bpsk,'-^','LineWidth',2);
grid on;
title('Plot of BER vs SNR for BPSK');
legend('Without ML','DNN','Linear','location','southwest');
xlabel('SNR (dB)');
ylabel('BER');
set(gca,'FontSize',15,'xlim',[-1 5.5],'ylim',[1e-11 1]);
figure();

semilogy(snr_bpsk,model_difference_bpsk,'-o',snr,model_difference,'-^','LineWidth',2);
grid on;
title('Plot of Model Difference vs SNR');
legend('BPSK','QPSK');
xlabel('SNR (dB)');
ylabel('Difference');
set(gca,'FontSize',15);

