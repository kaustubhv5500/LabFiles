% Mobile and Wireless Communication Lab
% Experiment 6: To implement indoor and outdoor propagation models
% MATLAB Version: R2018a
% Date: 21/10/2021

clc;
clear;
close all;

r = input('Enter distance of mobile from cell-site(in km): ');
fc = input('Enter frequency of transmission(in MHz): ');

c = 3e8;
lambda = c/(fc*1e6);
gt = 1;
gr = 1;
% Path loss at reference distance of 1m
Lpref = 32.44 + 20*log10(1e-3)+20*log10(fc); 

L30M = zeros(1,10000);
L100M = zeros(1,10000);
L200M = zeros(1,10000);
L300M = zeros(1,10000);

disp('Choose the propagation model');
fprintf('1. Indoor propagation mode\n2. Outdoor propagation model\n');
select = input('Enter choice: ');

switch select
    case 1
        fprintf('1. Log-Distance propagation model\n2. Attenuation factor path loss model\n');
        select_1 = input('Enter choice: ');
    switch select_1
        case 1
            Gamma = input('Enter Path Loss exponent: ');
            Xg = input('Enter Xg(Standard deviation): ');
            Lplog = Lpref + 10*Gamma*log10(r*1e3) - 10*log10(Xg);
            fprintf('Log-Distance Propagation Model Path Loss: %f\n', Lplog);
        case 2
            Gamma = input('Enter Path loss Exponent in range 1.6 and 3.3: ');
            Lpl = input('Enter total Partition Loss in dB: ');
            Lpaf = Lpref + 10*Gamma*log10(r*1e3) + Lpl;
            fprintf('Attenuation Factor Path Loss: %f\n', Lpaf);
    end
    case 2
        fprintf('1. Free space propagation model\n2. Okumara-Hata propagation model\n3. Multipath propagation model\n');
        select_2 = input('Enter choice: ');
        switch select_2
            case 1
                Lpfs = 32.44 + 20*log10(r) + 20*log10(fc);
                for i=1:1:10000
                    L30M(i)= 32.44+20*log10(i*1e-3)+20*log10(30);
                    L100M(i)= 32.44+20*log10(i*1e-3)+20*log10(100);
                    L200M(i)= 32.44+20*log10(i*1e-3)+20*log10(200);
                    L300M(i)= 32.44+20*log10(i*1e-3)+20*log10(300);
                end
                i = 1:1:10000;
                figure;
                semilogx(i,L30M,i,L100M,i,L200M,i,L300M,'LineWidth',2);
                grid on;
                legend('30MHz','100MHz','200MHz','300MHz','Location','northwest');
                xlabel('Distance in km');
                ylabel('Path loss in dB');
                title('Free-Space Propagation Model');
            case 2
                ht = input('Enter antenna height: ');
                fprintf('Celect Coverage Area\n1. Urban\n2. Rural\n');
                select_2_2 =  input('Enter choice: ');
                switch select_2_2
                    case 1
                        alpha = 3.2*(log10(11.75*ht))^2 - 4.97;
                        % Correction factor for urban area
                        LpH = 68.75 + 26.16*log10(fc) - 13.82*log10(ht)-alpha+(44.9-6.55*log10(ht))*log10(r);
                        fprintf('Path Loss in Urban area: %f\n', LpH);
                    case 2
                        LpH = 68.75 + 26.16*log10(fc) - 13.82*log10(ht)+(44.9-6.55*log10(ht))*log10(r);
                        fprintf('Path Loss in Rural Area: %f\n', LpH);
                end
                for i=1:1:10000
                    L30M(i)= 68.75+26.16*log10(30)-13.82*log10(ht)+(44.9-6.55*log10(ht))*log10(i*1e-3);
                    L100M(i)= 68.75+26.16*log10(100)-13.82*log10(ht)+(44.9-6.55*log10(ht))*log10(i*1e-3);
                    L200M(i)= 68.75+26.16*log10(200)-13.82*log10(ht)+(44.9-6.55*log10(ht))*log10(i*1e-3);
                    L300M(i)= 68.75+26.16*log10(300)-13.82*log10(ht)+(44.9-6.55*log10(ht))*log10(i*1e-3);
                end
                i = 1:1:10000;
                figure;
                semilogx(i,L30M,i,L100M,i,L200M,i,L300M,'LineWidth',2);
                legend('30MHz','100MHz','200MHz','300MHz','Location','northwest');
                grid on;
                xlabel('Distance in km');
                ylabel('Path loss in dB');
                title('Okumura-Hata Propagation Model');
            case 3
                ht = input('Enter Transmitter antenna height: ');
                hr = input('Enter Receiver antenna height: ');
                Lpm = 40*log10(r*1e3) - 20*log10(ht)- 20*log10(hr);
                fprintf('Multi-path loss: %f dB\n',Lpm);
        end
end
