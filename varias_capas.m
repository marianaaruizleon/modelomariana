%Solución radial con varias capas

close all
%Temperatura de entrada
T_ent=25+273.15;

%Conductividad térmica de cada una de las capas
k_p=60.5; %acero
k_w=0.58; %agua
k_o=0.15; %aceite

%Radios de la tubería 
r_p=0.2; %acero
r_w=0.1; %agua
r_o=0.1; %aceite

%flujo de calor
q=1;

%Creando espacio para graficar 
[x]=(0:0.01:0.1);

%Temperatura en la capa de aceite
T_o=((-1/k_o)*(((q*x.^2)/4)-((q*r_o^2*log(x))/2)))+T_ent;
plot(x,T_o)
title('Temperatura en el aceite')
ylabel('Temperatura [K]')
xlabel('Radio [m]')

%Temperatura para la sección de agua
T_w=((-1/k_w)*(((q*x.^2)/4)-((q*r_w^2*log(x))/2)))+T_o+((1/k_w)*(((q*r_o^2)/4)-((q*r_w^2*log(r_o))/2)));
figure
plot(x,T_w)
title('Temperatura en el agua')
ylabel('Temperatura [K]')
xlabel('Radio [m]')

%Tempatura en la sección del acero
T_p=((-1/k_p)*(((q*x.^2)/4)-((q*r_p^2*log(x))/2)))+T_w+((1/k_p)*(((q*r_w^2)/4)-((q*r_p^2*log(r_w))/2)));
figure
plot(x,T_p)
title('Temperatura en el acero')
ylabel('Temperatura [K]')
xlabel('Radio [m]')