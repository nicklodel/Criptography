%%Cifrado a bloques dado un n y un e con inverso
function v = rsa_num_cipher(n,e,blocks)
 for i=1:length(blocks)
    v(i) = power_mod(blocks(i),e,n); %%Reutilizo power mod para la potenciación modular
end
end