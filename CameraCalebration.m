%% Part 1 Collect calibration images
cam1 = webcam(1);
for i = 1:10
pause
dist = input('Enter Approx. Distance to checkerboard:','s');
im = snapshot(cam1);
img_num=i;
img_name = ['C:\Users\m236450\Downloads\Classes\EW309\CalImg\',num2str(img_num),'.png'];
%imwrite(im,img_name,['Image #: ' num2str(img_num) ',Approx. distance to checkerboard : ' dist ',' datestr(now)]) ;
imwrite(im,img_name, 'Commit', ['Image#: ' num2str(img_num)  'Approx dist to board: '  dist   ','   datestr(now)]);
end  
%% Part 2
imds = imageDatastore('C:\Users\m236450\Downloads\Classes\EW309\CalImg\','FileExtensions','.png'); % creates aimage data store from a desired folder
%Files paths will change between user
%% Part 3
[imagePoints,boardSize] = detectCheckerboardPoints(imds.Files(:)); %Detect the checkerboard corners in every calibration image .
squareSize = 50; %Generate the world coordinates of the checkerboard corners in thepattern - centric coordinate system , with the upper - left corner at (0 ,0).
worldPoints = generateCheckerboardPoints(boardSize, squareSize);
imageSize = [imfinfo(imds.Files{1}).Height,imfinfo(imds.Files{1}).Width]; %Calibrate the camera 
cameraParams = estimateCameraParameters(imagePoints,worldPoints, 'ImageSize',imageSize);
intrinsic = cameraParams.IntrinsicMatrix';%Extract the intrinsic matrix
%% Part 4