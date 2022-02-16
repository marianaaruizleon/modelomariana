%% Material properties
 
% Resistivity of Silver
function rho_Ag = rho_Ag(T)
p1 = -2.082e-9;
p2 = 6.17e-11;
rho_Ag = p1+p2*T; %[Ohm.m]
end
 
% Resistivity Copper
function rho_Cu = rho_Cu(T)
p1 = -3.06e-9;
p2 = 6.841e-11;
rho_Cu = p1+p2*T; %[Ohm.m]
end
 
% Resistivity Hastelloy
function rho_Hast = rho_Hastelloy(T)
p1 = 1.22615e-6;
p2 = 1.16923e-10;
rho_Hast = p1+p2*T; %[Ohm.m]
end
 
% Resistivity YBCO, normal state
function rho_YBCO = rho_YBCO(T)
p1 = -1e-3;
p2 = 1e-4;
rho_YBCO = p1+p2*T; %[Ohm.m]
end
 
% Resistivity BSCCO, normal state
function rho_BSCCO = rho_BSCCO(T, Tc)
alfa = 0.087;
p1 = 1;
p2 = 0.0092;
rho_BSCCO = alfa*(p1+p2*(T-Tc));
end
 
% % Resistivity of 304 Stainless Steel:
% function rho_304SS = Resistivity_304SS(T)
% a1 = 4.7589144;
% a2 = 0.0099003;
% na = 0.95536674;
% rho_304SS = (a1+a2*(T^na))/(10^7); %[Ohm.m]
% end
 
% Dresner. Protection of a test Magnet Wound with a Ag/Bi
% Specific Heat capacity of Silver
function C_Ag = SpecificHeatCapacity_Ag(T)
a0 = 1944;
a1 = 24.95;
n = 0.85;
mol_Ag = 107.868;
debye_Ag = 220;
C_Ag = 1e3*(((a0*((T/debye_Ag)^3))^(-n)+(a1^(-n)))^(-1/n))/mol_Ag; %[J/kg-K]
end
 
% Specific heat capacity of Copper
function C_Cu = SpecificHeatCapacity_Cu(T)
C_Cu = 390.9-539.4*exp(-0.014*T); %[J/kg-K]
end
 
% Specific Heat capacity of YBCO
function C_YBCO = SpecificHeatCapacity_YBCO(T)
C_YBCO = 390*(250/T)^2*(exp(250/T)/(exp(250/T)-1)^2); %[J/kg-K]
end
 
% Specific Heat capacity of BSCCO
function C_BSCCO = SpecificHeatCapacity_BSCCO(T)
C_BSCCO = 421*(300/T)^2*(exp(300/T)/(exp(300/T)-1)^2); %[J/kg-K]
end
 
% Specific Heat capacity of Hastelloy
function C_Hast = SpecificHeatCapacity_Hastelloy(T)
C_Hast = 1000*(0.19+2*(0.194*(1-exp(-T/310)))); %[J/kg-K]
end
 
% Specific Heat capacity of Kapton
function C_Kapton = SpecificHeatCapacity_Kapton(T)
DKapton = 1420;
a0 = -1.3684;
a1 = 0.65892;
a2 = 2.8719;
a3 = 0.42651;
a4 = -3.0088;
a5 = 1.9558;
a6 = -0.51998;
a7 = 0.051574;
logC = a0+a1*log10(T)+a2*((log10(T))^2)+a3*((log10(T))^3)+a4*((log10(T))^4)+a5*((log10(T))^5)+a6*((log10(T))^6)+a7*((log10(T))^7);
C_Kapton = 10^logC; %[J/kg-K]
end
 
% Specific Heat capacity of 304 Stainless Steel
% function C_304SS = SpecificHeatCapacity_304SS(T)
% a0 = 22.0061;
% a1 = -127.5528;
% a2 = 303.647;
% a3 = -381.0098;
% a4 = 274.0328;
% a5 = -112.9212;
% a6 = 24.7593;
% a7 = -2.239153;
% cplog = a0+a1*log10(T)+a2*((log10(T))^2)+a3*((log10(T))^3)+a4*((log10(T))^4)+a5*((log10(T))^5)+a6*((log10(T))^6)+a7*((log10(T))^7);
% C_304SS = 10^cplog; %[J/kg-K]
% end
 
