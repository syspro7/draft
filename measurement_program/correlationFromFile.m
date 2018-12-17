function [Rmm, lags] = correlationFromFile(filename, Fs)
    % calc correlation from exported data.
    % filename is file name of exported data.
    % exported data must be measurement structure.
    % more information, to read correlation.m
    % Fs is sampling frequency.

    measurement = load(filename);
    [Rmm, lags] = correlation(measurement.measurement, Fs);
end