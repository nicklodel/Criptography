
%Función que a partir de una muestra de texto llano y texto cifrado obtiene
%la matriz usada para cifrar
function matrix=crypto_hill(text,code,d)
format shortg;

%Variables y comprobaciones necesarias para el correcto funcionamiento
numberText = letter_number(text);
numberCode = letter_number(code);

tamText=length(numberText);
tamCode=length(numberCode);

if tamCode < d*d || tamText < d*d
error('Se necesita más muestra');
end

%Nos quedamos con el tamaño de muestra más pequeño
if tamText > tamCode
tamText = tamCode;
end

if tamText < tamCode
tamCode = tamText;
end
%Con el floor siempre usamos un entero menor o igual al resultado de los
%bloques
nBloquesText = floor(tamText/d);
nBloquesCode = floor(tamCode/d);

textIndex=1;
codeIndex=1;

textM = zeros(nBloquesText,d*2); %Iban a ser dos matrices pero no me ha dado lo que buscaba hasta que he unificado las dos
%Relleno la primera parte de la matriz
for i=1:nBloquesText
    for j=1:d
    textM(i,j) = numberText(textIndex);
    textIndex = textIndex +1;
    end
end
%Relleno la segunda parte de la matriz
for i=1:nBloquesCode
    
    for j=1:d
    textM(i,j+d) = numberCode(codeIndex);
    codeIndex = codeIndex +1;
    end
end
for j=1:d
    interchange = 0;
    if gcd(textM(j,j),27) ~= 1 %Comprobación de si el M(j,j) es primo relativo con 27 o no
        
        for i=j+1:nBloquesText
            
            if gcd(textM(i,j),27) == 1 %Buscamos un elemento que sí sea primo relativo
                interchange = 1;
                for z=j:d*2
                aux=textM(j,z);
                textM(j,z)=textM(i,z);
                textM(i,z) = aux;

                end
            break;
            end
        end
        if interchange == 0
            error('No existe matriz identidad'); %Comprobamos si existe fila, en caso negativo declaramos error
        end
    end
        [~,inverse,~]=gcd(textM(j,j),27);
        textM(j,:) = mod(textM(j,:) * inverse,27);
        %Multiplicación por la inversa
        
        for i=1:nBloquesText %Resta del opuesto para hacer 0s
         if i ~= j
        textM(i,:) = mod(textM(i,:) -textM(i,j).*textM(j,:),27); %Operador .* multiplica elemento a elemento
        end
        end
end
matrix = zeros(d,d);

for i=1:d %Creamos y rellenamos la matriz con el resultado (Hay maneras más eficientes pero no tengo más tiempo)
    for j=1:d
        matrix(i,j) = textM(i,j+d);

    end
end
matrix=transpose(matrix);