function [res_rects, res_centroids] = morCues(expandIm) 
    [H,W] = size(expandIm);
    bw_img = logical(expandIm);
    [L,num] = bwlabel(bw_img,8);
    %Debug only
    %figure(2),imshow(L);
    %hold on
    %plot(centerLocation(:,1),centerLocation(:,2),'b*')
    %hold off
    majorAxis = [];
    ecce = [];
    areaCC = [];
    for labels = 1:num
        C = [];
        cc = 0;
        for i = 1:H
            for j = 1:W
                if L(i,j) == labels
                    C = [C;i,j];
                    cc = cc+1;
                end
            end
        end
        mu = mean(C);

        if size(C) > 1
            for i = 1:size(C)            
                C(i,1) = C(i,1) - mu(1);
                C(i,2) = C(i,2) - mu(2);
            end
            sumC = (C'*C)/(cc-1);
            [~,D] = eig(sumC);
            majorAxis = [majorAxis,max(sqrt(D(1,1)),sqrt(D(2,2)))];
            ecce = [ecce,sqrt(1-min(D(1,1),D(2,2))/max(D(1,1),D(2,2)))];
            areaCC = [areaCC,cc];
        else
            majorAxis = [majorAxis,0];
            ecce = [ecce,1];
            areaCC = [areaCC,cc];
        end
        
    end
    
    tempArray = [];
    count = 1;
    for labels = 1:num
        if majorAxis(labels) < 2 && ecce(labels) > 0.8 && areaCC(labels) < 3
            tempArray(count,1) = labels;
            %debug only
            %tempArray(count,2) = majorAxis(labels);
            %tempArray(count,3) = ecce(labels);
            %tempArray(count,4) = areaCC(labels);
            count = count + 1;
        end
    end
    n = size(tempArray,1);
    %debug only
    %cc4final = 1;
    %finalArray = [];
    finalIm = zeros(H,W);
    for m = 1 : n
        found = 0;
        for i = 1 : H
            for j = 1 : W               
                if L(i,j) == tempArray(m,1)
                    finalIm(i,j) = 1;
                    found = 1;
                end          
            end
        end
        %For debug
        %if found == 1
        %    finalArray(cc4final,1) = tempArray(m,1);
        %    finalArray(cc4final,2) = tempArray(m,2);
        %    finalArray(cc4final,3) = tempArray(m,3);
        %    finalArray(cc4final,4) = tempArray(m,4);
        %    cc4final = cc4final+1;
        %end
    end
    finalIm = logical(finalIm);
    hBlob = vision.BlobAnalysis('AreaOutputPort',false);
    [centroid,bbox] = hBlob(finalIm);
    res_centroids = centroid;
    res_rects = bbox;
end