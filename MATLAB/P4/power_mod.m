%%Función que, dados un número, una potencia a la que elevar y un módulo,
%%realiza la factorización rápida modular de dicho número
function pow = power_mod (b,e,m)
if b > m || floor(b) ~= b || floor(e) ~= e || floor(m) ~= m
    error('Valor/es introducidos no válidos');
end

binary = dec2bin(e);

exponentialVector  = uint64([]);

binLength = length(binary);
expoIndex = 1;
for i=binLength:-1:1 %%Creamos un vector con los factores de potenciación que necesito
    if binary(i) == '1'
    exponentialVector(expoIndex) = 2^(expoIndex-1);
    else
    exponentialVector(expoIndex) = 0;
    end
    expoIndex = expoIndex + 1;
end

expoLength = length(exponentialVector);
moduleValues = uint64([]);
moduleValues(1) = mod(b,m);

for i=2:expoLength
    moduleValues(i) = mod(moduleValues(i-1) * moduleValues(i-1),m);
end
pow = uint64(1);
for i=1:expoLength
    if exponentialVector(i) ~= 0
    pow = mod(pow * moduleValues(i),m);
    end
end
end