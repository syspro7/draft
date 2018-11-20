measurement.date = datetime('now');
measurement.distance = 6.1;
%measurement.speaker = mask_rect;
%measurement.speaker = ra2;
measurement.speaker = f1500.*mask;
soundsc(measurement.speaker,Fs);
sss = recording();
measurement.microphone = sss;

save(['measurement20181120-' num2str(i) '.mat'],'measurement');
i = i + 1;