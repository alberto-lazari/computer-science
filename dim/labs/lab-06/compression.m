close all
clc

im = im2double(imread('original/IMG15.png'));

% JPEG
imwrite(im, 'compressed/I15_JPEG_75.jpg', 'Quality', 75);
imwrite(im, 'compressed/I15_JPEG_50.jpg', 'Quality', 50);
imwrite(im, 'compressed/I15_JPEG_25.jpg', 'Quality', 25);

% JPEG 2000
imwrite(im, 'compressed/I15_JPEG2K_125.jp2', 'CompressionRatio', 1.25);
imwrite(im, 'compressed/I15_JPEG2K_2.jp2', 'CompressionRatio', 2);
imwrite(im, 'compressed/I15_JPEG2K_25.jp2', 'CompressionRatio', 2.5);

% Compare results
% figure;
% imshowpair(im, im2double(imread('compressed/I15_JPEG_25.jpg')), 'montage');
% title('Original vs JPEG 25');

images = {
    'I15_JPEG_75' im2double(imread('compressed/I15_JPEG_75.jpg'))
    'I15_JPEG_50' im2double(imread('compressed/I15_JPEG_50.jpg'))
    'I15_JPEG_25' im2double(imread('compressed/I15_JPEG_25.jpg'))
    'I15_JPEG2K_125' im2double(imread('compressed/I15_JPEG2K_125.jp2'))
    'I15_JPEG2K_2' im2double(imread('compressed/I15_JPEG2K_2.jp2'))
    'I15_JPEG2K_25' im2double(imread('compressed/I15_JPEG2K_25.jp2'))
};

fprintf('Image\t\tPSNR\tSSIM\tBRIQUE\tNIQE\n')
for i = 1:6
    image = images{i, 2};
    fprintf("%s\t%.3f\t%.3f\t%.3f\t%.3f\n", images{i, 1}, psnr(image, im), ssim(image, im), brisque(image), niqe(image))
end
