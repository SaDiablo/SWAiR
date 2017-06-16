function y = obliczanielancucha( x )
x=detekcjakrawedzi(x)
[u,v]=find(x);
uv=[u,v];
directions = [ 0 1; 1 1; 1 0; 1 -1; 0 -1; -1 -1; -1 0; -1 1];
pt=uv(1,:);
code=[];
dir=7;
while(1)
    newpt=pt+directions(dir+1,:);
    if sum(newpt(1)==u&newpt(2)==v)
        code=[code,dir];
        pt=newpt;
        dir=mod(dir-2,8);
    else
        dir=mod(dir+1,8);
    end
    if pt(1)==u(1)&&pt(2)==v(1)&& dir==7
        break
    end
        
        
    
end
y=code; 