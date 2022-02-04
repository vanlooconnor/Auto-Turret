function [statsTargets,binTargets,bin] = targetThresholdYellow2(img,minArea,maxArea,minEcc,maxEcc)

bin = createMaskYellow2(img); %Performs color thresholding
binFill = imfill(bin,'holes'); %Filling Holes in the resultant binary
binMinArea = bwareaopen(binFill,minArea); %Imposes a minimum area threshold
[lbl,n] = bwlabel(binMinArea);% Labels connected componets 
stats = regionprops(lbl,'area','centroid','eccentricity','BoundingBox'); %Calculates region properties of connected components
idx = find([stats.Area] <= maxArea &...
    [stats.Eccentricity] >= minEcc &...
    [stats.Eccentricity] <= maxEcc); %sets minimum and maximum threshold values for area and eccentricity.
statsTargets = stats(idx);%Imposes remaining property thresholding
    if idx ~= 0
        for i = 1:idx
            binTargets{i} = lbl==i;
        end
    else
       binTargets = 0;   
    end
end