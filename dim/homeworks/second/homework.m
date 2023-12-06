clc
close all

addpath 'LFToolbox';
LFMatlabPathSetup;

% Build white image database
LFUtilProcessWhiteImages;

% Decode Images
DecodeOptions = [];
% I won't use color correction, because the result is terrible
% DecodeOptions.OptionalTasks = 'ColourCorrect';
LFUtilDecodeLytroFolder([], [], DecodeOptions);

load('Images/test-image__Decoded.mat', 'LF');
RenderOptions.PathRadius_percent = 50;
RenderOptions.FrameDelay = 1/22;
LFDispVidCirc(LF, RenderOptions);
% LFDispMousePan(LF);
