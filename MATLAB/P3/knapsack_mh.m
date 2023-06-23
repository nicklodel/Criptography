%%Función que devuelve la clave pública y la privada de una mochila
function [publ_k,priv_k]=knapsack_mh(s)
if knapsack(s) ~= 1
error('La mochila no es supercreciente');
end
totalS = s(:); 
lastValue = s(length(s));
mu=0;
%%Buscamos un mu mayor que el doble del último elemento de la mochil
while mu < lastValue*2
texto = sprintf('Introduzca un valor mayor que %d: ',lastValue*2);
mu = input(texto);
end

w = mu;
[factor_c,~] = common_factors(w,s);
%%Buscamos un w que cumpla no tener factores comunes con los elementos de s
%%y que sea primo relativo con mu
while gcd(mu,w) ~= 1 || factor_c == 1 || (gcd(mu,w) ~= 1 && factor_c == 1)
w = w - 1 ;
[factor_c,~] = common_factors(w,s)
end
[~,inverseW,~] = gcd(w,mu);
inverseW = mod(inverseW,mu);
priv_k = [mu,inverseW];
%%Encontramos la inversa de W y la guardamos junto a mu
publ_k(:) = mod(s(:)*w,mu) 
%Creamos la mochila trampa
end