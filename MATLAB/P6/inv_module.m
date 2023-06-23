%Función que calcula la inversa modular de una matriz A y un módulo m.
function inver=inv_module(A,m)
format shortg;
n=(length(A));
l=n;
[a,b] = size(A);

if(a ~= b)
error('La matriz no es cuadrada'); 
end

%Check de si los números dados son enteros o no
for i=1:n
    for j=1:l
        x=A(i,j);
        if (x/floor(x)) ~= 1 && x ~= 0
            fprintf('Todos los elementos deben ser enteros\n');
            return;
        end
    end
end

d=det(A);
d=mod(d,m);
d=round(d);

max=gcd(d,m);


if max ~= 1 || d == 0 %Check de que el determinante no sea 0 y que el máximo común divisor del det mod 27 y 27 sean 1
error('El determinante no es inversible con este módulo');
return;
end

[~,mod_inver,~] = gcd(d,m);
inver = mod(mod_inver*det(A)*inv(A),m); %Cálculo de la inversa A-1*detA*invA mod 27
end