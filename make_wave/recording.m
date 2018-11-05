% Record your voice for 2 seconds.
T = 2;
recObj = audiorecorder(44100,8,1);
disp('Start speaking.')
recordblocking(recObj, T);
disp('End of Recording.');

% Play back the recording.
play(recObj);

% Store data in double-precision array.
s = getaudiodata(recObj);

% Plot the waveform.
plot(1/44100:1/44100:T, s);