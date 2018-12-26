Tk = 0.05;      % seconds
Fs = 44100; % sampling rate
Nk = Fs*Tk;  % points per window;
wind = hann(Nk); % make a hann window
spectrogram(measurement.microphone,wind,floor(Nk/2),[],Fs,'yaxis');