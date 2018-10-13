addpath('.\funkcije')
addpath('.\slike')
 %%

 
 [img, map] = imread('salona.png');
whos
N = 2;
img_min = min(img(:));
img_max = max(img(:));
step = floor(double(img_max-img_min)/N);

%prvi nacin
A = (double(step)/2 + double(img_min)).*ones(size(img,1), size(img,2));
bb2 = (double(img)-A+0.001)*0.99;%stisnuti level radi zaokruzivanja
bb = quant(bb2, step)/0.99+A-0.001;
figure; imagesc(bb);

%drugi nacin
levels = zeros(1,N);
for i = 1: N-1
    levels(i+1) =levels(i)+step; 
end
levels(1) = -1;
indexes = imquantize(img, levels(:));
img_quant = zeros( size(indexes,1), size(indexes,2));
levels(1) = 0;

for i = 1: size(indexes,1)
    for j = 1: size(indexes,2)
    img_quant(i,j) = levels(int16(indexes(i,j))-1)+img_min;
    end
end

figure; imagesc(img_quant);

figure();
[ha, pos] = tight_subplot(2,1,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray);
axes(ha(2)),imagesc(img_quant);axis off;colormap(gray);


%%
bits = 8;
levels = pow2(bits);
[img1, map] = imread('6.1.07.tiff');
[img2, map] = imread('5.2.08.tiff');
[img3, map] = imread('4.2.07.tiff');
img3 = rgb2gray(img3);

keySet =   {1, 2, 3};
valueSet = {img1, img2, img3};
mapObj = containers.Map(keySet,valueSet)


for j = 1:3
    figure; 
    [ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]) ;
    for i = 1:bits
    
        axes(ha(i)),imagesc( dikretizacija(mapObj(j), pow2(i)));axis off;colormap(gray)
    end
     axes(ha(9)),imagesc(mapObj(j));axis off;colormap(gray)
end

%% 
[img, map] = imread('klis2.png');
img1 = img(1:10:end, 1:10:end);

figure(); imagesc(img1);

%%
[img, map] = imread('asinh1.tiff');

figure();
[ha, pos] = tight_subplot(4,3,[.01 .01],[.01 .01],[.01 .01]); 
for i = 1: 10
    img1 = img(1:i:end, 1:i:end);
    axes(ha(i)), imagesc(img1);axis off;

end
axes(ha(11)), axis off;
axes(ha(12)), axis off;
%%
%Pikselizacija
[img, map] = imread('klis2.png');
klisM=imresize(img,1/5,'nearest',0);
klisV = imresize(img,5,'nearest',0);
figure; imagesc(img);
figure; imagesc(klisV);


%%
[img1, map] = imread('4.1.01.tiff');
[img2, map] = imread('4.1.03.tiff');
[img3, map] = imread('4.1.04.tiff');

img1o = img1;
img2o = img2;
img3o = img3;

scale = 5;
startX = 100;
endX = 150;
startY = 90;
endY = 150;
dio = img1(startX:endX, startY:endY,1:3);
M=imresize(dio,1/scale,'nearest',0);
V = imresize(M,scale,'nearest',0);
img1(startX:size(V,1)+startX-1, startY:size(V,2)+startY-1,1:3) = V;
figure(); imagesc(img1);

startX = 100;
endX = 150;
startY = 90;
endY = 150;
dio = img2(startX:endX, startY:endY,1:3);
M=imresize(dio,1/scale,'nearest',0);
V = imresize(M,scale,'nearest',0);
img2(startX:size(V,1)+startX-1, startY:size(V,2)+startY-1,1:3) = V;
figure(); imagesc(img2);

startX = 80;
endX = 150;
startY = 140;
endY = 200;
dio = img3(startX:endX, startY:endY,1:3);
M=imresize(dio,1/scale,'nearest',0);
V = imresize(M,scale,'nearest',0);
img3(startX:size(V,1)+startX-1, startY:size(V,2)+startY-1,1:3) = V;
figure(); imagesc(img3);

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1o);axis off;
axes(ha(2)),imagesc(img1);axis off;
axes(ha(3)),imagesc(img2o);axis off;
axes(ha(4)),imagesc(img2);axis off;
axes(ha(5)),imagesc(img3o);axis off;
axes(ha(6)),imagesc(img3);axis off;

