function resultIm= caculateDiff(imOri,imDiff)
    tempIm=[];
    distributionArray=[];
    [H,W]=size(imOri);
    for i=1:H
        for j=1:W
            tempIm(i,j)=abs(imOri(i,j)-imDiff(i,j));
            %distributionArray((i-1)*H+j)=abs(imOri(i,j)-imDiff(i,j));
        end
    end
    centerPoint=[1,1];
    while centerPoint(1,1)<=W
        while centerPoint(1,2)<=H
            distributionArray=[];
            for i = centerPoint(1,1)-15:centerPoint(1,1)+15
                for j=centerPoint(1,2)-15:centerPoint(1,2)+15
                    if(i<W&&j<H&&i>0&&j>0)
                        distributionArray=[distributionArray,tempIm(i,j)];
                    end
                end
            end
            [~,muci]= expfit(distributionArray,0.05);
            threshold=muci(2);
            for u = centerPoint(1,1)-15:centerPoint(1,1)+15
                for v=centerPoint(1,2)-15:centerPoint(1,2)+15
                    if(u<W&&v<H&&u>0&&v>0&&tempIm(u,v)<=threshold)
                        tempIm(u,v)=0;
                    end
                end
            end
         centerPoint(1,2)=centerPoint(1,2)+16;
        end
         centerPoint(1,1)=centerPoint(1,1)+16;
    end

    tempIm=uint8(tempIm);
    resultIm=tempIm;
end

