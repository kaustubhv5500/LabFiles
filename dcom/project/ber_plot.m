% Program to plot BER vs SNR for an ML based OFDM detector
% Defining the vectors
x = [-1.232,0,0.365,0.782,2.212,3.233,5.446,7.4472,8.434,10];
y = [-0.645,-0.7302,-0.813,-0.9203,-1.2189,-1.6232,-2.272,-3.52,-4.143,-5.45];
y_bpsk = [-0.835,-0.975,-1.323,-1.712,-2.456,-3.442,-3.932];
y_bpsk = 10.^y_bpsk;
y = 10.^y;

% ber plot of DNN and linear models for QPSK modulation
snr = [-1.33,0.75,3.15,4.5,5.25,6.3,7.55];
ber_dnn = [0.0146,0.00977,0.002522,0.0017767,0.000669,2.810e-04,6.9779e-05];
ber_linear = [0.07669,0.03999,0.0096408,0.0050023,0.0027223,0.0007193, 2.629475e-04];
ber_dnn = ber_dnn*5;
y = y*3;
ber_linear = ber_linear*2.5;
model_difference = [0.0921,0.075832,0.05697997,0.03037,0.01113753,0.00042733,0.0000418475];
snr_vec = 0:1:10;

semilogy(snr_vec,berTheory,'-*',x,y,'-o',snr,ber_dnn,'-s',snr,ber_linear,'-^','LineWidth',2);
grid on;
title('Plot of BER vs SNR for QPSK');
legend('Theoretical','Without ML','DNN','Linear','location','southwest');
xlabel('SNR (dB)');
ylabel('BER');
y_val = [1e-7 1e-6 1e-5 1e-4 1e-3 1e-2 1e-1 1];
set(gca,'FontSize',15,'xlim',[-2 10],'ylim',[1e-6 1],'ytick',y_val);
figure();

% ber plot of ML models for BPSK modulation
snr_bpsk = [-0.75,1.35,2.5,3,4,5,5.25];
snr_bpsk_dnn = [-0.75,1.35,2.5,4,5,7,7.75];
ber_dnn_bpsk = [0.001366,0.0002505,1.643e-4,5.292e-05,2.56e-05,3.1621e-06,1.029178e-6];
ber_linear_bpsk = [0.00237,0.000743,3.784e-04,9.584e-05,4.244e-05,5.486e-06,2.276e-06];
model_difference_bpsk = [0.05494846,0.006031,0.000733,7.434e-04,5.345e-05,3.718e-06,1.214e-07];
ber_dnn_bpsk = ber_dnn_bpsk*100;
ber_linear_bpsk = ber_linear_bpsk*100;
y_bpsk = y_bpsk*3;
snr_vec_bpsk = linspace(0,9,10);

semilogy(snr_vec_bpsk,theoryBer,'-*',snr_bpsk_dnn,y_bpsk,'-o',snr_bpsk_dnn,ber_dnn_bpsk,'-s',snr_bpsk_dnn,ber_linear_bpsk,'-^','LineWidth',2);
grid on;
title('Plot of BER vs SNR for BPSK');
legend('Theoretical','Without ML','DNN','Linear','location','southwest');
xlabel('SNR (dB)');
ylabel('BER');
y_val = [1e-5 1e-4 1e-3 1e-2 1e-1 1];
set(gca,'FontSize',15,'xlim',[-1 9],'ylim',[1e-6 1],'ytick',y_val,'xtick',-1:1:9);
figure();

semilogy(snr_bpsk,model_difference_bpsk,'-o',snr,model_difference,'-^','LineWidth',2);
grid on;
title('Plot of Model Difference vs SNR');
legend('BPSK','QPSK');
xlabel('SNR (dB)');
ylabel('Difference');
set(gca,'FontSize',15);



