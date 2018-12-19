function wave = select_wave(wave_list)
% select wave from wavelist.
% wavelist is cell array of wave structure.
% this func can select wave from wavelist.
% output is a selected wave structure.

size = numel(wave_list);
% size of cell array.

figure(3);

for i = 1:size
    wave_plot(wave_list{i}, i, size);
end
% subplot all waves.

select_num = input('Select wave type (input number) >> ');
wave = wave_list{select_num};
end

function wave_plot(wave, index, size)
% subplot each wave.

t = 0:1/wave.Fs:numel(wave.wave)/wave.Fs - 1/wave.Fs;
% t is time vector.

subplot(size, 1, index);
plot(t, wave.wave);
xlabel("t[s]");
ylabel("wave");
title("wave" + string(index));
end