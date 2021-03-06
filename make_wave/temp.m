run init.m

% date
measurement.date = datetime('now');
d                = measurement.date;

% parameters and descriptions
dist                 = input('Enter distance >> ');
measurement.distance = dist;
measurement.description = input('Any description? >> ', 's');

% filename
filename      = sprintf('%d-exp', i);
tmp_filename  =input(sprintf('Enter filename (default: "%s" >> ', filename), 's');

if isempty(tmp_filename) % default filename
    i = i+1;
else
    filename = tmp_filename;
end

% select wave data
% wav = plot_waves
measurement.speaker = wav;
soundsc(measurement.speaker,Fs);
sss = recording();
measurement.microphone = sss;

save_data(sprintf('../data/%d-%d-%d/', year(d), month(d), day(d)), filename, measurement);