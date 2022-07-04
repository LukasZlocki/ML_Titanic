pkg load io %zaladowanie sterownikow IO

% Matryca P - opis wejsc
% Y1 - Czy jest to mezczyzna
% Y2 - ma bilet klasy 1
% Y3 - dziecko do 14 roku zycia

Pi = xlsread('P_matrix_data.xlsx') % wgranie matryc
P = Pi' % transponowanie matrycy do wymaganej postacji

% Wyjscie
% zyje , mie zyje
Ti = xlsread('T_matrix_data.xlsx') % wgranie matryc
T = Ti' % transponowanie matrycy do wymaganej postacji



%P = [ 0 0 1 1 ;   % wejscie sieci
%      0 1 0 1 ]
%T = [ 0 1 1 0]  % zadane wyjscia sieci

% paramtery do recznej zmiany
% m - ilosc krokow uczenia
% e1 - blad sredniokwadratowy(MSE1), dla warstwy 1, po osiagnieciu ktorego przerywamy uczenie
% e2 - blad sredniokwadratowy(MSE1), dla warstwy 1, po osiagnieciu ktorego przerywamy uczenie
% n - ilosc epok

n = 5000;
e1 = 0.0000;
e2 = 0.0000;

n = input("Podaj liczbe epok, zalecane (5000): ");
e1 = input ("Podaj blad MSE1, zalecane (0.00): ");
e2 = input ("Podaj blad MSE2, zalecane (0.00): ");

printf("",n);
printf("",e1)
printf("",e2)


% przed uczeniem
[W1przed, W2przed] = init2 ( 3 , 2 , 2)   % 3 wejscia / 2 neurony siec 1 / 2 neurony siec 2
[Y1 , Y2a] = dzialaj2 (W1przed , W2przed , P (:,1));
[Y1 , Y2b] = dzialaj2 (W1przed , W2przed , P (:,2));
[Y1 , Y2c] = dzialaj2 (W1przed , W2przed , P (:,3));
%[Y1 , Y2d] = dzialaj2 (W1przed , W2przed , P (:,4));
Yprzed = [ Y2a, Y2b, Y2c ]


% po uczeniu
[W1po, W2po, MSE1, MSE2] = ucz2 (W1przed, W2przed, P, T, n, e1, e2)

[ Y1 , Y2a] = dzialaj2 (W1po , W2po , P (:,1));
[ Y1 , Y2b] = dzialaj2 (W1po , W2po , P (:,2));
[ Y1 , Y2c] = dzialaj2 (W1po , W2po , P (:,3));
%[ Y1 , Y2d] = dzialaj2 (W1po , W2po , P (:,4));

Y1po = [ Y2a, Y2b, Y2c ]



