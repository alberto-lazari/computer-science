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
load('stereoParams.mat');


%%%%%%%%Rectify the images%%%%%%%%%%%%%%%%
[rectL, rectR, reprojectionMatrix] = rectifyStereoImages(IL, IR, stereoParams);


%%%%%%%%%Generate Disparity Map%%%%%%%%%%%
% use disparity function and disparity range from [0 64]
disparityMap = disparity(rgb2gray(rectL), rgb2gray(rectR), 'DisparityRange', [0 64]);
% disparityMap = disparityBM(rgb2gray(rectL), rgb2gray(rectR));
% disparityMap = disparitySGM(rgb2gray(rectL), rgb2gray(rectR));


%%%%%%%%%View the disparity map%%%%%%%%%%%
%use imshow with disparity range
%use color map of jet type
%use color bar
image = imshow(disparityMap);
colormap('jet');
colorbar('eastoutside');


%%%%%%%%% Reconstruct Point Cloud%%%%%%%%%
% Create point cloud using reconstructScene
xyzPoints = reconstructScene(disparityMap, reprojectionMatrix);


%%% Convert from millimeters to meters%%%%
xyzPoints = xyzPoints / 1000;


%%% Limit the range of Z and X for display using thresholds = [-5 5;-5 10;0 30]
%use thresholdPC function inside the folder of work
PC = thresholdPC(xyzPoints, [-5 5;-5 10;0 30]);


%%%%%%%View point cloud%%%%%%%%%%%%%%%%%%%
%use pcshow function to view point cloud
pcshow(PC)


%% Extract Image corresponding to the distance 20 to 30 meters
%use repmat function and z axis


%%%%%%%%%%%%%%%%% Print the result %%%%%%%
