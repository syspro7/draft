function [d] = save_data(dir_path, name, data)
% dir_path: directory path to save the data
% name:     only file name of the data without ext

if ~exist(dir_path, 'dir') 
    mkdir(dir_path)
end

full_path = sprintf('%s/%s.mat', dir_path, name);

if exist(full_path, 'file') == 2
    fprintf('ERROR!! %s already exists\n', full_path);
else
    save(full_path, 'data');
end

d = data;

end