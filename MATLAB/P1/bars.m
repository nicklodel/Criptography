%Función que nos da la frecuencia de las letras en español en gráficas con
%la frecuencia de las letras en el texto dado
function compare=bars(v)
format shortg;
compare=zeros(27,4);
compare(:,2)=0:26;
compare(:,4)=0:26;

compare(1,1)=0.1368;
compare(1,2)=4;
compare(2,1)=0.1253;
compare(2,2)=0;

compare(3,1)=0.0868;
compare(3,2)=15;

compare(4,1)=0.0798;
compare(4,2)=19;

compare(5,1)=0.0687;
compare(5,2)=18;

compare(6,1)=0.0671;
compare(6,2)=13;

compare(7,1)=0.0625;
compare(7,2)=8;

compare(8,1)=0.0586;
compare(8,2)=3;

compare(9,1)=0.0497;
compare(9,2)=11;

compare(10,1)=0.0468;
compare(10,2)=2;

compare(11,1)=0.0463;
compare(11,2)=20;

compare(12,1)=0.0393;
compare(12,2)=21;

compare(13,1)=0.0315;
compare(13,2)=12;

compare(14,1)=0.0251;
compare(14,2)=16;

compare(15,1)=0.0142;
compare(15,2)=1;

compare(16,1)=0.0101;
compare(16,2)=6;

compare(17,1)=0.009;
compare(17,2)=22;

compare(18,1)=0.009;
compare(18,2)=25;

compare(19,1)=0.0088;
compare(19,2)=17;

compare(20,1)=0.007;
compare(20,2)=7;

compare(21,1)=0.0069;
compare(21,2)=5;

compare(22,1)=0.0052;
compare(22,2)=26;

compare(23,1)=0.0044;
compare(23,2)=9;

compare(24,1)=0.0031;
compare(24,2)=14;

compare(25,1)=0.0022;
compare(25,2)=24;

compare(26,1)=0.0002;
compare(26,2)=10;

compare(27,1)=0.0001;
compare(27,2)=23;

[a,freq_order]=crypt_ana_order(v);
for i=1:27
    compare(i,3)=freq_order(i,1);
    compare(i,4)=freq_order(i,2);
end
x=compare(:,1);
y=compare(:,2);
subplot(1,2,1);
bar(y,x);
w=compare(:,3);
z=compare(:,4);
subplot(1,2,2);
bar(z,w);
end