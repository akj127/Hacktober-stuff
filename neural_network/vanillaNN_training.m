function [nn_params, cost] = neural_network_train(X, y, layers, lambda, epsilon, max_iterations)
    nn_params = nn_params_init(layers, epsilon);
    nn_params_unrolled_initial = unroll(nn_params);
    options = optimset('MaxIter', max_iterations);
    gradient_step = @(p) nn_gradient_step(p, layers, X, y, lambda);
    [nn_params_unrolled, cost] = fmincg(gradient_step, nn_params_unrolled_initial, options);
    nn_params = nn_params_roll(nn_params_unrolled, layers);
end
