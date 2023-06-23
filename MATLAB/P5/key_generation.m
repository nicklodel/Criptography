%%Script de interacción por antalla para conseguir que define las claves
%%públicas y privadas.

p = input('Elige un número primo p: ');

while ~isprime(p)
p = input('Elige un número primo p: ');
end

    q = input('Elige un número primo q: ');

while ~isprime(q)
    q = input('Elige un número primo q: ');
end

n= p * q;

fprintf('El valor de n es n = p * q = %d\n',n);

fprintf('El valor e, de la clave pública, debe satisfacer gcd(e,...fiden)=gcd(e,(p-1)(q-1)=gcd(e,%d)=1',(p-1)*(q-1));
fiden = (p-1)*(q-1);
e =  randi([2,fiden-2])

while gcd(e,(p-1)) ~= 1 && gcd(e,q-1) ~= 1
   e = randi([2,fiden-2])
end
fprintf('El valor e elegido es %d\n',e);

[~,d,~] = gcd(e,fiden);
f=mod(d*e,fiden)
fprintf('El valor inverso de e módulo fiden es d y su valor es %d\n',d);

fprintf('PUBLIC KEY: (n,d) = (%d,%d)\n',n,d);
fprintf('PRIVATE KEY: (n,e) = (%d,%d)\n',n,e);
