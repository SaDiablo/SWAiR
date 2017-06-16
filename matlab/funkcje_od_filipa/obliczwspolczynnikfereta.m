function b=obliczwspolczynnikfereta(a)
[y,x]=find(a);
pion=max(y)-min(y);
poziom=max(x)-min(x);
b=pion/poziom;