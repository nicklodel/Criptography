%%Versión eficiente del checkeo de si un número es generador
function gen = generate(g,p)
tic
if g > p || floor(g) ~= g || floor(p) ~= p %%Check de si g es candidato y si p y g son enteros
error('Argumentos no válidos');
end
gen = g;
pFactors = factor(p-1);

for i=1:length(pFactors)
    value = power_mod(g,(p-1)/pFactors(i),p);
    if value == 1
    gen = 0;    
    break;
    end
end

time = toc;
fprintf('Han pasado %f segundos\n',time);
end