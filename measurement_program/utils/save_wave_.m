function [d] = save_wave_(val, name, desc, Fs)
    
    data.description = desc;
    data.wave        = val;
    data.Fs          = Fs;
    data.name        = name;
    
    save_data('../data/waves/', name, data);
    d = data;
end