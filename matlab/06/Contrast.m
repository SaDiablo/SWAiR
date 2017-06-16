function [ contrast ] = Contrast( glcm )
%Contrast
%   Contrast from glcm matrix

contrast= zeros;
for j = 1 : 1 : 256
    for i = 1 : 1 : 256
        contrast = contrast + ((i + j)^2 * glcm(i,j));
    end
end

end