% Thermal Conductivity of Silver
function k_Ag = ThermalConductivity_Ag(T)
k_Ag=420.9+(501.8*0.956^T); %[W/K-m]
end
 
% Thermal Conductivity of Copper
function k_Cu = ThermalConductivity_Cu(T)
k_Cu=420.7+(2076*0.965^T); %[W/K-m]
end
 
% Thermal Conductivity of YBCO
function k_YBCO = ThermalConductivity_YBCO(T)
k_YBCO=5; %[W/K-m]
end
 
% Thermal Conductivity of BSCCO
function k_BSCCO = ThermalConductivity_BSCCO(T)
k_BSCCO=2.3-0.011*T+7e-5*T^2-6.6e-8*T^3; %[W/K-m]
end
 
% Thermal Conductivity of Hastelloy
% Ewin, Jack. Experimental Techniques for low temperature measurements
function k_Hs = ThermalConductivity_Hastelloy(T)
a0 = 5.726708;
a1 = 1.349819e-2;
a2 = 3.565928e-6;
k_Hs = a0+a1*T+a2*(T^2); %[W/K-m]
end
 
% Thermal conductivity of Kapton
function k_Kap = ThermalConductivity_Kapton(T)
a0 = -1.99117145;
a1 = -0.84948679;
a2 = 1.99072759;
a3 = -0.88969722;
a4 = 0.12450124;
logk = a0+a1*log10(T)+a2*((log10(T))^2)+a3*((log10(T))^3)+a4*((log10(T))^4);
k_Kap = 10^logk; %[W/K-m]
end
 
% Thermal conductivity of 304 Stainless Steel
% function k_304SS = ThermalConductivity_304SS(T)
% a0 = -1.4087;
% a1 = 1.3982;
% a2 = 0.2543;
% a3 = -0.626;
% a4 = 0.2334;
% a5 = 0.4256;
% a6 = -0.4658;
% a7 = 0.1650;
% a8 = -0.0199;
% logk = a0+a1*log10(T)+a2*((log10(T))^2)+a3*((log10(T))^3)+a4*((log10(T))^4)+a5*((log10(T))^5)+a6*((log10(T))^6)+a7*((log10(T))^7)+a8*((log10(T))^8);
% k_304SS = 10^logk; %[W/K-m]
% end
 
 
%% Heat transfer coefficient LN2
 
%%% LN2 convection - curve 1, reference: O. Mader, "Simulationen und experimente zum stabilitatsverhalten von HTSL-bandleitern,"
%%% PhD Thesis, Karlsruher Institut fur Technologie Fakultat fur Elektrotechnik und Informationstechnik.
function qc = hc_N(DT)
if (DT<3)
    q=0.217*DT;
elseif (DT<26.5)
    a5 = -12.773e-6;
    a4 = 1.325e-3;
    a3 = -0.049438;
    a2 = 0.72328;
    a1 = -2.8209;
    a0 = 3.8147;
    q=(a0+a1*DT+a2*DT^2+a3*DT^3+a4*DT^4+a5*DT^5);
else
    q=0.0397 +97.9e-4*DT;
end
qc=q*1e4; %[W/K-m^2]
end
 
%%% Curve 1 (reference: Trillaud)
%Heat flux of Liquid Nitrogen [W/m^2]
function [hc, qc] = HeatTransfer_1(T, Tref)
DT = T-Tref;
v1=sqrt(2)/sqrt(pi);
p0 = 0.088;
if (DT<=0)
    q=0;
elseif ((DT>0)&&(DT<=5))
    q=1e4*p0*DT^2;
