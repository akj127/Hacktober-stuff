function [best_epsilon best_F1] = select_threshold(yval, probabilities)
    F1 = 0;
    best_F1 = 0;
    best_epsilon = 0;
    stepsize = (max(probabilities) - min(probabilities)) / 1000;
    for epsilon = min(probabilities):stepsize:max(probabilities)
        predictions = (probabilities < epsilon);
        tp = sum((predictions == 1) & (yval == 1));
        fp = sum((predictions == 1) & (yval == 0));
        fn = sum((predictions == 0) & (yval == 1));
        prec = tp / (tp + fp);
        rec = tp / (tp + fn);
        F1 = 2 * prec * rec / (prec + rec);
        if F1 > best_F1
            best_F1 = F1;
            best_epsilon = epsilon;
        end
    end
end
