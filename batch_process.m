clc; close all; clear;

% Choose correct file seperator ('\');
sep = filesep;

directory = 'C:\Users\Behnam\Dropbox\CureMetrix\Skin Thickening\';
FileList = dir(directory);
N = size(FileList,1);

for k = 1:N
    [pathstr, name, ext] = fileparts([directory sep FileList(k).name]);
    if strcmp(ext,'.png') == 1
        skin_info = skin([pathstr name ext]);
        new_thickness = thickness_smoothing(skin_info);
%         new_thickness(new_thickness == 0) = [];
        plotskinlayers(skin_info,pathstr,name,new_thickness);
        savefig([pathstr name '_marked.fig']);
%         plot(new_thickness);
%         title(['Average Skin Thickness = ' num2str(mean(new_thickness))]);
%         savefig([pathstr name '.fig']);
        close all;
    end
end