%  Approaches:
    
%  HSV approach: check all pixels in hsv image, if h value in range [lowerThreshold, upperThreshold]
%  set the pixel to black, else set the value to white

%  RGB approach: check all pixels in rgb image, if r+g+b in range
%  [lowerThreshold, upperThreshold]*3*255
%  set the pixel to black, else set the value to white

% Experiment Values

%  iris-2: Upper Threshold: 1; Lower Threshold: 0.2
%  pepper: Upper Threshold: 0.64; Lower Threshold:0.15