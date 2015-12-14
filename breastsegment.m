clc;
clear;
close all;

%% Parameters
roi_size = 100;  % Dimension of ROI for determining direction is square with sides (2*roi_size+1)
dist = 100;      % Distance of pixels perpendicular to breast outline to check
thres = 80;

%% Skin Thickness Detection
original_img = imread('433.png');
bw_img = original_img;
gmag = imgradient(original_img);
gmag = uint8(gmag);
gmag = im2bw(gmag,0);
bw_img = bwareaopen(bw_img,50000);

se = strel('disk',10);
bw_img = imclose(bw_img,se);

edges = bwperim(bw_img);
[edge_row,edge_col] = find(edges);

[sorted_rows, temp] = sort(edge_row);
sorted_cols = edge_col(temp);
% firstpointx = min(edge_row);
% firstpointy = max(edge_col(edge_row == firstpointx));
% boundaries1 = bwtraceboundary(edges,[firstpointx,firstpointy],'S');
% boundaries2 = bwtraceboundary(edges,[firstpointx,firstpointy],'W');
% boundaries3 = bwtraceboundary(edges,[firstpointx,firstpointy],'SW');
% boundaries4 = bwtraceboundary(edges,[firstpointx,firstpointy],'NW');


% Thresholding (May change to fit external breast outline closer)
% bw_img(bw_img > 15) = 255;
% bw_img(bw_img <= 15) = 0;
% bw_img = ~bw_img;
% figure;
% imshow(bw_img);
% 
% % Eliminate Leftover holes
% bw_img = bwareaopen(bw_img,50000);
% figure;
% imshow(bw_img);
% % Generate Outside Breast Boundary
% edges = edge(bw_img,'Canny');
% [edge_row,edge_col] = find(edges);
% figure;
% imshow(edges)