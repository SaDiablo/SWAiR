function y=obliczwspolczynnikmalinowskiej(x)
l=obliczobwod(x);
s=obliczaniepola(x);
y=l/(2*(3.14*s)^(1/2))-1;