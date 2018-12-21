run init.m

% date
measurement.date = datetime('now');
d                = measurement.date;

% parameters and descriptions
dist                 = input('Enter distance >> ');
measurement.distance = dist;
measurement.description = input('Any description? >> ', 's');

% filename
filename      = sprintf('%d-exp', measure_index);
tmp_filename  =input(sprintf('Enter filename (default: "%s" >> ', filename), 's');

if isempty(tmp_filename) % default filename
    measure_index = measure_index+1;
else
    filename = tmp_filename;
end

% wave data
wav = select_wave(waves);
measurement.speaker = wav.wave;

T = dinput('Input T', 'T');

if ~exist('recObj', 'var')
    recObj          = audiorecorder(Fs, 24, 1);
    recObj.StartFcn	= 'disp(''Start speaking.'')';
    recObj.StopFcn	= 'disp(''End of recording.'')';
end

sss = recording(wav, recObj, T);
measurement.microphone = sss;

% Plot the waveform.
figure(4);
plot(0:1/Fs:numel(sss)/Fs - 1/Fs, sss);

% save
tmp = input('Save? (default: y) >> ', 's');
if isempty(tmp) || any(regexpi(tmp, 'y'))
    save_data(sprintf('../data/measure/%d-%d-%d/', year(d), month(d), day(d)), filename, measurement);
end

clear tmp d tmp_filename filename wav