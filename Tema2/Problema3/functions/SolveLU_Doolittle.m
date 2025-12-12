function x = SolveLU_Doolittle(L, U, b)
% SolveLU_Doolittle  Rezolva A*x=b cand A=L*U (Doolittle).

    if nargin ~= 3
        error('SolveLU_Doolittle:NumarArgumente', 'Se cer L, U, b.');
    end

    if ~isvector(b)
        error('SolveLU_Doolittle:TipInvalid', 'b trebuie sa fie vector.');
    end

    b = b(:);
    n = size(L,1);

    if size(L,2) ~= n || size(U,1) ~= n || size(U,2) ~= n
        error('SolveLU_Doolittle:Dimensiuni', 'L si U trebuie sa fie patratice compatibile.');
    end

    if length(b) ~= n
        error('SolveLU_Doolittle:Compatibilitate', 'length(b) trebuie sa fie n.');
    end

    y = zeros(n,1);
    for i = 1:n
        s = 0;
        for j = 1:i-1
            s = s + L(i,j) * y(j);
        end
        y(i) = b(i) - s;
    end

    x = zeros(n,1);
    for i = n:-1:1
        s = 0;
        for j = i+1:n
            s = s + U(i,j) * x(j);
        end

        if U(i,i) == 0
            error('SolveLU_Doolittle:PivotZeroU', 'U(%d,%d)=0.', i, i);
        end

        x(i) = (y(i) - s) / U(i,i);
    end
end

