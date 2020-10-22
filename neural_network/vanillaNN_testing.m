function predictions = neural_network_predict(X, nn_params, layers)
    m = size(X, 1);
    num_labels = size(nn_params{end}, 1);
    h = nn_feedforward_propagation(X, nn_params, layers);
    [dummy, predictions] = max(h, [], 2);
end
