close all;clear;clc;
finf_ori = dir('E:/project/PROJECT/project/Predict/old_new_test/mat/crop_img_350_epoch151/*.mat');
long = length(finf_ori);
for k = 1 : long
    pic_name = finf_ori(k).name;
    name = split(pic_name, ".");
    ori_name = name{1};
    I = load(['E:/project/PROJECT/project/Predict/old_new_test/mat/crop_img_350_epoch151/' ori_name '.mat']);
    ori_I = I.image;
    [r,c,h] = size(ori_I);    
    mask = I.mask;
    
    [m,n,z]=size(mask);
    if z==1
        final = mask;
    elseif z==2
        final = mask(:,:,1);
    elseif z==3
        final = mask(:,:,1);
    elseif z==4
        final = mask(:,:,1);
    elseif z==5
        final = mask(:,:,1);
    else
        final = zeros(r,c);
    end
%     mask = mask(:,:,1);
   imwrite(final,['E:/project/PROJECT/project/Predict/old_new_test/img/crop_img_350_epoch151/' ori_name '.bmp'])
%     figure,imshow(mask)
end