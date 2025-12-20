function X = SolveRightUpper_(U, B)
% SolveRightUpper_  Rezolva X*U = B folosind transpunerea:
% (X*U = B) <=> (U' * X' = B'), unde U' este inferior triunghiulara.

    X = (SolveLowerRec_(U.', B.', false)).';
end
