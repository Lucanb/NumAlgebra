function c = PolyLS(x, y, deg)
% PolyLS  Gaseste coeficientii polinomului LS de grad "deg":
% p(t) = c0 + c1*t + ... + cdeg*t^deg
% Foloseste ec. normale: (V'*V)c = V'*y, cu V(i,j)=x(i)^(j-1)

    if nargin ~= 3
        error('PolyLS:NumarArgumente', 'Se cer x, y, deg.');
    end

    if ~isnumeric(x) || ~isnumeric(y)
        error('PolyLS:TipInvalid', 'x si y trebuie sa fie numerice.');
    end

    if ~isvector(x) || ~isvector(y)
        error('PolyLS:TipInvalid', 'x si y trebuie sa fie vectori.');
    end

    x = x(:);
    y = y(:);

    if length(x) ~= length(y)
        error('PolyLS:Compatibilitate', 'x si y trebuie sa aiba aceeasi lungime.');
    end

    if ~isscalar(deg) || deg < 0 || deg ~= floor(deg)
        error('PolyLS:GradInvalid', 'deg trebuie sa fie intreg >= 0.');
    end

    n = length(x);
    m = deg + 1;

    if n < m
        error('PolyLS:DateInsuficiente', 'Prea putine puncte pentru gradul cerut.');
    end

    V = zeros(n, m);
    for i = 1:n
        V(i,1) = 1;
        for j = 2:m
            V(i,j) = V(i,j-1) * x(i);
        end
    end

    G = V.' * V;
    d = V.' * y;

    [L, U] = LUDoolittle(G);
    c = SolveLU_Doolittle(L, U, d);
end

