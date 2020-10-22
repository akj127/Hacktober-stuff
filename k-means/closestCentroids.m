function closest_centroids_ids = find_closest_centroids(X, centroids)
    m = size(X, 1);
    K = size(centroids, 1);
    closest_centroids_ids = zeros(m, 1);
    for i = 1:m
        distances = zeros(K, 1);
        for j = 1:K
            distances(j) = sum((X(i, :) - centroids(j, :)) .^ 2);
        end
        [min_distance, centroid_id] = min(distances);
        closest_centroids_ids(i) = centroid_id;
    end
end
% - Running the training process
function [centroids, closest_centroids_ids] = k_means_train(X, K, max_iterations)
    [m n] = size(X);
    centroids = init_centroids(X, K);
    for i=1:max_iterations
        closest_centroids_ids = find_closest_centroids(X, centroids);
        centroids = compute_centroids(X, closest_centroids_ids, K);
    end
end
