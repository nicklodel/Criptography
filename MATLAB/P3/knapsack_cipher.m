%%Función de cifrado a través de una mochila, supercreciente o no
function code=knapsack_cipher(s,text)

if knapsack(s) == -1
error('No es una mochila');
end

sLength = length(s);

v=double(text);

vLength = length(v);
binStr='';
%Añado un 0 a los elementos necesario para que cada letra tenga 8 binarios
for i=1:vLength
    aux = strcat('0',dec2bin(v(i)));
binStr = strcat(binStr,aux);
end
length(binStr)

%%Para completar los bloques
while floor(length(binStr)/sLength) ~= length(binStr)/sLength
    binStr(length(binStr)+1)='1';
end

binStrLength = length(binStr);
nBloques = binStrLength/sLength;
matrix = [nBloques,sLength];
binStrIndex = 1;
%%Creamos una matriz de nBloques x tamaño de s con 1 y 0 para crear los
%%bloques de cifrado
for i=1:nBloques
    for j=1:sLength
    if(binStr(binStrIndex) == '1')
    matrix(i,j) = 1;
    else
    matrix(i,j) = 0;
    end
    binStrIndex = binStrIndex +1;
    end
end
v = [];
%%Recorremos los bloques para generar los números relativos a cada elemento
%%del cifrado
for i=1:nBloques
    total=0;
    for j=1:sLength
        if matrix(i,j) == 1
        total = total + s(j);
        end
    end
    v(i)=total;
end
code=v;
end
