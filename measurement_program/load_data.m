function [d] = load_data(dir_path, name)
% dir_path: directory path to load the data file
% name:     only file name of the data without ext

if ~exist(dir_path, 'dir') 
    fprintf('ERROR! %s not exists!\n', dir_path);
end

full_path = sprintf('%s/%s.mat', dir_path, name);

if exist(full_path, 'file') == 0
    fprintf('ERROR!! %s not exists!\n', full_path);
else
    load(full_path, 'data');
end

d = data;

end