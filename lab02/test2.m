%ChenxinHu 22961779 lab02
lpOriIm=im2gray(imread("./mccain.jpg"));%read graph and turn it to gray
subplot(3,3,1),imshow(lpOriIm);
title('lowpass original image');


lpFFT = fft2(lpOriIm);%do fourier transform
lpShift=fftshift(lpFFT);%swap quadrants
lpS=log(1+abs(lpShift));%asure it not too big and none-negative
subplot(3,3,2),imshow(lpS,[]);%re-scaling the matrix to display
title('original image spectrum');


%filter should have the same size as the image
lpfilter=lowpassfilter([349,258],0.1,2);% keep on using 0.4 results in bad filter, so change to 0.1

lowPassTemp1=lpFFT.*lpfilter;%apply filter
lpSTemp=log(1+abs(fftshift(lowPassTemp1)));%display the transformed matrix
subplot(3,3,3),imshow(lpSTemp,[]);
title('smoothed image spectrum');


lowPassTemp2=lowPassTemp1;
lpIm=uint8(real(ifft2(lowPassTemp2)));%do the inverse fourier transform to the result matrix
subplot(3,3,4),imshow(lpIm);
title('smoothed image');


%Repeat the Procedure for highpass image%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Repeat the Procedure for high pass image%
hpOriIm=im2gray(imread("./obama.jpg"));%read graph and turn it to gray
subplot(3,3,5),imshow(hpOriIm);
title('highpass original image');


hpFFT = fft2(hpOriIm);%do fourier transform
hpShift=fftshift(hpFFT);%swap quadrants
hpS=log(1+abs(hpShift));%asure it not too big and none-negative
subplot(3,3,6),imshow(hpS,[]);%re-scaling the matrix to display
title('original image spectrum');


hpfilter=highpassfilter([349,258],0.0125,20);
%using 0.0125,and obama says: hey! watch my teeth!

highPassTemp1=hpFFT.*hpfilter;
hpSTemp=log(1+abs(fftshift(highPassTemp1)));
subplot(3,3,7),imshow(hpSTemp,[]);
title('sharpened image spectrum');


highPassTemp2=highPassTemp1;
hpIm=uint8(real(ifft2(highPassTemp2)));
subplot(3,3,8),imshow(hpIm);
title('sharpened image');



%Hybrid image! Add the high pass singnal and low pass singnal
hybridIm=imadd(lpIm,hpIm);
subplot(3,3,9),imshow(hybridIm);
title('hybrid image');







