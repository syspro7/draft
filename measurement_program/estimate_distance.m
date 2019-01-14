
% select data date
for i = 1:length(measurements)
    fprintf('%d: %s\n', i, measurements{i}.date);
end

env.measure_date = dinput('\nWhich ?', 'env.measure_date');

% which is base data?
env.measure_data = measurements{env.measure_date}.data;
for i = 1:length(env.measure_data)
    if isfield(env.measure_data{i}, 'description')
        fprintf('%d: %s\n', i, env.measure_data{i}.description);
    else
        fprintf('%d: %s\n', i, env.measure_data{i}.filename);
    end
end

env.measure_base = dinput('\nWhich is base?', 'env.measure_base');
env.measure_test = dinput('\nWhich is test?', 'env.measure_test');
env.measure_thre = dinput('\nWhat is thre?', 'env.measure_thre');

d = env.measure_data{env.measure_test};
estimate_distance_dslp_env(env.measure_data{env.measure_base}.microphone, d.microphone, d.distance, d.Fs, env.measure_thre);

clear d