close all;clear;clc;
Day = 'nor/2012.04.11/2L1/';
c = 38;

path = ['E:/project/PROJECT/project/img/original img/' Day];
gt_path = ['E:/project/PROJECT/project/img/GT/' Day];
% save_path = 'E:/project/PROJECT/project/test data/detect/';

firf = dir([path '*.bmp']);
long = length(firf);

for k = 1 
%     : long
    pic_name = firf(k).name;
%     name = split(pic_name, ".");
%     ori_name = name{1};
    I = imread([path pic_name]);
    mid = medfilt3(I);
    out_imadjust = mid;
    out_adapthisteq = mid;
    out_imadjustr = imadjust(mid(:,:,1));
    out_imadjustg = imadjust(mid(:,:,2));
    out_imadjustb = imadjust(mid(:,:,3));
    out_imadjust(:,:,1) = out_imadjustr;
    out_imadjust(:,:,2) = out_imadjustg;
    out_imadjust(:,:,3) = out_imadjustb;
    out_histeq = histeq(mid);
    out_adapthisteqr = adapthisteq(mid(:,:,1));
    out_adapthisteqg = adapthisteq(mid(:,:,2));
    out_adapthisteqb = adapthisteq(mid(:,:,3));
    out_adapthisteq(:,:,1) = out_adapthisteqr;
    out_adapthisteq(:,:,2) = out_adapthisteqg;
    out_adapthisteq(:,:,3) = out_adapthisteqb;
    subplot(2,2,1),imshow(I),title('ori');subplot(2,2,2),imshow(out_imadjust),title('imadjust');
    subplot(2,2,3),imshow(out_histeq),title('histeq');subplot(2,2,4),imshow(out_adapthisteq),title('adapthisteq');
    
    
%     imwrite(his,[save_path '1.bmp']);
%     imwrite(his, [save_path num2str(c) '/images/' num2str(c) '.bmp']);
%     imwrite(gt_crop, [save_path num2str(c) '/mask_norm/' num2str(c) '.bmp']);
    c = c+1;
    
    
end