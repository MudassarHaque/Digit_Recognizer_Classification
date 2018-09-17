function [all_theta] = oneVsAll(X, y, num_labels, lambda)
  %ONEVSALL trains multiple logistic regression classifiers

  % Some useful variables
  m = size(X, 1);
  n = size(X, 2);

  all_theta = zeros(num_labels, n + 1);

  % Add ones to the X data matrix
  X = [ones(m, 1) X];
  % Initialize theta
  initial_theta = zeros(n+1, 1);

  options = optimset('GradObj', 'on', 'MaxIter', 500);

  for c = 0:num_labels
    
    [theta] = ...
    fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
    initial_theta, options);
    
    all_theta(c+1,:) = theta;
    
  endfor
end
