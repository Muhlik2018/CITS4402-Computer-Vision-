
floderPath="H:/Cv/mot/car/010/img/";
prefix="000";
suffix=".jpg";
BeforeIm=im2gray(imread(floderPath+"000001"+suffix));
TargetIm=im2gray(imread(floderPath+"000011"+suffix));
AfterIm=im2gray(imread(floderPath+"000021"+suffix));
tempIm1=caculateDiff(TargetIm,BeforeIm);
tempIm2=caculateDiff(TargetIm,AfterIm);
tempIm3=imAnd(tempIm1,tempIm2);
subplot(3,3,1),imshow(TargetIm);
title('tragetIm');
subplot(3,3,2),imshow(tempIm1);
title('im1-im2 using 95% confidence');
subplot(3,3,3),imshow(tempIm2);
title('im1-im2 using 95% confidence');
subplot(3,3,4),imshow(tempIm3);
title('im1-im0 && im1-im2');

centerLocation=caculateCenter(tempIm3);
subplot(3,3,5),imshow(TargetIm);
title('detect center');
hold on
plot(centerLocation(:,1),centerLocation(:,2),'b*')
hold off

resultIm=expand(TargetIm,centerLocation);
subplot(3,3,6),imshow(resultIm);
title('region growing');

centerLocation=morCues(resultIm);
subplot(3,3,7),imshow(TargetIm);
title('centerloaction after morCues');
hold on
plot(centerLocation(:,1),centerLocation(:,2),'b*')
hold off


track=iniTrack(centerLocation);
nTracks = length(track);

subplot(3,3,8),imshow(TargetIm);
title('inital track');
hold on
for i = 1:nTracks
    if(track(i).death==0)
    plot(track(i).x,track(i).y,'b*')
    text(track(i).x,track(i).y,num2str(track(i).id));
    else
    plot(track(i).x,track(i).y,'r*')
    text(newtrack(i).x,newtrack(i).y,num2str(newtrack(i).id));
    end
end
hold off

BeforeIm=im2gray(imread(floderPath+"000002"+suffix));
TargetIm=im2gray(imread(floderPath+"000012"+suffix));
AfterIm=im2gray(imread(floderPath+"000022"+suffix));
tempIm1=caculateDiff(TargetIm,BeforeIm);
tempIm2=caculateDiff(TargetIm,AfterIm);
tempIm3=imAnd(tempIm1,tempIm2);
centerLocation=caculateCenter(tempIm3);
resultIm=expand(TargetIm,centerLocation);
[~,centerLocation]=morCues(resultIm);



