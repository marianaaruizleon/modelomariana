function [u] = HeatTransfer_sc(gx,a,alfa)
%para sacar las dos primeras raices de Bessel usamos:
function o = raices(f, x)
    y=f(x);
    indices=find(y(1:end-1).*y(2:end)<0);
    o=zeros(1,length(indices));
    for k=1:length(indices)
        o(k)=fzero(f, [x(indices(k)), x(indices(k)+1)]);
    end
end
x=linspace(0,6,6);
f=@(x) besselj(0,x);
k=raices(f,x);
w=k(1);
e=k(2);
%utilizando la solución obtenida
arg1=@(r)w*r./a;
arg2=@(r)e*r./a;
expon1=w*alfa/a;
expon2=e*alfa/a;
fun1=@(r)gx*besselj(0,arg1);
fun2=@(r)gx*besselj(0,arg2);
integ1=@(r)int(fun,r,0,a);
primerter=@(r,t)((exp((-expon1)^2*t)*((besselj(0,arg1)/((besselj(1,w))^2)+(besselj(0,w))^2))*integ1));
segundoter=@(r,t)((exp((-expon2)^2*t)*((besselj(0,arg2)/((besselj(1,e))^2)+(besselj(0,e))^2))*integ2));
u=@(r,t)(2/a^2)*(primerter+segundoter)
end