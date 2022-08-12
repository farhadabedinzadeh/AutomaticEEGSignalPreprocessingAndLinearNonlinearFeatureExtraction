# AutomaticEEGSignalPreprocessingAndLinearNonlinearFeatureExtraction

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
