%ChenxinHu 22961779
oriIm=imread("./lego1.png");
subplot(3,3,1);
imshow(oriIm);
title('original image');
grayIm=rgb2gray(oriIm);%turn original image into grayscale image

subplot(3,3,2);
imshow(grayIm);
title('gary image');

subplot(3,3,3);
imhist(oriIm);%show histogram of the image
title('histgram');


subplot(3,3,4);
threhold=graythresh(grayIm);%try to apply ostu, but the result is not ideal
threhold=0.62;%threhold use ostu should be 0.415, but it doesn't works well
%so use 0.62 according to the histgram
bwIm=imbinarize(grayIm,threhold);%binarize the image
imshow(bwIm)
title(['binarized image using otsu therhold: ',num2str(threhold,3)]);


SE=strel('square',4);%use square, cause there's many rectengle shaped objects

subplot(3,3,5);
erodeIm=imerode(bwIm,SE);%erode image
imshow(erodeIm);
title('eroded image');

subplot(3,3,6);
dilateIm=imdilate(bwIm,SE);%dilate image
imshow(dilateIm);
title('dilated image');

subplot(3,3,7)
closeIm=imclose(bwIm,SE);%close image for counting objects
imshow(closeIm);
title('closed image');

[labeled, numObjects]=bwlabel(~closeIm,8);%count number of objects

disp(numObjects);%show number of objects in console
