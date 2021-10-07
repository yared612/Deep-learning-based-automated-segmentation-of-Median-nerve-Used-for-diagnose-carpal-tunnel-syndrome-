close all;clear;clc;
% Day = 'nor/2012.04.11/2R1/';
% c = 38;

path = 'I:\project\PROJECT\project\test data\ori\img\';
% gt_path = ['E:/project/PROJECT/project/img/GT/' Day];
save_path = 'I:\project\PROJECT\project\test data\pre\img\';

firf = dir([path '*.bmp']);
long = length(firf);

for k = 1 : long
    pic_name = firf(k).name;
%     name = split(pic_name, ".");
%     ori_name = name{1};
    I = imread([path pic_name]);
%     gt = imread([gt_path pic_name]);
    [m,n,z] = size(I);
%     gt_crop = imcrop(gt,[1 1 n 172]);
    imgcrop=imcrop(I,[1 1 n 172]);
    mid = medfilt3(imgcrop);
    his =  histeq(mid);
%     subplot(1,3,1),imshow(imgcrop),title('ori');subplot(1,3,2),imshow(mid),title('median');subplot(1,3,3),imshow(his),title('med histogram');
    
    
    imwrite(his,[save_path firf(k).name]);
%     imwrite(his, [save_path num2str(c) '/images/' num2str(c) '.bmp']);
%     imwrite(gt_crop, [save_path num2str(c) '/mask_norm/' num2str(c) '.bmp']);
%     c = c+1;
    
    
end