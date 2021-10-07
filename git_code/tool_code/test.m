close all;clear;clc;
Day = '»´«×/2012.10.17/3r1/';

path = ['I:/project/PROJECT/project/crop/' Day];
save_path = ['I:/project/PROJECT/project/GT/' Day];



firf = dir([path '*.bmp']);
long = length(firf);
for k = 1 :long
    pic_name = firf(k).name;
%     name = split(pic_name, ".");
%     ori_name = name{1};
    I = imread([path pic_name]);
    [m,n,z] = size(I);
    mask = zeros(m,n);
    for i=1:m
        for j=1:n
            if(I(i,j,1)==255 && I(i,j,2)==255 && I(i,j,3)==255)
                mask(i,j)=1;
            end
        end
    end
    mask = imfill(mask);
    mask(1:30,1:30)=0;
%     figure,imshow(mask)
    imwrite(mask, [save_path pic_name]);
    
    
    
end


% I = imread('/media/john/SP PHD U3/project/PROJECT/project/crop/nor/2012.04.11/2L1/SplitFrame_00.bmp');
% [m,n,z] = size(I);
% mask = zeros(m,n);
% for i=1:m
%     for j=1:n
%         if(I(i,j,1)==255 && I(i,j,2)==255 && I(i,j,3)==255)
%             mask(i,j)=1;
%         end
%     end
% end
% mask = imfill(mask);
% mask(1:30,1:30)=0;
% 
% 
% figure,imshow(I);
% figure,imshow(mask)