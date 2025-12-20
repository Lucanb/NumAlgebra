function sse = SSE_Hooke(F, x, k)
% SSE_Hooke  Calculeaza abaterea totala (SSE) pentru modelul F ~ k*x:
% sse = sum( (F - k*x).^2 )

    if nargin ~= 3
        error('SSE_Hooke:NumarArgumente', 'Se cer F, x, k.');
    end

    if ~isnumeric(k) || ~isscalar(k)
        error('SSE_Hooke:TipInvalidK', 'k trebuie sa fie scalar numeric.');
    end

    F = F(:);
    x = x(:);

    if length(F) ~= length(x)
        error('SSE_Hooke:Compatibilitate', 'F si x trebuie sa aiba aceeasi lungime.');
    end

    r = F - k*x;
    sse = sum(r .* r);
end

