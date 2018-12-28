
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
    
    % env vars
    env = struct();
    
    clear f i n wave_files
    initialized = true;
end