clc; close all; clear;

% Choose correct file seperator ('\');
sep = filesep;

directory = 'C:\Users\xsaardo\Dropbox\CureMetrix\Skin Thickening\';
FileList = dir(directory);
N = size(FileList,1);

for k = 1:N
    [pathstr, name, ext] = fileparts([directory sep FileList(k).name]);
    if strcmp(ext,'.png') == 1
        plotskinlayers([pathstr name ext]);
       
        close all;
    end
end