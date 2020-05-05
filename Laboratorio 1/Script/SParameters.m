S = sparameters('defaultbandpass.s2p');
freq = S.Frequencies;
gd2 = groupdelay(S,freq);
figure
plot(freq,gd2)
rfplot(S)