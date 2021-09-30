% Mobile and Wireless Communication Lab
% Experiment 3: To implement DSSS Signal
% MATLAB Version: R2018a
% Date: 23/09/2021

clc;
clear;
close;

b = input('Enter the number of input bits: ');
ln = input('Enter the number of Bits to be spread upon : ');

b = randi([0 1], 1, b);
disp('Input Sequence: ');
disp(b);

fs = 64;
fc = round(100 * pi);

% Converting bit 0 to -1
for i=1:ln
    if b(i) == 0
        b(i) = -1;
    end
end

% Generating the bit sequence with each bit 8 samples long
k = 1;
bb = [];

for i=1:ln
    for j=1:8
        bb(k) = b(i);
        j = j+1;
        k = k+1;
    end
    i = i+1;
end

len = length(bb);
subplot(5,1,1);
stairs(b,'linewidth',2);
grid on;
title('Input Signal');

% Generating the pseudo random bit pattern for spreading
pr_sig = round(rand(1,len));
for i=1:len
    if pr_sig(i) == 0
        pr_sig(i) = -1;
    end
end

pr_seq = randi([0 1], 1, length(b));
disp('Pseudorandom Sequence: ');
disp(pr_seq);

for i=1:length(b)
    if pr_seq(i) == 0
        pr_seq(i) = -1;
    end
end

subplot(5,1,2);
stairs(pr_seq,'linewidth',2); 
grid on;
title('Pseudo random sequence');

% Multiplying bit sequence with Pseudorandom Sequence
bbs = zeros(1,len);
for i=1:len
    bbs(i) = bb(i).*pr_sig(i);
end

% Spreading the sequence to find the chip signal
chip = zeros(1,length(b)*fc);
for i = 1:length(b)
    for j = 1:fc
        chip(i*fc + j) = b(i).*pr_seq(i);
    end
end

% Modulating the signal
dsss = [];
t = 0:0.1:2*pi;
c1 = cos(t);
c2 = cos(t + pi);

for k = 1:len
    if bbs(1,k) == -1
        dsss = [dsss c1];
    else
        dsss = [dsss c2];
    end
end
    
subplot(5,1,3);
stairs(b.*pr_seq,'linewidth',2);
set(gca(),'FontSize',12);
grid on;
title('Multiplied Sequence');

subplot(5,1,4);
stairs(chip,'linewidth',2);
set(gca(),'xlim',[0 length(chip)],'ylim',[-1.5 1.5],'FontSize',12);
grid on;
title('Chip Sequence');

bpskModulator = comm.BPSKModulator;
subplot(5,1,5);
plot(dsss,'linewidth',1.5);
set(gca(),'xlim',[0 length(dsss)],'FontSize',12);
grid on;
title('BPSK Signal');