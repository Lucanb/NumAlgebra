base = fileparts(mfilename('fullpath'));
addpath(fullfile(base,'functions'));
rehash;

randn('seed',314);
x = linspace(0,1,30)';
y = 2*x.^3 - 3*x + 1 + 0.05*randn(size(x));

figure;
plot(x, y, 'o');
grid on;
title('Punctele (x_i, y_i)');
xlabel('x'); ylabel('y');

c3 = PolyLS(x, y, 3);
c4 = PolyLS(x, y, 4);

xx = linspace(0,1,400)';
y3 = EvalPoly(c3, xx);
y4 = EvalPoly(c4, xx);

figure;
plot(x, y, 'o'); hold on;
plot(xx, y3, '-');
grid on;
title('Aproximare LS cu polinom grad 3');
xlabel('x'); ylabel('y');
legend('date','p3');

figure;
plot(x, y, 'o'); hold on;
plot(xx, y4, '-');
grid on;
title('Aproximare LS cu polinom grad 4');
xlabel('x'); ylabel('y');
legend('date','p4');

y3_on_data = EvalPoly(c3, x);
y4_on_data = EvalPoly(c4, x);

err3 = sum((y - y3_on_data).^2);
err4 = sum((y - y4_on_data).^2);

disp('Abaterea totala (SSE) grad 3 =');
disp(err3);

disp('Abaterea totala (SSE) grad 4 =');
disp(err4);

disp('Comparatie: (SSE4 <= SSE3) ?');
disp(err4 <= err3);

c3_builtin = polyfit(x, y, 3);
c4_builtin = polyfit(x, y, 4);

c3_builtin = flipud(c3_builtin(:));
c4_builtin = flipud(c4_builtin(:));

disp('||c3 - c3_builtin||_2 =');
disp(sqrt(sum((c3 - c3_builtin).^2)));

disp('||c4 - c4_builtin||_2 =');
disp(sqrt(sum((c4 - c4_builtin).^2)));

