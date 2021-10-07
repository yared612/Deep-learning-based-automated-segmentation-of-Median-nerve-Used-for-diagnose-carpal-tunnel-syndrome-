close all;clear;clc;
% Day = 'slight/2012.10.17/3R1/';
% ori=imread('/home/john/Desktop/tf-unet/AMD/A0006.png');
finf_ori  = dir('I:\project\PROJECT\project\test data\pre\imgdele\*.bmp');
finf_ans  = dir('I:\project\PROJECT\project\test data\pre\dele\*.bmp');
finf_ans1 = dir('I:\project\PROJECT\project\Predict\Mask_Rcnn_v3_predict_croppref\dele(dice = 0.7728)\*.bmp');

long=length(finf_ori);
I=cell(long,1);
Ans=cell(long,1);
% Ans1=cell(long,1);
contour=cell(long,1);
for k= 1 : length(finf_ori)
    I=imread(['I:\project\PROJECT\project\test data\pre\imgdele\' finf_ori(k).name]);
    Ans =255-imread(['I:\project\PROJECT\project\test data\crop\dele\' finf_ans(k).name]);
    Ans1=imread(['I:\project\PROJECT\project\Predict\Mask_Rcnn_v3_predict_croppref\dele(dice = 0.7728)\', finf_ans1(k).name]);
%     figure,imshow(Ans);
    [m,n,z]=size(I);
    Im =zeros(m,n,z);
    Im1=zeros(m,n,z);
    Ans=double(Ans);
%     I = I(1:172,:,:);
%     g = zeros(m,n,z);
%     g (:,:,1) = I;
%     g (:,:,2) = I;
%     g (:,:,3) = I;
%     I = g;
%     Ans1 = imresize(Ans1,[172,540]);
%     mid = medfilt3(I);
%     I =  histeq(mid)/255;
    Ans1=double(Ans1);
    
%%    
    for i = 2:size(Im,1)-1
        for j = 2:size(Im,2)-1
            if Ans(i,j)==255
                Ans(i,j)=1;
            else
                Ans(i,j)=0;
            end
        end
    end
    for i = 2:size(Im,1)-2
        for j = 2:size(Im,2)-1
            if Ans(i,j)==1
                a = Ans(i-1:i+1,j-1:j+1);
                if sum(a(:))<9
                    Im(i-1:i+1,j-1:j+1,1)=0;
                    Im(i-1:i+1,j-1:j+1,2)=0;
                    Im(i-1:i+1,j-1:j+1,3)=255;
                end
            end
        end
    end
  %%  
    for i = 2:size(Im,1)-1
        for j = 2:size(Im,2)-1
            if Ans1(i,j)==0
                Ans1(i,j)=1;
            else
                Ans1(i,j)=0;
            end
        end
    end    
    for i = 2:size(Im,1)-1
        for j = 2:size(Im,2)-1
            if Ans1(i,j)==1
                a = Ans1(i-1:i+1,j-1:j+1);
                if sum(a(:))<9
                    Im1(i-1:i+1,j-1:j+1,1)=0;
                    Im1(i-1:i+1,j-1:j+1,2)=255;
                    Im1(i-1:i+1,j-1:j+1,3)=0;
                end
            end
        end
    end
    COMbin=Im + Im1;
%     figure,imshow(COMbin)
    imio(:,:,1)=double(I(:,:,1))+COMbin(:,:,1);
    imio(:,:,2)=double(I(:,:,2))+COMbin(:,:,2);
    imio(:,:,3)=double(I(:,:,3))+COMbin(:,:,3);
    for i=1:m
        for j=1:n
            if imio(i,j,1)>255
                imio(i,j,1)=255;            
            end
            if imio(i,j,2)>255
                imio(i,j,2)=255;            
            end
            if imio(i,j,3)>255
                imio(i,j,3)=255;            
            end
            if COMbin(i,j,2)==255
                imio(i,j,1)=0;
                imio(i,j,3)=0;
            end
            if COMbin(i,j,3)==255
                imio(i,j,1)=0;
                imio(i,j,2)=0;
            end
            if COMbin(i,j,2)==255 && COMbin(i,j,3)==255
                imio(i,j,2)=255;
                imio(i,j,1)=255;
                imio(i,j,3)=0;
            end
        end
    end
    imio=uint8(imio);
    imwrite(imio, ['I:\project\PROJECT\project\combine\crop+nor\' finf_ori(k).name]);
%     figure,imshow(uint8(imio));

end

