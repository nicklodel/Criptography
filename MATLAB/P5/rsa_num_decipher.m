%%Función que descifra unos bloques con un número n, un inverso de e (d) y
%%un código dividido en bloques
function v = rsa_num_decipher(n,d,code)
v = [];
for i=1:length(code)
    v(i) = power_mod(code(i),d,n);
end

end