function b = numerujfigury(a)
[row,col]=size(a);
visited=false(size(a));
index=1;
b=zeros(size(a));
for i=1:row
    clc; fprintf('Progress: %3.1f%%',i/row*100);
    for j=1:col
        if a(i,j)==0 
            visited(i,j)=true;
            continue
        elseif visited(i,j)==true
                continue
        else
            stos=[i,j];
            while ~isempty(stos)
                loc=stos(1,:);
                stos(1,:)=[];
                if visited(loc(1),loc(2))
                    continue;
                end
                visited(loc(1),loc(2))=true;
                b(loc(1),loc(2))=index;
                for m=loc(1)-1:loc(1)+1
                    for n=loc(2)-1:loc(2)+1
                        if m<1||n<1||n>col||m>row||visited(m,n)||a(m,n)==0
                            continue
                        end
                        stos=[stos;[m,n]];
                    end
                end
            end
            index=index+1;  
        end    
    end
end

