%Autores:
%   -Gary Simken       19.986.690-7
%   -Felipe Villalobos 20.139.310-8
clc
clear all
close all
s = tf('s');


%------------ Pregunta 1 ---------------------
%Funcion 1

H1 = 8/(6*s+2);
H1_Lazo=feedback(H1,1);
[y1,t1]=step(H1,20);
[y1_Lazo,t1_Lazo]=step(H1_Lazo, 20);



createfigure1(t1,y1,t1_Lazo,y1_Lazo)




%Calculo de la ganancia estatica, polos y ceros de lazo abierto
N1= [8];
D1= [6 2];
[ceros1,polos1,gan1] = tf2zp (N1,D1);
%calculada manualmente
gan1=4;
tiempo1=12;

%Calculo de la ganancia estatica, polos y ceros de lazo cerrado
N1_Lazo= [8];
D1_Lazo= [6 10];
[ceros1_Lazo,polos1_Lazo,gan1_Lazo] = tf2zp (N1_Lazo,D1_Lazo);
%calculada manualmente
gan1_Lazo=0.8;
tiempo1_Lazo=2.4;


%Funcion 2
H2 = (5*s^2 + 7*s + 1) / (s^2 + 6*s + 3);
H2_Lazo=feedback(H2,1);
[y2,t2]=step(H2,18);
[y2_Lazo,t2_Lazo]=step(H2_Lazo,18);

createfigure2(t2,y2,t2_Lazo,y2_Lazo)
%Calculo de la ganancia estatica, polos y ceros de lazo abierto
N2= [5 7 1];
D2= [1 6 3];
[ceros2,polos2,gan2] = tf2zp (N2,D2);
[frecN2,zeta2,p2]= damp(H2);

tiempo2 = 4/(frecN2(2)*cos(frecN2(2)))

%Calculo de la ganancia estatica, polos y ceros de lazo cerrado
N2_Lazo= [5 7 1];
D2_Lazo= [1 13 4];
[ceros2_Lazo,polos2_Lazo,gan2_Lazo] = tf2zp (N2_Lazo,D2_Lazo);

[frecN2_Lazo,zeta2_Lazo,p2_lazo]= damp(H2_Lazo);
tiempo2_Lazo = 2/(-frecN2_Lazo(2)*cos(frecN2_Lazo(2)))
%Tiempo2_Lazo=4/(zeta*frecN)

%------------ Pregunta 2 ---------------------

%se ingresan las funciones de transferencias presentes en el diagrama
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
[yH,tH] = step(H_final, 10);

createfigure3(tH,yH)

H_final


