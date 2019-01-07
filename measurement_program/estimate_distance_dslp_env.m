function [ratio, estidist] = estimate_distance_dslp_env(base,test,testdist,Fs,thre)
    if ~exist('Fs','var')
        Fs = 96000;
    end
    [base_upperenv, base_lowerenv] = envelope(base,300);
    [test_upperenv, test_lowerenv] = envelope(test,300);
    [Rmm, lags] = xcorr(base_upperenv, test_upperenv, 'coeff');
    [~,b] = max(Rmm); 
    
    sa = b-(length(Rmm)+1)/2;
    lpthre = 500;
    dsrate = 10;
    adjwidth = 10;
    
    figure;
    grid on; hold on;
    if sa < 0
        plot((1:length(base)+sa)*1/Fs,[base(1:end+sa)' test(-sa+1:end)']);
        plot((1:length(base)+sa)*1/Fs,[base_upperenv(1:end+sa)' test_upperenv(-sa+1:end)']);
        [~,d] = lowpass(downsample(base_upperenv(1:end+sa)',dsrate),lpthre,Fs/dsrate);
        base_dslp_upperenv = filtfilt(d,downsample(base_upperenv(1:end+sa)',dsrate));
        [~,d] = lowpass(downsample(test_upperenv(-sa+1:end)',dsrate),lpthre,Fs/dsrate);
        test_dslp_upperenv = filtfilt(d,downsample(test_upperenv(-sa+1:end)',dsrate));
        t = linspace(0,1,length(base_dslp_upperenv));
        plot(t,base_dslp_upperenv,t,test_dslp_upperenv);
        %plot((1:length(base)+sa)*1/Fs,[lowpass(base_upperenv(1:end+sa)',lpthre,Fs) lowpass(test_upperenv(-sa+1:end)',lpthre,Fs)]);
    else
        plot((1:length(base)-sa)*1/Fs,[base(sa+1:end)' test(1:end-sa)']);
        plot((1:length(base)-sa)*1/Fs,[base_upperenv(sa+1:end)' test_upperenv(1:end-sa)']);
        [~,d] = lowpass(downsample(base_upperenv(sa+1:end)',dsrate),lpthre,Fs/dsrate);
        base_dslp_upperenv = filtfilt(d,downsample(base_upperenv(sa+1:end)',dsrate));
        [~,d] = lowpass(downsample(test_upperenv(1:end-sa)',dsrate),lpthre,Fs/dsrate);
        test_dslp_upperenv = filtfilt(d,downsample(test_upperenv(1:end-sa)',dsrate));
        t = linspace(0,1,length(base_dslp_upperenv));
        plot(t,base_dslp_upperenv,t,test_dslp_upperenv);
    end
    [maxenv, maxenvind] = max(abs(test_dslp_upperenv));
    plot([1 1]*t(maxenvind),[-maxenv maxenv]);
    plot([1 1]*t(maxenvind)+2*testdist/340,[-maxenv maxenv],'--');
    dist = base_dslp_upperenv./test_dslp_upperenv;
    i = maxenvind;
    while dist(i) > thre
        i = i + 1;
    end
    ds = test_dslp_upperenv(i-adjwidth:i+adjwidth);
    [maxds,b] = max(ds);
    plot([1 1]*t(i+b-adjwidth-1),[-maxenv maxenv]);
    estidist = t(i+b-adjwidth-1-maxenvind)*340;
    ratio = maxds/maxenv;
    legend;
end