fs = 1e3;              % Sample rate (Hz)
ts = 1/fs;             % Sample period (s)
fd = 1;               % Frequency deviation (Hz)
t = (0:ts:5-ts)';
x = wgn(length(t),1,0);
MOD1 = comm.FMModulator('SampleRate',fs,'FrequencyDeviation',fd);
y = step(MOD1,x);
MOD2 = comm.FMModulator('SampleRate',fs,'FrequencyDeviation',5*fd);
z = step(MOD2,x);
SA = dsp.SpectrumAnalyzer('SampleRate',fs,'ShowLegend',true);
step(SA,[y z])