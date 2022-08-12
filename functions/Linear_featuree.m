%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Version 1.0 August 2022   |  Copyright (c) 2022   | All rights reserved       %
%                                                                               %
%                                                                               %
%   Farhad Abedinzadeh torghabeh | Master Student of Biomdeical Engineering     %
%                      farhaad.abedinzade@gmail.com                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% non-linear features
function [abpDelta,abpTheta,abpAlpha,abpBeta,abpGamma,TBR]=Linear_featuree(X)
fprintf('\n Linear Feature Extraction is Starting ... \n');
 tic
%% Delta Average Band Power
Delta=X.Delta;
% Band power
abpDelta = bandpower(Delta);

%% Theta Average Band Power
Theta=X.Theta;
% Band power
abpTheta = bandpower(Theta);
%% Alphaa Average Band Power
Alpha=X.Alpha;
% Band power
abpAlpha = bandpower(Alpha);

%% Beta Average Band Power
Beta=X.Beta;
% Band power
abpBeta = bandpower(Beta);

%% Gamma Average Band Power
Gamma=X.Gamma;
% Band power
abpGamma = bandpower(Gamma);

%% Theta To Beta Ratio(TBR)
% Ratio beta/alpha
TBR = abpTheta ./ abpBeta;

fprintf('\n Linear Feature Extraction is finished ... \n');
 toc
fprintf('...................................................................\n');

end

