% k  = 4104

FileList = dir('C:\Users\xsaardo\Desktop\fps');
N = size(FileList,1);

for k = 6592:N
    if (FileList(k).isdir == 0 && ~isempty(strfind(FileList(k).name, '.jpg')))
        imagename = FileList(k).name;
        image = imread(['C:\Users\xsaardo\Desktop\fps\' imagename]);
        imshow(image);
        userinput = input(['image - ' num2str(k)]);
        switch userinput
            case 1
                imwrite(image,['C:\Users\xsaardo\Desktop\spicd\' imagename '.png']);
            case 2
                imwrite(image,['C:\Users\xsaardo\Desktop\nonspicd\' imagename '.png']);
            case 3
                imwrite(image,['C:\Users\xsaardo\Desktop\normal\' imagename '.png']);
            case 4
                imwrite(image,['C:\Users\xsaardo\Desktop\nothelpful\' imagename '.png']);
        end
    end
end
