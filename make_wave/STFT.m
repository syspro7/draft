Tk = 0.1;      % seconds
Fs = 44100; % sampling rate
Nk = Fs*Tk;  % points per window;
wind = hann(Nk); % make a hann window
[S, f, tt] = spectrogram(s6,wind,Nk/2,[],Fs,'yaxis');