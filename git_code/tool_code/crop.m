clc;close all;clear all;
img1=imread(strcat('F:\project\PROJECT\project\?????v??\nor\2012.04.11\2L1\',img(i).name));
imgcrop=imcrop(img1,[199 51 539 360]);
imwrite(imgcrop,['F:\project\PROJECT\project\crop\nor\2012.04.11\2L1\',img(i).name]);


