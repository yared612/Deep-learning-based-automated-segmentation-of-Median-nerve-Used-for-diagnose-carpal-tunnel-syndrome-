close all;clear;clc;
% Day = 'slight/2012.10.03/1L1/';
% c = 2053;

path = 'E:/project/PROJECT/project/test data/crop/crop_test/crop_test/';
gt_path = 'E:/project/PROJECT/project/test data/crop/crop_testgt/crop_testgt/';
save_path = 'E:/project/PROJECT/project/test data/detect/';

firf = dir([path '*.bmp']);
long = length(firf);

for k = 1 : long
    pic_name = firf(k).name;
%     name = split(pic_name, ".");
%     ori_name = name{1};
    I = imread([path pic_name]);
    gt = imread([gt_path pic_name]);
    m = 0;
    n = 0;
    g = 0;
    [x,y]= size(gt);
    for i = 1 : x
        for j  = 1: y
            if gt(i,j) == 255
                m = m + i;
                n = n + j;
               g = g + 1;
            end
        end
    end
    m = m/g;
    n = n/g;     
    imgcrop = I(1:172,n-59:n+105);
    gtcrop = gt(1:172,n-59:n+105);
%     subplot(1,3,1),imshow(I),title('ori');subplot(1,3,2),imshow(imgcrop),title('oricrop');subplot(1,3,3),imshow(gtcrop),title('gt');
%     imwrite(imgcrop, [save_path 'img/' pic_name]);
%     imwrite(gtcrop, [save_path 'gt/' pic_name]);
%     c = c+1;
    
    
end