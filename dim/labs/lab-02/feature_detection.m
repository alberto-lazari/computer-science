close all

image = imread('image.jpg');
figure;
imshow(image);

points = detectSIFTFeatures(rgb2gray(image), ContrastThreshold = 0.005, EdgeThreshold=7, Sigma=5);
% points = detectBRISKFeatures(rgb2gray(image));
% points = detectSURFFeatures(rgb2gray(image));

hold on
plot(points.selectStrongest(5000));

distorted_image = imrotate(image, 3);
distorted_points = detectSIFTFeatures(rgb2gray(distorted_image), ContrastThreshold = 0.005, EdgeThreshold=7, Sigma=5);

points = points.selectStrongest(1000);
distorted_points = distorted_points.selectStrongest(1000);

[features_orig, valid_points_orig] = extractFeatures(rgb2gray(image), points);
[features_dist, valid_points_dist] = extractFeatures(rgb2gray(distorted_image), distorted_points);

indexPairs = matchFeatures(features_orig, features_dist);

matched_orig = valid_points_orig(indexPairs(:, 1));
matched_dist = valid_points_dist(indexPairs(:, 2));

figure;
showMatchedFeatures(image, distorted_image, matched_orig, matched_dist)
