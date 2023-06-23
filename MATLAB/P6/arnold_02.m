%%Función que, dada una fotografía y una matriz de trasposición, genera una
%%animación de imágenes de n iteraciones
function power = arnold_02(photo,A)
value=0;

while value ~= 1 && value ~=  2
    value = input('Introduce 1 para desordenar hasta encontrar el original o 2 para desordenar hasta un número concreto de veces: ');
end


if value == 1
 
 photoIt = imread(photo);
 [tam,~] = size(photoIt);
 
 n = power_a(A,tam)
   for i=1:n+1
       imshow(photoIt);
       pixel_disorder(photoIt,A);
       photoIt = getappdata(gcf,"photoMod");
       
   

   end

end

if value == 2
    n = 0;
   while n < 1
   n = input('Introduce un número entero: ');
   end 
    photoIt = imread(photo);
   for i=1:n
       imshow(photoIt);
       pixel_disorder(photoIt,A);
       photoIt = getappdata(gcf,"photoMod");
        
   end
end
power = n;
end