    I1 = imread('mug1.jpg');
    I2 = imread('mug2.jpg');
    % cpselect(I1,I2);%p3p4

    p3p4 = importdata('p3p4.mat');%手动用cpselect抓取12对点
    p3 = p3p4.movingPoints;
    p4 = p3p4.fixedPoints;
    H2to1 = computeH(p3',p4'); 

    p4 = cat(2,p4,ones(size(p4,1),1));
    p4_t = (H2to1*p4')';
    p4_t = [p4_t(:,1)./p4_t(:,3),p4_t(:,2)./p4_t(:,3)];%齐次矩阵归一化
    %%把2的点显示到1 上，验证H2to1是否正确%%
    h= figure;
    imshow(imread('mug1.jpg'));
    hold on;plot(p3(:,1),p3(:,2),'r.');plot(p4_t(:,1),p4_t(:,2),'g+');
    saveas(h,'q3_1.jpg');
    save q3_1.mat H2to1 p3 p4 p4_t;
    
    %Q3.1%
    im1 = imread('mug1.jpg');
    im2 = imread('mug2.jpg');
    out_size = [1280,1680];
    M = [0.3,0,250;0,0.3,250;0,0,1];
    warp_im1 = warpH(im1,M,out_size);
    warp_im2 = warpH(im2,M*H2to1,out_size);
    figure;imshow(warp_im1);
    figure;imshow(warp_im2);
    %%找到重叠的部分的Mask%%find the mask of the overlapping part
    Mask1 = zeros(1280,1680,3);
    Mask1(warp_im1>0) = 1;
%     figure;imshow(Mask1);
    Mask2 = zeros(1280,1680,3);
    Mask2(warp_im2>0) = 1;
%     figure;imshow(Mask2);
    Mask3 = Mask1 + Mask2;
%     figure;imshow(Mask3);
    Mask = zeros(1280,1680,3);
    Mask(Mask3 == 2) = 1;
%     figure;imshow(Mask);
    %%提取重叠部分%% Extrack the overlapping part
    warp_im1_overlap = double(warp_im1).*Mask;
%     figure;imshow(warp_im1_overlap);
    %%全景图%% panorama
    warp_im3 = uint8(double(warp_im2) + double(warp_im1)-warp_im1_overlap);
%     warp_im3 = (warpH(warp_im3,inv(M),size(im1)));
    figure;imshow(warp_im3);
    imwrite(warp_im3,'mug_panorama.jpg');
    %%3.2%%
