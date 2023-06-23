%%Función que , dada una matriz de foto y otra de trasposición, crea una
%%imagen traspuesta.
function pixel_disorder(photo,A)
[a,b,~]= size(photo);
if a ~= b
    error('la foto no es cuadrada');
end
if det(A) == 0 
error('La matriz no es válida');
end
[sizeA,sizeAA] = size(A);
if sizeA ~= sizeAA || sizeA ~= 2
error('La matriz no es válida')
end
arnold = photo;
for i=1:a
    for j=1:b
        d = mod( A *[i;j],a);
        if d(1) == 0
            d(1) = a;
        end
        if d(2) == 0
            d(2) = a;
        end
        arnold(d(1),d(2),:) = photo(i,j,:);
    end
end
setappdata(gcf,'photoMod',arnold);
end
