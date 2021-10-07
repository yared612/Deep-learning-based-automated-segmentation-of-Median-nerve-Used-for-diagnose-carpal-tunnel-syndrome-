close all;clear;clc;
Day = 'nor/2012.05.17/1R1/';
c = 390; 

path = ['E:/project/PROJECT/project/img/original img/' Day];
save_path = 'E:/project/PROJECT/project/classfication/ori/';

firf = dir([path '*.bmp']);
long = length(firf);

for k = 1:long
    pic_name = firf(k).name;
%     name = split(pic_name, ".");
%     ori_name = name{1};
    I = imread([path pic_name]);
%     imshow(imgcrop)
%     imwrite(imgcrop,[save_path pic_name]);
%     imwrite(mask, [save_path pic_name]);
    imwrite(I,[save_path 'norm/' num2str(c) '.jpg'])
    c = c+1;
    
    
end