close all;clear all;clc
Files = dir(strcat('E:\project\PROJECT\project\img\s_test\original_img\nor\2012.04.11\2L1\','*.bmp'));

LengthFiles = length(Files);


for a =1%1:LengthFiles;
    ori=imread(strcat('E:\project\PROJECT\project\img\s_test\original_img\nor\2012.04.11\2L1\',Files(a).name));
    
    
    %==make MASK
    ori = ori(:,:,1);
    BW = im2bw(ori,graythresh(ori)*0.3);
    M = medfilt2(BW,[5 5]);
    d=Files(a).name;
    number=d(1:length(d)-4);   
    
 %   imwrite(M, strcat('D:\Phantom_Edge_Detection_Matlab\case01\left\try_BC\BC_mask\',num2str(number),'.bmp'));
    
    %%
    % == COMPUTE B0
    
    B0 = PolyMaskFilter(double(ori),3,M);    
    d=Files(a).name;
    number=d(1:length(d)-4);
   
      
    
   % imwrite( uint8(B0), strcat('G:\Phantom_Edge_Detection_Matlab\Phantom_Edge_Detection_Matlab\U0487\20170706\1\left\try02_aniso\m\',num2str(number),'.bmp'));
    %%
    %   Bias Correction
    
   Bc=(double(ori)-(0.5*double(B0)));
   %Bc=double(ori).*exp(-(0.001*double(B0)));
    %¥¿³W¤Æ
    Bc_n=uint8(255.*(Bc-min(Bc(:)))/(max(Bc(:))-min(Bc(:))));

    %imwrite( Bc_n, strcat('G:\Phantom_Edge_Detection_Matlab\Phantom_Edge_Detection_Matlab\U0487\20170706\1\left\try02_aniso\new_BiasCorrection\',num2str(number),'.bmp'));
%     
    
end