%
% sin波を発するプログラ�?
%
Fs = 44100;
t = 0:1/Fs:1;
y = sin(2*pi*440*t);
soundsc(y, Fs);