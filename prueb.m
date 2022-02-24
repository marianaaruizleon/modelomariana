clear all
%Valores de las raices guardadas en un vector 
syms w
A = 0.3;
mroot=zeros(1,10);
mH=zeros(1,10);
    for i=0:50:500
        c=300+i;
        H = HeatTransfer_1(c,298);
        LHS =(w)/(H);
        RHS = besselj(0,A*w)/ besselj(1,A*w);
        root=vpasolve(RHS==LHS,w,[0,10]);
        n=i/50;
        if n==0
            mroot(1)=root;
        else 
            mroot(n)=root;
        end
        if n==0
            mH(1)=H;
        else 
            mH(n)=H;
        end
    end