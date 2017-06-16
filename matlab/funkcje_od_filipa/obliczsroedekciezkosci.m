function y=obliczsroedekciezkosci(x)
s=obliczaniepola(x);
a=size(x)
b=0;
c=0;
for i=1:a(1)
    for j=1:a(2)
        if x(i,j)==1;
            b=i+b;
            c=j+c;
        end
    end
end
b=b/s;
c=c/s;
y=[b,c];