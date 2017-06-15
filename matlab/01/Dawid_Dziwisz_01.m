clear all
%% Lab 1 - binaryzacja i konwersja kolorów
% podpunkty 1-6
obraz = imread('lena.jpg');
obrazGray = cv.cvtColor(obraz,'RGB2GRAY');
%% 1.1 Histogram R G B
imR = obraz(:,:,1);
imR = imR(:);
imG = obraz(:,:,2);
imG = imG(:);
imB = obraz(:,:,3);
imB = imB(:);
histR (1:256,1) = 0; % alokacja
histG (1:256,1) = 0; % alokacja
histB (1:256,1) = 0; % alokacja
for i = 1 : numel(imR)
    histR(imR(i)+1) = histR(imR(i)+1)+1;
end
for i = 1 : numel(imG)
    histG(imG(i)+1) = histG(imG(i)+1)+1;
end
for i = 1 : numel(imB)
    histB(imB(i)+1) = histB(imB(i)+1)+1;
end

figure(1) % Wyœwietlanie
subplot(3,1,1)
bar(histR)
title('Histogram koloru czerwonego')
subplot(3,1,2)
bar(histG)
title('Histogram koloru zielonego')
subplot(3,1,3)
bar(histB)
title('Histogram koloru niebieskiego')

%% 1.2 Histogram w skali szaroœci
imGray = obrazGray(:);
histGray (1:256,1)=0;
for i = 1 : numel(imGray)
    histGray(imGray(i)+1) = histGray(imGray(i)+1)+1;
end

figure(2)
bar(histGray)
title('Histogram obrazu w skali szaroœci')

%% 2.1 Histogram kumulacyjny obrazu RGB
im = obraz(:);
hist (1:256,1)=0;
for i = 1 : numel(im)
    hist(im(i)+1) = hist(im(i)+1)+1;
end
figure(3)
bar(hist)
title('Histogram kumulacyjny obrazu RGB')

%% 2.2 Histogram kumulacyjny obrazu w skali szaroœci
imGray = obrazGray(:);
histGray (1:256,1)=0;
for i = 1 : numel(imGray)
    histGray(imGray(i)+1) = histGray(imGray(i)+1)+1;
end

figure(4)
bar(histGray)
title('Histogram kumulacyjny obrazu w skali szaroœci')
%% 3.1 Wyg³adzanie histogramu obrazu w skali szaroœci

%siod³a i binaryzacja
windowSize = 5;
histGraySre = filter(ones(1,windowSize)/windowSize,1,histGray);
windowSize2 = 10;
histGraySre2 = filter(ones(1,windowSize2)/windowSize2,1,histGraySre);
%   Z = smooth(Y) uses the moving average method with span 5 and
%   X=1:length(Y).
figure(5)
bar(histGraySre2)
title('Wyg³adzony histogram obrazu w skali szaroœci')
%% 3.2 Szukanie progu binaryzacji (minimum lokalnego) histogramu

poch = diff(histGraySre2);
figure(6)
bar(poch)
title('Pierwsza pochodna histogramu obrazu w skali szaroœci')
x = 0;
temp = 0;
for i = 2:255
   if(poch(i) < 0)
      temp = 1;
   end
   if(x > 0)
      break
   end
   if(temp && poch(i) > 0)
      x = i;
   end
end
tekst = ['Próg binaryzacji: ', num2str(x)];
disp(tekst)

%% 3.3 Binaryzacja obrazu
obrazBin = zeros(size(obrazGray));
for i = 1:size(obrazGray,1)
   for j = 1:size(obrazGray,2)
      if(obrazGray(i,j) < 40)
         obrazBin(i,j) = 0;
      else
         obrazBin(i,j) = 1;
      end
   end
end

imageview(obrazBin)
%title('Zbinaryzowany obraz')

%% 4.1 Binaryzacja obrazu za pomoc¹ biblioteki OpenCV

obrazBinOtsu = cv.threshold(obrazGray, 'Otsu');
imageview(obrazBinOtsu)
%title('Zbinaryzowany obraz z u¿yciem metody Otsu')

%% 5 Wp³yw sposobu konwersji do skali szaroœci 
%na binaryzacjê metod¹ otsu

%% 5.1 XYZ
obrazXYZ = cv.cvtColor(obraz, 'RGB2XYZ');
obrazGrayXYZ = cv.cvtColor(obrazXYZ,'RGB2GRAY');
obrazBinOtsuXYZ = cv.threshold(obrazGrayXYZ, 'Otsu');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(XYZ) z u¿yciem metody Otsu')
subplot(1,2,1)
image(obrazXYZ)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinOtsuXYZ)
colormap(gray(256))
pbaspect([1 1 1])

%% 5.2 LAB
obrazLAB = cv.cvtColor(obraz, 'RGB2Lab');
obrazGrayLAB = cv.cvtColor(obrazLAB,'RGB2GRAY');
obrazBinOtsuLAB = cv.threshold(obrazGrayLAB, 'Otsu');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(Lab) z u¿yciem metody Otsu')
subplot(1,2,1)
image(obrazLAB)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinOtsuLAB)
colormap(gray(256))
pbaspect([1 1 1])

%% 5.3 HLS
obrazHLS = cv.cvtColor(obraz, 'RGB2HLS');
obrazGrayHLS = cv.cvtColor(obrazHLS, 'RGB2GRAY');
obrazBinOtsuHLS = cv.threshold(obrazGrayHLS, 'Otsu');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(HLS) z u¿yciem metody Otsu')
subplot(1,2,1)
image(obrazHLS)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinOtsuHLS)
colormap(gray(256))
pbaspect([1 1 1])

