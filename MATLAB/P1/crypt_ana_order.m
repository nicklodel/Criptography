%Función que devuelve la frecuencia de un texto dado ordenadad de mayor a
%menor y ordenada de la a a la z
function [freq,freq_order]=crypt_ana_order(v)
format shortg;
freq = zeros(27, 2);
freq(:,2) = 0:26;
letras=letter_number(v);
n=length(letras);
m=27;
for i=1:n
    for j=1:m
if letras(i) == freq(j,2)
    freq(j,1) = freq(j,1)+1;
end
    end
end
for j=1:m
    freq(j,1) = freq(j,1)/n;
end
freq_order = sortrows(freq,1,"descend");
end


    
