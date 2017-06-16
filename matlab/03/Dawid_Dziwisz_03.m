%% Lab 3 - Analiza obrazów binarnych - ekstrakcja podstawowych parametrów geometrycznych
% podpunkty 1-5
obraz = imread('arcydzielo.bmp');
imageview(obraz)
obraz_lab = func_01(obraz);
obraz_1 = obraz_lab == 1;
imageview(obraz_lab)
%% 1.1 Czyszczenie brzegu

ramka = obraz;
ramka(2:end-1,2:end-1) = 0;
po_dylatacji = ramka;
for i = 1 : 1 : 100
    po_dylatacji = cv.dilate(po_dylatacji) & obraz;
end
wynik = obraz - po_dylatacji;
imageview(wynik)

%% 2.1 Wype³nianie otworów

ramka_odw = ~obraz;
ramka1 = ramka_odw;
ramka1(2:end-1, 2:end-1) = 0;
po_dylatacji = ramka1;
for i = 1 : 1 : 250
    po_dylatacji = cv.dilate(po_dylatacji) & ramka_odw;
end
wynik = ~po_dylatacji;
imageview(wynik)

%% 3.1 Pole powierzchni i d³ugoœci krawêdzi

pole = sum(obraz_1(:));
sum(obraz_1(:)); %sum(sum(obraz_2))  %dwa sposoby na obliczenie pola
ramka2 = obraz_1 - logical(cv.erode(obraz_1)); %stworzenie ramki obiektu
[py, px] = find(ramka2);
p = [py, px]; %wektor z obrazu

%wektor przesuniêæ
directions = [ 0, 1;
               1, 1;
               1, 0;
               1,-1;
               0,-1;
              -1,-1;
              -1, 0;
              -1, 1];

pt = p(1,:); %punkt startowy
code = []; %The chain code
dir = 7; %poczatkowe przesuniecie
%sz = imsize(ramka)


%nie ogarniam tego ni¿ej
while 1
    newpt = pt + directions(dir+1,:);
   if newpt == any(p) %poprawiæ to
      cc = [cc,dir];
      pt = newpt;
      dir = mod(dir+2,8);
   else
      dir = mod(dir-1,8);
   end
   if all(pt==start) && dir==1 % back to starting situation
      break;
   end
end

%% 4.1 Estymacja pola powierzchni 


%% 5.1 Zliczanie obiektów

tekst = ['Liczba obiektów: ', num2str(max(obraz_lab(:)))];
disp(tekst)