function k = EstimeazaK_Hooke(F, x)
% EstimeazaK_Hooke  Estimeaza k in modelul F = k*x (LS fara termen liber):
% k = (sum(x_i*F_i)) / (sum(x_i^2))

    if nargin ~= 2
        error('EstimeazaK_Hooke:NumarArgumente', 'Se cer F si x.');
    end

    if ~isnumeric(F) || ~isvector(F)
        error('EstimeazaK_Hooke:TipInvalidF', 'F trebuie sa fie vector numeric.');
    end

    if ~isnumeric(x) || ~isvector(x)
        error('EstimeazaK_Hooke:TipInvalidX', 'x trebuie sa fie vector numeric.');
    end

    F = F(:);
    x = x(:);

    if length(F) ~= length(x)
        error('EstimeazaK_Hooke:Compatibilitate', 'F si x trebuie sa aiba aceeasi lungime.');
    end

    if any(~isfinite(F)) || any(~isfinite(x))
        error('EstimeazaK_Hooke:ValoriInvalid', 'F sau x contin NaN/Inf.');
    end

    if any(x == 0)
        error('EstimeazaK_Hooke:XZero', 'Exista valori x=0, formula devine problematica.');
    end

    num = sum(x .* F);
    den = sum(x .* x);

    if den == 0
        error('EstimeazaK_Hooke:DenZero', 'sum(x.^2)=0, nu se poate estima k.');
    end

    k = num / den;
end

