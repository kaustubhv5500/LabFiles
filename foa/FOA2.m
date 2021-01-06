%Fundamentals of Antenna LAB 2
%Calculating power received by antenna using Friis Transmission Equation
%MATLAB version R2020a
%Date : 25-08-2020

clc;
clear all;
close all;

freq = input('Enter the Frequency of transmission (in GHZ) : ');
inp = input('Do you want to enter Gain or Directivity?\n1)Press 1 for Gain\n2)Press 2 for Directivity : ');

wave_length = 3e8/(freq*1e9);
Gtx = 1;
Grx = 1;

switch inp
    case 1
        Gtx = input('Enter the gain of the Transmitting antenna (in dB) : ');
        Grx = input('Enter the gain of the Receiving antenna (in dB) : ');
        Gtx = 10^(Gtx/10);
        Grx = 10^(Grx/10);
    case 2
        Dtx = input('Enter the Directivity of the Transmitting antenna (in dB) : ');
        Drx = input('Enter the Directivity of the Receiving antenna (in dB) : ');
        
        Dtx = 10^(Dtx/10);
        Drx = 10^(Drx/10);
        
        ecd_tx = input('Enter the efficiency of the Transmitting antenna : ');
        ecd_rx = input('Enter the efficiency of the Receiving antenna : ');
        Gtx = ecd_tx*Dtx;
        Grx = ecd_rx*Drx;
    otherwise
        Gtx = 10;
        Grx = 100;
end

r = input('Enter the distance between the antennas (in m) : ');
prad = input('Enter the Power radiated in Watts : ');
flag = input('Enter 1 if Antenna Polarization is matched and 0 for Unmatched : ');
plf = 1;

rho_rx = 0;
rho_ry = 0;
rho_tx = 0;
rho_ty = 0;

if (flag == 1)
    plf = 1;
else
    disp('Please represent the complex number as i');
    rho_rx = input('Enter the X-component of Polarizing vector for the Receiving antenna : ');
    rho_ry = input('Enter the Y-component of Polarizing vector for the Receiving antenna : ');
    rho_tx = input('Enter the x-component of Polarizing vector for the Transmitting antenna : ');
    rho_ty = input('Enter the Y-component of Polarizing vector for the Transmitting antenna : ');
    plf = (abs(rho_rx*rho_tx + rho_ry*rho_ty))^2;      
end

p1 = rho_rx + rho_ry;
p2 = rho_tx + rho_ty;

p1 = p1/norm(p1);
p2 = p1/norm(p2);

Ex1 = rho_tx;
Ey1 = rho_ty; 
phi=angle(Ey1)-angle(Ex1);

if abs(Ex1)==abs(Ey1) && phi==pi/2
     ptype1='CCW Circular Polarization';
elseif abs(Ex1)==abs(Ey1) && phi==-pi/2
     ptype1='CW Circular Polarization';
elseif abs(Ex1)~=abs(Ey1) && phi==pi/2
     ptype1='CCW Elliptical Polarization';
elseif abs(Ex1)~=abs(Ey1) && phi==-pi/2
     ptype1='CW Elliptical Polarization';
  elseif Ex1~=0 && Ey1~=0 && phi==pi || phi==0
     ptype1='Linear Polarization';
  else
     ptype1='Invalid';
  end
  
Ex2 = rho_rx;
Ey2 = rho_ry;
phi2=angle(Ey2)-angle(Ex2);

  if abs(Ex2)==abs(Ey2) && phi2==pi/2
    ptype2='CW Circular Polarization';
  elseif abs(Ex2)==abs(Ey2) && phi2==-pi/2
    ptype2='CCW Circular Polarization';
  elseif abs(Ex2)~=abs(Ey2) && phi2==pi/2
    ptype2='CW Elliptical Polarization';
  elseif abs(Ex2)~=abs(Ey2) && phi2==-pi/2
    ptype2='CCW Elliptical Polarization';
  elseif phi2==pi || phi2==0
    ptype2='Linear Polarization';
  else
    ptype2='Invalid';
  end
  
disp('Polarization of Transmitting antenna : ' + ptype1);
disp('Polarization of Receiving Antenna : ' + ptype2);

%Friis Transmission equation
prec = prad*plf*Gtx*Grx*(wave_length/(4*pi*r))^2; 
fprintf('The Power received by the antenna is : %d W\n',prec);

if flag == 0
          VarNames = {'Power Received in Watts', 'Power Transmitted in Watts','Tx Polarization','Rx polarization', 'Tx Gain', 'Rx Gain', 'PLF'};
    T = table(prec ,prad, ptype1, ptype2, Gtx, Grx,plf, 'VariableNames',VarNames);
else
    VarNames = {'Power Received in Watts', 'Power Transmitted in Watts', 'Tx Gain', 'Rx Gain'};
    T = table(prec, prad, Gtx, Grx, 'VariableNames', VarNames);
end
disp(T);
    
clear all;
