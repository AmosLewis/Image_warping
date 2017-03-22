function [ im1 ] = detectTransparent( I1,I2,n )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   I1: image1 I2：image2  n: model
%
%   透明部分有折射，所以像素不会warp 以后像素不会
%   一一对应，只要两个warp以后的图像相减，差值大于
%   一定阈值说明对应像素值偏差很大，就是透明部分
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    load('q3_1.mat');
    if n == 1
    %Q3.2%%% I1 to I2 %%
    im1 = I1;
    im2 = I2;
    out_size = [1280,1680];
    M = [0.3,0,250;0,0.3,250;0,0,1];
    warp_im1 = warpH(im1,M,out_size);
    warp_im2 = warpH(im2,M*H2to1,out_size);
    Gray_im1 = rgb2gray(warp_im1);%用灰度图比较
    Gray_im2 = rgb2gray(warp_im2);
    [Row,Col] = find(abs(Gray_im2-Gray_im1)>170);%%阈值为170，自定义，比较
    warp_im1(Row,Col,1) = 100;
    warp_im1(Row,Col,2) = 100;
    warp_im1(Row,Col,3) = 100;
    figure;imshow(warp_im1);
    imwrite(warp_im1,'I1_to_I2.jpg');
    else
    %Q3.2%%% I1 to I2 %%
    im1 = I2;
    im2 = I1;
    out_size = [1280,1680];
    M = [0.3,0,250;0,0.3,250;0,0,1];
    warp_im1 = warpH(im1,M,out_size);
    warp_im2 = warpH(im2,M*inv(H2to1),out_size);
    Gray_im1 = rgb2gray(warp_im1);
    Gray_im2 = rgb2gray(warp_im2);
    [Row,Col] = find(abs(Gray_im2-Gray_im1)>170);
    warp_im1(Row,Col,1) = 100;
    warp_im1(Row,Col,2) = 100;
    warp_im1(Row,Col,3) = 100;
    figure;imshow(warp_im1);
    imwrite(warp_im1,'I1_to_I2.jpg');
    end
end

