function s = recording(wav, recObj, T)

record(recObj, T);
soundsc(wav.wave, wav.Fs);

pause(T*1.1);
s = getaudiodata(recObj)';

end