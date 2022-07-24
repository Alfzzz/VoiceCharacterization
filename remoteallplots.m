%%This script takes all remote recorded samples voices, it plots all the
%same type of plot in the same figure, uncomment necessary section for
%specific information figure and add "figure" command if necessary

clear all
clc
close all
q=2;
f1=2500;
%%
load('audioremoto_JP.mat');
r1=myRecordingjp;
load('audioAlfred_remote.mat');
r2=alfRecording;
load('audioAndres_remote.mat');
r3=andresRecording;

r1nz=nonzeros(myRecordingjp);
r2nz=nonzeros(alfRecording);
r3nz=nonzeros(andresRecording);

qa=size(r1,1);  
t=(0:q/qa:q-q/qa)';

%% for the frrequency axis
Ts=q/qa; %sampling time
fs=1/Ts; %sampling frequency
[na,nb]=size(t(:)); % na=number of points of signal
ff=fs*[0:na-1]/na-fs/2;
N=length(ff);
%% Time.
%{
sgtitle('Remote Recording');
subplot(2,3,1);
plot(t,r1);
title('Subject 0 Voice Signal in Time Domain');
xlabel('Time [s]');
ylabel('Amplitude [V]');

subplot(2,3,2);
plot(t,r2);
title('Subject 1 Voice Signal in Time Domain');
xlabel('Time [s]');
ylabel('Amplitude [V]');

subplot(2,3,3);
plot(t,r3);
title('Subject 2 Voice Signal in Time Domain');
xlabel('Time [s]');
ylabel('Amplitude [V]');


%% Frequency 

subplot(2,3,4)
plot(ff,fftshift(abs(fft(r1))/(N/2)),'r')
title('Centralized Subject 0 Voice Signal in F. Dom.')
xlabel('Frequency [Hz]')
ylabel('Magnitude [V]')
subplot(2,3,5)
plot(ff,fftshift(abs(fft(r2))/(N/2)),'r')
title('Centralized Subject 1 Voice Signal in F. Dom.')
xlabel('Frequency [Hz]')
ylabel('Magnitude [V]')
subplot(2,3,6)
plot(ff,fftshift(abs(fft(r3))/(N/2)),'r')
title('Centralized Subject 2 Voice Signal in F. Dom.')
xlabel('Frequency [Hz]')
ylabel('Magnitude [V]')
%}

%% Statistical analysis of the amplitude of your voice in the time domain
    %histogram, mean, variance, standard deviation, skewness, kurtosis, dispersion (var/std), cdf, pdf. Show plots
    %data on a table
%{
sgtitle('Remote Amplitude Histograms Time Domain Analysis')
subplot(1,3,1);
histogram(r1);
title("Subject 0 Voice Signal")
xlabel('Amplitude Interval')
ylabel('Amplitude Repetitions')

subplot(1,3,2);
histogram(r2);
title("Subject 1 Voice Signal")
xlabel('Amplitude Interval')
ylabel('Amplitude Repetitions')

subplot(1,3,3);
histogram(r3);
title("Subject 2 Voice Signal")
xlabel('Amplitude Interval')
ylabel('Amplitude Repetitions')
%}
    %%histograms without zeros
%{
    sgtitle('Remote Amplitude Histograms Time Domain Analysis Without Zeros')
subplot(1,3,1);
histogram(r1nz);
title("Subject 0 Voice Signal")
xlabel('Amplitude Interval')
ylabel('Amplitude Repetitions')

subplot(1,3,2);
histogram(r2nz);
title("Subject 1 Voice Signal")
xlabel('Amplitude Interval')
ylabel('Amplitude Repetitions')

subplot(1,3,3);
histogram(r3nz);
title("Subject 2 Voice Signal")
xlabel('Amplitude Interval')
ylabel('Amplitude Repetitions')
    %}
