function obrazWyjsciowy = func_02(obraz,R,G,B)

Rx = 256 / 2^R;
Gx = 256 / 2^G;
Bx = 256 / 2^B;

obraz(:,:,1) = obraz(:,:,1) / Rx;
obraz(:,:,2) = obraz(:,:,2) / Gx;
obraz(:,:,3) = obraz(:,:,3) / Bx;
obraz = floor(obraz);
obraz(:,:,1) = obraz(:,:,1) * Rx;
obraz(:,:,2) = obraz(:,:,2) * Gx;
obraz(:,:,3) = obraz(:,:,3) * Bx;
obrazWyjsciowy = obraz;
end