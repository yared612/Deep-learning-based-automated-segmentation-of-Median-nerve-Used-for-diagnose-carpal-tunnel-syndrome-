clc;close all;clear all;
finf_gt  = dir('E:/project/PROJECT/project/Predict/old_new_test/gt/crop_img_gt/*.bmp');
finf_pre  = dir('E:/project/PROJECT/project/Predict/old_new_test/img/crop_img_350_epoch83/*.bmp');
long=length(finf_gt);
dice1 = zeros(1,long);
iou = zeros(1,long);
name = zeros(1,long);
for k= 1 : length(finf_gt)
    % groung truth
    I=imread(['E:/project/PROJECT/project/Predict/old_new_test/gt/crop_img_gt/' finf_gt(k).name])/255;
%     figure,imshow(double(I))
    % predict
    ans_mask = (imread(['E:/project/PROJECT/project/Predict/old_new_test/img/crop_img_350_epoch83/' finf_gt(k).name]));
%     figure,imshow(double(ans_mask))
    %     ans_mask = imresize(ans_mask,[361,540]);
    ins = (double(I)).*(double(ans_mask));
    inss = sum(sum(ins));
    Is = sum(sum(I));
    ans_masks = sum(sum(ans_mask));
    d = (2*inss+0.00000000001)/(Is+ans_masks+0.00000000001);
    io = d/(2-d);
    dice1(k) = d;
    iou(k) = io;
end
avg_dice = sum(dice1)/long;
avg_iou = sum(iou)/long;