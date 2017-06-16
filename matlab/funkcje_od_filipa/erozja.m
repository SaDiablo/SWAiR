function y=erozja( x )
a=size(x);
y=x;
for i=2:(a(1)-1)
    for j=2:(a(2)-1)
        if sum(sum(x((i-1):(i+1),(j-1):(j+1))))<9
            y(i,j)=0;
        end
    end
end     
end

