close all;clear;clc;
Day = 'nor/2012.04.11/2L1/';

path = ['E:/project/PROJECT/project/img/original img/' Day];
save_path = 'E:/project/PROJECT/project/test data/crop/preprocess img/';

firf = dir([path '*.bmp']);
long = length(firf);

c=0; 
for k = 1
%     :long
    pic_name = firf(k).name;
%     name = split(pic_name, ".");
%     ori_name = name{1};
    I = imread([path pic_name]);
    
% ntu
    i = double(I);
    rm = mean2(i(:,:,1));
    gm = mean2(i(:,:,2));
    bm = mean2(i(:,:,3));
    rs = std2(i(:,:,1));
    gs = std2(i(:,:,2));
    bs = std2(i(:,:,3));
    i(:,:,1) = (i(:,:,1) - rm)/rs;
    i(:,:,2) = (i(:,:,2) - gm)/gs;
    i(:,:,3) = (i(:,:,3) - bm)/bs;
    
% paper
    mid = medfilt3(I);
    his =  histeq(mid);
    
    [m,n,z] = size(I);
    Icrop = imcrop(his,[10 1 504 171]);
    icrop = imcrop(i,[1 1 n 171]);
    subplot(1,3,1),imshow(I),title('ori');subplot(1,3,2),imshow(Icrop),title('ori__crop');subplot(1,3,3),imshow(icrop),title('final');
    
    
%     imwrite(his,[save_path pic_name '.bmp']);
%     imwrite(mask, [save_path pic_name]);
    c = c+1;
    
    
end