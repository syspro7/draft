T = 1;      % seconds
Fs = 44100; % sampling rate
Nk = Fs*T;  % points per window;
wind = hann(Nk); % make a hann window
[S, f, t] = spectrogram(s,wind,Nk/2,[],Fs,'yaxis');