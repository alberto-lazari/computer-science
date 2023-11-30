clc
close all

addpath 'LFToolbox';
LFMatlabPathSetup;

% Build white image database
LFUtilProcessWhiteImages;

% Decode Images
% DecodeOptions.OptionalTasks = 'Rectify'
% Don't use color correction, it's terrible
% DecodeOptions.OptionalTasks = 'ColourCorrect'
% LFUtilDecodeLytroFolder([], [], DecodeOptions)
LFUtilDecodeLytroFolder();

load('Images/IMG_0751__Decoded.mat', 'LF');
% LFDisp(LF);
RenderOptions.PathRadius_percent = 50;
RenderOptions.FrameDelay = 1/25;
LFDispVidCirc(LF, RenderOptions);
% LFDispMousePan(LF);
% LFDispLawnmower(LF);
