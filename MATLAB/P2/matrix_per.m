%Función que genera una matriz de permutación a partir de una permutación
%válida
function matrix = matrix_per(p)
pLength = length(p);

if(permutation(p) == 1)
matrix = zeros(pLength,pLength);
 
for i=1:pLength
 matrix(i,p(i)) = 1;
 end

end
if(permutation(p) == 0)
error('Permutación no válida');
end
end