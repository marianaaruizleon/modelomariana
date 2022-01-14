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