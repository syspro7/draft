
if ~exist('Fs', 'var')
    fprintf('ERROR! Fs not defined\n');
    Fs = input('Enter Fs >> ');
end

if ~exist('waves', 'var')
    fprintf('ERROR! waves not defined!\n');
    return;
end

d = save_wave_( eval(input('wave data variable name >> ', 's')), Fs );

waves{length(waves)+1} = d;