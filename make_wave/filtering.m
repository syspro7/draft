function filtmm = filtering(mm,f1,f2)
    % Apply a band-pass-filter to a signal 'mm' from f1[Hz] to f2[Hz]
    Fs = 44100;
    bpFilt = designfilt('bandpassiir','FilterOrder',20, ...
         'HalfPowerFrequency1',f1,'HalfPowerFrequency2',f2, ...
         'SampleRate',Fs);
    %fvtool(bpFilt);
    filtmm = filtfilt(bpFilt,mm);
end