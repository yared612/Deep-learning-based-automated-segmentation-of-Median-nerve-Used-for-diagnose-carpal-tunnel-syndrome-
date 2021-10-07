close all;clear;clc;
% Day = 'nor/2012.05.17/1R1/';
c = 1372; 

path = 'F:/mid/pick_nomulti_data/images/';
save_path = 'F:/mid/CLAHE_data/images/';

firf = dir([path '*']);
long = length(firf);

for k = 3 :long
    firf1 = dir([path firf(k).name]);
    long1 = length(firf1);
    for s = 3 : long1
        firf2 = dir([path firf(k).name '/' firf1(s).name '/*.bmp']);
        long2 = length(firf2);
        for a = 1 
%             : long2
            pic_name = firf2(a).name;
            I = imread([path firf(k).name '/' firf1(s).name '/' pic_name]);
            [m,n] = size(I);
            I1 = zeros(m,n,3);
            I1(:,:,1) = I;
            I1(:,:,2) = I;
            I1(:,:,3) = I;
            I1 = adapthisteq(I1)
            figure,imshow(I1)
%             imwrite(uint8(I1),[save_path 'slight/' num2str(c) '.jpg']);
            c = c+1;
        end
%     pic_name = firf(k).name;
%     name = split(pic_name, ".");
%     ori_name = name{1};
%     I = imread([path pic_name]);
%     imshow(imgcrop)
%     imwrite(imgcrop,[save_path pic_name]);
%     imwrite(mask, [save_path pic_name]);
%     imwrite(I,[save_path 'norm/' num2str(c) '.jpg'])
%     c = c+1;
    
    end
end