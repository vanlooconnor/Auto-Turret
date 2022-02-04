%% Part 1
cam1 = webcam(1);
pause(1)
dist = input('Enter Approx. Distance to checkerboard:','s');
im = snapshot(cam1);
img_num=10;
img_name = ['C:\Users\m236450\Downloads\Classes\EW309\CalImg\',num2str(img_num),'.png'];
%imwrite(im,img_name,['Image #: ' num2str(img_num) ',Approx. distance to checkerboard : ' dist ',' datestr(now)]) ;
imwrite(im,img_name, 'Commit', ['Image#: ' num2str(img_num)  'Approx dist to board: '  dist   ','   datestr(now)]);
    
%% Part 2
imds = imageDatastore('C:\Users\m236450\Downloads\Classes\EW309\CalImg\','FileExtensions','.png');
%% Part 3
[imagePoints,boardSize] = detectCheckerboardPoints(imds.Files(:));
squareSize = 50;
worldPoints = generateCheckerboardPoints(boardSize, squareSize);
imageSize = [imfinfo(imds.Files{1}).Height,imfinfo(imds.Files{1}).Width];
cameraParams = estimateCameraParameters(imagePoints,worldPoints, 'ImageSize',imageSize);
intrinsic = cameraParams.IntrinsicMatrix';
%% Part 4