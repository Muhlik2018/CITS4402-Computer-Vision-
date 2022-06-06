function [res_rects, res_centroids] = morCues(expandIm,centerLocation)    
    T = graythresh(expandIm);
    bw_img = imbinarize(expandIm, T);

    img_reg = regionprops(bw_img,'MajorAxisLength', 'Eccentricity', ...
        'boundingbox', 'Extent', 'Centroid','Area');
    
    rects = cat(1,  img_reg.BoundingBox);
    majorAxis = cat(1,  img_reg.MajorAxisLength);
    ecce = cat(1,  img_reg.Eccentricity);
    extent = cat(1,  img_reg.Extent);
    centroids = cat(1,  img_reg.Centroid);
    area = cat(1,  img_reg.Area);
    count = 1;
    res_rects = [];
    res_centroids = [];
    %figure(3),imshow(expandIm);
    for i = 1:size(rects, 1)
        if extent(i) < 0.8 && majorAxis(i) > 5 && majorAxis(i) < 12 && ecce(i) > 0.5 && area(i) < 40 && area(i) > 1
            rectangle('position', rects(i, :), 'EdgeColor', 'r');
            res_rects(count, :) = rects(i, :);
            res_centroids(count, :) = round(centroids(i, :));
            count = count + 1;
        end        
    end
end