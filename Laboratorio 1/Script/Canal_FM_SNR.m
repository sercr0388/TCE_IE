% Analisis de canales de Espectro FM
% Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
% Escuela de Ingeniería Electrónica
% Prof: Ing. Sergio Arriola-Valverde. M. Sc (sarriola@tec.ac.cr)
% Curso: EL-5522 Taller de Comunicaciones Eléctricas
% Este Script esta estructurado en Matlab 
% Propósito General: Analisis de canales de Espectro FM
% Entradas: Tonos en frecuencia
% Tomado y adapdato de: https://la.mathworks.com/help/signal/ug/measure-bandwidth-power-mean-frequency.html
% Este material son para uso unicamente didactico y academic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Limpio la terminal y variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
close all;
clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definicion de parametros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nSamp = (1024); % Numero de muestras
Fs = 1024e6;  % Frecuencia de muestreo
SNR = input('Digite una valor SNR en (dB): '); %Ruido   
t = (0:nSamp-1)'/Fs;  % Vector de tiempo
Canal_1 = chirp(t,100e6,nSamp/Fs,100.010e6);
Canal_1 = Canal_1+randn(size(Canal_1))*std(Canal_1)/db2mag(SNR);% Establecimiento de espectros
Canal_2 = 1.5*chirp(t,80e6,nSamp/Fs,80.010e6);
Canal_2 = Canal_2+randn(size(Canal_2))*std(Canal_2)/db2mag(SNR);
Canal_3 = 2*chirp(t,90e6,nSamp/Fs,90.010e6);
Canal_3 = Canal_3+randn(size(Canal_3))*std(Canal_3)/db2mag(SNR);
Canal_4 = 2.5*chirp(t,91e6,nSamp/Fs,91.010e6);
Canal_4 = Canal_4+randn(size(Canal_4))*std(Canal_4)/db2mag(SNR);
Canal_5 = 3*chirp(t,92e6,nSamp/Fs,92.010e6);
Canal_5 = Canal_5+randn(size(Canal_5))*std(Canal_5)/db2mag(SNR);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determinación de ancho de banda da canal FM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

powerbw([Canal_1 Canal_2 Canal_3 Canal_4 Canal_5],Fs) % Funcion que debe agregar los estudiantes, deben de investigarla

%>>>>>>>>>>>>>>>>>>>>>> FIN  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<