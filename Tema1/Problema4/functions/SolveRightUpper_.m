function X = SolveRightUpper_(U, B)
% SolveRightUpper_  Rezolva X*U = B pentru X, unde U este superior triunghiulara.
% Folosim transpunerea: (X*U = B) <=> (U' * X' = B')
% U' este inferior triunghiulara (nu unit), deci rezolvam cu SolveLower_(U', B', false).

    X = (SolveLower_(U.', B.', false)).';
end
