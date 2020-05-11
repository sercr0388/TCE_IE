% Se�al y espectro de tonos senoidales
% Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
% Escuela de Ingenier�a Electr�nica
% Prof: Ing. Sergio Arriola-Valverde. M. Sc (sarriola@tec.ac.cr)
% Curso: EL-5522 Taller de Comunicaciones El�ctricas
% Este Script esta estructurado en Matlab 
% Prop�sito General: Se�al y espectro de tonos senoidales
% Entradas: Tonos de frecuencia
% Tomado y adapdato de: https://www.mathworks.com/help/matlab/ref/fft.html
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

Fs = 1000;            % Frecuencia de muestreo                    
T = 1/Fs;             % Periodo de muestreo      
L = 1500;             % Largo de la se�al
t = (0:L-1)*T;        % Tiempo de vector

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definicion de parametros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t); % Definicion de se�al
X = S + 0.5*randn(size(t)); % Se�al con ruido

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graficas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
plot(1000*t(1:50),X(1:50))
title('Se�al con Ruido aditivo')
xlabel('t (millisegundos)')
ylabel('X(t)')

Y = fft(X);  % Transformada de Fourier para el la se�al X

P2 = abs(Y/L);  
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1); 

figure(2)
f = Fs*(0:(L/2))/L;
plot(f,P1)
title('Espectro de la se�al X(t)')
xlabel('f (Hz)')
ylabel('|P(f)|')

%>>>>>>>>>>>>>>>>>>>>>> FIN  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<