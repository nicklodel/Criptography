%Función que genera un cifrado a partir de una matriz y un texto a cifrar
function code=hill_cipher(A,text)
numbers = letter_number(text);
[a,b] = size(A);

if(a ~= b)
error("La matriz no es cuadrada");
end


while round(length(numbers)/a) ~= length(numbers)/a
numbers(length(numbers)+1) = 23; %Añadimos 'w' hasta completar el bloque
end

tamFrase = length(numbers);
tamBloque = a;
nBloques = tamFrase/tamBloque;
numbersIndex = 1;
transcriptionIndex = 1;
transcription = [];

for i=1:nBloques
auxMatrix = [];

    for j=1:tamBloque
    auxMatrix(j,1) = numbers(numbersIndex); %Rellenamos una matriz de nx1 elementos, siendo n la dimensión de la matriz de cifrado
    numbersIndex = numbersIndex + 1;
    end
    
result = A * auxMatrix; %Operamos para obtener el texto cifrado
    
    for k=1:tamBloque
    transcription(transcriptionIndex) = result(k,1); %Escribimos el texto en la matriz transcription
    transcriptionIndex = transcriptionIndex + 1;
    end
end



    transcription(:) = mod(transcription(:),27); %Nos aseguramos de que los elementos estén en Z27


code = number_letter(transcription);
end 
