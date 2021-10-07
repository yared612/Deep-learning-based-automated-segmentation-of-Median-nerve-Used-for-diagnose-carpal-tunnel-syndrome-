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
    A=fspecial('average',3);
    Ia = filter(A,I);
    subplot(2,1,1),imshow(I),title('ori');subplot(2,1,2),imshow(out_imadjust),title('imadjust');
%     subplot(2,2,3),imshow(out_histeq),title('histeq');subplot(2,2,4),imshow(out_adapthisteq),title('adapthisteq');
    
    
%     imwrite(his,[save_path '1.bmp']);
%     imwrite(his, [save_path num2str(c) '/images/' num2str(c) '.bmp']);
%     imwrite(gt_crop, [save_path num2str(c) '/mask_norm/' num2str(c) '.bmp']);
    c = c+1;
    
    
end