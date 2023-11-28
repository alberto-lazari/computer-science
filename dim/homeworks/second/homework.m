clc
close all

addpath 'LFToolbox'
LFMatlabPathSetup

% Build white image database
LFUtilProcessWhiteImages

% Decode Images
LFUtilDecodeLytroFolder
