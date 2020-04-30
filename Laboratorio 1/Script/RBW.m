sineSignal = dsp.SineWave('SamplesPerFrame',1000,'SampleRate',1000, ...
    'Frequency',[100 200 300],'PhaseOffset',[0 pi/2 pi/4]);
estimator = dsp.SpectrumEstimator('FrequencyRange','onesided');
plotter = dsp.ArrayPlot('PlotType','Line','YLimits',[0 0.75], ...
    'YLabel','Power Spectrum (watts)','XLabel','Frequency (Hz)');
y = step(sineSignal);
pxx = step(estimator,y);
step(plotter,pxx)
f = getFrequencyVector(estimator);
rbw = getRBW(estimator)