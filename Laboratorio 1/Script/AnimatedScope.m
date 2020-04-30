SampPerFrame = 1000;
Fs = 1000;
SW = dsp.SineWave('Frequency', 100, ...
  'SampleRate', Fs, 'SamplesPerFrame', SampPerFrame);
TS = dsp.TimeScope('SampleRate', Fs, 'TimeSpan', 0.1, ...
    'YLimits', [-2, 2], 'ShowGrid', true);
SA = dsp.SpectrumAnalyzer('SampleRate', Fs);
tic;
while toc < 1000
  sigData = step(SW) + 0.05*randn(SampPerFrame,1);
  step(TS,sigData);
  step(SA,sigData);
end

Fs = 100e3;
SW1 = dsp.SineWave(1e0,   5e3, 0, 'SampleRate', Fs, 'SamplesPerFrame', SampPerFrame);
SW2 = dsp.SineWave(1e-1, 15e3, 0, 'SampleRate', Fs, 'SamplesPerFrame', SampPerFrame);
SW3 = dsp.SineWave(1e-2, 25e3, 0, 'SampleRate', Fs, 'SamplesPerFrame', SampPerFrame);
SA_Peak = dsp.SpectrumAnalyzer('SampleRate', Fs, 'PlotAsTwoSidedSpectrum', false);
tic;
while toc < 5
    sigData = SW1() + SW2() + SW3() + 1e-4*randn(SampPerFrame,1);
    SA_Peak(sigData);
end
clear SA_Peak;
