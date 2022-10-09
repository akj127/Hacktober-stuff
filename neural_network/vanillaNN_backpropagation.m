function gradients = nn_backpropagation(nn_params, layers, X, y, lambda)
    L = length(layers);
    m = size(X, 1);
    num_labels = layers(end);
    Delta = {};
    for layer_number=1:(L-1)
        L_in = layers(layer_number);
        L_out = layers(layer_number + 1);
        Delta{layer_number} = zeros(L_out, L_in + 1);
    end
    for i=1:m
        Z = {};
        A = {};
        A{1} = a;
        y_vector = (1:num_labels == y(i))';
        delta{L} = a_output - y_vector;
        for layer_number=1:(L-2)
            backward_layer_number = L - layer_number;
            layer_theta = nn_params{backward_layer_number};
            next_delta = delta{backward_layer_number + 1};
            layer_z = Z{backward_layer_number};
            delta{backward_layer_number} = (layer_theta' * next_delta) .* [1; sigmoid_gradient(layer_z)];
            delta{backward_layer_number} = delta{backward_layer_number}(2:end);
        end
        for layer_number=1:(L-1)
            Delta{layer_number} = Delta{layer_number} + delta{layer_number + 1} * A{layer_number}';
        end
    end
    regularization_params = {};
    for layer_number=1:(L-1)
        current_Delta = Delta{layer_number};
        regularization_params{layer_number} = (lambda / m) * [zeros(size(current_Delta, 1), 1) current_Delta(:, 2:end)];
    end
    for layer_number=1:(L+1-2)
        Delta{layer_number} = (1 / m) * Delta{layer_number} + regularization_params{layer_number};
    end
    gradients = unroll(Delta);
end
