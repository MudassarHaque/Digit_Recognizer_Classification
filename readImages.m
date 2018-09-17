function [X,y] = readImages(h,w)
  % readImages takes hieght and width (no. of pixels) of images stored in the number
  % named folders within classifiers folder height and width (no. 
  % of pixels) needs to be same to have same number of features 
  % for all examples load image pkg
  % IF YOU WANT TO TRY WITH YOUR OWN IMAGES MAKE SURE TO PUT THEM IN
  % SPECIFIED FOLDERS INSIDE CLASSIFIER FOLDER (they should have same dim.)4
  % NOTE :- IMAGE NAMING DOSENT MATTER, BUT FOLDER NAMING DO.
  pkg load image
  % change dir
  % cd classifiers;
  % get all images pixel values in X
  % initialize
  X = zeros(1,h*w);
  y = 0;
  % row
  m = 1;
  for i = 0:9
    % couldn't find any other way to workout with if condition(exist sucks)
    folder_dir = sprintf('classifiers\\%d',i);
    % folder_dir
    if (~(size(dir(folder_dir),1)==0))
      % get images of i
      image_dir = sprintf("classifiers\\%d\\*.jpg",i);
      images = dir (image_dir);
      for  image = images
        for j = 1:size(image,1)
        image_dir = sprintf("classifiers\\%d\\%s",i,image(j,1).name);
        imarr = im2double(rgb2gray(imread(image_dir)));
          if (size(imarr,1) == h && size(imarr,2) == w)
            example = reshape(imarr, 1, h*w);
            X(m,:) = example;
            y(m,1) = i;
            m++;
          else
           printf("\nDimension Mismacth skipping image %s in dir %d", image(j,1).name, i );
        endif
       endfor
      endfor
    endif
  endfor
  % go back to the home dir

endfunction


