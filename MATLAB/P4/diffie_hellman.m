%%Función de simulación de un intercambio de claves 
p = input("introduce un valor primo p: ");
while ~isprime(p)
p = input("introduce un valor primo p: ");
end

g = input(['Introduce un generador válido para ' num2str(p) ': ']);

while generate(g,p) == 0
g = input(['Introduce un generador válido para' p ': ']);
end

fprintf('AGENTE A\n');
a=0;
while a < 2 || a > p-2
a =  input(['Introduce un valor entre 2 y ' num2str(p-2) ': ']);
end

aresult = power_mod(g,a,p);
fprintf("A manda a B power_mod (%d,%d,%d) = %d\n",g,a,p,aresult);

fprintf('AGENTE B\n');
b=0;
while b < 2 || b > p-2
b =  input(['Introduce un valor entre 2 y ' num2str(p-2) ': ']);
end

bresult = power_mod(g,b,p);
fprintf("B manda a A power_mod (%d,%d,%d) = %d\n",g,b,p,bresult);

fprintf('Ambos Agentes\n');

afinal = power_mod(bresult,a,p);
fprintf("A obtiene power_mod (%d,%d,%d)  = %d\n ",bresult,a,p,afinal);

bfinal = power_mod(aresult,b,p);
fprintf("B obtiene power_mod (%d,%d,%d)  = %d\n ",aresult,b,p,bfinal);

