function [im,targetim] = loadDir(floderPath,num)
    floderPath=[floderPath,'\'];
    prefix='000';
    suffix='.jpg';
    BeforeIm=im2gray(imread([floderPath,prefix,num2str(num,'%03d'),suffix]));
    TargetIm=im2gray(imread([floderPath,prefix,num2str(num+10,'%03d'),suffix]));
    AfterIm=im2gray(imread([floderPath,prefix,num2str(num+20,'%03d'),suffix]));
    tempIm1=caculateDiff(TargetIm,BeforeIm);
    tempIm2=caculateDiff(TargetIm,AfterIm);
    im=imAnd(tempIm1,tempIm2);
    targetim = TargetIm;
end

