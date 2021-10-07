close all;clear;clc;
I = imread('E:\project\PROJECT\project\img\preprocess img\0\mask_norm\0.bmp');
ori = imread('E:\project\PROJECT\project\img\preprocess img\0\images\0.bmp');
m = 0;
n = 0;
c = 0;
[x,y]= size(I);
for i = 1 : x
    for j  = 1: y
        if I(i,j) == 255
            m = m + i;
            n = n + j;
            c = c + 1;
        end
    end
end
m = m/c;
n = n/c;     
imgcrop=ori(m-49:m+50,n-49:n+50);
subplot(1,2,1),imshow(ori),title('ori');subplot(1,2,2),imshow(imgcrop),title('crop');