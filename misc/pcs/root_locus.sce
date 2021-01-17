s = poly(0,'s');

n1 = [s^2+2*s+2];
d1 = [(s+2)*(s+4)];
TF1 = syslin('c',n1/d1);
subplot(1,4,1);
evans(TF1,50);

n2 = [1];
d2 = [s^3];
TF2 = syslin('c',n2/d2);
subplot(1,4,2);
evans(TF2,50);

n3 = [1];
d3 = [s*(s+1)*(s+1)*(s+2)];
TF3 = syslin('c',n3/d3);
subplot(1,4,3);
evans(TF3,50);

n4 = [(s+1)*(s+1)];
d4 = [s*(s+2)];
TF4 = syslin('c',n4/d4);
subplot(1,4,4);
evans(TF4,50);
