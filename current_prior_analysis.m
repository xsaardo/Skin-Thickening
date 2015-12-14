clc; clear; 

[right_img, right_dir] = uigetfile('*.dcm','Select Right image','C:\Users\Behnam\Desktop\Mstudy2_part2\');
[left_img, left_dir] = uigetfile('*.dcm','Select Left image','C:\Users\Behnam\Desktop\Mstudy2_part2\');

[right_skininfo,img1] = skin([right_dir, right_img]);
right_thickness = thickness_smoothing(right_skininfo);
[left_skininfo,img2] = skin([left_dir, left_img]);
left_thickness = thickness_smoothing(left_skininfo);

figure;
plotskinlayers(right_skininfo,right_dir,right_img,right_thickness);
savefig([right_dir right_img '.fig']);

figure;
plotskinlayers(left_skininfo,left_dir,left_img,left_thickness);
savefig([left_dir left_img '.fig']);

right_thickness(right_thickness == 0) = [];
left_thickness(left_thickness == 0) = [];
mean_right = mean(right_thickness);
mean_left = mean(left_thickness);

figure;
plot(right_thickness);
hold on;
plot(left_thickness);
legend('Right','Left');
title(['Mean Left = ' num2str(mean_left) 'Mean Right = ' num2str(mean_right)]);
savefig([right_dir 'CC' 'Thickness_left_right' '.fig']);