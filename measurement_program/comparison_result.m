% load data
result_1120_00 = load('measurement20181120-0.mat');
result_1120_15 = load('measurement20181120-15.mat');

% get signal of microphone
microphone_1120_00 = result_1120_00.measurement.microphone.';
microphone_1120_15 = result_1120_15.measurement.microphone.';

% get min(max) value of signal
peack_00 = min(microphone_1120_00);
peack_15 = min(microphone_1120_15);

% get index of min in signal
peack_inds_00 = find(microphone_1120_00 == peack_00);
peack_inds_15 = find(microphone_1120_15 == peack_15);

% set min value index in 20K
rolled_00 = circshift(microphone_1120_00, 20000 - peack_inds_00);
rolled_15 = circshift(microphone_1120_15, 20000 - peack_inds_15);


tmp = rolled_00 - rolled_15;
%low_tmp = lowpass(tmp, 150, 1000);

figure
hold on

%plot(tmp)
plot(rolled_00, 'b')
plot(rolled_15, 'r')

%tmp = abs(microphone_1120_00) .* abs(microphone_1120_15);
%plot(tmp)
%plot(microphone_1120_00)
%plot(microphone_1120_15)



