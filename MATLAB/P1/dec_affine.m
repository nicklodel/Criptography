%Dada una clave k y otra d, desciframos un texto dado.
function text=dec_affine(k,d,text)

if k>27 || k<1 || gcd(k,27) ~= 1
error('k No es un número perteneciente a Z27 o no cumple la identidad de bezout');
end
if d>27 || d<0
error('d no es un número perteneciente a Z27');
end
v=letter_number(text);
n=length(v);
for i=1:n
    [a,inversek,b]=gcd(k,27);
    v(i) = mod(mod(inversek,27)*mod(v(i)+mod(-d,27),27),27);
end
text=number_letter(v);
end

