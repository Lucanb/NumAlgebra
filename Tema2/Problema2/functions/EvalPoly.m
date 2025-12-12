function yhat = EvalPoly(c, x)
% EvalPoly  Evalueaza p(x) = c0 + c1*x + ... folosind schema Horner.

    if nargin ~= 2
        error('EvalPoly:NumarArgumente', 'Se cer c si x.');
    end

    if ~isnumeric(c) || ~isnumeric(x)
        error('EvalPoly:TipInvalid', 'c si x trebuie sa fie numerice.');
    end

    c = c(:);
    x = x(:);

    deg = length(c) - 1;
    yhat = zeros(size(x));

    for i = 1:length(x)
        val = c(deg+1);
        for k = deg:-1:1
            val = val * x(i) + c(k);
        end
        yhat(i) = val;
    end
end

