
if ~exist('Fs', 'var')
    fprintf('ERROR! Fs not defined\n');
    Fs = input('Enter Fs >> ');
end

if ~exist('waves', 'var')
    fprintf('ERROR! waves not defined!\n');
    return;
end

varname = input('wave data variable name >> ', 's');
name = dinput('Enter save name', 's', 'varname');

if isempty(name)
    disp('Name can''t be empty');
    return
end

desc = input('Description >> ', 's');

d = save_wave_( eval(varname), name, desc, Fs );

waves{length(waves)+1} = d;