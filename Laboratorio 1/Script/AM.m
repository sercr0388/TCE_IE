% Modulaci�n AM
% Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
% Escuela de Ingenier�a Electr�nica
% Prof: Ing. Sergio Arriola-Valverde. M. Sc (sarriola@tec.ac.cr)
% Curso: EL-5522 Taller de Comunicaciones El�ctricas
% Este Script esta estructurado en Matlab 
% Prop�sito General: Grafico de Modulaci�n AM
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

m=input('Introduzca el indice de modulaci�n (m): ');

if (0>m||m>2)
    error('El indice de moludacion deber mayor a 0 pero menor a 2'); % Funcion de error
    AM
end

Am=input('Introduzca la amplitud de la se�al moduladora: ');
fa=input('Introduzca la frecuencia de la se�al moduladora: ');

fc=fa*10;% Frecuencia de la se�al portadora
Ta=1/fa; % Periodo de la se�al moduladora
Tc=1/fc;% Periodo de la se�al moduladora
t=0:Ta/999:6*Ta; % Tiempo total de la simulaci�n

Fs = 10*fc; % Frecuencia de muestreo
t_s = (0:1/Fs:100)'; % Tiempo total


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definici�n de se�ales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ym=Am*cos(2*pi*fa*t); % Se�al temporal de la moduladora
y_m=Am*cos(2*pi*t_s); % Se�al temporal de la moduladora
figure(1)
subplot(3,1,1); 
plot(t,ym), grid on;% Gr�fico de la se�al moduladora
title ( '  Se�al Moduladora   ');
xlabel ( ' Tiempo (sec) ');
ylabel (' Amplitud (Voltios)   ');

Ac=Am/m;% Amplitud de la se�al portadora[con indice de modulacion (m)=Am/Ac]
yc=Ac*cos(2*pi*fc*t);% Se�al temporal de la portadora
subplot(3,1,2);
plot(t,yc), grid on;% Gr�fico de la se�al portadora
title ( '  Se�al Portadora   ');
xlabel ( ' Tiempo (sec) ');
ylabel (' Amplitud (Voltios)   ');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modulaci�n AM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
y=Ac*(1+m*cos(2*pi*fa*t)).*cos(2*pi*fc*t); % Modulaci�n AM a nivel temporal
subplot(3,1,3);
plot(t,y);% Grafico de la se�al AM en dominio temporal
title ( '  Se�al Modulada en Amplitud  ');
xlabel ( ' Tiempo (sec) ');
ylabel (' Amplitud (Voltios)   ');

%>>>>>>>>>>>>>>>>>>>>>> FIN  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<