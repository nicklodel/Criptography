%Función que convierte de texto a números del 0 al 26 según la posición en
%el alfabeto. Código reciclado de letter_number (P1)
function v=letter_number(text)
abc='abcdefghijklmnnopqrstuvwxyz';
abc(15)=char(241);
text=lower(text);
n=length(abc);
m=length(text);
v='';
for i=1:m 
    for j=1:n
        if text(i) == abc(j)
            v= strcat(v,sprintf('%02d',j-1));
            break;
        end
    end
end
double = v;
end