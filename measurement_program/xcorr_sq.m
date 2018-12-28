filename1 = '2m-5000Hz.mat';
filename2 = '6m-5000Hz.mat';

data1 = load(filename1);
data2 = load(filename2);

microphone1 = data1.data.microphone;
microphone2 = data2.data.microphone;

speaker1 = data1.data.speaker;
speaker2 = data2.data.speaker;

t = linspace(0, 1, 96000*1);

figure();

subplot(6,1,1);
plot(t, speaker1);
%xlim([0.2 0.25]);
%ylim([-0.1 1.1]);
subplot(6,1,2);
plot(t, microphone1);
%xlim([0.4 0.7]);

c1 = xcorr(microphone1, speaker1); 
%, 'coeff');
c1 = abs(c1);
subplot(6,1,3);
plot(c1);

subplot(6,1,4);
plot(t, speaker2);
%xlim([0.2 0.25]);
%ylim([-0.1 1.1]);
subplot(7,1,5);
plot(t, microphone2);
%xlim([0.4 0.7]);

c2 = xcorr(microphone2, speaker2); %, 'coeff');
c2 = abs(c2);
subplot(6,1,6);
plot(c2);


peak1 = max(c1);
peak2 = max(c2);

peak_index1 = find(c1==peak1);
peak_index2 = find(c2==peak2);

rolled1 = circshift(c1, 20000-peak_index1);
rolled2 = circshift(c2, 20000-peak_index2);

figure();
hold on;

plot(rolled1, 'b');
plot(rolled2, 'r');
xlim([1.95 2.35].*1E4);
title([filename1, ':', filename2]);

data1.data.distance
data2.data.distance