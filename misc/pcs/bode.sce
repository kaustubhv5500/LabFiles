s = poly(0,'s');

n1 = [200];
d1 = [(s+2)*(s+4)*(s+5)];
TF1 = syslin('c',n1/d1);
//subplot(1,2,1);
bode(TF1,0.1,10);
xlabel("Transfer Function 1");

[p,fm] = p_margin(TF1);
[g,fr] = g_margin(TF1);

disp("For First Transfer Function : ")
disp("Gain Margin : ");
disp(g);
disp("Phase Margin : ");
disp(p);
disp("Phase Crossover Frequency : ");
disp(fm);
disp("Gain Crossover Frequency : ");
disp(fr);

/*
n2 = [s+20];
d2 = [(s+1)*(s+7)*(s+50)];
TF2 = syslin('c',n2/d2);
subplot(1,2,2);
bode(TF2,0.01,100);
xlabel("Transfer Function 2");


[p,fm] = p_margin(TF2);
[g,fr] = g_margin(TF2);

disp("For Second Transfer Function : ");
disp("Gain Margin : ");
disp(g);
disp("Phase Margin : ");
disp(p);
disp("Phase Crossover Frequency : ");
disp(fm);
disp("Gain Crossover Frequency : ");
disp(fr);

*/
