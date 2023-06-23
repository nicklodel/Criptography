%Función que comprueba si una mochila es mochila o no y si es supercreciente
%o no
function valide=knapsack(s)
valide = 1;
sLength = length(s);
for i=1:sLength
    if s(i) ~= floor(s(i)) || s(i) < 0
    valide = -1;
    return;
    end
end
totalMochila=0;

for i=1:sLength
    for j=1:i-1
        if i == 1
        continue;
        end
        totalMochila = totalMochila + s(j);
    end
  if totalMochila >= s(i)
  valide = 0;
  break;
  end
totalMochila = 0;
end
end
