%%Función auxiliar para pasar los valores de un texto a ascii
function v=letter_number_ascii(text)
abc='abcdefghijklmnnopqrstuvwxyz';
abc(15)=char(241);
text=lower(text);
n=length(abc);
m=length(text);
v=[];
for i=1:m 
    for j=1:n
        if text(i) == abc(j)
            v(i)=double(abc(j));
            break;
        end
    end
end
end