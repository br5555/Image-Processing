function R_corr = whole_correlation(img_obj, img_nat)

img_height = size(img_nat, 1);
img_width = size(img_nat, 2);

R_corr = zeros(img_height, img_width);

for i = 0: img_height-size(img_obj, 1)
    for j = 0: img_width-size(img_obj, 2)
        R_corr(i+1,j+1) = correlation_image (img_obj, img_nat, j, i);
    
    end
end

end