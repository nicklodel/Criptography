%%Función que prepara una cadena de números en bloques, añadiendo en caso
%%de que falte para completar los bloques 30s y 0s
function v = prepare_num_cipher(d,double)

doubleL = length(double);
if floor(doubleL/d) ~= doubleL/d
    blocks = floor(doubleL/d) + 1;
    while (floor(length(double)/d) ~= length(double)/d) && (length(double) < d*blocks)
  
        if (blocks*d - length(double)) >= 2
            double  = strcat(double,'30');
        else
            double = strcat(double,'0');
        end
    end
end
doubleIndex = 1;
blocks = length(double)/d;
for i=1:blocks
    aux = extractBetween(double,doubleIndex, doubleIndex+(d-1));
    aux = str2double(aux);
    v(i) = aux;
    doubleIndex = doubleIndex + d;
end

end