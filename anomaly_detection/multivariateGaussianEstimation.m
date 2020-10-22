function probabilities = multivariate_gaussian(X, mu, sig)
    [m n] = size(X);
    probabilities = ones(m, 1);
    for i=1:m
        for j=1:n
            p = (1 / sqrt(2 * pi * sig(j))) * exp(-(X(i, j) - mu(j)) .^ 2 / (2 * sig(j)));
            probabilities(i) = probabilities(i) * p;
        end
    end
end
