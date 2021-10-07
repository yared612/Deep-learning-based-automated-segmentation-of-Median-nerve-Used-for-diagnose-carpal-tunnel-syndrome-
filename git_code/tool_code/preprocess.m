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
    [m,n,z] = size(I);
    I = I/255;    
    mid = medfilt3(I);
    his =  histeq(mid);
    imgcrop=imcrop(his,[1 1 n 172]);

    imshow(imgcrop);
%     subplot(1,3,1),imshow(imgcrop),title('ori');subplot(1,3,2),imshow(mid),title('median');subplot(1,3,3),imshow(his),title('med histogram');
    
    
%     imwrite(his,[save_path pic_name '.bmp']);
%     imwrite(mask, [save_path pic_name]);
    c = c+1;
    
    
end