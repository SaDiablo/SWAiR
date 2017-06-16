function y=binaryzacja(x)
x=x(:);
for i=1:length(x)
	if x>150
        x=1;
    else
        x=0;
    end
end
y=x;
end

    