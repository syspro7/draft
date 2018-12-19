% Apply a filter to the input signal, then take the autocorrelation of it.
no = 5;
alpha = zeros(1,no);
mm = zeros(no,length(t));
filtmm = zeros(no,length(t));
newmm = zeros(no,length(t));
FntSize = 12;
figure;
for i = 1:no                                                % From 5[m], 4[m], 3[m], 2[m], 1[m]
    load(['measurement20181126-' num2str(3*i) '.mat']);     % 3*i-1(squarewave), 3*i(440Hz), 3*i+1(1500Hz)
    M(i) = measurement;
    mm(i,:) = M(i).microphone;
    ms = M(i).speaker;
    %filtmm(i,:) = filtering(mm(i,:),1450,1550);
    filtmm(i,:) = filtering(mm(i,:),350,500);
    [Rmm, lags] = correlation(filtmm(i,:));
    subplot(no,1,i); grid on; hold on;
    title(['(' num2str(6-i) 'm)'],'FontSize',FntSize);
    xlabel('lag [s]','FontSize',FntSize);
    ylabel('AutoCorrelation','FontSize',FntSize);
    plot(lags/Fs,Rmm);
    xlim([0 0.5]);
    % unfinished
%     [~,dl] = findpeaks(Rmm,lags,'MinPeakHeight',0.15,'MinPeakDistance',180);
%     if(size(dl,2)>=2)
%         plot([t(dl(2)) t(dl(2))],[-1 1]);
%         alpha(i) = Rmm(dl(2));
%         newmm(i,:) = filter(1,[1 zeros(1,dl(2)-1) alpha],mm(i,:));
%     end
end