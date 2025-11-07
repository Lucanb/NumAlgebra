function prod_norme = norm_mat_inverse(A)
if isTransposed(A)
    disp('Matricea este simetrica (egala cu transpusa).')
else
    disp('Matricea nu este simetrica.')
end

valp = eig(A);
rho1 = max(abs(valp));
rho2 = sqrt(max(eig(A*A')));
detA = det(A);
normA = norm(A);

if abs(detA) < 1e-12
    disp('Matricea nu este inversabila.')
    prod_norme = NaN;
else
    normAinv = norm(inv(A));
    prod_norme = normA * normAinv;
end

fprintf('Raza spectrala (eig): %.4f\n', rho1)
fprintf('Raza spectrala (AA''): %.4f\n', rho2)
fprintf('Det(A): %.4f\n', detA)
fprintf('||A|| * ||A^-1||: %.4f\n\n', prod_norme)
end
