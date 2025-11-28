function x_preds = recursive_predict(M, steps)
[m, n] = size(M);
n_pred = n-1;
x_preds = [];

for k = 1:steps
    A = M(:,1:n_pred);  
    b = M(:,end);
    
    if rank(A) < n_pred
        warning('Rang incomplet la pasul %d', k);
    end
    coef = pinv(A) * b;

    next_predictor = M(end,1:n_pred) + 1;  
    
    x_next = next_predictor * coef;  
    x_preds = [x_preds; x_next];

    new_row = [next_predictor x_next];  
    M = [M; new_row];
    
    fprintf('Pas %d: predictor = [%s], predic?ie salariu = %.4f\n', k, num2str(next_predictor), x_next);
end
end
