function [ e, A, B ] = multiscaleSampleEntropy( x, m, r, tau )
%MULTISCALESAMPLEENTROPY
%
% Based on "Multiscale entropy analysis of biological signals"
% By Madalena Costa, Ary L. Goldberger, and C.-K. Peng
% Published on 18 February 2005 in Phys. Rev. E 71, 021906.
%
% This code was implemented by John Malik on 26 April 2017.
% Contact: john.malik@duke.edu
switch nargin
    case 1
        m = 2;
        r = 0.15;
        tau = 1;
    case 2
        r = 0.15;
        tau = 1;
    case 3
        tau = 1;
end
% coarse signal
y = mean(buffer(x(:), tau), 1);
% (m+1)-element sequences
X = buffer(y, m + 1, m, 'nodelay')';
% matching (m+1)-element sequences
A = sum(pdist(X, 'chebychev') < r * nanstd(x, 1));
% matching m-element sequences
X = X(:, 1:m);
B = sum(pdist(X, 'chebychev') < r * nanstd(x, 1));
% take log
if A == 0 || B == 0
    e = NaN;
    return
end
e = log(B / A);
end
