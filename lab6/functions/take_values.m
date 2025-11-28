function [A_mat, b_vec] = take_values(M)
[m,n] = size(M);
A_mat = M(:,1:n-1);
b_vec = M(:,n);
end
