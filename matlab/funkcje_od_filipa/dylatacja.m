function y=dylatacja( x )
a=size(x);
y=x;
for i=2:(a(1)-1)
    for j=2:(a(2)-1)
        if sum(sum(x((i-1):(i+1),(j-1):(j+1))))>0
            y(i,j)=1;
        end
    end
end     
end

