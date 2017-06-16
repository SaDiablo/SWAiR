function z=montecarrlo(x,y)
x=x(:);
a=floor(length(x)*y/100)
z=0;
for i=1:a
    b=floor(rand*length(x));
    if x(b)==1;
        z=z+1;
    end
end
z=z*100/y;