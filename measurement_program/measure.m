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
    measure_index = measure_index+1;
else
    filename = tmp_filename;
end

% wave data
measurement.speaker = f1500.*mask;
soundsc(measurement.speaker,Fs);
sss = recording();
measurement.microphone = sss;

save_data(sprintf('../data/measure/%d-%d-%d/', year(d), month(d), day(d)), filename, measurement);