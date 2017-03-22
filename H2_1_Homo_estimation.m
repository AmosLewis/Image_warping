%%%%%%%1.2 Homographies in Matlab%%%%%%%
    im = imread('curiosity.jpg');
    %Q1.3%
    fill_value = 0;
    out_size = 3*size(im);
    H1 = [1 0 0;0 2 0;0 0 1];
    warp_im1 = warpH(im, H1, out_size,fill_value);
    imwrite(warp_im1,'image1h1.jpg'); 
    %figure;imshow(warp_im1);

    H2 = [1 0 8;0 1 8;0 0 1];
    warp_im2 = warpH(im, H2, out_size,fill_value);
    imwrite(warp_im2,'image1h2.jpg'); 
    %figure;imshow(warp_im2);

    H3 = [1 1 0;10 2 0.5; 0 3 1];
    warp_im3 = warpH(im, H3, out_size,fill_value);
    imwrite(warp_im3,'image1h3.jpg'); 
    %figure;imshow(warp_im3);

%%%%%%2.1Homography estimation%%%%%%%
    %Q2.3%
    p1p2 = importdata('p1p2.mat');%手动用cpselect抓取12对点
    p1 = p1p2.movingPoints;
    p2 = p1p2.fixedPoints;
    H2to1 = computeH(p1',p2'); 

    p2 = cat(2,p2,ones(size(p2,1),1));
    p2_t = (H2to1*p2')';
    p2_t = [p2_t(:,1)./p2_t(:,3),p2_t(:,2)./p2_t(:,3)];%齐次矩阵归一化

    h= figure;
    imshow(imread('taj1.jpg'));
    hold on;plot(p1(:,1),p1(:,2),'r.');plot(p2_t(:,1),p2_t(:,2),'g+');
    saveas(h,'q2_3.jpg');
    save q2_3.mat H2to1 p1 p2 p2_t;







