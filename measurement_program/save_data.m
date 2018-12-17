function save_data(dir_path, name, data)
% dir_path: directory path to save the data
% name:     only file name of the data without ext

if ~exist(dir_path, 'dir') 
    mkdir(dir_path)
end

save(sprintf('%s/%s.mat', dir_path, name), 'data');
end