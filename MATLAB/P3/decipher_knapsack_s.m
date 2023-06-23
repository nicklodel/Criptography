%%Descifrar una función a partir de una mochila supercreciente
function text = decipher_knapsack_s(s,code)
if knapsack(s) ~= 1
error('No es una mochila válida');
end

sLength = length(s);
codeLength = length(code);
blockM = zeros(codeLength,sLength);
%%Matriz de bloques de descifrado
for i=1:codeLength
    for j=sLength:-1:1
        if s(j) <= code(i)
        code(i) = code(i) - s(j);
        blockM(i,j) = 1;
        end
    end
end

decode = '';
%%Pasamos a una sola cadena de caracteres binarios
for i=1:codeLength
    for j=1:sLength
    if blockM(i,j) == 1
    decode = strcat(decode,'1');
    else
    decode = strcat(decode,'0');
    end
    end
end

decodeLength = length(decode);
nLetras = floor(decodeLength/8);

v = [];
decodeIndex = 1;
%%desciframos cogiendo la cadena en bloques de 8 y pasando a decimal
for i=1:nLetras
letra = extractBetween(decode,decodeIndex,decodeIndex +7);
decodeIndex = decodeIndex +8;
v(i) = bin2dec(letra);
end
%%Pasamos a char los elementos de v
text = '';
text = char(v);
end