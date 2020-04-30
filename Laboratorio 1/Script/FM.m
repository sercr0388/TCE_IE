fs = 1000; 
fc = 200;  
t = (0:1/fs:0.2)';
x = sin(2*pi*30*t)+2*sin(2*pi*60*t);
fDev = 50;
y = fmmod(x,fc,fs,fDev);
plot(t,x,'c',t,y,'b--')
xlabel('Time (s)')
ylabel('Amplitude')
legend('Original Signal','Modulated Signal')