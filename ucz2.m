function [W1po, W2po, MSE1, MSE2] = ucz2 ( W1przed, W2przed, P, T, n, e1, e2)
% schemat funkcji:
% losuj numer przykładu
% podaj przykład na wejścia i oblicz wyjścia
% oblicz błędy na wyjściach warstwy 2 - ważna kolejnosć !
% oblicz błędy na wyjściach warstwy 1 - ważna kolejnosć !
% oblicz poprawki wag warstw 1 i 2 - dowolna kolejność
% dodaj poprawki do wag warstw 1 i 2 - dowolna kolejność
% i to wszystko n razy



liczbaPrzykladow = size (P, 2);
liczbaWyjsc = size(T, 1)
W1 = W1przed;
W2 = W2przed;
wspUcz = 0.1;
beta = 5;
MSE1 = zeros(1, n)  %MSE1 !
MSE2 = zeros(1, n) %MSE2 !


for i = 1 : n,
  nrPrzykladu =  randi (liczbaPrzykladow);
  X = P (:, nrPrzykladu); % podaj przyklad na wejscie i oblicz wyjscia
  X1 = [ -1 ; X ] ;
  [ Y1, Y2] = dzialaj2( W1, W2, X);
  X2 = [ -1 ; Y1 ];
  D2 = T (:, nrPrzykladu) - Y2; %oblicz bledy na wyjsciach warstwy 2
  E2 = beta * D2 .* Y2 .* (1 - Y2); %blad wewnetrzny warstwy 2
  D1 = W2 ( 2:end , :) * E2; %oblicza bledy dla warstwy 1
  E1 = beta * D1 .* Y1 .* (1 - Y1); %blad wewnetrzny warstwy 1

  dW1 = wspUcz * X1 * E1';   % oblicz poprawki wag warstwy 1
  dW2 = wspUcz * X2 * E2';  % oblicz poprawki wag warstwy 2

  W1 = W1 + dW1; % dodaje poprawki do wag warstwy 1
  W2 = W2 + dW2; % dodaje poprawki do wag warstwy 1

  MSE1(i) = 0.5*1/liczbaWyjsc * D1' * D1 ; % do wykresu bledu lukasz
  MSE2(i) = 0.5*1/liczbaWyjsc * D2' * D2 ;

if (MSE1(i) < e1) % jesli blad bedzie mniejszy niz zadeklarowany (e1) to wychodzimy z petli
    break;
  endif

if (MSE2(i) < e2) % jesli blad bedzie mniejszy niz zadeklarowany (e2) to wychodzimy z petli
    break;
  endif

end

% plotowanie MSE
subplot(1, 4, 1)
plot(MSE1); %lukasz !
title('Blad sredniokwadratowy MSE1')

subplot(1, 4, 2)
plot(MSE2); %lukasz !
title('Blad sredniokwadratowy MSE2')


subplot(1, 4, 3)
plot(E1); %lukasz !
title('Wartosc wag E1')

subplot(1, 4, 4)
plot(E2); %lukasz !
title('Wartosc wag E2')

W1po = W1;
W2po = W2;
