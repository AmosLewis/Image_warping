H2_1_Homo_estimation.m
1. 测试curiosity.jpg 图片，用H矩阵进行三次Affine操作，并保存。
2. 用cpselect手动抓取了taj1 与 taj2对应点,存入 p1p2中。
3. 用p1p2点计算 H2to1,函数为computeH。
　computeH.m 使用Homogenous Linear Least Squares计算H, 其中就包括SVD。
4. 验证H2to1 是否正确，计算p2通过H2to1变换后的到在第一张图的点p2_t，并画出
5. 保存上面所有已知参数H2to1,p1,p2,p2_t到q2_3.mat 

H2_23_Image_warping.m
1. 把taj2通过warpH 输出到taj1并显示结果。
2. 建一个纯黑背景，把taj1移到中间为warp_im1，把taj2变换到第一张图也移到中间为warp_im2。
3. 把两张warp后的图对应像素相加，由于重叠部分像素计算了两次，要减去重叠部分一次，的到全景图。
4. 重叠部分的位置要用Mask。taj1 有图像的部分对应Mask1部位赋值１，其他为０，taj2对应mask2,mask1加mask2为mask3,mask3像素值为２的地方是重叠部分。与taj1点乘即可得重叠部分像素。

H3_1_Detect_transparent_image.m
对mug1,mug2上述方法造全景图。

Detect_Transparent.m
使用mug1,mug2 找出透明部分。由于透明部分的水杯，对光有折射最用，所以warp后对应点的像素值可能偏差很大，所以可以对重叠部分比较像素值大小，大于一定阈值的地方就是透明部分。使用自定义函数detectTransparent

H3_3_myimage
对myimage1,myimage2用上述方法造全景图。
