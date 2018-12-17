function [Rmm, lags] = correlation(measurement, Fs)
    % 'Rmm' is the correlation, 'lags' is the lag in **index**.
    % measurement is measurement structure.
    % measurement.microphone is microphone data.
    % measurement.speaker is speaker data.
    % Fs is sampling frequency.

    [Rmm, lags] = xcorr(measurement.microphone, measurement.speaker, 'coeff');
    
    Rmm = Rmm(lags > 0);
    lags = lags(lags > 0);
    % delete lag < 0 data.
    % lag = 0 when speaker start to sound.
    
    figure;
    plot(lags / Fs, Rmm);
    xlabel('lag[s]');
    title('cross-correlation');
    % show figure.
end
