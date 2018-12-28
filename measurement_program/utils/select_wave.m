function wave = select_wave(wave_list)
% select wave from wavelist.
% wavelist is cell array of wave structure.
% this func can select wave from wavelist.
% output is a selected wave structure.

size_ = numel(wave_list);
% size of cell array.

figure(3);

for i = 1:size_
    wave_plot(wave_list{i}, i, 4);
end
% subplot all waves.

select_num = input('Select wave type (input number) >> ');
wave = wave_list{select_num};
end

function wave_plot(wave, index, size_)
% subplot each wave.

t = 0:1/wave.Fs:numel(wave.wave)/wave.Fs - 1/wave.Fs;
% t is time vector.

scale_index = wave.scale_index;

scrollsubplot(size_, 2, index);
plot(t(1:scale_index), wave.wave(1:scale_index));
xlabel("t[s]");
ylabel("wave");
title(sprintf("%d: %s (%s)", index, wave.name, wave.description));
end