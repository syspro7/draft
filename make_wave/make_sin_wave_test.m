%
% sin波を発するプログラム
%
x = linspace(-100, 100, 100000);
y = sin(400*x);
soundsc(y, 44100);