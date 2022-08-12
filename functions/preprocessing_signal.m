%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Version 1.0 August 2022   |  Copyright (c) 2022   | All rights reserved       %
%                                                                               %
%                                                                               %
%   Farhad Abedinzadeh torghabeh | Master Student of Biomdeical Engineering     %
%                      farhaad.abedinzade@gmail.com                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [fs ,out ]=preprocessing_signal(sig,Fs)
fprintf('\n Preprocessing is Starting ... \n');
if nargin < 2
    Fs = input(' Please Enter Sampling Frequency(Hz):');
end
tic
%% butterworth bandstop filter
opt = input(' Do You Want use Default Options for Butterworth Filter? Yes = 1 | No = 2 > ');
fprintf('\n');
if opt == 1 || opt~=2
    fprintf('\n Default Options are Selected... \n');

    N   = 10;   % Order
    Fc1 = 0.5;  % First Cutoff Frequency
    Fc2 = 64;   % Second Cutoff Frequency

    % Construct an FDESIGN object and call its BUTTER method.
    h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
    filter1 = design(h, 'butter');
    butter_filtered=filter(filter1,sig);
else
    N = input('Please Enter Filter Order :');
    Fc1 = input('Please Enter FC1(First Cutoff Frequency) :');
    Fc2 = input('Please Enter FC2(Second Cutoff Frequency(MAXIMUM = FS/2) :');
    % Construct an FDESIGN object and call its BUTTER method.
    h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
    filter1 = design(h, 'butter');
    butter_filtered=filter(filter1,sig);
end
%% Notch Filter
notch = designfilt('bandstopiir','FilterOrder',2, ...
    'HalfPowerFrequency1',49,'HalfPowerFrequency2',51, ...
    'DesignMethod','butter','SampleRate',Fs);

notch_filtered=filter(notch,butter_filtered);

out=notch_filtered;
fs = Fs;
fprintf('\n Preprocessing is finished ... \n');
toc
fprintf('...................................................................\n');

end



