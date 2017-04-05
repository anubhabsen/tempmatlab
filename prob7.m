RGB = imread('7image.jpg');
YCBCR = rgb2ycbcr(RGB);



newYCBCR(:, :, 1) = YCBCR(:, :, 1);
newYCBCR(:, :, 2) = imnoise(YCBCR(:, :, 2), 'speckle', 0.002);
newYCBCR(:, :, 3) = imnoise(YCBCR(:, :, 3), 'speckle', 0.002);

newRGB = ycbcr2rgb(newYCBCR);

subplot(2, 2, 1);
imshow(RGB);

subplot(2, 2, 2);
imshow(YCBCR);

subplot(2, 2, 3);
imshow(newYCBCR);

subplot(2, 2, 4);
imshow(newRGB);
