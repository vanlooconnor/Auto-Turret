%% Set Up Camera and Program
clear;close all;clc;
cam1 = webcam(1);
cam1.Brightness=35;
cam1.Saturation=40;
pause(1)
%% Input Arguments
minArea = 800;
maxArea = 2500;
minEcc = .25;
maxEcc = .75;
tgt_dmm = 152.2; %~6in target
load('intrinsic.mat')
%% Start Tracking
%img = snapshot(cam1);
%figure(1)
%imshow(img)
%hold on
%aimpoint = plot(320,240,'+m','MarkerSize',15);
while true
    img = snapshot(cam1); 
    imshow(img);
    hold on
    aimpoint = plot(320,240,'+m','MarkerSize',15);
    [statsTargets,binTargets,bin] = targetThresholdYellow(img,minArea,maxArea,minEcc,maxEcc);
       i = 1;
    if  size(binTargets) ~= 0
        for i = 1:size(binTargets)   
             targetpoint(i) = plot(statsTargets.Centroid(1),statsTargets.Centroid(2),'+r','MarkerSize',15);
        end 
    end
       drawnow
      [angle_rad,angle_deg]=determine_angle(statsTargets,tgt_dmm,intrinsic);
end