function [angle_rad,angle_deg] = determine_angle(statsTargets,tgt_dmm,intrinsic)
tgt_px = mean(statsTargets.BoundingBox(3:4));
z = (intrinsic(1,1)*tgt_dmm)/tgt_px;
xc = z*(statsTargets.Centroid(1)-intrinsic(1,3))/intrinsic(1,1);
angle_rad = atan2(xc,z);
angle_deg = rad2deg(angle_rad);
end

