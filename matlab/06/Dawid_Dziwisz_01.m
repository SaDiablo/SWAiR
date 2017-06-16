%% Lab 6 - Analiza cech tekstur
% podpunkty 1-3
ob1_norm = imread('H01.png');
ob2_norm = imread('H02.png');
ob3_norm = imread('H03.png');
ob4_norm = imread('H04.png');
ob5_norm = imread('C05.png');
ob6_norm = imread('C06.png');
%% 2.1 Macierze glcm

ob1_glcm = glcm(ob1_norm);
ob2_glcm = glcm(ob2_norm);
ob3_glcm = glcm(ob3_norm);
ob4_glcm = glcm(ob4_norm);
ob5_glcm = glcm(ob5_norm);
ob6_glcm = glcm(ob6_norm);

%% 3.1 Cechy Haralicka

ob1_ang = AngScMom(ob1_glcm);
ob1_cont = Contrast(ob1_glcm);
tekst1_1 = ['Obraz 1 - Drugi moment k¹towy(Energia): ', num2str(uint64(ob1_ang))];
tekst1_2 = ['Obraz 1 - Kontrast: ', num2str(uint64(ob1_cont))];
disp(tekst1_1)
disp(tekst1_2)

ob2_ang = AngScMom(ob2_glcm);
ob2_cont = Contrast(ob2_glcm);
tekst2_1 = ['Obraz 2 - Drugi moment k¹towy(Energia): ', num2str(uint64(ob2_ang))];
tekst2_2 = ['Obraz 2 - Kontrast: ', num2str(uint64(ob2_cont))];
disp(tekst2_1)
disp(tekst2_2)

ob3_ang = AngScMom(ob3_glcm);
ob3_cont = Contrast(ob3_glcm);
tekst3_1 = ['Obraz 3 - Drugi moment k¹towy(Energia): ', num2str(uint64(ob3_ang))];
tekst3_2 = ['Obraz 3 - Kontrast: ', num2str(uint64(ob3_cont))];
disp(tekst3_1)
disp(tekst3_2)

ob4_ang = AngScMom(ob4_glcm);
ob4_cont = Contrast(ob4_glcm);
tekst4_1 = ['Obraz 4 - Drugi moment k¹towy(Energia): ', num2str(uint64(ob4_ang))];
tekst4_2 = ['Obraz 4 - Kontrast: ', num2str(uint64(ob4_cont))];
disp(tekst4_1)
disp(tekst4_2)

ob5_ang = AngScMom(ob5_glcm);
ob5_cont = Contrast(ob5_glcm);
tekst5_1 = ['Obraz 5 - Drugi moment k¹towy(Energia): ', num2str(uint64(ob5_ang))];
tekst5_2 = ['Obraz 5 - Kontrast: ', num2str(uint64(ob5_cont))];
disp(tekst5_1)
disp(tekst5_2)


ob6_ang = AngScMom(ob6_glcm);
ob6_cont = Contrast(ob6_glcm);
tekst6_1 = ['Obraz 6 - Drugi moment k¹towy(Energia): ', num2str(uint64(ob6_ang))];
tekst6_2 = ['Obraz 6 - Kontrast: ', num2str(uint64(ob6_cont))];
disp(tekst6_1)
disp(tekst6_2)

%%
ang = [ob1_ang; ob2_ang; ob3_ang; ob4_ang; ob5_ang; ob6_ang]; 
cont = [ob1_cont; ob2_cont; ob3_cont; ob4_cont; ob5_cont; ob6_cont];

figure(1)
plot(ang, cont,'MarkerSize',15,'Marker','x','LineStyle','none')
xlim([0 2500000000000]);
ylim([50000000 800000000000]);

%%
ang = [ob2_ang; ob3_ang; ob4_ang; ob5_ang; ob6_ang]; 
cont = [ob2_cont; ob3_cont; ob4_cont; ob5_cont; ob6_cont];
figure(2)
plot(ang, cont,'MarkerSize',15,'Marker','x','LineStyle','none')
xlim([0 18000000000]);
ylim([50000000000 300000000000]);