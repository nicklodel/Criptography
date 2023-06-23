%% Una función que descubre la mochila supercreciente usada mediante una muestra y una m dadas
function s = crypt_shammir_zippel(publ_k,mu)

format shortg;
%%Declaración de variables del método
bOne = publ_k(1);
bTwo = publ_k(2);
[~,inversebOne,~] = gcd(bTwo,mu);
inversebOne = mod(inversebOne,mu);
q = mod(inversebOne * bOne,mu);
pubLength = length(publ_k);

qMatrix = [];
qMatrixIndex = 1;
range = 0;
loopKey = "";
%%Loop de procesamiento de q para buscar el menor en un rango determinado
%%por la clave
while loopKey ~= "N"
    loopKey = "deprecable Value for the while loop";
    aux = range;
    range = range + 2^(pubLength+1);
    fprintf('Buscando en el rango [%d,%d]\n',aux+1,range);
    tic
    for i=aux+1:range
        qMatrix(qMatrixIndex) = mod(q*i,mu);
        qMatrixIndex = qMatrixIndex +1;
    end
    time = toc; %%tic toc para calcular el tiempo del bucle
    fprintf('Han pasado %f segundos\n',time);
    %%Probamos la a menor conseguida
    aOne= min(qMatrix);
    [~,inverseaOne,~] = gcd(aOne,mu);
    inverseaOne = mod(inverseaOne,mu);
    w=mod(inverseaOne*bOne,mu);

    [~,inversew,~] = gcd(w,mu);
    inversew = mod(inversew,mu);

    optMochila(:) = mod(publ_k(:) * inversew,mu); 
    %Si es supercreciente, es la mochila que buscamos, si no, ampliamos
    %rango
    if knapsack(optMochila) == 1
    s=optMochila;
    sprintf('Mochila encontrada : \n');
    return;
    end
    qMatrixIndex=1;
    while loopKey ~= "Y" && loopKey ~= "N"
    loopKey = input("No se ha encontrado ningúna mochila. ¿Quiere probar un rango mayor?[Y/N]","s");
    end
end
end