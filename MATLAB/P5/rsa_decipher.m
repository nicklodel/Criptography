%%Función que compacta descifrar y pasar a texto una serie de bloques
function  text = rsa_decipher(n,d,code)
decode = rsa_num_decipher(n,d,code);
text = num_decipher(n,decode);
end