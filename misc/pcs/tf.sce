s = poly(0,'s')
t = 0:0.05:7

n1 = s+1
d1 = s^2+0.8*s+16
tf1 = syslin('c',n1/d1)
o1 = csim('step',t,tf1)
subplot(2,4,1)
plot(t,o1)
title("Step Response")
xlabel("Time in s")
ylabel("Response")

n2 = 1
d2 = s^2
tf2 = syslin('c',n2/d2)
o2 = csim('step',t,tf2)
subplot(2,4,2)
plot(t,o2)
title("Step Response")
xlabel("Time in s")
ylabel("Response")

//t = 0:0.05:20

n3 = 1 +s
d3 = s^2 -0.8*s +16
tf3 = syslin('c',n3/d3)
o3 = csim('step',t,tf3)
subplot(2,4,3)
plot(t,o3)
title("Step Response")
xlabel("Time in s")
ylabel("Response")

n4 = 1
d4 = s^2 +0.8*s +1
tf4 = syslin('c',n4/d4)
o4 = csim('step',t,tf4)
subplot(2,4,4)
plot(t,o4)
title("Step Response")
xlabel("Time in s")
ylabel("Response")

n5 = 1+s
d5 = s^2-1.8*s+25
tf5 = syslin('c',n5/d5)
o5 = csim('step',t,tf5)
subplot(2,4,5)
plot(t,o5)
title("Step Response")
xlabel("Time in s")
ylabel("Response")



n6 = 1+s
d6 = s^2+1.8*s+25
tf6 = syslin('c',n6/d6)
o6 = csim('step',t,tf6)
subplot(2,4,6)
plot(t,o6)
title("Step Response")
xlabel("Time in s")
ylabel("Response")



n7 = 1
d7 = s^2+0.8*s+16
tf7 = syslin('c',n7/d7)
o7 = csim('step',t,tf7)
subplot(2,4,7)
plot(t,o7)
title("Step Response")
xlabel("Time in s")
ylabel("Response")

n8 = 25
d8 = s^4+6*s^3+11*s^2+6*s
tf8 = syslin('c',n8/d8)
o8 = csim('step',t,tf8)
subplot(2,4,8)
plot(t,o8)
title("Step Response")
xlabel("Time in s")
ylabel("Response")
