clear all
clc
A = floor(100*rand(5))
b = floor(100*rand(5,1))
tol = 10^(-18)
x = rafinareGEM(A, b, tol)
b - A*x
