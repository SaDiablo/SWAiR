function y=obliczwspolczynnikblairablissa(x)
s=obliczaniepola(x);
a=size(x)
b=obliczsroedekciezkosci(x)
y=0;
for i=1:a(1)
    for j=1:a(2)
        if x(i,j)==1;
           k=b(1)-i;
           l=b(2)-j
           y=y+k*k+l*l
        end
    end
end
y=s/(2*3.14*y)