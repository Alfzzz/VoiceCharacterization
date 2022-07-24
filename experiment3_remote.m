clear all
clc
close all

q=2;
f1=2500;
%% Record your voice for q seconds.
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, q);
disp('End of Recording.');

% Play back the recording.
play(recObj);

% Store data in double-precision array.
danRecording = getaudiodata(recObj);    %change variable name to later store in .mat file
% Time axis
qa=recObj.TotalSamples;
t=(0:q/qa:q-q/qa)';

%% for the frrequency axis
Ts=q/qa; %sampling time
fs=1/Ts; %sampling frequency
[na,nb]=size(t(:)); % na=number of points of signal
ff=fs*[0:na-1]/na-fs/2;

% Plot the waveform.
plot(t,danRecording);
xlabel('time (secs)')
ylabel('amplitude (V)')
figure

cs=cos(2*pi*f1*t);
mods=cs.*danRecording;
plot(ff,fftshift(abs(fft(danRecording))),'r')
% hold on
% plot(ff,fftshift(abs(fft(mods))),'k')
% hold off
xlabel('frequency (Hz)')
ylabel('Magnitude (V)')

%% Conduct a statistical analysis of the amplitude of your voice in the
%time domain, i.e., histogram, mean, variance, standard deviation, 
%skewness, kurtosis, dispersion (var/std), cdf, pdf. Show plots of cdf, 
%pdf and histogram, as well as data on a table.
figure
histogram(danRecording)
title("Histogram of recording")
xlabel('n')
ylabel('Samples')
figure
cdfplot(danRecording)
title("cdf of recording")
figure
histogram(danRecording, 'Normalization', 'pdf')
title("pdf of recording")
R_Mean=mean(danRecording);
R_Variance=var(danRecording);
R_Standard_Deviation=std(danRecording);
R_Skewness=skewness(danRecording);
R_Kurtosis=kurtosis(danRecording);
R_Dispersion=R_Variance/R_Standard_Deviation;

table(R_Mean,R_Variance,R_Standard_Deviation,R_Skewness,R_Kurtosis,R_Dispersion)

figure
R_AutoCor=autocorr(danRecording,'NumLags',(size(danRecording,1)-1));
plot(R_AutoCor)
title("Autocorrelation of recording")

figure
plot(ff,fftshift((abs(fft(danRecording))).^2),'r')
xlabel('frequency (Hz)')
ylabel('Magnitude squared(spectral density) (V)')

figure
plot(fftshift((abs(fft(R_AutoCor)))),'r')
xlabel('frequency (Hz)')
ylabel('Autocorrrelation')
%%Save audio file
save('audioDan_remote.mat','danRecording','t','q','qa','f1')    %save variables