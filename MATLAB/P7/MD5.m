% PRACTICA 7: Completa el siguiente codigo para implementar un programa
% que proporcione el MD5 de cualquier mensaje.
%
% Por si os ayuda os dejo un esqueleto del codigo junto con alguna 
% indicacion. Hay pasos que se pueden implementar de una forma
% alternativa, podeis variarlo siempre y cuando el programa funcione
% correctametne.
%
%  Salida: resumen MD5 del mensaje, que debera ser pedido al usuario,
%  como una cadena hexadecimal.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
format longG;
%% 1st STEP.- INTRODUCING NECESSARY VARIABLES AND CONSTANTS.
clc
%1.1. STEP.- MESSAGE.
% 'En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que vivía un hidalgo de los de lanza en 
% astillero, adarga antigua, rocín flaco y galgo corredor.';

message = 'En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que vivía un hidalgo de los de lanza en astillero, adarga antigua, rocín flaco y galgo corredor.';


% 1.2. STEP.- WORK MODULE: m=2^32.
m= 2^32;

% 1.3. STEP.- CREATE A MATRIX S FOR THE BIT ROTATION.
% NUMBERS ARE NEGATIVE SINCE IT IS A LEFT ROTATION.
s = [-7, -12, -17, -22;-5,  -9, -14, -20;-4, -11, -16, -23;-6, -10, -15, -21];

% 1.4. STEP.- t IS THE VECTOR WITH THE T_i CONSTANTS (sin...).
t = floor(abs(sin(1:64)*m));

% 1.5. STEP.- INITIAL WORDS. MD5 USES THE FOLLOWING 4 WORDS:
% A=01 23 45 67, but in little endian:67 45 23 01
% B=89 ab cd ef --> ef cd ab 89 
% C=fe dc ba 98 --> 98 ba dc fe
% D=76 54 32 10 --> 10 32 54 76

fhash = [hex2dec('67452301') ,  hex2dec('efcdab89'),hex2dec('98badcfe'),hex2dec('10325476')];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 2nd STEP.- PREPARING THE MESSAGE FOR THE MD5 ALGORITHM.

message = abs(message)
bytelen = numel(message) 

% 2.1. STEP.- COMPLETE THE MESSAGE WITH 1 AND 0'S SO THAT THE NUMBER OF BITS
% IS CONGRUENT WITH 448 MOD 512. IF WORKING WITH BYTES, COMPLETE WITH 128
% AND 0'S SO THAT THE NUMBER OF BYTES IS CONGRUENT WITH 56 MOD 64.

bytesleft = 56 - mod(bytelen,64)

message(bytelen+1) = 128;

message(bytelen+ [2:bytesleft]) = 0;

% 2.2. STEP.- 1 WORD = 4 BYTES. THUS, MAKE A 4-ROW MATRIX WITH THE BYTES OF 
% THE MESSAGE: EACH COLUMN WOULD BE A WORD. 

message = reshape(message,[4 length(message)/4]);


% 2.3. STEP.- CONVERT EACH COLUMN TO 32-BITS INTEGERS (little endian).
[xlen,ylen] = size(message);
for i=1:ylen
    for j=1:(xlen/2)
       aux = message(j,i);
       message(j,i) = message(xlen-(j-1),i);
       message(xlen-(j-1),i) = aux;
    end
end
bits = [];

bits=message(4,:)*1 + message(3,:) * (2^8) + message(2,:) * (2^16) + message(1,:) * (2^24);

% 2.4. STEP- COMPLETE WITH THE LENGTH OF THE ORIGINAL MESSAGE WITH A 64-BIT 
% INTEGER -> 8 BYTES -> 2 WORDS (little endian each word).
bitlen = bytelen * 8;
message = [bits mod(bitlen,m) mod(floor(bitlen/m),m)];



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 3rd STEP.- MD5 ALGORITHM.
% WORK WITH 512-BITS BLOCKS. EACH BLOCK HAS 16 WORDS.

for k = 1:16:numel(message)
    a = fhash(1);
    b = fhash(2); 
    c = fhash(3); 
    d = fhash(4);
    for i =1:64
        % Convert b, c and d to row vectors of bits.
        bv = dec2bin(b, 32) - '0';
        cv = dec2bin(c, 32) - '0';
        dv = dec2bin(d, 32) - '0';
        % obtain the logical functions  f(b,c,d).
        %      ki = index  0:15 of the message (k + ki).
        %      sr = rows 1:4 of  s(sr, :).
        if i <= 16          % 1st  round
            f = (bv & cv) | (~bv & dv);
            ki = i - 1;
            sr = 1;
        elseif i <= 32      %2nd round
            f = (bv & dv) | (cv & ~dv);
            ki = mod(5 * i - 4, 16);    %from 5 to 5 starting at 1
            sr = 2;
        elseif i <= 48      %3rd round
            f = xor(bv, xor(cv, dv));
            ki = mod(3 * i + 2, 16);    %from 3 to 3 starting at 5
            sr = 3;
        else                %4th round
            f = xor(cv, bv | ~dv);
            ki = mod(7 * i - 7, 16);    %from 7 to 7 starting at 0
            sr = 4;
        end
        % CONVERT f, FROM A ROW VECTOR OF BITS TO 32-BIT INTEGERS.
       
      flength = length(f);
      string = char(f+'0');
       f = bin2dec(string);
  
       

       
   % APPLYING THE OPERATIONS OF THE ROUNDS.
        sc = mod(i - 1, 4) + 1;
        sum = mod(a + f + message(k + ki) + t(i), m);
        sum = dec2bin(sum, 32);
        sum = circshift(sum, [0, s(sr, sc)]);
        sum = bin2dec(sum);

        % MODIFYING a, b, c AND d. ROTATION IS NECESSARY.
        
     a = mod(sum+b,m);
     auxb = b;
     auxd = d;
     auxc = c;
     auxa = a;
     b=auxa;
     c=auxb;
     d=auxc;
     a=auxd;
    end
    
    % MODIFYING THE HASH.
    
    fhash = mod([a b c d] + fhash,m);
    
    
end

% CONVERT THE HASH FROM 32-BIT INTEGERS (little endian) TO BYTES.
bytes = string([]);
numbers = string([]);
fhash = dec2bin(fhash);
index = 1;
for i=1:4
   
   for j=1:4
    chain='';
    chain = strcat(chain,fhash(i,index:index+7));
    index=index + 8;
    bytes(j,:) = chain;
    
   end
    index=1;
    numbers(i,:) = strcat(bytes(4,:),bytes(3,:),bytes(2,:),bytes(1,:));
end
fhash = numbers;
% CONVERT THE HASH TO HEXADECIMAL.


numbers = bin2dec(numbers);
numbers = dec2hex(numbers);
md5=strcat(numbers(1,:),numbers(2,:),numbers(3,:),numbers(4,:)); %%Me lo saca en mayúsculas, digo yo que no habrá problema con eso
md5