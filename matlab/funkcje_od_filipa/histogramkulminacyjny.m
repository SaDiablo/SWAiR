function y=histogramkulminacyjny(x)
hist=zeros(256,1);
img=x(:,:,1);
imo=img(:);
for i=1:length(imo)
    hist(imo(i)+1)=hist(imo(i)+1)+1;
end
for i=2:256
    hist(i)=hist(i-1)+hist(i)
end
y=hist;
bar(hist)