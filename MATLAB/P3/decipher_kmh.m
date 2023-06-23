%%Función que descifra un código dado mediante los valores de clave privada
%%necesarios
%%
function text = decipher_kmh(s,code,mu,invw)
if knapsack(s) ~= 1
    error('No es una mochila');
end

code(:) = mod(code(:) * invw,mu);

text = decipher_knapsack_s(s,code);
end
