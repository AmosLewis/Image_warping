%%%%%%%2.2 Image warping %%%%%%%
    load('q2_3.mat');
    H2to1 = computeH(p1',p2'); 
    im1 = imread('taj1.jpg');
    im2 = imread('taj2.jpg');
    warp_im = warpH(im2,H2to1,size(im1));
    figure;imshow(warp_im);
    
    %Q2.4 2.5%
    out_size = [720,1280];
    M = [0.3,0,250;0,0.3,250;0,0,1];
    warp_im1 = warpH(im1,M,out_size);
    warp_im2 = warpH(im2,M*H2to1,out_size);
%     figure;imshow(warp_im1);
%     figure;imshow(warp_im2);
    %%找到重叠的部分的Mask%%find the mask of the overlapping part
    Mask1 = uint8(zeros(720,1280,3));
    Mask1(warp_im1>0) = 1;
%     figure;imshow(Mask1);
    Mask2 = uint8(zeros(720,1280,3));
    Mask2(warp_im2>0) = 1;
%     figure;imshow(Mask2);
    Mask3 = uint8(Mask1 + Mask2);
%     figure;imshow(Mask3);
    Mask = uint8(zeros(720,1280,3));
    Mask(Mask3 == 2) = 1;
%     figure;imshow(Mask);
    %%提取重叠部分%% Extrack the overlapping part
    warp_im1_overlap = double(warp_im1).*double(Mask);
%     figure;imshow(uint8(warp_im1_overlap));
    warp_im3 = uint8(double(warp_im2) + double(warp_im1)-warp_im1_overlap);
    figure;imshow(warp_im3);
    imwrite(warp_im3,'q2.5.jpg');
    
