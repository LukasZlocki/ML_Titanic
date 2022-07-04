function [Y1, Y2] = dzialaj2 (W1, W2, X)
% funkcja symuluje działanie sieci dwuwarstwowej
% parametry: W1 – macierz wag pierwszej warstwy sieci
% W2 – macierz wag drugiej warstwy sieci
% X – wektor wejść do sieci
% sygnał podany na wejście ( sieci / warstwy 1 )
% wynik: Y1 – wektor wyjść warstwy 1 ( przyda się podczas uczenia )
% Y2 – wektor wyjść warstwy 2 / sieci
% sygnał na wyjściu sieci



beta = 5 ;
 X1 = [-1 ; X];
 U1 = W1' * X1;
 Y1 = 1 ./ (1 + exp(-beta * U1));
 X2 = [ -1 ; Y1];
 U2 = W2' * X2;
 Y2 = 1 ./ (1 + exp(-beta * U2));
