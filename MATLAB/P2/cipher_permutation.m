%función que comprueba si una permutación es válida para luego generar una
%matriz de permutación y cifrar un texto dado
function code=cipher_permutation(p,text)
if permutation(p) == 0
error('No es una permutacion');
end

A =matrix_per(p);

code = hill_cipher(A,text);
end
