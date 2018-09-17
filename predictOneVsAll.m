function p = predictOneVsAll(all_theta, X)
  % PREDICT Predict the label for a trained one-vs-all classifier
  % (i.e it checks the accuracy for given data)
  m = size(X, 1);
  num_labels = size(all_theta, 1);
  % Intialize
  p = zeros(size(X, 1), 1);

  % Add ones to the X data matrix
  X = [ones(m, 1) X];

  [prob, p] = max(sigmoid(X*all_theta'), [] , 2);
  %bcuz p would have last index as an zero classifier
  p = p.-1;
end
