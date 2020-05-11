% Filtro Paso Bajo
% Instituto Tecnologico de Costa Rica (www.tec.ac.cr)
% Escuela de Ingeniería Electrónica
% Prof: Ing. Sergio Arriola-Valverde. M. Sc (sarriola@tec.ac.cr)
% Curso: EL-5522 Taller de Comunicaciones Eléctricas
% Este Script esta estructurado en Matlab 
% Propósito General: Filtro Paso Bajo
% Entradas: Frecuencia, amplitud e indice de modulacion
% Tomado y adapdato de: https://www.mathworks.com/help/dsp/ug/lowpass-filter-design.html
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

N = input('Digite el orden del filtro: '); % Orden del filtro
Fs  = 48e3; % Frecuencia de muestreo
Fp = input('Digite la frecuencia de corte: '); % Frecuencia de corte
Ap = input('Digite el rizado en (dB) de la banda pasante: ');
Ast = input('Digite la atenuación en (dB) de la banda no pasante: ');
Rp  = (10^(Ap/20) - 1)/(10^(Ap/20) + 1);
Rst = 10^(-Ast/20);
NUM = firceqrip(N,Fp/(Fs/2),[Rp Rst],'passedge');
hvft=fvtool(NUM,'Fs',Fs);
legend(hvft,strcat('N=',num2str(N)))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graficas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

LP_FIR = dsp.FIRFilter('Numerator',NUM);
SA     = dsp.SpectrumAnalyzer('SampleRate',Fs,'SpectralAverages',5);
tic
while toc < 1000
    x = randn(256,1);
    y = step(LP_FIR,x);
    step(SA,y);
end

%>>>>>>>>>>>>>>>>>>>>>> FIN  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<