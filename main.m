clc
clear all
close all


s = tf('s');

%Funcion 1

H1 = 8/(6*s+2);
H1_Lazo=feedback(H1,1);
[y1,t1]=step(H1);
[y1_Lazo,t1_Lazo]=step(H1_Lazo);

%subplot(2,1,1),plot(t1,y1,'b',t1_Lazo,y1_Lazo,'r')
%subplot(2,1,2), pzmap(H1,'b',H1_Lazo,'r')




%Calculo de la ganancia estatica, polos y ceros
N1= [8];
D1= [6 2];
[ceros1,polos1,gan1] = tf2zp (N1,D1);

N1_Lazo= [8];
D1_Lazo= [6 19];
[ceros1_Lazo,polos1_Lazo,gan1_Lazo] = tf2zp (N1_Lazo,D1_Lazo);

%pzmap(H1)

%Funcion 2
H2 = (5*s^2 + 7*s + 1) / (s^2 + 6*s + 3);
H2_Lazo=feedback(H2,1);
%step(H2)
%step(H2_Lazo)


%Calculo de la ganancia estatica, polos y ceros
N2= [5 7 1];
D2= [1 6 3];
[ceros2,polos2,gan2] = tf2zp (N2,D2);

N2_Lazo= [5 7 1];
D2_Lazo= [1 13 4];
[ceros2_Lazo,polos2_Lazo,gan2_Lazo] = tf2zp (N2_Lazo,D2_Lazo);

%pzmap(H2)



%Pregunta 2


Fcn1 = (4*s)/(10*s^2 + 4);
Fcn2 = 3/(6* s + 16);
Fcn3 = (4*s + 10)/( 4* s^3 + 9* s^2 + 5*s);
Fcn4 = 1/( 7*s + 10);
Fcn5 = (8*s + 8)/( s^3 + 2* s^2 + 3*s);
Fcn6 = (3*s + 2)/(5* s^2 + 7*s + 10);
 
% se realiza el feedback consigo misma, ademas de ser postivo
% debido a esto se añade el +1
Fcn3_feed = feedback (Fcn3,1,+1);

% se realiza la conexion en serie que surge en
% feedback con H4 y feedback con H5
Fcn4_ser = Fcn3_feed * Fcn4;
Fcn5_ser = Fcn3_feed * Fcn5;

% Se aplica el sumador 2 entre las 2 conexiones en serie anteriores
sum2 = Fcn4_ser + Fcn5_ser;

%Se realiza la conexion en serie del sumador 2 con la funcion 6
Fcn6_ser = sum2 * Fcn6;

% finalmente se aplica el sumador 3, donde se unen funcion 1, funcion 2 y
% la conexion en serie calculada anteriormente

H_final= Fcn1 + Fcn2 + Fcn6_ser;

%Se le aplicara un escalon como entrada
step(H_final, 10);

H_final