elseif ((DT>5)&&(DT<=11.1))
    a0 = 0.07774;
    a1 = 140.461;
    a2 = 7.738;
    a3 = 12.603;
    v2=(DT-a3)/a2;
    q=1e4*(a0+v1*(a1/a2)*exp(-2*(v2^2)));
elseif ((DT>11.1)&&(DT<=20))
    a0=3.037;
    a1= 237.717;
    a2= 15.8477;
    a3= 15.272;
    v2=(DT-a3)/a2;
    q=1e4*(a0+v1*(a1/a2)*exp(-2*(v2^2)));
elseif ((DT>20)&&(DT<=31.05))
    a0 = -3579.81841801;
    a1 = 676.95993494;
    a2 = -50.06449001;
    a3 = 1.82057088;
    a4 = -0.03267505;
    a5=2.32147033e-4;
    q=1e4*(a0+a1*DT+a2*DT^2+a3*DT^3+a4*DT^4+a5*DT^5);
else
    a0 = 0.343;
    a1= 0.0106;
    a2= -2.496e-6;
    q=1e4*(a0+a1*DT+a2*DT^2);
end
qc=q;
if (DT == 0)
    hc = 0;
else
    hc = q/DT;
end
end
 
%%% LN2 convection - curve 2, reference: A. D. Berger, "Stability of SC cables with twisted stacked YBCO coated conductors,"
%%% Plasma Science and Fusion Center, Massachusetts Institute of Technology, MIT, February 2012.
function [hc, qc] = HeatTransfer_2(T, Tref)
DT = T-Tref;
if (DT<=0)
    a0 = 0;
    a1 = 0;
    a2 = 0;
    a3 = 0;
    a4 = 0;
    a5 = 0;
elseif (DT<=4.6)
    a5 = 0.001680087;
    a4 = -0.019242022;
    a3 = 0.087095646;
    a2 = -0.074037883;
    a1 = 0.057917877;
    a0 = 0;
elseif (DT<=10)
    a5 = 0.001523743;
    a4 = -0.042849971;
    a3 = 0.443404076;
    a2 = -1.846635116;
    a1 = 3.046099292;
    a0 = 0;
elseif (DT<=18.9)
    a5 = 0;
    a4 = 0;
    a3 = 0.030698456;
    a2 = -1.696351705;
    a1 = 28.57852002;
    a0 = -133.0831413;
elseif (DT<=22.8)
    a5 = 0;
    a4 = 0;
    a3 = -0.019815625;
    a2 = 1.546287856;
    a1 = -40.11763931;
    a0 = 347.5715056;
elseif (DT<=89.9)
    a5 = -7.8404488e-9;
    a4 = 2.8840356e-6;
    a3 = -0.0004118;
    a2 = 0.028566069;
    a1 = -0.952535697;
    a0 = 12.89616643;
else
    a5 = -3.37683125e-13;
    a4 = 4.008429818e-10;
    a3 = -1.60665804e-7;
    a2 = 3.053044558e-5;
    a1 = 0.009349036;
    a0 = 0.240726932;
end
q=a0+a1*DT+a2*DT^2+a3*DT^3+a4*DT^4+a5*DT^5;
qc= q*1e4;
if (DT == 0)
    hc = 0;
else
    hc = qc/DT;
end
end
 
%%% LN2 convection - curve 3, reference: TLayer. Jin, J. Hong, H. Zheng, K. Tang and Z. Gan,
%%% "Measurement of boiling heat transfer coefficient in liquid nitrogen bath by inverse heat conduction method,"
%%% Journal of Zhejiang University Science A, vol. 10, No. 5, 2009.
function [hc, qc] = HeatTransfer_3(T, Tref)
DT = T-Tref;
if (DT <= 0)
    q = 0;
elseif (DT <= 4)
    q = 21.945*DT;
elseif (DT <= 19.6)
    q = 82.74-131.22*DT+37.64*DT^2-1.13*DT^3;
elseif (DT <= 52)
    q = 13087.8-723.04*DT+13.48*DT^2-0.084*DT^3;
else
    q = 125 + 0.069*DT;
end
qc = q*DT;
hc = q;
end