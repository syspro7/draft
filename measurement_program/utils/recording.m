function s = recording(recObj, T)

disp('Start rec.');
recordblocking(recObj, T);
disp('End rec.');

% Play back the recording.
%play(recObj);

% Store data in double-precision array.
s = getaudiodata(recObj)';

end