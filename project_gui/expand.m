function expandIm = expand(TargetIm,centerLocation)
[H,W]=size(TargetIm);
resultIm=zeros(H,W);
pixelDistrubtion=[];
[Height,~]=size(centerLocation);
for centerX=1:Height
pixelDistrubtion=[];
count=1;
x=centerLocation(centerX,2);
y=centerLocation(centerX,1);
for i=x-1:x+1
    for j=y-1:y+1
        if i>=1&&i<=W&&j<=H&&j>=1
        pixelDistrubtion=[pixelDistrubtion,TargetIm(i,j)];
        count=count+1;
        end
    end
end
[~,~,muCI,~] = normfit(pixelDistrubtion);
upperBound=muCI(2);
lowerBound=muCI(1);
resultIm(x,y)=255;
found=1;
while found>0
found=0;
    for i=x-5:x+5
        for j=y-5:y+5
            if i>=1&&j>=1&&j<=W&&i<=H
            if resultIm(i,j)==255
                for u=-1:1
                    for v=-1:1
                        if (i+u)>=1&&(j+v)>=1&&(i+u)<W&&(j+v)<H
                        if resultIm(i+u,j+v)==0 && TargetIm(i+u,j+v)<upperBound && TargetIm(i+u,j+v)>lowerBound
                            resultIm(i+u,j+v)=255;
                            found=1;
                            pixelDistrubtion=[pixelDistrubtion,TargetIm(i+u,j+v)];
                        end
                            [~,~,muCI,~] = normfit(pixelDistrubtion);
                            upperBound=muCI(2);
                            lowerBound=muCI(1);
                        end
                    end
                end

            end
            end
        end
    end
end

end
resultIm=uint8(resultIm);
expandIm=resultIm;
end