%Función que criptoanaliza por fuerza bruta un texto dado. Obtiene
%frecuencias y obtiene las claves mediante iteraciones.

function affine_cryptoanalisis(v)
[~, freq_order]=crypt_ana_order(v); %obtengo la frecuencia ordenada de mayor a menor
inp=3; %input pedido por pantalla
n=27;
    for i=1:n
        a=freq_order(i,2); %1er caracter más usado
           for j=1:8 %Busco hasta el 7º más usado
               if inp == 1
               break;
               end
                b=freq_order(j,2); %Este bucle tendrá un resultado despreciable ya que en algún punto j=i 
                M=[4 1;0 1]; %Matriz a invertir
                Y=[a;b];
                result=mod(inv_module(M,27)*Y,27); %K,D = M^-1 *Y
                %Modularizar k y d y comprobar si k entra es válido
                k=mod(result(1,1),27);
                d=mod(result(2,1),27);
                if gcd(k,27) ~=1
                    fprintf("\nValor de k no válido, pasamos al siguiente\n");
                    continue;
                end
                fprintf("\nk=%d ",k);
                fprintf("\nd=%d ",d);
                
                
                texto=dec_affine(k,d,v); %Decodificación
                fprintf("\n%s\n",texto);
                inp= input("\n¿Sigo? Seleccione 1 para parar, 0 o cualquier otro para continuar: ");
           end
       end
end
