function x = SolveWithLUtot_(P, Q, L, U, b)
% Rezolva A*x=b cand avem PAQ=LU:
%   PAQx = LUx' cu x' = Q^T x
%   L y = P b
%   U z = y
%   x = Q z

    rhs = P * b;
    y = SolveLower(L, rhs, true);
    z = SolveUpper(U, y);
    x = Q * z;
end
