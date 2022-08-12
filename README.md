# Automatic EEG Signal Preprocessing And Linear Nonlinear FeatureExtraction

In this Script A suitable Butterworth band-pass filter (0.5–60 Hz) was employed to eliminate out-of-band noise in this code. 
In addition, a 50 Hz notch filter  was utilized to eliminate the remaining line noise. To make it easier to track   future results, we normalized the entire
database.                                        
In the step of feature extraction, linear and nonlinear univariate features,  as well as nonlinear multivariate features, were extracted from EEG signals.
Individual recording channels and five frequency sub-bands (Delta,Theta, Alpha , Beta and Gamma) underwent spectral analysis of average power.
On the basis of the Kaiser window, five Finite Impulse Response (FIR) filters  were created to split the original signals into five subbands.

# Linear Features:
Delta Average Band Power , Theta Average Band Power , Alpha Average Band Power , Beta Average Band Power , Gamma Average Band Power Theta To Beta Ratio(TBR)  
 
# Nonliner Features:
Sample Entropy , Shannon Entropy , Dispersion Entropy , MultiScale Sample Entropy

## Environment Variables

To run this Code, you will need to add the `functions` folder to your MATLAB path


And then run the following script
`Main.m`

Note : `WorkSpace.mat` is result of run.

## License
 Version 1.0 August 2022   |  Copyright (c) 2022   | All rights reserved       
                                                                               
                                                                               
  Farhad Abedinzadeh torghabeh | Master Student of Biomdeical Engineering     
                      farhaad.abedinzade@gmail.com                             
## Cite as
Farhad Abedinzade (2022). Auto EEG Signal Preprocessing and Feature Extraction (https://github.com/farhadabedinzadeh/AutomaticEEGSignalPreprocessingAndLinearNonlinearFeatureExtraction/releases/tag/1.0.0), GitHub. Retrieved August 12, 2022.

[![View Auto EEG Signal Preprocessing and Feature Extraction on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/116205-auto-eeg-signal-preprocessing-and-feature-extraction)
