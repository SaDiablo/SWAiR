function [ ang ] = AngScMom( glcm )
%AngScMom
%   Calculating AngScMom from glcm matrix

ang = zeros;
for j = 1 : 1 : 256
    for i = 1 : 1 : 256
        ang = ang + glcm(i,j)^2;
    end
end

end

