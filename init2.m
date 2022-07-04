% buduje siec dwu warstwowa
% s liczba wejsc do sieci

function [W1, W2] = init2 (S, K1, K2)
% funkcja tworzy sieć dwuwarstwową
% i wypełnia jej macierze wag wartościami losowymi
% z zakresu od -0.1 do 0.1
% parametry:
% S – liczba wejść do sieci / liczba wejść warstwy 1
% K1 – liczba neuronów w warstwie 1
% K2 – liczba neuronów w warstwie 2 / liczba wyjść sieci
% wynik: W1 – macierz wag warstwy 1 sieci
% W2 – macierz wag warstwy 2 sieci



W1 = rand (S +1, K1) *0.2-0.1; %lukasz
W2 = rand (K1 +1, K2) *0.2-0.1; % lukasz
