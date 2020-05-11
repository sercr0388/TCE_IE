% Desviacion FM
% Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
% Escuela de Ingeniería Electrónica
% Prof: Ing. Sergio Arriola-Valverde. M. Sc (sarriola@tec.ac.cr)
% Curso: EL-5522 Taller de Comunicaciones Eléctricas
% Este Script esta estructurado en Matlab 
% Propósito General: Desviacion FM
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
fs = input('Digite la frecuencia de muestro en (Hz): '); % Frecuencia de muestreo            
ts = 1/fs;             % Periodo de muestra
fd = input('Digite la desviacion de frecuencia en (Hz): '); % Desviacion de frecuencia

if (fd < 75)
    error('La desviacion de frecuencia debe ser menos a 75 Hz'); % Funcion de error
    fmdeviation
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Grafico
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = (0:ts:5-ts)';
x = wgn(length(t),1,0);
MOD1 = comm.FMModulator('SampleRate',fs,'FrequencyDeviation',fd);
y = step(MOD1,x);
MOD2 = comm.FMModulator('SampleRate',fs,'FrequencyDeviation',5*fd);
z = step(MOD2,x);
SA = dsp.SpectrumAnalyzer('SampleRate',fs,'ShowLegend',true);
step(SA,[y z])

%>>>>>>>>>>>>>>>>>>>>>> FIN  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<