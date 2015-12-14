function [] = plotskinlayers(skin_info,current_dir,current_img,thickness)
% original_img = dicomread([current_dir current_img]);
original_img = imread([current_dir current_img '.png']);
edge_col = skin_info(:,1);
edge_row = skin_info(:,2);
newdirs = skin_info(:,3:4);

new_skin_x = edge_col + thickness.*newdirs(:,1);
new_skin_y = edge_row + thickness.*newdirs(:,2);

imshow(original_img,[]);
hold on;
plot(edge_col,edge_row,'.');
scatter(new_skin_x, new_skin_y,'x');
% quiver(edge_col,edge_row,newdirs(:,1),newdirs(:,2));
end