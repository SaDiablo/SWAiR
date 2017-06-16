function  y= czyszczeniebrzegow(x)
z=x;
z(2:end-1,2:end-1)=0;
a=0;
while (a==0)
z1=dylatacja(z)&x;
if z1==z;
    a=1;
end
z=z1;
end
y=logical(x-z);
