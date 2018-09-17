clear ; close all; clc

%% Setup the parameters
h = 50;             % 50x50 Input Images of as width x hieght
w = 50;  
num_labels = 2;          % from 0 to 9
lambda = 0.1;

%% =========== Loading and Visualizing Data =============

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

[X , y] = readImages(h , w); % training data stored in arrays X, y
m = size(X, 1);

% Randomly select 100 data points to display
rand_indices = randperm(m);
sel = X(rand_indices(1:m), :);

displayData(sel);


%% ============ Part 2b: One-vs-All Training ============
fprintf('\nTraining One-vs-All Logistic Regression...\n')

[all_theta] = oneVsAll(X, y, num_labels, lambda);

%% ================Predict for One-Vs-All ================

pred = predictOneVsAll(all_theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

