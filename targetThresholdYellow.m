function [statsTargets,binTargets,bin] = targetThresholdYellow(img,minArea,maxArea,minEcc,maxEcc)

bin = createMaskYellow(img); %Performs color thresholding
binFill = imfill(bin,'holes'); %Filling Holes in the resultant binary
binMinArea = bwareaopen(binFill,minArea); %Imposes a minimum area threshold
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