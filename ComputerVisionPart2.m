%cam1 = webcam(2);
%img = snapshot(cam1);
%figure(1)
%imshow(img)
%hold on
%xline(320,'r')
%yline(240,'r')
%colorThresholder(img);
%bin = createMask(img); %Using A Color Thresholding Function
%binFill = imfill(bin,'holes'); % Filling Holes
minArea = 30; %minimum size that a object can be
binMinArea = bwareaopen(bin,minArea);%Minimum Area Thresholding