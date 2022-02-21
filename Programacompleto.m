%Para encoontrar las raices
clear all
close all
syms w
A= 0.3;
H = HeatTransfer_1(300,200);
LHS = (w)/(H);
RHS = besselj(0,A*w)/ besselj(1,A*w);
root=vpasolve(RHS==LHS,w,[0, 10]);

%Constantes utilizadas 
alpha=0.001;
g=200;

%Para un solo término
syms x
fun=(200*x*besselj(0,(root*x/A)));
q=int(fun,0,A);
[X,Y]=meshgrid(0:A/10:A,0:10:100);
Z=(2/A^2)*((((exp(-(root*(alpha/A))^2*Y)))*((besselj(0,(root*X/A)))/((1+((H^2*A^2)/(root^2)))*((besselj(0,root))^2))))*q);

%Sacamos los valores de Z para una variable double
z2=zeros(11);
for i=1:11
    for j=1:11
        z2(i,j)=double(Z(i,j));
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