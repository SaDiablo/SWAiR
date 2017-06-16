function y=obliczwspolczynnikdanielssona(x)
s=obliczaniepola(x);
a=0;
i=1;
d=0;
while (a==0)
    x1=erozja(x);
    z=x-x1;
    c=sum(sum(z))
    d=d+c*i;
    i=i+1;
    if c==0;
        a=1;
    end
    x=x1;
end
y=s*s*s/d/d;