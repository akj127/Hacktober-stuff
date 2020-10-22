function [mu sig] = estimate_gaussian(X)
    [m, n] = size(X);
    mu = mean(X);
    sig = (1 / m) * sum((X - mu) .^ 2);
end
