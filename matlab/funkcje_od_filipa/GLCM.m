function y=GLCM(x)
a=max(max(x))
y=zeros(a,a)
for i=2:a
    for j=1:a
        y(x(j,i)+1,x(j,i-1)+1)=y(x(j,i)+1,x(j,i-1)+1)+1;
    end
end
    