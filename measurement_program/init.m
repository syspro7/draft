
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
    end
    
    clear f i n wave_files
    initialized = true;
end