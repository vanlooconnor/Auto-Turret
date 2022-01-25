cam1 = webcam(2);
img = snapshot(cam1);
figure(1)
imshow(img)
hold on
xline(320,'r')
yline(240,'r')
while true
 %tic
 img = snapshot(cam1); 
 imshow(img)
 drawnow
 %toc
 %FPS = 1/(tic-toc);
 %Text = 'Frames per second: %f\n';
%fprintf(Text,FPS)
end
