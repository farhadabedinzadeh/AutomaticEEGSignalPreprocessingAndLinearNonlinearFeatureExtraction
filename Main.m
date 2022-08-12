
% In this Script A suitable Butterworth band-pass filter (0.5–60 Hz) was employed
% to eliminate out-of-band noise in this code. In addition, a 50 Hz notch filter 
% was utilized to eliminate the remaining line noise. To make it easier to track  
% future results, we normalized the entire database.                                       
% In the step of feature extraction, linear and nonlinear univariate features, 
% as well as nonlinear multivariate features, were extracted from EEG signals. 
% Individual recording channels and five frequency sub-bands (Delta,Theta, Alpha
% , Beta and Gamma) underwent spectral analysis of average power.
% On the basis of the Kaiser window, five Finite Impulse Response (FIR) filters 
% were created to split the original signals into five subbands.
% ------------------------------------------
% Linear Features :Delta Average Band Power , Theta Average Band Power ,
% Alpha Average Band Power , Beta Average Band Power , Gamma Average Band Power
% Theta To Beta Ratio(TBR) 
% ------------------------------------------
% Nonliner Features : Sample Entropy , Shannon Entropy , Dispersion Entropy
% , MultiScale Sample Entropy

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Version 1.0 August 2022   |  Copyright (c) 2022   | All rights reserved       %
%                                                                               %
%                                                                               %
%   Farhad Abedinzadeh torghabeh | Master Student of Biomdeical Engineering     %
%                      farhaad.abedinzade@gmail.com                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
close
clc
% addpath(genpath(pwd))
%% Set Path needed Functions
addpath("functions\")
%% ADHD data 
%  https://ieee-dataport.org/open-access/eeg-data-adhd-control-children#files

path='./DataForTest/*.mat' ;  
files=dir(path);

for i = 1:length(files)
    fn = [path(1:end-5) files(i,1).name];
    signal=struct2array(load(fn));
%% PreProcessing
% Fs = 128; % Sampling Frequency
[fs , preprocessed_signal ] =preprocessing_signal(signal);
%% Band Extraction and Normalize 
normalizedsig = mat2gray(preprocessed_signal);
out = band_extraction_kaiser(normalizedsig , fs); % is a structure include all Bands(Delta,Theta,Alpha,Beta and Gamma )
%% Feature Extraction

% Linear Univariate Features 
[abpDelta(i,:),abpTheta(i,:),abpAlpha(i,:),abpBeta(i,:),abpGamma(i,:),TBR(i,:)] = Linear_featuree(out);

% Non-Linear UniVariate Feature
% m=2;r=0.2;tau=3; for example

[SampleEntropy(i,:),ShannonEn(i,:),Dispx(i,:),MSEnt(i,:)]=NonLinearFeature(normalizedsig);

end