clear all
close all
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
% Constantes utilizadas 
alpha=0.001;
g=200;
%para 10 términos
for u=1:10
    for e=1:10
        syms x
        fun=(200*x*besselj(0,(mroot(u)*x/A)));
        q=int(fun,0,A);
        [X,Y]=meshgrid(0:A/10:A,0:10:100);
        Z=(2/A^2)*((((exp(-(mroot(u)*(alpha/A))^2*Y)))*((besselj(0,(mroot(u)*X/A)))/((1+((mH(u)^2*A^2)/(mroot(u)^2)))*((besselj(0,mroot(u)))^2))))*q);
        a=genvarname(['Z00',num2str(e)]);
        eval([a,'=Z'])
    end
end
Zf=Z001+Z002+Z003+Z004+Z005+Z006+Z007+Z008+Z009+Z0010;
% Sacamos los valores de Z para una variable double
z2=zeros(11);
for i=1:11
    for j=1:11
        z2(i,j)=double(Zf(i,j));
    end
end

%Graficamos
surf(X,Y,z2)
xlabel('radio')
ylabel('tiempo')
zlabel('temperatura')
figure
contour(X,Y,Z)
title('grafica de contorno')