% Modulación AM
% Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
% Escuela de Ingeniería Electrónica
% Prof: Ing. Sergio Arriola-Valverde. M. Sc (sarriola@tec.ac.cr)
% Curso: EL-5522 Taller de Comunicaciones Eléctricas
% Este Script esta estructurado en Matlab 
% Propósito General: Grafico de Modulación AM
% Entradas: Frecuencia
% Tomado y adapdato de: https://www.mathworks.com/matlabcentral/fileexchange/44797-matlab-code-for-amplitude-modulation-am
% Esto material son para uso unicamente didactico y academico

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Limpio la terminal y variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
close all;
clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definicion de parametros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m=input('Introduzca el indice de modulación (m): ');

if (0>m||m>2)
    error('El indice de moludacion deber mayor a 0 pero menor a 2'); % Funcion de error
    AM
end

Am=input('Introduzca la amplitud de la señal moduladora: ');
fa=input('Introduzca la frecuencia de la señal moduladora: ');

fc=fa*10;% Frecuencia de la señal portadora
Ta=1/fa; % Periodo de la señal moduladora
Tc=1/fc;% Periodo de la señal moduladora
t=0:Ta/999:6*Ta; % Tiempo total de la simulación

Fs = 10*fc; % Frecuencia de muestreo
t_s = (0:1/Fs:100)'; % Tiempo total


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definición de señales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ym=Am*cos(2*pi*fa*t); % Señal temporal de la moduladora
y_m=Am*cos(2*pi*t_s); % Señal temporal de la moduladora
figure(1)
subplot(3,1,1); 
plot(t,ym), grid on;% Gráfico de la señal moduladora
title ( '  Señal Moduladora   ');
xlabel ( ' Tiempo (sec) ');
ylabel (' Amplitud (Voltios)   ');

Ac=Am/m;% Amplitud de la señal portadora[con indice de modulacion (m)=Am/Ac]
yc=Ac*cos(2*pi*fc*t);% Señal temporal de la portadora
subplot(3,1,2);
plot(t,yc), grid on;% Gráfico de la señal portadora
title ( '  Señal Portadora   ');
xlabel ( ' Tiempo (sec) ');
ylabel (' Amplitud (Voltios)   ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modulación AM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
y=Ac*(1+m*cos(2*pi*fa*t)).*cos(2*pi*fc*t); % Modulación AM a nivel temporal
subplot(3,1,3);
plot(t,y);% Grafico de la señal AM en dominio temporal
title ( '  Señal Modulada en Amplitud  ');
xlabel ( ' Tiempo (sec) ');
ylabel (' Amplitud (Voltios)   ');

%>>>>>>>>>>>>>>>>>>>>>> FIN  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<