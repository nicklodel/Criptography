%Función que comprueba si un valor w tiene factores comunes con una mochila
%s
function [factor_c, fact] = common_factors(w,s)
f= factor(w); %%Para sacar los factores de w
sLength = length(s);
factor_c = 0;
fact = [];
factIndex = 1;
factorFound = 0;
%%Buscamos entre todos los elementos de s...
for i=1:sLength
    fs= factor(s(i));
    %%...los factores ...
    for j=1:length(fs)
        %%...que coincidan con los de w
        for k=1:length(f)
            if fs(j) == f(k)
            fact(factIndex) = s(i);
            factIndex = factIndex +1;
            factor_c = 1;
            factorFound = 1;
            break; %%Dejamos de buscar en el bucle si encontramos 1
            end
        end
        if factorFound == 1
        factorFound = 0; %%Salimos del bucle de factores de s(i) cuando encontramos el factor común para ganar en valor computacional 
        % (solo guardamos los elementos de s 1 vez aunque compartan varios factores)
        break;
        end   
    end
    end
end