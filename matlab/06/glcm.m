function [glcm] = glcm( ob_norm )
%Opis funkcji:
%   transformacja do glcm ze zwyk³ego obrazu

ob_grey = cv.cvtColor(ob_norm, 'RGB2GRAY');
glcm = zeros(256);
y = size(ob_grey,1);
x = size(ob_grey,2);
for i = 1 :  y - 1
    for j = 1 : x
        temp = ob_grey(i,j);
        temp1 = ob_grey(i+1,j);
        glcm(temp+1,temp1+1) = glcm(temp+1,temp1+1) + 1;   
    end
end
end

