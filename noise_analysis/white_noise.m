%% psd of white noise 
clear;clc
close all
%% noise generate
n = wgn(1,1000,0)+0.3;% 最后一个参数是power，也就是n的方差，注意单位是dB(10*log10)
fs = 1000;%Hz
t = 1/fs*(0:length(n)-1);
figure(1)
plot(t,n)

%power/variance calculation
dt = 1/fs;
p1=0;
for i=1:length(n)
    p1 = p1+n(i)^2;
end
p1 =p1/(length(n));

%% PSD plot
n_ac=1/length(n)*ifft(fft(n).*conj(fft(n)));%循环卷积/n 自相关函数
figure(2)
plot(n_ac)


[Xw,fx]=CFT(n_ac,fs,length(n_ac));
figure(3)
plot(fx,abs(Xw))


%% power calculation comparation
% calculation from psd plot
df = fx(2)-fx(1);
p2=0;
for i=1:length(Xw)
    p2 = Xw(i)*df+p2;
end
p2 = abs(p2);

% direct calculation from fft
psd = fft(n_ac);
p3 = abs(sum(psd)/length(psd));

