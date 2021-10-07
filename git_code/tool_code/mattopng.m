close all;clear;clc;
finf_ori = dir('E:/project/PROJECT/project/Predict/old_new_test/mat/crop_img_350_epoch83/*.mat');
long = length(finf_ori);
for k = 1:long
    pic_name = finf_ori(k).name;
    name = split(pic_name, ".");
    ori_name = name{1};
    I = load(['E:/project/PROJECT/project/Predict/old_new_test/mat/crop_img_350_epoch83/' ori_name '.mat']);
    mask = I.mask;
%     subplot(1,2,1),imshow(uint8(ori_I));colorbar(),title('ori');subplot(1,2,2),imshow(nakagami),title('na');colorbar();
    imwrite(1-mask,['E:/project/PROJECT/project/Predict/old_new_test/img/crop_img_350_epoch83/' ori_name '.bmp']);
%     figure(),imshow(mask)

end