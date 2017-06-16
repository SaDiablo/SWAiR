function y=zmniejszeniebitowdlaRGB(obraz,R,G,B)

Rx = 256 / 2^R;
Rx = 256 / 2^G;
Rx = 256 / 2^B;

x(:,:,1)=x(:,:,1)/8;
x(:,:,2)=x(:,:,2)/2;
x(:,:,3)=x(:,:,3)/16;
x=floor(x);
x(:,:,1)=x(:,:,1)*8;
x(:,:,2)=x(:,:,2)*2;
x(:,:,3)=x(:,:,3)*16;
y=x;
end