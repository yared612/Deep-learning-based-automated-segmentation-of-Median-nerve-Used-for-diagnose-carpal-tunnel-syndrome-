close all;clear;clc;
path = 'C:\Users\owuser\Desktop\for_0818\2012.05.30_2L1\new\';
% save_path = 'E:/project/PROJECT/project/test data/crop/preprocess img/';

firf = dir([path '*.bmp']);
long = length(firf);

c=0; 
for k = 6
%     :long
    pic_name = firf(k).name;
    I = imread([path pic_name]);
    his =  histeq(I);
    R = I(:,:,1);
    G = I(:,:,2);
    B = I(:,:,3);
    
    mean_R=filter2(fspecial('average',5),R)/255;
    mean_G=filter2(fspecial('average',5),G)/255;
    mean_B=filter2(fspecial('average',5),B)/255;
    mean_I= cat(3,mean_R,mean_G,mean_B);
%     figure;imshow(I);
%     figure;imshow(mean_I);
    subplot(1,3,1),imshow(I),title('ori');subplot(1,3,2),imshow(his),title('histogram');subplot(1,3,3),imshow(mean_I),title('his mean');
    c = c+1;
    
    
end