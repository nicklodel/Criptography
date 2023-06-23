%%Función que realiza una sola ordenación o desordenación en un fotografía
function arnold(photo,A)
value=0;
while value ~= 1 && value ~= 2
    value = input('Introduce 1 para desordenar o 2 para ordenar: ');
end
if value == 1
    photoM = imread(photo);
    pixel_disorder(photoM,A)
end
if value == 2
    photoA = imread(photo);
    [a,b,c] = size(photoA);
    pixel_disorder(photoA,inv_module(A,a));
end
img = getappdata(gcf,'photoMod');
imshow(img);
end