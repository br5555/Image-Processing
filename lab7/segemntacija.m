 addpath('./funkcije')
 addpath('./slike')
%%
[img, map] = imread('testpat1.tif'); % učitavamo sliku
figure(); imhist(img);
figure();grayslice(im2double(img), 130/250)% segmentiramo sliku pragom koji smo odabrali
%Ako histogram interpretiramo kao višemodalni, istom naredbom sliku
%segmentiramo u tri područja definirajući dva praga:
figure(); grayslice(im2double(img), [45 130 190]/255);

%%
[img, map] = imread('blood1.tif'); % učitavamo sliku
figure(); imhist(img);
figure(); grayslice(im2double(img), [107]/255);
figure(); grayslice(im2double(img), [107-51]/255);
figure(); grayslice(im2double(img), [107+51]/255);

figure(); grayslice(im2double(img), [107 190]/255);
%%
[img, map] = imread('testpat1.tif'); % učitavamo sliku
[idx, c] = kmeans(im2double(img(:)), 3); %određujemo segmentaciju
figure; imagesc(reshape(idx, size(img))); %prikazujemo segmentaciju
[idx , c] = kmeans(im2double(img(:)), 3, 'start', [0.5:3]'/3, 'onlinephase', 'off');
figure; imagesc(reshape(idx, size(img)));
%%
[img, map] = imread('blood1.tif'); % učitavamo sliku
[idx, c] = kmeans(im2double(img(:)), 3, 'start', [0.5:3]'/3, 'onlinephase', 'off');
figure(); imagesc(reshape(idx, size(img)))
%%
[img, map] = imread('knjiga_ssa.png');
rub = edge(img, 'sobel');
figure(); imshow(rub); % prikažimo detektirane rubove
rub= edge(img, 'sobel', 0.02);%edge ignores all edges that are not stronger than threshold
figure(); imshow(rub)
rub = edge(img, 'log', [],4);
figure(); imshow(rub)
rub = edge(img, 'prewitt');
figure(); imshow(rub);
rub = edge(img, 'roberts');
figure(); imshow(rub);
rub = edge(img, 'zerocross');
figure(); imshow(rub);
rub = edge(img, 'canny');
figure(); imshow(rub);
%%
[img, map] = imread('uskoci1.png');
img = rgb2gray(img);
k = 1;
figure();
[ha, pos] = tight_subplot(5,5,[.01 .01],[.01 .01],[.01 .01]);
for i = 0: 0.005: 0.125-0.005
    rub= edge(img, 'sobel', i);
    axes(ha(k)), imagesc(rub);axis off; colormap('gray')
    k=k+1;
end

rub = edge(img, 'sobel');
figure(); imshow(rub);

rub = edge(img, 'zerocross');
figure(); imshow(rub);

rub = edge(img, 'log');
figure(); imshow(rub);


imgZ_GN=imnoise(img,'gaussian');
imgZ_SP=imnoise(img,'salt & pepper');

rub1 = edge(imgZ_GN, 'sobel');

rub2 = edge(imgZ_GN, 'zerocross');

rub3 = edge(imgZ_GN, 'log');

rub4 = edge(imgZ_SP, 'sobel');

rub5 = edge(imgZ_SP, 'zerocross');

rub6 = edge(imgZ_SP, 'log');


rub7 = edge(imgZ_GN, 'canny');

rub8 = edge(imgZ_SP, 'canny');

figure();
[ha, pos] = tight_subplot(4,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imshow(rub1);axis off;
axes(ha(2)), imshow(rub4);axis off;
axes(ha(3)), imshow(rub2);axis off;
axes(ha(4)), imshow(rub5);axis off;
axes(ha(5)), imshow(rub3);axis off;
axes(ha(6)), imshow(rub6);axis off;
axes(ha(7)), imshow(rub7);axis off;
axes(ha(8)), imshow(rub8);axis off;
%%
[img, map] = imread('4.2.07.tiff');
img = rgb2gray(img);
k = 1;
figure();
[ha, pos] = tight_subplot(5,5,[.01 .01],[.01 .01],[.01 .01]);
for i = 0: 0.005: 0.125-0.005
    rub= edge(img, 'sobel', i);
    axes(ha(k)), imagesc(rub);axis off; colormap('gray')
    k=k+1;
end

[rub, tresh] = edge(img, 'sobel');
tresh
figure(); imshow(rub);

rub = edge(img, 'zerocross');
figure(); imshow(rub);

rub = edge(img, 'log');
figure(); imshow(rub);


imgZ_GN=imnoise(img,'gaussian');
imgZ_SP=imnoise(img,'salt & pepper');

rub1 = edge(imgZ_GN, 'sobel');

rub2 = edge(imgZ_GN, 'zerocross');

rub3 = edge(imgZ_GN, 'log');

rub4 = edge(imgZ_SP, 'sobel');

rub5 = edge(imgZ_SP, 'zerocross');

rub6 = edge(imgZ_SP, 'log');


rub7 = edge(imgZ_GN, 'canny');

rub8 = edge(imgZ_SP, 'canny');

figure();
[ha, pos] = tight_subplot(4,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(rub1);axis off;colormap('gray')
axes(ha(2)), imagesc(rub4);axis off;colormap('gray')
axes(ha(3)), imagesc(rub2);axis off;colormap('gray')
axes(ha(4)), imagesc(rub5);axis off;colormap('gray')
axes(ha(5)), imagesc(rub3);axis off;colormap('gray')
axes(ha(6)), imagesc(rub6);axis off;colormap('gray')
axes(ha(7)), imagesc(rub7);axis off;colormap('gray')
axes(ha(8)), imagesc(rub8);axis off;colormap('gray')
%%
[img, map] = imread('texture.tif');
p = [2, 3]; %definiramo pomak
fun = @(x) inertia(x,p); %pointer funkcije (function handle)
znacajke = nlfilter(img, [10 10], fun); % procesiramo sliku
figure; imagesc(znacajke); colormap(gray)
[idx, c] = kmeans(im2double(znacajke(:)), 5, 'start', [0.5:5]'/5, 'onlinephase', 'off');
figure; imagesc(reshape(idx, size(img))); % prikazujemo segmentaciju

%%
[img, map] = imread('texture.tif');
figure(); imagesc(img); colormap('gray')
p = [2, 3]; %definiramo pomak
fun = @(x) inertia(x,p); %pointer funkcije (function handle)
znacajke = nlfilter(img, [12 12], fun);
figure; imagesc(znacajke); colormap(gray)
[idx, c] = kmeans(im2double(znacajke(:)), 5, 'start', [0.5:5]'/5, 'onlinephase', 'off');
figure; imagesc(reshape(idx, size(img))); colormap(gray)


fun = @(x) covariance(x, p); %pointer funkcije (function handle)
znacajke = nlfilter(img, [12 12], fun);
figure; imagesc(znacajke); colormap(gray)
[idx, c] = kmeans(im2double(znacajke(:)), 5, 'start', [0.5:5]'/5, 'onlinephase', 'off');
figure; imagesc(reshape(idx, size(img))); colormap(gray)


p = [2, 2]; %definiramo pomak
fun = @(x) energijaSignala(x,p); %pointer funkcije (function handle)
znacajke = nlfilter(img, [12 12], fun);
figure; imagesc(znacajke); colormap(gray)
[idx, c] = kmeans(im2double(znacajke(:)), 5, 'start', [0.5:5]'/5, 'onlinephase', 'off');
figure; imagesc(reshape(idx, size(img))); colormap(gray)








