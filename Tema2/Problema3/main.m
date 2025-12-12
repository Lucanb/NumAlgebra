base = fileparts(mfilename('fullpath'));
addpath(fullfile(base,'functions'));
rehash;

A = [1+1e-3, 2,      3;
     2,      4+1e-3, 6;
     3,      6,      9+1e-3];

x_exact = [1; 0; -1];
b = A*x_exact;

x_NE = LSNormalEq(A,b);
x_QR = LS_QR(A,b);
x_QR_ref = Refine_QR(A,b,1e-14);

err_NE = sqrt(sum((x_NE - x_exact).^2));
err_QR = sqrt(sum((x_QR - x_exact).^2));
err_QR_ref = sqrt(sum((x_QR_ref - x_exact).^2));

disp('x_exact ='); disp(x_exact);

disp('x (LS ec. normale) ='); disp(x_NE);
disp('abatere ||x_NE - x_exact||_2 ='); disp(err_NE);

disp('x (LS QR) ='); disp(x_QR);
disp('abatere ||x_QR - x_exact||_2 ='); disp(err_QR);

disp('x (LS QR + rafinare) ='); disp(x_QR_ref);
disp('abatere ||x_QR_ref - x_exact||_2 ='); disp(err_QR_ref);

disp('reziduu NE: ||A*x_NE - b||_2 =');
disp(sqrt(sum((A*x_NE - b).^2)));

disp('reziduu QR: ||A*x_QR - b||_2 =');
disp(sqrt(sum((A*x_QR - b).^2)));

