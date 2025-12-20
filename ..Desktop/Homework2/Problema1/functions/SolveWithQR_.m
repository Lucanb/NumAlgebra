function x = SolveWithQR_(Q, R, b)
% Rezolva A*x=b cand A=Q*R:
% R*x = Q'*b
    rhs = Q.' * b;
    x = SolveUpper(R, rhs);
end
