%%Función que halla la multiplicación modular que hace a una matriz A 2x2
%%la matriz identidad
function n = power_a(A,m)
[a,c] = size(A);
if det(A) == 0 || a ~= c || a ~= 2
error('Error de argumentos');
end
contador = 1;
Aiter = A;
while Aiter(1,1)/1 ~= 1 || Aiter(2,2)/1 ~= 1 || Aiter(1,2) ~= 0 || Aiter(2,1) ~= 0
Aiter = mod(Aiter * A,m);
contador = contador +1;
end
n = contador;
end