function y=obliczwspolczynnikharalicka(x)
x1=detekcjakrawedzi(x)
a=size(x)
b=obliczsroedekciezkosci(x)
y=0;
y1=0;
y2=0
for i=1:a(1)
    for j=1:a(2)
        if x1(i,j)==1;
           k=b(1)-i;
           l=b(2)-j
           y=y+k*k+l*l
           y1=y1+(k*k+l*l)^(1/2)
           y2=y2+1
        end
    end
end
y=(y1*y1/(y2*y-1))^(1/2)