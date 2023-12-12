close all

im = im2double(imread('original/IMG15.png'));

% JPEG
imwrite(im, 'compressed/I15_JPEG_75.jpg', 'Quality', 75);
imwrite(im, 'compressed/I15_JPEG_50.jpg', 'Quality', 50);
imwrite(im, 'compressed/I15_JPEG_25.jpg', 'Quality', 25);

% JPEG 2000
imwrite(im, 'compressed/I15_JPEG2K_1.25.jp2', 'CompressionRatio', 1.25);
imwrite(im, 'compressed/I15_JPEG2K_2.jp2', 'CompressionRatio', 2);
imwrite(im, 'compressed/I15_JPEG2K_2.5.jp2', 'CompressionRatio', 2.5);

figure;
imshowpair(im, im2double(imread('compressed/I15_JPEG_25.jpg')), 'montage');
title('Original vs JPEG 25');
