%%Algoritmo ineficiente que checkea si un número es o no generador
function gen = generate_0(g,p)
tic;
gen = 0;

if g > p || floor(g) ~= g || floor(p) ~= p %%Check de si g es candidato
error('Parámetros incorrectos');
end

numbers = uint64([]);
resultado = 0;
numbers (1) = g;
i = 2;

while resultado ~= 1 %%Bucle que busca los números del generador
    resultado = mod(numbers(i-1)*g,p);
    numbers(i) = resultado;
    i = i +1;
    if(i > p) %%Un generador nunca tendrá más de p elementos
        time = toc;
        fprintf('Han pasado %f segundos',time);
    return;
    end
end

gen = g;

time = toc;
fprintf('Han pasado %f segundos',time);
end