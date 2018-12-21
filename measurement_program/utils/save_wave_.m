function [d] = save_wave_(val, Fs)
    name = input('Enter save name >> ', 's');
    if isempty(name)
        disp('Name can''t be empty');
        return
    end
    
    desc = input('Description >> ', 's');
    
    data.description = desc;
    data.wave        = val;
    data.Fs          = Fs;
    data.name        = name;
    
    save_data('../data/waves/', name, data);
    d = data;
end