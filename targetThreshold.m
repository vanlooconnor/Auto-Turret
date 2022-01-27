function [statsTargets,binTargets,bin] = targetThreshold(img)
minArea = 30; %minimum size that a object can be
maxArea = 300;
minEcc = 0;
maxEcc = 1;
bin = createMask(img); %Performs color thresholding
binFill = imfill(bin,'holes'); %Filling Holes in the resultant binary
binMinArea = bwareaopen(bin,minArea); %Imposes a minimum area threshold
[lbl,n] = bwlabel(binMinArea);% Labels connected componets 
stats = regionprops(lbl,'area','centroid','eccentricity'); %Calculates region properties of connected components
idx = find([stats.Area] <= maxArea &...
    [stats.Eccentricity] >= minEcc &...
    [stats.Eccentricity] <= maxEcc); %sets minimum and maximum threshold values for area and eccentricity.
statsTargets = stats(idx);%Imposes remaining property thresholding
for i = idx
binTargets{i} = lbl == i;
end
end
