clear all
clc
close all
q=2;
f1=2500;
%% Record your voice for q seconds.
%{
recObj = audiorecorder;
disp('Start speaking.')
recordblocking(recObj, q);
disp('End of Recording.');

% Store data in double-precision array.
record = getaudiodata(recObj);
% Play back the recording.
sound(record);
% Time axis
qa=recObj.TotalSamples;
%}

load('experiment1.mat');
record=nonzeros(experiment1rec);    %Rremove zeros for statistical analysis
qa=size(experiment1rec,1);  
t=(0:q/qa:q-q/qa)';
sound(experiment1rec);
%% for the frrequency axis
Ts=q/qa; %sampling time
fs=1/Ts; %sampling frequency
[na,nb]=size(t(:)); % na=number of points of signal
ff=fs*[0:na-1]/na-fs/2;
N=length(ff);

% Plot the waveform.
figure
plot(t,experiment1rec);
title('Subject 0 Voice Signal in Time Domain')
xlabel('Time [s]')
ylabel('Amplitude [V]')

figure
plot(ff,fftshift(abs(fft(experiment1rec))/(N/2)),'r')
title('Centralized Subject 0 Voice Signal in Frequency Domain')
xlabel('Frequency [Hz]')
ylabel('Magnitude [V]')

%% Conduct a statistical analysis of the amplitude of your voice in the
%time domain, i.e., histogram, mean, variance, standard deviation, 
%skewness, kurtosis, dispersion (var/std), cdf, pdf. Show plots of cdf, 
%pdf and histogram, as well as data on a table.
figure
subplot(1,2,1);
histogram(experiment1rec)
title("Subject 0 Voice Signal")
xlabel('Amplitude Interval')
ylabel('Amplitude Repetitions')
subplot(1,2,2);
histogram(record)
title("Subject 0 Voice Signal Without Zeros")
xlabel('Amplitude Interval')
ylabel('Amplitude Repetitions')

figure
subplot(1,2,1);
cdfplot(experiment1rec)
title("CDF of Subject 0 Voice Signal")
subplot(1,2,2);
cdfplot(record)
title("CDF of Subject 0 Voice Signal Without Zeros")

figure
subplot(1,2,1);
histogram(experiment1rec, 'Normalization', 'pdf')
title("PDF of Subject 0 Voice Signal")
subplot(1,2,2);
histogram(record, 'Normalization', 'pdf')
title("PDF of Subject 0 Voice Signal Withput Zeros")

R_Mean=mean(record);
R_Variance=var(record);
R_Standard_Deviation=std(record);
R_Skewness=skewness(record);
R_Kurtosis=kurtosis(record);
R_Dispersion=R_Variance/R_Standard_Deviation;

table(R_Mean,R_Variance,R_Standard_Deviation,R_Skewness,R_Kurtosis,R_Dispersion)

figure
R_AutoCor=autocorr(experiment1rec,'NumLag',(size(experiment1rec,1)-1));
plot(R_AutoCor)
title("Autocorrelation of Subject 0 Voice Signal")
xlabel('Lags');
ylabel('Autocorrelation Value');

figure
plot(ff,fftshift((abs(fft(experiment1rec))/(N/2)).^2),'r')
title('Subject 0 Voice Signal')
xlabel('Frequency [Hz]')
ylabel('Magnitude Squared (Spectral Density) [V^{2}]')

figure
plot(ff,fftshift((abs(fft(R_AutoCor)))/(N^2/4)),'r')
title('Fourier Transform of Autocorrelation - Power Spectrum of Subject 0 Voice Signal')
xlabel('Frequency [Hz]')
ylabel('Power [W]')
%% Save audio file
%save('experiment1.mat','record','t','q','qa','f1')