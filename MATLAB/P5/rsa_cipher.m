%%Función que realiza el cifrado rsa sobre un texto, una potencia y un n
%%dados
function v = rsa_cipher(n,e,text)
%%Formateo del texto a Z27 con 30s y 0s
chain = letter_2numbers(text);
ndigitos = length(int2str(n))-1;
ndigitos;
v = prepare_num_cipher(ndigitos,chain);

for i=1:length(v)
    c(i) = power_mod(v(i),e,n); %%Reutilizo power mod para la potenciación modular
end
v=c;
end