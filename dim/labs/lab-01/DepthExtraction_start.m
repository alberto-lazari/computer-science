%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear
clc
%%%%%%%% Load images%%%%%%%%%%%%%%%%%%%%%%
IL=imread('image_Left.jpg');
IR=imread('image_Right.jpg');

%%%%%%% View the extracted image%%%%%%%%%%
figure;
imshowpair(IL,IR,'montage');
title('Extracted Portion of Original Images');

%%%%%%% Rectify the Images%%%%%%%%%%%%%%%%
% Load Stereo Parameters
load stereoParams;

%%%%%%%%Rectify the images%%%%%%%%%%%%%%%%
[rectL, rectR] = rectifyStereoImages(IL, IR, stereoParams);

%%%%%%%%%Generate Disparity Map%%%%%%%%%%%
disparityRange = [0 64];
disparityMap = disparity(rgb2gray(rectL), rgb2gray(rectR), 'disparityRange', disparityRange);

%%%%%%%%%View the disparity map%%%%%%%%%%%
figure;
imshow(disparityMap, disparityRange);
title('Disparity Map');
colormap('jet');
colorbar;

%%%%%%%%% Reconstruct Point Cloud%%%%%%%%%
ptcloud = reconstructScene(disparityMap,stereoParams) / 1000;

%%% Limit the range of Z and X for display using thresholds = [-5 5;-5 10;0 30]
PC = thresholdPC(ptcloud, [-5 5; -5 10; 0 30]);

%%%%%%%View point cloud%%%%%%%%%%%%%%%%%%%
figure;
pcshow(PC, rectL);
title('3D Point Cloud');

%% Extract Image corresponding to the distance 20 to 30 meters
z_min = 20;
z_max = 30;
z = PC(:, :, 3);
mask = repmat(z > z_min & z < z_max, [1, 1, 3]);
k = rectL;
k(~mask) = 0;

%%%%%%%%%%%%%%%%% Print the result %%%%%%%
figure;
imshow(k);
