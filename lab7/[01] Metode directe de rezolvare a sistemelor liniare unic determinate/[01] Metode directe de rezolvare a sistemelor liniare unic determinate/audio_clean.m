[b,fs] = audioread('sunet_bruiat.ogg'); %incarcam sunetul cu zgomot

%Verificam sunetul si afisam semnalul descris de acesta
sound(b, fs);
plot(b);
hold on

% Afisam lungimea pentru a intelege magnitudinea datelor
n = length(b)

% Construim matricele In si L folosind matrici rare (sparse) deoarece au dimensiuni
% foarte mari, dar majoritatea elementelor sunt nule
idn = speye(n);
e = ones(n-1,1);
L = spdiags([-e e], [0 1], n-1, n);

% Definim lambda (putem incepe de la o valoare mica si sa tot crestem)
lambda = 5;

% Folosim metoda celor mai mici patrate cu regularizare patratica (vezi curs) si ajungem la format
% x = inv(In + lambda*L'*L) *b, dar nu folosim aceasta forma, deoarece matricea este prea mare.
% Fie folosim operatorul \ care implementeaza deja cea mai eficienta metoda de rezolvare a unui
% sistem liniar, luand in calcul si cazul matricelor rare:

x = (speye(n) + lambda*(L'*L)) \ b;

% Ascultam semnalul filtrat:
sound(x, fs);
plot(x);
hold on

% Fie LU pe blocuri rezolvat in laboratoarele anterioare, dar se pierde putin din acuratete:
A = speye(n) + lambda*(L'*L);
db = floor(n/500) % numarul de blocuri (se poate modifica)
x = [];
for k = 1:499
[L,U]= FactorizareLU(A(1+(k-1)*db:k*db,1+(k-1)*db:k*db));
y = lowerSolve(L,b(1+(k-1)*db:k*db));
x1 = upperSolve(U,y);
x = [x x1'];
end

% Ascultam semnalul filtrat:
sound(x, fs);

plot(x);
legend('Original', 'Filtrat \', 'Filtrat LU blocuri');
xlabel('Sample');
ylabel('Amplitudine');

