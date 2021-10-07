close all;clear;clc;
finf_ori = dir('E:/project/PROJECT/project/Predict/submit_20200616T102223/*.mat');
long = length(finf_ori);
for k = 1 : long
    pic_name = finf_ori(k).name;
    name = split(pic_name, ".");
    ori_name = name{1};
    I = load(['E:/project/PROJECT/project/Predict/submit_20200616T102223/' ori_name '.mat']);
    ori_I = I.image;
    [r,c,h] = size(ori_I);    
    mask = I.masks;
    
    [m,n,z]=size(mask);
    if z==1
        final = mask;
    elseif z==2
        final = mask(:,:,1)+mask(:,:,2);
    elseif z==3
        final = mask(:,:,1)+mask(:,:,2)+mask(:,:,3);
    elseif z==4
        final = mask(:,:,1)+mask(:,:,2)+mask(:,:,3)+mask(:,:,4);
    elseif z==5
        final = mask(:,:,1)+mask(:,:,2)+mask(:,:,3)+mask(:,:,4)+mask(:,:,5);
    else
        final = zeros(r,c);
    end
%     mask = mask(:,:,1);
   imwrite(1-final,['E:/project/PROJECT/project/Predict/Mask_Rcnn_v5_BC/all/' ori_name '.bmp'])
%     figure,imshow(mask)
end