%% CDF    
  %{
sgtitle('Remote Cumulative Distribution Function - CDF')
subplot(1,3,1);
cdfplot(r1)
title("Subject 0 Voice Signal")
subplot(1,3,2);
cdfplot(r2)
title("Subject 1 Voice Signal")
subplot(1,3,3);
cdfplot(r3)
title("Subject 2 Voice Signal")
%}
%{
sgtitle('Remote Cumulative Distribution Function - CDF Without Zeros')
subplot(1,3,1);
cdfplot(r1nz)
title("Subject 0 Voice Signal")
subplot(1,3,2);
cdfplot(r2nz)
title("Subject 1 Voice Signal")
subplot(1,3,3);
cdfplot(r3nz)
title("Subject 2 Voice Signal")
%}
%% PDF
    %{
sgtitle('Remote Probability Density Function - PDF')
subplot(1,3,1);
histogram(r1, 'Normalization', 'pdf')
title("Subject 0 Voice Signal")
subplot(1,3,2);
histogram(r2, 'Normalization', 'pdf')
title("Subject 1 Voice Signal")
subplot(1,3,3);
histogram(r3, 'Normalization', 'pdf')
title("Subject 2 Voice Signal")
%}
%{
sgtitle('Remote Probability Density Function - PDF Without Zeros')
subplot(1,3,1);
histogram(r1nz, 'Normalization', 'pdf')
title("Subject 0 Voice Signal")
subplot(1,3,2);
histogram(r2nz, 'Normalization', 'pdf')
title("Subject 1 Voice Signal")
subplot(1,3,3);
histogram(r3nz, 'Normalization', 'pdf')
title("Subject 2 Voice Signal")
%}
 %{
R1_Mean=mean(r1);
R1_Variance=var(r1);
R1_Standard_Deviation=std(r1);
R1_Skewness=skewness(r1);
R1_Kurtosis=kurtosis(r1);
R1_Dispersion=R1_Variance/R1_Standard_Deviation;
table(R1_Mean,R1_Variance,R1_Standard_Deviation,R1_Skewness,R1_Kurtosis,R1_Dispersion)

R2_Mean=mean(r2);
R2_Variance=var(r2);
R2_Standard_Deviation=std(r2);
R2_Skewness=skewness(r2);
R2_Kurtosis=kurtosis(r2);
R2_Dispersion=R2_Variance/R2_Standard_Deviation;
table(R2_Mean,R2_Variance,R2_Standard_Deviation,R2_Skewness,R2_Kurtosis,R2_Dispersion)

R3_Mean=mean(r3);
R3_Variance=var(r3);
R3_Standard_Deviation=std(r3);
R3_Skewness=skewness(r3);
R3_Kurtosis=kurtosis(r3);
R3_Dispersion=R3_Variance/R3_Standard_Deviation;
table(R3_Mean,R3_Variance,R3_Standard_Deviation,R3_Skewness,R3_Kurtosis,R3_Dispersion)

R1_Meannz=mean(r1nz);
R1_Variancenz=var(r1nz);
R1_Standard_Deviationnz=std(r1nz);
R1_Skewnessnz=skewness(r1nz);
R1_Kurtosisnz=kurtosis(r1nz);
R1_Dispersionnz=R1_Variancenz/R1_Standard_Deviationnz;
table(R1_Meannz,R1_Variancenz,R1_Standard_Deviationnz,R1_Skewnessnz,R1_Kurtosisnz,R1_Dispersionnz)

R2_Meannz=mean(r2nz);
R2_Variancenz=var(r2nz);
R2_Standard_Deviationnz=std(r2nz);
R2_Skewnessnz=skewness(r2nz);
R2_Kurtosisnz=kurtosis(r2nz);
R2_Dispersionnz=R2_Variancenz/R2_Standard_Deviationnz;
table(R2_Meannz,R2_Variancenz,R2_Standard_Deviationnz,R2_Skewnessnz,R2_Kurtosisnz,R2_Dispersionnz)

R3_Meannz=mean(r3nz);
R3_Variancenz=var(r3nz);
R3_Standard_Deviationnz=std(r3nz);
R3_Skewnessnz=skewness(r3nz);
R3_Kurtosisnz=kurtosis(r3nz);
R3_Dispersionnz=R3_Variancenz/R3_Standard_Deviationnz;
table(R3_Meannz,R3_Variancenz,R3_Standard_Deviationnz,R3_Skewnessnz,R3_Kurtosisnz,R3_Dispersionnz)
%}
  %{
sgtitle('Remote Autocorrelation')
subplot(1,3,1);
R1_AutoCor=autocorr(r1,'NumLag',(size(r1,1)-1));
plot(R1_AutoCor)
title("Subject 0 Voice Signal")
xlabel('Lags');
ylabel('Autocorrelation Value');

subplot(1,3,2);
R2_AutoCor=autocorr(r2,'NumLag',(size(r2,1)-1));
plot(R2_AutoCor)
title("Subject 2 Voice Signal")
xlabel('Lags');
ylabel('Autocorrelation Value');

subplot(1,3,3);
R3_AutoCor=autocorr(r3,'NumLag',(size(r3,1)-1));
plot(R3_AutoCor)
title("Subject 1 Voice Signal")
xlabel('Lags');
ylabel('Autocorrelation Value');
%}
    %{
sgtitle('Remote Magnitude Squared - Spectral Density')
subplot(1,3,1);
plot(ff,fftshift((abs(fft(r1))/(N/2)).^2),'r')
title('Subject 0 Voice Signal')
xlabel('Frequency [Hz]')
ylabel('Spectral Density [V^{2}]')

subplot(1,3,2);
plot(ff,fftshift((abs(fft(r2))/(N/2)).^2),'r')
title('Subject 1 Voice Signal')
xlabel('Frequency [Hz]')
ylabel('Spectral Density [V^{2}]')

subplot(1,3,3);
plot(ff,fftshift((abs(fft(r3))/(N/2)).^2),'r')
title('Subject 2 Voice Signal')
xlabel('Frequency [Hz]')
ylabel('Spectral Density [V^{2}]')
%}

  R1_AutoCor=autocorr(r1,'NumLag',(size(r1,1)-1));
  R2_AutoCor=autocorr(r2,'NumLag',(size(r2,1)-1));
  R3_AutoCor=autocorr(r3,'NumLag',(size(r3,1)-1));
sgtitle('Remote Fourier Transform of Autocorrelation - Power Spectrum')
subplot(1,3,1);
plot(ff,fftshift((abs(fft(R1_AutoCor)))/(N^2/4)),'r')
title('Subject 0 Voice Signal')
xlabel('Frequency [Hz]')
ylabel('Power [dB]')

subplot(1,3,2);
plot(ff,fftshift((abs(fft(R2_AutoCor)))/(N^2/4)),'r')
title('Subject 1 Voice Signal')
xlabel('Frequency [Hz]')
ylabel('Power [dB]')

subplot(1,3,3);
plot(ff,fftshift((abs(fft(R3_AutoCor)))/(N^2/4)),'r')
title('Subject 2 Voice Signal')
xlabel('Frequency [Hz]')
ylabel('Power [dB]')

