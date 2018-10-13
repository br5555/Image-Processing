 addpath('./funkcije')
 addpath('./slike')

%%
[img1, map1] = imread('detalj.png');

[img2, map2] = imread('salona.png');

img_height = size(img1, 1);
img_width = size(img1, 2);

R_corr = zeros(img_height, img_width);

for i = 0: img_height
    for j = 0: img_width
        R_corr(i+1,j+1) = correlation_image (img2, img1, j, i);
    
    end
end
figure();
mesh(1:size(R_corr,2), 1:size(R_corr,1), R_corr)



%%
[img1, map1] = imread('auto1.tiff');

[img2, map2] = imread('slika1.tiff');

img_height = size(img2, 1);
img_width = size(img2, 2);

R_corr = zeros(img_height, img_width);

for i = 0: img_height-size(img1, 1)
    for j = 0: img_width-size(img1, 2)
        R_corr(i+1,j+1) = correlation_image (img1, img2, j, i);
    
    end
end
[i, j] = max(abs(R_corr(:)));
mj = double(int32(j/size(R_corr,2)));
mi = mod(j, size(R_corr,2));
plot_rect_on_image(img1, img2, mi, mj)
figure();
mesh(1:size(R_corr,2), 1:size(R_corr,1), R_corr)



%%
R_corr = whole_correlation(img1, img2);
figure();
mesh(1:size(R_corr,2), 1:size(R_corr,1), R_corr)
%%
[img1, map1] = imread('auto1.tiff');

[img2, map2] = imread('slika2.tiff');

img_height = size(img2, 1);
img_width = size(img2, 2);

R_corr = zeros(img_height, img_width);

for i = 0: img_height-size(img1, 1)
    for j = 0: img_width-size(img1, 2)
        R_corr(i+1,j+1) = correlation_image (img1, img2, j, i);
    
    end
end
[i, j] = max(abs(R_corr(:)));
mj = double(int32(j/size(R_corr,2)));
mi = mod(j, size(R_corr,2));
plot_rect_on_image(img1, img2, mi, mj)
figure();
mesh(1:size(R_corr,2), 1:size(R_corr,1), R_corr)

%%
%%
[img1, map1] = imread('auto1.tiff');

[img2, map2] = imread('slika3.tiff');

img_height = size(img2, 1);
img_width = size(img2, 2);

R_corr = zeros(img_height, img_width);

for i = 0: img_height-size(img1, 1)
    for j = 0: img_width-size(img1, 2)
        R_corr(i+1,j+1) = correlation_image (img1, img2, j, i);
    
    end
end
[i, j] = max(abs(R_corr(:)));
mj = double(int32(j/size(R_corr,2)));
mi = mod(j, size(R_corr,2));
plot_rect_on_image(img1, img2, mi, mj)
figure();
mesh(1:size(R_corr,2), 1:size(R_corr,1), R_corr)
%%
[img1, map1] = imread('auto1.tiff');

[img2, map2] = imread('slika4.tiff');

img_height = size(img2, 1);
img_width = size(img2, 2);

R_corr = zeros(img_height, img_width);

for i = 0: img_height-size(img1, 1)
    for j = 0: img_width-size(img1, 2)
        R_corr(i+1,j+1) = correlation_image (img1, img2, j, i);
    
    end
end
[i, j] = max(abs(R_corr(:)));
mj = double(int32(j/size(R_corr,2)));
mi = mod(j, size(R_corr,2));
plot_rect_on_image(img1, img2, mi, mj)
figure();
mesh(1:size(R_corr,2), 1:size(R_corr,1), R_corr)

%%
[img1, map1] = imread('auto1.tiff');

[img2, map2] = imread('auto2.tiff');

img_height = size(img1, 1);
img_width = size(img1, 1);

R_corr = zeros(360);

for i = 1:360
    
        R_corr(i) = correlation_rotate_image (img1, img2, i-1);
    
end
figure();
plot(1:360,R_corr )
[i, j] = max(abs(R_corr(:)));
hold on;
plot(j, R_corr(j), 'rx', 'MarkerSize',10); xlabel('angle [^\circ]') ; ylabel('correlation'); xlim([0, 360])
% plot_rect_on_image(img2, imrotate(img1,j-1), 0, 0)