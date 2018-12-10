function [Rmm, lags] = correlation(varargin)
    % 'Rmm' is the correlation, 'lags' is the lag in index.
    if length(varargin) == 1    % Calculate autocorrelation of varargin{1}. 
        filtmm = varargin{1};
        [Rmm,lags] = xcorr(filtmm,'coeff');
        Rmm = Rmm(lags>0);
        lags = lags(lags>0);
    else                        % Calculate correlation between varargin{1} and varargin{2}. 
        ms = varargin{1};
        filtmm = varargin{2};
        [Rmm,lags] = xcorr(ms,filtmm,'coeff');
        Rmm = Rmm(lags>0);
        lags = lags(lags>0);
    end
end

%figure
%plot(lags/Fs,Rmm);