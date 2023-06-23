%%Función que descifra a texto unos bloques en función del tamaño que tiene
function text = num_decipher(n,blocks)

ndigitos = length(int2str(n));
total='';

for i=1:length(blocks) %%Formateo de la cadena de bloques
    aux = int2str(blocks(i));
    while length(aux) ~= (ndigitos - 1)
        aux = strcat('0',aux);
    end
    total = strcat(total,aux);
end


totalIndex = 1;
lettersnum = [];
for i=1:length(total)/2 %%Formatear por letras
    if extractBetween(total,totalIndex,totalIndex+1) ~= "30"
    lettersnum(i) = str2double(extractBetween(total,totalIndex,totalIndex+1));
    totalIndex = totalIndex +2;
    end
abc = 'abcdefghijklmnñopqrstuvwxyz';
text = '';

for i=1:length(lettersnum)
    aux = lettersnum(i);
    for j=1:length(abc)
       
        if aux +1== j
            text(i) = abc(j);
            break;
        end
    end
end

end