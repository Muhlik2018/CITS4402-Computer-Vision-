classdef dataloader
    properties
        filename = [];
        pathname = [];
    end
    methods
        function loader = dataloader()
        end
        function [im,targetim] = loadDir(obj,floderPath,num)
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

        function data1 = loadGT(obj, filename, pathname)
            data1 = load([pathname,filename]);
        end
    end
end