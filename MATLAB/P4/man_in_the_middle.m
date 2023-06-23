%%Función que simula la intercepción de un mensaje en un intercambio de
%%clave
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
a =  input(['A Introduce un valor entre 2 y ' num2str(p-2) ': ']);
end

aresult = power_mod(g,a,p);
fprintf("A manda a B power_mod (%d,%d,%d) = %d\n",g,a,p,aresult);
fprintf('C intercepta el mensaje\n');

fprintf('AGENTE B\n');
b=0;
while b < 2 || b > p-2
b =  input(['B Introduce un valor entre 2 y ' num2str(p-2) ': ']);
end

bresult = power_mod(g,b,p);
fprintf("B manda a A power_mod (%d,%d,%d) = %d\n",g,b,p,bresult);
fprintf('C intercepta el mensaje\n');

fprintf('AGENTE C\n');
fprintf('C intercepta %d y %d y los guarda\n',aresult,bresult);
c=0;
while c < 2 || c > p-2
c =  input(['C Introduce un valor entre 2 y ' num2str(p-2) ': ']);
end

cresult = power_mod(g,c,p);
fprintf("C manda a A y B power_mod (%d,%d,%d) = %d\n",g,c,p,cresult);

fprintf('B piensa que ha recibido dicho número de A y vicecersa\n');

fprintf('AGENTES A y B')
afake = power_mod(cresult,a,p);
fprintf("A obtiene power_mod (%d,%d,%d) = %d\n",cresult,a,p,afake);
bfake = power_mod(cresult,b,p);
fprintf("A obtiene power_mod (%d,%d,%d) = %d\n",cresult,b,p,bfake);

fprintf('AGENTE C\n')
cobtaina = power_mod(aresult,c,p);
cobtainb = power_mod(bresult,c,p);
fprintf("Para A computa power_mod (%d,%d,%d) = %d\n",aresult,c,p,cobtaina);
fprintf("Para B computa power_mod (%d,%d,%d) = %d\n",bresult,c,p,cobtainb);
