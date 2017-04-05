function output = RMSE(im1, im2)

output = sqrt(mean(abs(im1(:) - im2(:)) .^ 2));