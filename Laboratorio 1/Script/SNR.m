% Analisis SNR
% Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
% Escuela de Ingeniería Electrónica
% Prof: Ing. Sergio Arriola-Valverde. M. Sc (sarriola@tec.ac.cr)
% Curso: EL-5522 Taller de Comunicaciones Eléctricas
% Este Script esta estructurado en Matlab 
% Propósito General: Analisis SNR
% Entradas: Frecuencia, amplitud e indice de modulacion
% Tomado y adapdato de: https://www.mathworks.com/help/signal/ref/snr.html
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

rng default

fs = 5e4; 
f0 = input('Digite la frecuencia fundamental en (Hz): '); % Frecuencia fundamental
Noise = input('Digite las unidades lineales de ruido deseadas: '); %Ruido
N = 1024;
t = (0:N-1)/fs;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Funciones y SNR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ct = cos(2*pi*f0*t);
cd = ct + (Noise)*randn(size(ct));

amp = [1e-5 5e-6 -1e-3 6e-5 1 25e-3];
sgn = polyval(amp,cd);

snr(sgn,fs,2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%>>>>>>>>>>>>>>>>>>>>>> FIN  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<