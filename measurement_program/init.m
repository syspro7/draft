
if ~exist('initialized', 'var')    
    % addpath
    addpath('./utils');
    
    % var declaration
    Fs = 96000;
    measure_index = 1;
    
    % load waves
    wave_files = dir('../data/waves/*.mat');
    waves      = cell(1, length(wave_files));
    for i = 1:length(waves)
        f = wave_files(i);
        [~, n, ~] = fileparts(f.name);
        waves{i} = load_data(f.folder, n);

        if ~isfield(waves{i}, 'scale_index')
            wave = waves{i};
            abserrs = abs(wave.wave-mean(wave.wave));
            maxabserr = max(abserrs);
            scale_index = find(abserrs > maxabserr*0.03, 1, 'last');
            waves{i}.scale_index = scale_index;
        end
    end
    
    % measured data
    dirs = dir('../data/measure/*');
    dirs = dirs(3:end); % ignore . and ..
    measurements      = cell(1, length(dirs));
    for i = 1:length(measurements)
        d = dirs(i);
        measurements{i} = struct();
        measurements{i}.date = d.name;
        
        dir_path = sprintf('%s/%s', d.folder, d.name);
        mat_files = dir(sprintf('%s/*.mat', dir_path));
        tmp_mats = cell(1, length(mat_files));
        for i2 = 1:length(mat_files)
            [~, n, ~] = fileparts(mat_files(i2).name);
            tmp_mats{i2} = load_data(dir_path, n);
            tmp_mats{i2}.filename = n;
        end
        measurements{i}.data = tmp_mats;
    end
    
    % env vars
    env = struct();
    
    clear f i i2 scale_index tmp_mats mat_files dir_path abserrs maxabserr n wave_files dirs d
    initialized = true;
end