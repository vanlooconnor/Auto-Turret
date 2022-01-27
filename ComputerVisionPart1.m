cam1 = webcam(1);
img = snapshot(cam1);
pos   = [320 240];
color = {'magenta'};
figure(1)
%imshow(img)
hold on;
rbg = insertMarker(img,pos,'+','color',color,'size',10);
imshow(rbg);
%xline(320,'r')
%yline(240,'r')
while true
 img = snapshot(cam1); 
 rbg = insertMarker(img,pos,'+','color',color,'size',10);
 imshow(rbg);
 [statsTargets,binTargets,binThreshold] = targetThreshold(img);
 drawnow
end