function x = salLU(A,b)
[L,U] = FactLU(A);
y = forward(L,b);
x= backward(U,y);
end