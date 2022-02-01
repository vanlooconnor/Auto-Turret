clear;close all;clc;
minArea = 500;
maxArea = 480*640;
minEcc = .05;
maxEcc = .95;
cam1 = webcam(1);
pause(1)
img = snapshot(cam1);

%figure(1)
imshow(img)
hold on
aimpoint = plot(320,240,'+m','MarkerSize',15);
while true
    clear targetpoint figure(1)
 img = snapshot(cam1); 
 imshow(img);
 aimpoint = plot(320,240,'+m','MarkerSize',15);
 [statsTargets,binTargets,bin] = targetThresholdYellow(img,minArea,maxArea,minEcc,maxEcc);
 targetpoint = plot(statsTargets.Centroid(1),statsTargets.Centroid(2),'+r','MarkerSize',15);
  drawnow
end