%%
%Niskopropusni filtar . Aliasing  efekt
%Usrednjavaju´ci sliku, zamutili smo sve piksele na takav na¡cin da se dio informacije
%susjednih piksela preslikao na onaj piksel u sredini filtra za usrednjavanje.
%Stoga ovaj postupak mo¡zemo i promatrati kao spremanje maksimalne koli¡cine
%informacije u ¡sto manji broj piksela. Na¡zalost, ovaj postupak nije reverzibilan

[img, map] = imread('uzorak.tif');
H = fspecial('average', 3);%raèunamo odziv traženog filtra
imgL = filter2(H, img);
figure(); imagesc(imgL);

%%
[img, map] = imread('asinh1.tiff');
scale = 5;
size(img)
M=imresize(img,1/scale,'nearest',0);
V = imresize(M,scale,'nearest',0);
figure;
[ha, pos] = tight_subplot(4,3,[.01 .01],[.01 .01],[.01 .01]); 
for i = 1: 10
    img_otipka = V(1:i:end, 1:i:end, :);
    axes(ha(i)),imagesc(img_otipka);axis off;colormap(gray)
end
axes(ha(11)), axis off;
axes(ha(12)), axis off;

%%
[img1, map] = imread('testpat1.tif');
[img2, map] = imread('testpat2.tif');

img1_otip = img1(1:4:end, 1:4:end,:);
img2_otip = img2(1:4:end, 1:4:end,:);

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]); 
axes(ha(1)),imagesc(img1);axis off;colormap(gray);
axes(ha(2)),imagesc(img1_otip);axis off;colormap(gray);
axes(ha(3)),imagesc(img2);axis off;colormap(gray);
axes(ha(4)),imagesc(img2_otip);axis off;colormap(gray);

%%
[img1, map] = imread('testpat1.tif');
[img2, map] = imread('testpat2.tif');

img1_otip = img1(1:4:end, 1:4:end,:);
img2_otip = img2(1:4:end, 1:4:end,:);
H = fspecial('average', 3);%raèunamo odziv traženog filtra
img1L = filter2(H, img1);
img2L = filter2(H, img2);
img1_fil_otip = img1L(1:4:end, 1:4:end,:);
img2_fil_otip = img2L(1:4:end, 1:4:end,:);


figure;
[ha, pos] = tight_subplot(2,3,[.01 .01],[.01 .01],[.01 .01]); 
axes(ha(1)),imagesc(img1);axis off;colormap(gray)
axes(ha(2)),imagesc(img1_otip);axis off;colormap(gray)
axes(ha(3)),imagesc(img1_fil_otip);axis off;colormap(gray)
axes(ha(4)),imagesc(img2);axis off;colormap(gray)
axes(ha(5)),imagesc(img2_otip);axis off;colormap(gray)
axes(ha(6)),imagesc(img2_fil_otip);axis off;colormap(gray)

%%
[img2, map] = imread('testpat2.tif');
figure;
[ha, pos] = tight_subplot(4,3,[.01 .01],[.01 .01],[.01 .01]); 
for i = 1:10
    H = fspecial('average', i);
    img1L = filter2(H, img1);
    axes(ha(i)),imagesc(img1L);axis off;colormap(gray)
end
axes(ha(11));axis off;
axes(ha(12));axis off;
%%
[img1, map] = imread('uzorak.tif');
size(img1)
img_x_otip = img1(1:3:end,:,:);
figure;
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]); 
axes(ha(1)); imagesc(img1);axis off;colormap(gray)
axes(ha(2)); imagesc(img_x_otip);axis off;colormap(gray)

