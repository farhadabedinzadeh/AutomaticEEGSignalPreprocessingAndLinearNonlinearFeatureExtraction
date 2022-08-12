function SampEn = SampEn(data,m,r)
% This function computes sample entropy of a time series.
% data represents the time series.
% m is the embedding dimension.
% r is the tolerance value.
% SampEnVal is the sample entropy of the time series.

N = length(data);
r = r*std(data);
n_x1 = zeros(N-m,1);
n_x2 = zeros(N-m,1);

for k = 1:1:N-m
    x1(k,:) = data(k:k+m-1);
    x2(k,:) = data(k:k+m);
end

for k = 1:1:N-m
    d_x1 = zeros(1,N-m);
    x1temprow = x1(k,:);
    x1temp = ones(N-m,1)*x1temprow;
    d_x1 = max(abs(x1temp-x1),[],2)';
    n_x1(k) = (sum(d_x1 <= r)-1)/(N-m-1);
    d_x2 = zeros(1,N-m);
    x2temprow = x2(k,:);
    x2temp = ones(N-m,1)*x2temprow;
    d_x2 = max(abs(x2temp-x2),[],2)';
    n_x2(k) = (sum(d_x2 <= r)-1)/(N-m-1);
end

Am = sum(n_x1)/(N-m);
Bm = sum(n_x2)/(N-m);
SampEn = log(Am/Bm);