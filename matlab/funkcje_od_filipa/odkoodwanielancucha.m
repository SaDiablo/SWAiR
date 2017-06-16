function y=odkodowanielancucha(x)
directions = [ 0 1; 1 1; 1 0; 1 -1; 0 -1; -1 -1; -1 0; -1 1];
a=zeros(140,300)
v=50;
w=50;
a(50,50)=1
for i=1:length(x)
    v=v+directions(x(i)+1,1)
   w=w+directions(x(i)+1,2)
    a(v,w)=1;
end
y=logical(a)