%%
[img1, map] = imread('uzorak.tif');
img_y_otip = img1(:,1:2:end,:);
figure;
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]); 
axes(ha(1)); imagesc(img1);axis off;colormap(gray)
axes(ha(2)); imagesc(img_y_otip);axis off;colormap(gray)
%%
[img1, map] = imread('testpat1.tif');
[img2, map] = imread('uzorak.tif');

scale = 4;
img1_L = imresize(img1, 1/scale,'nearest',0);
img2_L = imresize(img2, 1/scale,'nearest',0);

[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;colormap(gray)
axes(ha(2)),imagesc(img1_L);axis off;colormap(gray)
axes(ha(3)),imagesc(img2);axis off;colormap(gray)
axes(ha(4)),imagesc(img2_L);axis off;colormap(gray)

%% 

[img1, map] = imread('4.2.07.tiff');
scale = 5;
img_otip = imresize(img1, 1/scale,'nearest',0);
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;colormap(gray)
axes(ha(2)),imagesc(img_otip);axis off;colormap(gray)

%%
%Moarski efekt
[img, map] = imread('AB2.tiff');
img_moarski = img(:, 1:39:end,:);
img_moarski_37 = img(:, 1:37:end,:);
img_moarski_40 = img(:, 1:40:end,:);
img_moarski_30 = img(:, 1:30:end,:);

figure;
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray)
axes(ha(2)),imagesc(img_moarski);axis off;colormap(gray)

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray)
axes(ha(2)),imagesc(img_moarski_37);axis off;colormap(gray)
axes(ha(3)),imagesc(img_moarski_40);axis off;colormap(gray)
axes(ha(4)),imagesc(img_moarski_30);axis off;colormap(gray)

%%
[img, map] = imread('hsokol.png');
img_podot = img(1:5:end, 1:5:end,:);
img1_L = imresize(img, 1/5,'nearest',0);

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;
axes(ha(2)),imagesc(img_podot);axis off;
axes(ha(3)),imagesc(img1_L);axis off;
axes(ha(4));axis off;

%%
[img1, map] = imread('testpat_circ.tiff');
[img2, map] = imread('asinh2.tiff');

img1_200_L = imresize(img1, 200/300,'nearest',0);
img1_100_L = imresize(img1, 100/300,'nearest',0);
img1_50_L = imresize(img1, 50/300,'nearest',0);

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;colormap(gray)
axes(ha(2)),imagesc(img1_200_L);axis off;colormap(gray)
axes(ha(3)),imagesc(img1_100_L);axis off;colormap(gray)
axes(ha(4)),imagesc(img1_50_L);axis off;colormap(gray)

img2_200_L = imresize(img2, 200/300,'nearest',0);
img2_100_L = imresize(img2, 100/300,'nearest',0);
img2_50_L = imresize(img2, 50/300,'nearest',0);

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img2);axis off;colormap(gray)
axes(ha(2)),imagesc(img2_200_L);axis off;colormap(gray)
axes(ha(3)),imagesc(img2_100_L);axis off;colormap(gray)
axes(ha(4)),imagesc(img2_50_L);axis off;colormap(gray)

%%
[img1, map] = imread('testpat_circ.tiff');
[img2, map] = imread('asinh2.tiff');

img1_10_L = imresize(img1, 1/10,'nearest',0);
img1_30_L = imresize(img1, 1/30,'nearest',0);
img1_50_L = imresize(img1, 1/50,'nearest',0);

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;colormap(gray)
axes(ha(2)),imagesc(img1_10_L);axis off;colormap(gray)
axes(ha(3)),imagesc(img1_30_L);axis off;colormap(gray)
axes(ha(4)),imagesc(img1_50_L);axis off;colormap(gray)

img2_10_L = imresize(img2, 1/10,'nearest',0);
img2_30_L = imresize(img2, 1/30,'nearest',0);
img2_50_L = imresize(img2, 1/50,'nearest',0);

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img2);axis off;colormap(gray)
axes(ha(2)),imagesc(img2_10_L);axis off;colormap(gray)
axes(ha(3)),imagesc(img2_30_L);axis off;colormap(gray)
axes(ha(4)),imagesc(img2_50_L);axis off;colormap(gray)