%Función que comprueba si una permutación es válida o no
function permute=permutation(p)
pLength=length(p);
permute = 1;
for i=1:pLength
    if p(i) > pLength
        permute = 0;
        return;
    end
    
    for j=1:pLength
        if( i == j)
        continue;
        end
        
        if p(i) == p(j)
        permute = 0;
        return;
        end
        end
    end
end