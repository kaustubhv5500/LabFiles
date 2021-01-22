M = 4;                 % Modulation alphabet
k = log2(M);           % Bits/symbol
numSC = 128;           % Number of OFDM subcarriers
cpLen = 32;            % OFDM cyclic prefix length
maxBitErrors = 100;    % Maximum number of bit errors
maxNumBits = 1e7;      % Maximum number of bits transmitted
qpskMod = comm.QPSKModulator('BitInput',true);
qpskDemod = comm.QPSKDemodulator('BitOutput',true);
ofdmMod = comm.OFDMModulator('FFTLength',numSC,'CyclicPrefixLength',cpLen);
ofdmDemod = comm.OFDMDemodulator('FFTLength',numSC,'CyclicPrefixLength',cpLen);
channel = comm.AWGNChannel('NoiseMethod','Variance','VarianceSource','Input port');
errorRate = comm.ErrorRate('ResetInputPort',true);
ofdmDims = info(ofdmMod)
numDC = ofdmDims.DataInputSize(1)
frameSize = [k*numDC 1];
EbNoVec = (0:10)';
snrVec = EbNoVec + 10*log10(k) + 10*log10(numDC/numSC);
berVec = zeros(length(EbNoVec),3);
errorStats = zeros(1,3);
for m = 1:length(EbNoVec)
    snr = snrVec(m);
    
    while errorStats(2) <= maxBitErrors && errorStats(3) <= maxNumBits
        dataIn = randi([0,1],frameSize);              % Generate binary data
        qpskTx = qpskMod(dataIn);                     % Apply QPSK modulation
        txSig = ofdmMod(qpskTx);                      % Apply OFDM modulation
        powerDB = 10*log10(var(txSig));               % Calculate Tx signal power
        noiseVar = 10.^(0.1*(powerDB-snr));           % Calculate the noise variance
        rxSig = channel(txSig,noiseVar);              % Pass the signal through a noisy channel
        qpskRx = ofdmDemod(rxSig);                    % Apply OFDM demodulation
        dataOut = qpskDemod(qpskRx);                  % Apply QPSK demodulation
        errorStats = errorRate(dataIn,dataOut,0);     % Collect error statistics
    end
    
    berVec(m,:) = errorStats;                         % Save BER data
    errorStats = errorRate(dataIn,dataOut,1);         % Reset the error rate calculator
end
berTheory = berawgn(EbNoVec,'psk',M,'nondiff');
SNRVec = 10*log10(EbNoVec);% Converting to SNR
berTheory = berTheory/2;
figure
semilogy(SNRVec,berVec(:,1),'*')
hold on
semilogy(SNRVec,berTheory)
legend('Simulation','Theory','Location','Best')
xlabel('SNR (dB)')
ylabel('Bit Error Rate')
grid on
hold off