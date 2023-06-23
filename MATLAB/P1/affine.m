%Dada una clave k y otra d, ciframos un texto dado
function code=affine(k,d,text)
k=round(k);
if k>27 || k<1 || gcd(k,27) ~= 1
error('k No es un número perteneciente a Z27 o no cumple la identidad de bezout');
end
if d>27 || d<0
error('d no es un número perteneciente a Z27');
end
numeros = letter_number(text);
n=length(numeros);
for i=1:n
    numeros(i) = mod(mod(numeros(i)*k,27)+d,27);
end
code = number_letter(numeros);
end