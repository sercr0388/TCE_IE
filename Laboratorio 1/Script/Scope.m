sin = dsp.SineWave('Frequency',200,'SampleRate',1000);
sin.SamplesPerFrame = 1000;
scope = dsp.SpectrumAnalyzer('SampleRate',sin.SampleRate);
for ii = 1:250
  x = step(sin) + 0.05*randn(1000,1);
  step(scope,x);
end