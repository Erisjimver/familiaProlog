%**********Arbol Familiar*********
%********Hechos*********

hombre(bolivar). %Padre**
hombre(stalin).  %hijo
hombre(pedro).   %hijo
hombre(juan).    %abueloM
hombre(crispin). %abueloP
hombre(luis).    %tio
hombre(diego).   %primo


mujer(margarita). %Madre**
mujer(laura).  %hija
mujer(rosa).   %abuelaM
mujer(elida).  %abuelaP
mujer(anabel).  %tia
mujer(valeria). %prima

%********Relaciones*****

esPadre(juan,bolivar).
esPadre(juan,luis).
esPadre(bolivar,stalin).
esPadre(bolivar,pedro).
esPadre(bolivar,laura).
esPadre(crispin,margarita).
esPadre(crispin,anabel).
esPadre(luis,diego).
esPadre(luis,valeria).

%**************************
esMadre(rosa,bolivar).
esMadre(rosa,luis).
esMadre(elida,margarita).
esMadre(elida,anabel).
esMadre(margarita,stalin).
esMadre(margarita,pedro).
esMadre(margarita,laura).
esMadre(anabel,diego).
esMadre(anabel,valeria).
%***************************
esEsposo(bolivar,margarita).
esEsposo(juan,rosa).
esEsposo(crispin,elida).
%***********************
%******,(X\==Y).redundancia***
%******,not(X,Y).

%**Definicion De Reglas**
%**REGLA HIJO,HIJA*******

esHijo(X,Y):-(esPadre(Y,X);esMadre(Y,X)),hombre(X).

esHija(X,Y):-(esPadre(Y,X);esMadre(Y,X)),mujer(X).

%**REGLA HERMANO,HERMANA*****
esHermano(X,Y):-((esPadre(B,X),esPadre(B,Y)),(esMadre(M,X),esMadre(M,Y))),hombre(X),(X\==Y).

esHermana(X,Y):-((esPadre(B,X),esPadre(B,Y)),(esMadre(M,X),esMadre(M,Y))),mujer(X),not(X=Y).

%****REGLA ABUELO,ABUELA*****

esAbuelo(X,Y):-(esPadre(X,B);esPadre(X,S)),(esPadre(B,Y),esMadre(S,Y)),hombre(X).

esAbuela(X,Y):-(esMadre(X,M);esMadre(X,A)),(esPadre(M,Y),esMadre(A,Y)),mujer(X).

%**REGLA NIETO,NIETA*****

sonNietos(X,Y):-(esAbuelo(Y,X);esAbuela(Y,X)),hombre(X).

sonNietas(X,Y):-(esAbuelo(Y,X);esAbuela(Y,X)),mujer(X).

%**REGLA HERMANOS****
sonHermanos(X,Y):- esHermano(X,Y);esHermana(X,Y).

%**REGLA CASADOS****

sonCasados(X,Y):-(esEsposo(X,Y);esEsposo(Y,X)),((hombre(X),mujer(Y));(mujer(X),hombre(Y))).

%**REGLA TIO,TIA****

tio(X,Y):- (sonHermanos(X,Z),(esHijo(Y,Z);esHija(Y,Z)),hombre(X)).

tia(X,Y):- (sonHermanos(X,Z),(esHijo(Y,Z);esHija(Y,Z)),mujer(X)).

%**REGLA SOBRINO,SOBRINA****

esSobrino(X,Y):-(sonHermanos(Y,Z),sonHermanos(Z,Y)),(esHijo(X,Z)),hombre(X),not(X=Y).

esSobrina(X,Y):-(sonHermanos(Y,Z),sonHermanos(Z,Y)),(esHija(X,Z)),mujer(X),not(X=Y).
%**REGLA PRIMO,PRIMA****

esPrimo(X,Y):-(esPadre(Z,X);esMadre(Z,X)),(esPadre(A,Y);esMadre(A,Y)),(sonHermanos(Z,A),sonHermanos(A,Z)),hombre(X),not(X=Y).

esPrima(X,Y):-(esPadre(Z,X);esMadre(Z,X)),(esPadre(A,Y);esMadre(A,Y)),(sonHermanos(Z,A),sonHermanos(A,Z)),mujer(X),not(X=Y).

% RECURSIVIDAD.- expresa una regla en termino de si mismmo y % define,reglas de forma mas generaly flexible

%*****Antecesor Padre*******************************************

antecesor(X,Y):-esPadre(X,Y).
antecesor(X,Y):-esPadre(X,Z),antecesor(Z,Y).

%*****Antecesor Madre*******************************************

antecesora(X,Y):-esMadre(X,Y).
antecesora(X,Y):-esMadre(X,Z),antecesora(Z,Y).

antecesores(X,Y):-(esPadre(X,Y);esMadre(X,Y)).
antecesores(X,Y):-(esPadre(X,Z),antecesores(Z,Y));(esMadre(X,Z),antecesores(Z,Y)).



























