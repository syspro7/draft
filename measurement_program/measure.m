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
% wav = select_wave()
measurement.speaker = wav;

p1 = gcp();
p2 = gcp();
p3 = gcp();
f = parfeval(p1, @pause, 0, 10);

parfeval(p2, @start_sound, 0, f, measurement.speaker, Fs);
f3 = parfeval(p3, @start_record, 1, f);

sss = fetchOutputs(f3);
measurement.microphone = sss;

save_data(sprintf('../data/measure/%d-%d-%d/', year(d), month(d), day(d)), filename, measurement);

function start_sound(f, speaker, Fs)
wait(f);
soundsc(speaker, Fs);
end

function sss = start_record(f)
wait(f);
sss = recording();
end