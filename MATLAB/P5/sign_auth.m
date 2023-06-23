%%Función que realiza un simulacro de transferencia de mensaje y firma
%%entre dos agentes

%%Pedir y checkear los números necesarios para a y b
fprintf('\nAGENTE A\n');

publicA = input('Introduce un par de valores de clave pública (na,ea)\n');

pq = factor(publicA(1));
fiden = (pq(1)-1)*(pq(2)-1);
if any(~isprime(pq)) || length(pq) ~= 2
    error('Mal input');
end 

if publicA(2) > (pq(1)-1)*(pq(2)-1) || gcd(publicA(2),fiden) ~= 1
    error('Mal input');
end

privateA = input('Introduce los valores privados de a (na,da) \n');

if mod(publicA(2)*privateA(2),fiden) ~= 1 || publicA(1) ~= privateA(1)
    error('Bad public input');
end

fprintf('\nAgente B\n');

publicB = input('Introduce un par de valores de clave pública (nb,eb)\n');

pq = factor(publicB(1));
fiden = (pq(1)-1)*(pq(2)-1);
if any(~isprime(pq)) || length(pq) ~= 2
    error('Mal input');
end 

if publicB(2) > (pq(1)-1)*(pq(2)-1) || gcd(publicB(2),fiden) ~= 1
    error('Mal input');
end

privateB = input('Introduce los valores privados de a (nb,db) \n');

if mod(publicB(2)*privateB(2),fiden) ~= 1 || publicB(1) ~= privateB(1)
    error('Bad public input');
end

fprintf('\nAGENTE A\n');
message = input('Introduce el mensaje que quieres mandar a B: ',"s");
sign = input('Introduce tu firma: ',"s");
%%Cifrado del mensaje total
mensajetotal = strcat(message,sign);

text_ciph = rsa_cipher(publicB(1),publicB(2),mensajetotal);
%%Cifrado de la firma

%%Cifrado 1
firmaABloques = rsa_cipher(privateA(1),privateA(2),sign)
signTotal = '';
bloquesA = length(int2str(privateA(1)))-1
bloquesB = length(int2str(privateB(1)))-1

%%Formateo
for i=1:length(firmaABloques)
    aux = int2str(firmaABloques(i));
    while length(aux) <= bloquesA
    aux =strcat('0',aux);
    end
    signTotal = strcat(signTotal,aux);
end

signFormatBlock = prepare_num_cipher(bloquesB,signTotal);
%%Cifrado 2
sign_ciph_da_eb = rsa_num_cipher(publicB(1),publicB(2),signFormatBlock);

fprintf('Los dos criptogramas generados son:\n');
text_ciph
sign_ciph_da_eb

fprintf('\nAGENTE B \n');

fprintf('B empieza a descifrar lo enviado\n');
%%Cifrado del mensaje total
decipher = rsa_decipher(privateB(1),privateB(2),text_ciph);

%%Primer descifrado de la firma
sign_decipher = rsa_num_decipher(privateB(1),privateB(2),sign_ciph_da_eb);

%%Formateo de la firma
signTotal = '';
for i=1:length(sign_decipher)
    aux = int2str(sign_decipher(i));
    while length(aux) < bloquesB
    aux = strcat('0',aux);
    end
    signTotal = strcat(signTotal,aux);
end
%%Eliminación de 30s y 0s
if length(signTotal)/2 == floor(length(signTotal)/2)
    
    while signTotal(end-1:end) == '30'
        signTotal = signTotal (1:end-2);
    end
else
    if signTotal(end) == '0'
        signTotal = signTotal (1:end-1);
    end
end

formated = prepare_num_cipher(bloquesA+1,signTotal);
%%Segundo cifrado
sign_decipher_defi = rsa_decipher(publicA(1),publicA(2),formated);

fprintf('El mensaje junto a la firma es: \n');
decipher
fprintf('La firma es:\n')
sign_decipher_defi

fprintf('Transferencia de mensajes satisfactoria\n');