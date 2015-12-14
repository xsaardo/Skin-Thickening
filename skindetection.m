testimage = imread('C:\Users\xsaardo\Desktop\M00002_42444486_t3_20150212_145832_R_CC_Cancer_R_Cancer_focal-asymmetry_Invasive-ductal-carcinoma_ct_0_dns_2.dcm.jpg');

thres = im2bw(testimage,graythresh(testimage));
grad = imgradient(testimage);

thresgrad = graythresh(grad);
a = im2bw(grad,thresgrad);

str = strel('disk',10);
dilated = imdilate(a,str);
dilated = imdilate(dilated,str);

[gmag gangle] = imgradient(dilated);
[row,col] = find(logical(gmag)==1);

mask1 = ones(1,size(gmag,2));
mask2 = zeros(5,size(gmag,2));
mask = [mask1;mask2];
mask3 = [];

while size(mask3,1) < size(gmag,1)
   mask3 = [mask3;mask];
end

mask3 = mask3(1:size(gmag,1),:);

%edgemap = edge(uint8(dilated),'Canny');



%[row, col] = find(edgemap == 1);
% for i = row
%     for j = col
%         while thres(row,coll) == 1
%             coll = coll + 1;
%         end
%         
%     end
% end