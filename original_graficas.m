clear all
clc

i=linspace(0,6,6);
f=@(x) besselj(0,x);
k=raices(f,x);
%valores de las reices de Bessel
w=k(1);
e=k(2);
alpha=0.001;
a=10;
t=0.002;
gx=200;

% Así funciona. Solamente tienes que ir agregando los demás términos para
% ver que funcionen bien. Creo que no tendrás problemas con ellos.
u=((2/a^2)*(exp(-(w*(alpha/a))^2*t)))*(((besselj(0,(w*x./a)))/((besselj(1,w))^2)))
%+(besselj(0,w))^2)))
%*(integral(gx*besselj(0,(w*r/a))*r,r,0,a))))*(exp(-(e*(alpha/a))^2*t)*(((besselj(0,(e*r/a)))/((besselj(1,e))^2)+(besselj(0,e))^2)*(integral(gx*besselj(0,(e*r/a))*r,r,0,a)))));

% Tienes que cambiar todas las r por x en las funciones.

% surf(x, t, u) % El problema es que u es un escalar así como lo tienes.
% porque solo lo estás evaluando para un tiempo. Entonces no lo va a
% graficar como superficie hasta que la hagas depender de un vector de
% tiempos (similar al vector de posiciones x).

% Había que pasar la función hasta el final.

% funcion para encontrar las raices de Bessel
function o = raices(f, x)
    y=f(x);
    indices=find(y(1:end-1).*y(2:end)<0);
    o=zeros(1,length(indices));
    for k=1:length(indices)
        o(k)=fzero(f, [x(indices(k)), x(indices(k)+1)]);
    end
end
