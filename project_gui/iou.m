function [TP,FP,FN] = iou(data2,frameNo)
    
    path1 = "../mot/car/001/gt/gt_centroid.txt";
    
    data1 = load(path1);
    
    TP = 0;
    FP = 0;
    FN = 0;
    
    for m = 1:size(data2)
        x2max = data2(m,1)+data2(m,3)/2;
        y2max = data2(m,2)+data2(m,4)/2;
        x2min = data2(m,1)-data2(m,3)/2;
        y2min = data2(m,2)-data2(m,4)/2;
        cc = 0;
        for i = 1:size(data1)
            j1 = data1(i,1);
            if j1 == frameNo
                x1max = data1(i,3)+data1(i,5)/2;
                y1max = data1(i,4)+data1(i,6)/2;
                x1min = data1(i,3)-data1(i,5)/2;
                y1min = data1(i,4)-data1(i,6)/2;
    
                xmax = max(x1max,x2max);
                xmin = min(x1min,x2min);
                ymax = max(y1max,y2max);
                ymin = min(y1min,y2min);
    
                W = xmin+data1(i,5)+data2(m,3)-xmax;
                H = ymin+data1(i,6)+data2(m,4)-ymax;
    
                if W>0&&H>0
                    interarea = W*H;
                    unionarea = data2(m,3)*data2(m,4)+data1(i,5)*data1(i,6)-interarea;
                    iou = interarea/unionarea;
                    if iou>0.7
                        TP = TP+1;
                        cc = cc+1;
                    else
                        FP = FP+1;
                        cc = cc+1;
                    end                
                end
            end
        end
        if cc == 0
            FN = FN+1;
        end
    end

end