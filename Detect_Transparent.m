    I1 = imread('mug1.jpg');
    I2 = imread('mug2.jpg');
    n = 1;
    detectTransparent(I1,I2,n);
%     load('q3_1.mat');
%     if n == 1
%     %Q3.2%%% I1 to I2 %%
%     im1 = imread('mug1.jpg');
%     im2 = imread('mug2.jpg');
%     out_size = [1280,1680];
%     M = [0.3,0,250;0,0.3,250;0,0,1];
%     warp_im1 = warpH(im1,M,out_size);
%     warp_im2 = warpH(im2,M*H2to1,out_size);
%     Gray_im1 = rgb2gray(warp_im1);
%     Gray_im2 = rgb2gray(warp_im2);
%     [Row,Col] = find(abs(Gray_im2-Gray_im1)>170);
%     warp_im1(Row,Col,1) = 100;
%     warp_im1(Row,Col,2) = 100;
%     warp_im1(Row,Col,3) = 100;
%     figure;imshow(warp_im1);
%     imwrite(warp_im1,'I1_to_I2.jpg')
%     else
%         %Q3.2%%% I1 to I2 %%
%     im1 = imread('mug2.jpg');
%     im2 = imread('mug1.jpg');
%     out_size = [1280,1680];
%     M = [0.3,0,250;0,0.3,250;0,0,1];
%     warp_im1 = warpH(im1,M,out_size);
%     warp_im2 = warpH(im2,M*inv(H2to1),out_size);
%     Gray_im1 = rgb2gray(warp_im1);
%     Gray_im2 = rgb2gray(warp_im2);
%     [Row,Col] = find(abs(Gray_im2-Gray_im1)>170);
%     warp_im1(Row,Col,1) = 100;
%     warp_im1(Row,Col,2) = 100;
%     warp_im1(Row,Col,3) = 100;
%     figure;imshow(warp_im1);
%     imwrite(warp_im1,'I2_to_I1.jpg')
%     end
    
    