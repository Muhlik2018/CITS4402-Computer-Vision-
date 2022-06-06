function resultIm = imAnd(im1,im2)
%IMAND 此处显示有关此函数的摘要
%   此处显示详细说明
    tempIm=[];
    [H,W]=size(im1);
    for i=1:H
        for j=1:W
            if im1(i,j)==im2(i,j) && im1(i,j)~=0
                tempIm(i,j)=im1(i,j);
            else
                tempIm(i,j)=0;
            end
        end
    end
    tempIm=uint8(tempIm);
    resultIm=tempIm;
end

