%Función que con una permutación válida y un texto dado descifra dicho
%texto
function text=decipher_permutation(p,text)
if permutation(p) == 0
error('No es una permutacion');
end

A =matrix_per(p);
AInverse = inv_module(A,27);
text = hill_cipher(AInverse,text);
end