% Discrete Time Signal Processing Lab 4
% Fast Fourier Transform
% MATLAB version R2018a
% Date : 09-03-2021

clc;
clear;
close all;

% x = [1j 0 -1j 0];                                     
x = [1+1j 0 1-1j 0 2-2j 0 2 2j];

disp("Input Signal : ");
disp(x);

X = DIT_FFT(x);
disp("DIT FFT of x : ");
disp(X);

X_ = DIF_FFT(x);
disp("DIF FFT of x : ");
disp(X);

x_ = IDIT_FFT(X);
disp("IDIT FFT of X obtained : ");
disp(x_);

x_ = IDIT_FFT(X_);
disp("IDIF FFT of X obtained : ");
disp(x_);


function X = DIT_FFT(x)
    t = nextpow2(length(x));            
    j = [x zeros(1,(2^t)-length(x))] ;   
    N = length(j);                       
    S = log2(N);                         
    j = bitrevorder(j);                 
    for stage=1:S   
        a = 1;                          
        b = 1+2^(stage-1);
        n=0;
        while( n<=2^(stage-1)-1 && b<=N)
            e = exp((-1i)*2*pi*n/(2^stage));    
            y = j(a)+e*j(b);                    
            z = j(a)-e*j(b);
            j(a) = y;
            j(b) = z;
            a = a+1;
            b = b+1;     
            n = n+1;
            if(rem(b,2^stage)== 1)
                a = a+2^(stage-1);     
                b = b+2^(stage-1);
                n = 0;
            end
        end
    end
    X = j;
end

function X = DIF_FFT(x)

    t = nextpow2(length(x));                       
    j = [x zeros(1,(2^t)-length(x))] ;             
    N = length(j);                                 
    S = log2(N);                                   
    for stage=S:-1:1
        a = 1;
        b = 1+2^(stage-1);                         
        n = 0;
        while( n<=2^(stage-1)-1  && a<=N && b<=N)
            l = (n).*(2^(S+1-stage))./2;
            e = exp((-1i)*2*pi*l/(16));            
            y = j(a)+j(b);
            z = (j(a)-j(b)).*e;                 
            j(a) = y;
            j(b) = z;
            a = a+1;                               
            b = b+1;
            n = n+1;
            if (stage == 1)               
                if(rem(1,a) == 1)            
                    a = a+2^(stage-1);
                    b = b+2^(stage-1);
                    n=0;
                end
            end
            
            if(stage~=1)
                if(rem(a,2^(stage-1))==1)
                    a = a+2^(stage-1);
                    b = b+2^(stage-1);
                    n = 0;
                end
            end
        end
    end                 
    X = bitrevorder(j);
end

function x = IDIT_FFT(X)
    x = DIT_FFT(X)./length(X);
end

function x = IDIF_FFT(X)
    x = DIF_FFT(X)./length(X);
end