%% 5.4 HSV
obrazHSV = cv.cvtColor(obraz, 'RGB2HSV');
obrazGrayHSV = cv.cvtColor(obrazHSV, 'RGB2GRAY');
obrazBinOtsuHSV = cv.threshold(obrazGrayHSV, 'Otsu');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(HSV) z u¿yciem metody Otsu')
subplot(1,2,1)
image(obrazHSV)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinOtsuHSV)
colormap(gray(256))
pbaspect([1 1 1])

%% 6 Wp³yw sposobu konwersji adaptacyjnej do skali szaroœci 
%na binaryzacjê metod¹ otsu

%% 6.1 XYZ Mean
obrazXYZ = cv.cvtColor(obraz, 'RGB2XYZ');
obrazGrayXYZ = cv.cvtColor(obrazXYZ,'RGB2GRAY');
obrazBinAdaptMeanXYZ = cv.adaptiveThreshold(obrazGrayXYZ, 'Method', 'Mean');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(XYZ) z u¿yciem metody adaptacyjnej "Mean"')
subplot(1,2,1)
image(obrazXYZ)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinAdaptMeanXYZ)
colormap(gray(256))
pbaspect([1 1 1])

%% 6.2 XYZ Gaussian
obrazXYZ = cv.cvtColor(obraz, 'RGB2XYZ');
obrazGrayXYZ = cv.cvtColor(obrazXYZ,'RGB2GRAY');
obrazBinAdaptGausXYZ = cv.adaptiveThreshold(obrazGrayXYZ, 'Method', 'Gaussian');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(XYZ) z u¿yciem metody adaptacyjnej "Gaussian"')
subplot(1,2,1)
image(obrazXYZ)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinAdaptGausXYZ)
colormap(gray(256))
pbaspect([1 1 1])

%% 6.3 LAB Mean
obrazLAB = cv.cvtColor(obraz, 'RGB2Lab');
obrazGrayLAB = cv.cvtColor(obrazLAB,'RGB2GRAY');
obrazBinAdaptMeanLAB = cv.adaptiveThreshold(obrazGrayLAB, 'Method', 'Mean');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(Lab) z u¿yciem metody adaptacyjnej "Mean"')
subplot(1,2,1)
image(obrazLAB)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinAdaptMeanLAB)
colormap(gray(256))
pbaspect([1 1 1])

%% 6.4 LAB Gaussian
obrazLAB = cv.cvtColor(obraz, 'RGB2Lab');
obrazGrayLAB = cv.cvtColor(obrazLAB,'RGB2GRAY');
obrazBinAdaptGausLAB = cv.adaptiveThreshold(obrazGrayLAB, 'Method', 'Gaussian');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(Lab) z u¿yciem metody metody adaptacyjnej "Gaussian"')
subplot(1,2,1)
image(obrazLAB)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinAdaptGausLAB)
colormap(gray(256))
pbaspect([1 1 1])

%% 6.5 HLS Mean
obrazHLS = cv.cvtColor(obraz, 'RGB2HLS');
obrazGrayHLS = cv.cvtColor(obrazHLS, 'RGB2GRAY');
obrazBinAdaptMeanHLS = cv.adaptiveThreshold(obrazGrayHLS, 'Method', 'Mean');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(HLS) z u¿yciem metody adaptacyjnej "Mean"')
subplot(1,2,1)
image(obrazHLS)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinAdaptMeanHLS)
colormap(gray(256))
pbaspect([1 1 1])

%% 6.6 HLS Mean
obrazHLS = cv.cvtColor(obraz, 'RGB2HLS');
obrazGrayHLS = cv.cvtColor(obrazHLS, 'RGB2GRAY');
obrazBinAdaptGausHLS = cv.adaptiveThreshold(obrazGrayHLS, 'Method', 'Gaussian');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(HLS) z u¿yciem metody adaptacyjnej "Gaussian"')
subplot(1,2,1)
image(obrazHLS)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinAdaptGausHLS)
colormap(gray(256))
pbaspect([1 1 1])

%% 6.7 HSV Mean
obrazHSV = cv.cvtColor(obraz, 'RGB2HSV');
obrazGrayHSV = cv.cvtColor(obrazHSV, 'RGB2GRAY');
obrazBinAdaptMeanHSV = cv.adaptiveThreshold(obrazGrayHSV, 'Method', 'Mean');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(HSV) z u¿yciem metody adaptacyjnej "Mean"')
subplot(1,2,1)
image(obrazHSV)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinAdaptMeanHSV)
colormap(gray(256))
pbaspect([1 1 1])

%% 6.7 HSV Gaus
obrazHSV = cv.cvtColor(obraz, 'RGB2HSV');
obrazGrayHSV = cv.cvtColor(obrazHSV, 'RGB2GRAY');
obrazBinAdaptGausHSV = cv.adaptiveThreshold(obrazGrayHSV, 'Method', 'Gaussian');
figure('Name', 'Zbinaryzowany obraz w skali szaroœci(HSV) z u¿yciem metody adaptacyjnej "Gaussian"')
subplot(1,2,1)
image(obrazHSV)
pbaspect([1 1 1])
subplot(1,2,2)
image(obrazBinAdaptGausHSV)
colormap(gray(256))
pbaspect([1 1 1])
