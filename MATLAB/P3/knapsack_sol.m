%%Función para comprobar si un valor se puede descomponer en los valores de
%%una mochila o no
function [v,valide] = knapsack_sol(s,obj)
if knapsack(s) < 0
valide = -1;
error('No es mochila');
end

valide = knapsack(s);
sSize=size(s);
sLength=length(s);
v = zeros(sSize);

    
    for i=sLength:-1:1
        
        if s(i) <= obj
            v(i) = 1;
            obj = obj-s(i);
        end
        
    end

if obj ~= 0
        v = 0;
        return;
end

