% Modulaci�n FM
% Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
% Escuela de Ingenier�a Electr�nica
% Prof: Ing. Sergio Arriola-Valverde. M. Sc (sarriola@tec.ac.cr)
% Curso: EL-5522 Taller de Comunicaciones El�ctricas
% Este Script esta estructurado en Matlab 
% Prop�sito General: Modulaci�n FM
% Entradas: Freceuncia de muestro, portadora, desviacion
% Tomado y adapdato de: https://www.mathworks.com/help/comm/ref/fmmod.html
% Este material son para uso unicamente didactico y academico

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

fs = 10000; % Frecuencia de muestreo
fc = 200;  % Frecuencia de portadora
t = (0:1/fs:0.2)'; % Vector de tiempo
x = sin(2*pi*30*t)+2*sin(2*pi*60*t);  % Mensaje
fDev = 50; % Desviacion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Modulaci�n FM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

y = fmmod(x,fc,fs,fDev);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graficos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(t,x,'k',t,y,'b--') 
xlabel('Tiempo (s)')
ylabel('Amplitud (Voltios)')
legend('Se�al Original','Se�al Modulada')

%>>>>>>>>>>>>>>>>>>>>>> FIN  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<