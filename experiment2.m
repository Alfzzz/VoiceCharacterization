clc
clear all
close all

load('audioJP80.mat')
R2_average=mean(myRecording,2); 
R2_average_withoutzeros=nonzeros(R2_average);   %remove zeros for statistical analysis
        
q=2;
%% for the frequency axis
Ts=q/qa; %sampling time
fs=1/Ts; %sampling frequency
[na,nb]=size(t(:)); % na=number of points of signal
ff=fs*[0:na-1]/na-fs/2;
N=length(ff);
%%Show plots of time and frequency domain of such average signal
figure
plot(t,R2_average);
title("Averaged audio signal")
xlabel('Time [s]')
ylabel('Amplitude [V]')
figure
plot(ff,fftshift(abs(fft(R2_average))/(N/2)),'r')
title('Looped averaged signal');
xlabel('Frequency [Hz]')
ylabel('Amplitude [V]')
%%Conduct the same statistical analysis that you did for your first 
%voice signal, but of your average signal
figure
subplot(1,2,1)
histogram(R2_average)
title("Histogram of averaged signal")
xlabel('Amplitude Interval')
ylabel('Amplitude Repetitions')
subplot(1,2,2)
histogram(R2_average_withoutzeros)
title("Histogram of averaged signal without zeros")
xlabel('Amplitude Interval')
ylabel('Amplitude Repetitions')
figure
subplot(1,2,1)
cdfplot(R2_average)
title("cdf of averaged signal")
subplot(1,2,2)
cdfplot(R2_average_withoutzeros)
title("cdf ofaveraged signal without zeros")
figure
subplot(1,2,1)
histogram(R2_average, 'Normalization', 'pdf')
title("pdf of averaged signal")
subplot(1,2,2)
histogram(R2_average_withoutzeros, 'Normalization', 'pdf')
title("pdf of averaged signal without zeros")

R2_Mean=mean(R2_average);
R2_Variance=var(R2_average);
R2_Standard_Deviation=std(R2_average);
R2_Skewness=skewness(R2_average);
R2_Kurtosis=kurtosis(R2_average);
R2_Dispersion=R2_Variance/R2_Standard_Deviation;
table(R2_Mean,R2_Variance,R2_Standard_Deviation,R2_Skewness,R2_Kurtosis,R2_Dispersion)

R2_Mean_withoutzeros=mean(R2_average_withoutzeros);
R2_Variance_withoutzeros=var(R2_average_withoutzeros);
R2_Standard_Deviation_withoutzeros=std(R2_average_withoutzeros);
R2_Skewness_withoutzeros=skewness(R2_average_withoutzeros);
R2_Kurtosis_withoutzeros=kurtosis(R2_average_withoutzeros);
R2_Dispersion_withoutzeros=R2_Variance_withoutzeros/R2_Standard_Deviation_withoutzeros;
table(R2_Mean_withoutzeros,R2_Variance_withoutzeros,R2_Standard_Deviation_withoutzeros,R2_Skewness_withoutzeros,R2_Kurtosis_withoutzeros,R2_Dispersion_withoutzeros)

%Autocorrelation
figure
R_AutoCor=autocorr(R2_average,'NumLags',(size(R2_average,1)-1));
plot(R_AutoCor)
title("Autocorrelation of averaged signal")
xlabel("Lags")
ylabel("Autocorrelation")

%Magnitude squared(spectral density)
figure
plot(ff,fftshift((abs(fft(R2_average))/(N/2)).^2),'r')
xlabel('frequency [Hz]')
ylabel('Magnitude squared(spectral density) [V^{2}])')

%Fourier transform of autocorrelation
figure
plot(ff,fftshift((abs(fft(R_AutoCor)))/(N*N/(2*2))),'r')
title("Fourier transform of Autocorrelation of averaged signal - Power Spectrum")
xlabel("frequency [Hz]")
ylabel("Power [W]")



