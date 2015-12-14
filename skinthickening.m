close all;

FileList = dir('C:\Users\xsaardo\Desktop\Skin Thickening\');
N = size(FileList,1);

for k = 12:12
    if (FileList(k).isdir == 0)
        imagename = FileList(k).name;
        testimage = imread(['C:\Users\xsaardo\Desktop\Skin Thickening\' imagename]);
        thres = im2bw(testimage,graythresh(testimage));
        grad = imgradient(testimage);
        
        thresgrad = graythresh(grad);
        a = im2bw(grad,thresgrad);
        
%         str = strel('disk',10);
%         dilated = imdilate(a,str);
%         dilated = imdilate(dilated,str);
%         
        %[edgemap, gangle] = imgradient(a);
        %imshow(gmag);
       
        edgemap = edge(uint8(a),'Canny');
        [edge_col,edge_row] = find(edgemap);
        
        imshow(testimage);
        hold on;
        scatter(edge_row,edge_col,'.');
        %imwrite(thres,['C:\Users\xsaardo\Desktop\thresholded\' imagename]);
        %imwrite(edgemap,['C:\Users\xsaardo\Desktop\edges\' imagename]);
        
        
    end
end