clear;close all;clc;
minArea = 50;
maxArea = 480*640;
minEcc = 0;
maxEcc = 1;
cam1 = webcam(1);
img = snapshot(cam1);

figure(1)
imshow(img)
hold on;
aimpoint = plot(320,240,'+m','MarkerSize',15);

while true
 img = snapshot(cam1); 
 imshow(img);
 hold on 
 aimpoint = plot(320,240,'+m','MarkerSize',15);
 [statsTargets,binTargets,binThreshold] = targetThreshold(img,minArea,maxArea,minEcc,maxEcc);
 drawnow
end