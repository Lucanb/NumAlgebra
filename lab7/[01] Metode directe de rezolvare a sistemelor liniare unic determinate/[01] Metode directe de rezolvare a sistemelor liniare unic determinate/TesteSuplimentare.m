clear all
clc
A = floor(100*rand(10))
b = floor(100*rand(10, 1))
[L U P] = FactorizareLUPivotarePartiala(A)
L*U - P*A

