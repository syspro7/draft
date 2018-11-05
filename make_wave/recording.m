% Record your voice for 2 seconds.
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, 2);
disp('End of Recording.');

% Play back the recording.
play(recObj);

% Store data in double-precision array.
s = getaudiodata(recObj);

% Plot the waveform.
plot(s);