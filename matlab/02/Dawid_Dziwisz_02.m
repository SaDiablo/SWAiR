%% Lab 2 - Redukcja liczby kolorów i podstawy analizy obrazów binarnych
% podpunkty 1-4
obraz=imread('lena.jpg');
obrazBin = imread('E10.bmp');
elem_strukt = cv.getStructuringElement('Shape','Rect', 'KSize',[5,5]);
obrazGray = cv.cvtColor(obraz,'RGB2GRAY');
figure('Name','Oryginalny obraz')
image(obraz)
pbaspect([1 1 1])
figure('Name','Obraz w skali szaroœci')
image(obrazGray)
colormap(gray(256))
pbaspect([1 1 1])

%% 1.1 Redukcja liczby poziomów szaroœci (zerowaniem najm³odszych bitów)

obrazGrayRed1 = func_01(obrazGray,2)
figure('Name','Obraz w skali szaroœci (128 poziomów)')
image(obrazGrayRed1)
colormap(gray(256))
pbaspect([1 1 1])

obrazGrayRed2 = func_01(obrazGray,4)
figure('Name','Obraz w skali szaroœci (64 poziomów)')
image(obrazGrayRed2)
colormap(gray(256))
pbaspect([1 1 1])

obrazGrayRed3 = func_01(obrazGray,8)
figure('Name','Obraz w skali szaroœci (32 poziomów)')
image(obrazGrayRed3)
colormap(gray(256))
pbaspect([1 1 1])

obrazGrayRed4 = func_01(obrazGray,16)
figure('Name','Obraz w skali szaroœci (16 poziomów)')
image(obrazGrayRed4)
colormap(gray(256))
pbaspect([1 1 1])

obrazGrayRed5 = func_01(obrazGray,32)
figure('Name','Obraz w skali szaroœci (8 poziomów)')
image(obrazGrayRed5)
colormap(gray(256))
pbaspect([1 1 1])

%% 2.1 Redukcja palety barw z 24bitów do 16

obrazRed = func_02(obraz,7,5,4);
figure('Name','Obraz po redukcji do 16 bitów (7R, 5G, 4B)')
subplot(1,2,1)
image(obraz)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazRed)
pbaspect([1 1 1])

%% 3.1 Erozja, Dylatacja, Otwarcie, Zamkniêcie - obrazu binarnego



obrazEroz = cv.erode(obrazBin, 'Element', elem_strukt, 'Iterations', 1);
imageview(obrazEroz)

obrazDilat = cv.dilate(obrazBin, 'Element', elem_strukt, 'Iterations', 1);
imageview(obrazDilat)

%otwarcie
obrazOtw = cv.erode(obrazBin, 'Element', elem_strukt, 'Iterations', 1);
obrazOtw = cv.dilate(obrazOtw, 'Element', elem_strukt, 'Iterations', 1);
imageview(obrazOtw)

%zamkniêcie
obrazZamk = cv.dilate(obrazBin, 'Element', elem_strukt, 'Iterations', 1);
obrazZamk = cv.erode(obrazZamk, 'Element', elem_strukt, 'Iterations', 1);
imageview(obrazZamk)

%% 4.1 Morfologiczna detekcja krawêdzi w obrazie binarnym

obrazKrawedz = cv.erode(obrazBin, 'Element', elem_strukt, 'Iterations', 1);
obrazKrawedz = obrazBin - logical(obrazKrawedz);
imageview(obrazKrawedz)