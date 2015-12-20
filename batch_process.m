clc; close all; clear;

% Choose correct file seperator ('\');
sep = filesep;

directory = 'C:\Users\xsaardo\Desktop\Skin Thickening\Images\';
FileList = dir(directory);
N = size(FileList,1);

for k = 1:N
    [pathstr, name, ext] = fileparts([directory sep FileList(k).name]);
    if strcmp(ext,'.png') == 1
       plotskinlayers([pathstr name ext]);
       
    end
end