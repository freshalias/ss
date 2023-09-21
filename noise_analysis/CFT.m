%%calculation CFT point
function [Xw,fx] = CFT(sig,fs,nfft)
%% 
% sig- singal
%fs- sampling rate
%nfft- fft points
%Mg- magnitude
%fx- x-axis with freqency


Xw = fft(sig,nfft);
Xw = fftshift(Xw)/fs;
fx=(-nfft/2:nfft/2-1)*fs/nfft;
end

