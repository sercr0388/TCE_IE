% Analisis SINAD
% Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
% Escuela de Ingeniería Electrónica
% Prof: Ing. Sergio Arriola-Valverde. M. Sc (sarriola@tec.ac.cr)
% Curso: EL-5522 Taller de Comunicaciones Eléctricas
% Este Script esta estructurado en Matlab 
% Propósito General: Analisis SINAD
% Entradas: Frecuencia fundamental y Ruido
% Tomado y adapdato de: https://www.mathworks.com/help/signal/ref/sinad.html
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

fs = 5e4; % Frecuencia de muestro
f0 = input('Digite la frecuencia fundamental en (Hz): '); % Frecuencia fundamental
Noise = input('Digite las unidades lineales de ruido deseadas: '); %Ruido
N = 1024;
t = (0:N-1)/fs;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funciones y SINAD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ct = cos(2*pi*f0*t);
cd = ct + (Noise)*randn(size(ct));

amp = [1e-5 5e-6 -1e-3 6e-5 1 25e-3];
sgn = polyval(amp,cd);
sinad(sgn,fs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%>>>>>>>>>>>>>>>>>>>>>> FIN  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

