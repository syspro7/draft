function estidist = estimate_distance_env(base,test,testdist,Fs,thre)
    if ~exist('Fs','var')
        Fs = 96000;
    end
    [base_upperenv, base_lowerenv] = envelope(base,300);
    [test_upperenv, test_lowerenv] = envelope(test,300);
    [Rmm, lags] = xcorr(base_upperenv, test_upperenv, 'coeff');
    [~,b] = max(Rmm); 
    
    sa = b-(length(Rmm)+1)/2;
    
    figure;
    grid on; hold on;
    if sa < 0
        plot((1:length(base)+sa)*1/Fs,[base(1:end+sa)' test(-sa+1:end)']);
        plot((1:length(base)+sa)*1/Fs,[base_upperenv(1:end+sa)' test_upperenv(-sa+1:end)']);
        [maxenv, maxenvind] = max(abs(base_upperenv));
        plot([1 1]*maxenvind*(1/Fs),[-maxenv maxenv]);
        plot([1 1]*maxenvind*(1/Fs)+2*testdist/340,[-maxenv maxenv],'--');
        dist = abs(base_upperenv(1:end+sa)-test_upperenv(-sa+1:end));
        i = maxenvind;
        while dist(i) < thre
            i = i + 1;
        end
        ds = dist(i-5:i+5);
        [~,b] = max(ds);
        plot([1 1]*(i+b-6)/Fs,[-maxenv maxenv]);
    else
        plot((1:length(base)-sa)*1/Fs,[base(sa+1:end)' test(1:end-sa)']);
        plot((1:length(base)-sa)*1/Fs,[base_upperenv(sa+1:end)' test_upperenv(1:end-sa)']);
        plot((1:length(base)-sa)*1/Fs,[lowpass(base_upperenv(sa+1:end)',lpthre,Fs) lowpass(test_upperenv(1:end-sa)',lpthre,Fs)]);
        [maxenv, maxenvind] = max(abs(test_upperenv));
        plot([1 1]*maxenvind*(1/Fs),[-maxenv maxenv]);
        plot([1 1]*maxenvind*(1/Fs)+2*testdist/340,[-maxenv maxenv],'--');
        dist = abs(base_upperenv(sa+1:end)-test_upperenv(1:end-sa));
        i = maxenvind;
        while dist(i) < thre
            i = i + 1;
        end
        ds = dist(i-5:i+5);
        [~,b] = max(ds);
        plot([1 1]*(i+b-6)/Fs,[-maxenv maxenv]);
    end
    estidist = (i+b-6-maxenvind)/Fs*340;
    legend;
end