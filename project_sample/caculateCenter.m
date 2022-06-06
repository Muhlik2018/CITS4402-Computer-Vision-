function centerList = caculateCenter(im)
s = regionprops(im,'centroid');
centroids = cat(1,s.Centroid);
centerLocation=[];
[H,W]=size(centroids);
count=1;
for i=1:H
    if ~isnan(centroids(i,1))
        centerLocation(count,1)=round(centroids(i,1));
        centerLocation(count,2)=round(centroids(i,2));
        count=count+1;
    end
end
centerList=centerLocation;
end

