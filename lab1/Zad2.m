clc
clear all
addpath('.\funkcije')
addpath('.\slike')

[img, map ]= imread('medalja_kamenita_vrata.png');
img = double(img);
imgU = sqrt(img);
maxx = max(imgU(:))
minn = min(imgU(:))
figure();imagesc(imgU)
colormap(gray)

maxcol = size(colormap(gray), 1) - 1;

imgg = (imgU - minn)./(maxx-minn).*maxcol;
figure();image(imgg);colormap(gray)
imgg2 = (imgU - minn)./(maxx-minn);
% figure();imshow(imgg,[0, maxcol] );colormap(gray)
figure();aa=imshow(imgg2 );colormap(gray)
%%
[img, map] = imread('uskoci1.png');
gray_img = rgb2gray(img);
gray_img = double(gray_img);
img_log = log(gray_img);
img_sqrt = sqrt(gray_img);
img_sq = gray_img.*gray_img;
% figure();imagesc(img_log);colormap(gray);
% figure();imagesc(img_sqrt);colormap(gray);
% figure();imagesc(img_sq);colormap(gray);

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray);
axes(ha(2)),imagesc(img_log);axis off;colormap(gray);
axes(ha(3)),imagesc(img_sqrt);axis off;colormap(gray);
axes(ha(4)),imagesc(img_sq);axis off;colormap(gray);

%%
x = linspace(0, 255, 256);
y1 = x.*x;
y2 = sqrt(x);
y3 = log(x);
[ha, pos] = tight_subplot(3,1,[.025 .025],[.025 .025],[.025 .025]);
figure(); axes(ha(1)); plot(x, y1,'Color',[0.1, 0.5, 0.1]);  grid on; xlabel('x'); ylabel('transformation'); legend('x^2');xlim([0 255]);
axes(ha(2));plot(x, y2,'Color',[0.1, 0.5, 0.1]);  grid on; xlabel('x'); ylabel('transformation');  legend('sqrt(x)' );xlim([0 255]);
axes(ha(3)); plot(x, y3, 'Color',[0.1, 0.5, 0.1]); legend('log(x)' ); grid on; xlabel('x'); ylabel('transformation'); xlim([0 255]);
%%
[img1, map] = imread('medalja_kamenita_vrata.png');
[img2, map] = imread('medalja_dubrovnik.png');
whos
img2 = imresize(img2, [600 600], 'bilinear');
size(img2)
img = double(img1)+double(img2);
imagesc(img); colormap(gray);

%%
[img1, map] = imread('salona.png');
[img2, map] = imread('saturn.tif');
whos

img1_bi = imresize(img1, [328 613], 'bilinear');
img2_bi = imresize(img2, [328 613], 'bilinear');

img1 =  double(img1_bi)+double(img2_bi);
% figure();imagesc(img1);% colormap(hsv)
% title('zbrajanje')

img2 =  double(img1_bi)-double(img2_bi);
% figure();imagesc(img2); %colormap(hsv)
% title('oduzimanje')

img3 =  double(img1_bi).*(double(img2_bi));
% figure();imagesc(img3); %colormap(hsv)
% title('mnozenje')

img4 =  double(img1_bi)*transpose(double(img2_bi));
% figure();imagesc(img4); %colormap(hsv)
% title('mnozenje')

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;colormap(gray);
axes(ha(2)),imagesc(img2);axis off;colormap(gray);
axes(ha(3)),imagesc(img3);axis off;colormap(gray);
axes(ha(4)),axis off;
%%
%RGB
%Pri tome imamo mogu´cnost izbora broja
%to¡caka, mo¡zemo npr. smanjiti ve´cu sliku ili pove´cati manju, ili pak mijenjati
%obje. Posebno je takoder pripaziti i da prostor boja koje obje slike koriste
%bude jednak (npr. RGB, HSV...), odnosno da obje slike budu indeksirane i
%imaju istu paletu boja ili da budu crno-bijele.
[img1, map] = imread('kljakovic1.png');
[img2, map] = imread('kljakovic2.png');
whos

img1_bi = img1;
img2_bi = imresize(img2, [446 400 ], 'bilinear');
size(img1_bi)

img1_bi(10, 10 ,3)
img2_bi(10, 10 ,3)
img_1 =  double(img1_bi)+double(img2_bi);
aa1 = img_1(:,:,1);
min(aa1(:))
img_1(:,:,1) = (img_1(:,:,1) - min(aa1(:)))./(max(aa1(:))-min(aa1(:)));
aa1 = img_1(:,:,2);
img_1(:,:,2) = (img_1(:,:,2) - min(aa1(:)))./(max(aa1(:))-min(aa1(:)));

aa1 = img_1(:,:,3);
img_1(:,:,3) = (img_1(:,:,3) - min(aa1(:)))./(max(aa1(:))-min(aa1(:)));


% figure();imagesc(img_1); 
% title('zbrajanje')

img_2 =  double(img1_bi)-double(img2_bi);
% figure();imagesc(img_2); 
% title('oduzimanje')
aa1 = img_2(:,:,1);
min(aa1(:))
img_2(:,:,1) = (img_2(:,:,1) - min(aa1(:)))./(max(aa1(:))-min(aa1(:)));
aa1 = img_2(:,:,2);
img_2(:,:,2) = (img_2(:,:,2) - min(aa1(:)))./(max(aa1(:))-min(aa1(:)));

aa1 = img_2(:,:,3);
img_2(:,:,3) = (img_2(:,:,3) - min(aa1(:)))./(max(aa1(:))-min(aa1(:)));


img_3 =  double(img1_bi).*(double(img2_bi));
% figure();imagesc(img_3); 
% title('mnozenje')
aa1 = img_3(:,:,1);
min(aa1(:))
img_3(:,:,1) = (img_3(:,:,1) - min(aa1(:)))./(max(aa1(:))-min(aa1(:)));
aa1 = img_3(:,:,2);
img_3(:,:,2) = (img_3(:,:,2) - min(aa1(:)))./(max(aa1(:))-min(aa1(:)));

aa1 = img_3(:,:,3);
img_3(:,:,3) = (img_3(:,:,3) - min(aa1(:)))./(max(aa1(:))-min(aa1(:)));
figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;
axes(ha(2)),imagesc(img2);axis off;
axes(ha(3)),imagesc(img_1);axis off;
axes(ha(4)),imagesc(img_2);axis off;
axes(ha(5)),imagesc(img_3);axis off;
axes(ha(6)),axis off;

% img1_gray = rgb2gray(img1);
% img2_gray = rgb2gray(img2);
% 
% img1_bi = img1_gray;
% img2_bi = imresize(img2_gray, [446 400 ], 'bilinear');
% 
% 
% img =  double(img1_bi)+double(img2_bi);
% figure();imagesc(img); colormap(gray)
% title('zbrajanje')
% 
% img =  double(img1_bi)-double(img2_bi);
% figure();imagesc(img); colormap(gray)
% title('oduzimanje')
% 
% img =  double(img1_bi).*(double(img2_bi));
% figure();imagesc(img); colormap(gray)
% title('mnozenje')
%%
[img1 , map ] = imread('angio0.tif');
[img2 , map ] = imread('angio1.tif');

whos
img = double(img1)-double(img2);
figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;colormap(gray);
axes(ha(2)),imagesc(img2);axis off;colormap(gray);
axes(ha(3)),imagesc(img);axis off;colormap(gray);
axes(ha(4)),axis off;
%%
%Gama
[img, map ]= imread('split.jpg');
figure();imshow(img);title('without gama')
imgG = imadjust(img, [], [], 0.5);
figure; imshow(imgG);title('with gama')

[img1, map] = imread('4.1.01.tiff');
figure();imshow(img1);title('without gama')
imgG1 = imadjust(img1, [], [], 0.2);
imgG2 = imadjust(img1, [], [], 0.5);
imgG3 = imadjust(img1, [], [], 0.8);
imgG4 = imadjust(img1, [], [], 1.3);

figure;
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;
axes(ha(2)),imagesc(imgG1);axis off;
axes(ha(3)),imagesc(imgG2);axis off;
axes(ha(4)),imagesc(imgG3);axis off;
axes(ha(5)),imagesc(imgG4);axis off;
axes(ha(6)),axis off;

[img1, map] = imread('4.2.05.tiff');
figure();imshow(img1);title('without gama')
imgG1 = imadjust(img1, [], [], 0.2);
imgG2 = imadjust(img1, [], [], 0.5);
imgG3 = imadjust(img1, [], [], 0.8);
imgG4 = imadjust(img1, [], [], 1.3);

figure;
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;
axes(ha(2)),imagesc(imgG1);axis off;
axes(ha(3)),imagesc(imgG2);axis off;
axes(ha(4)),imagesc(imgG3);axis off;
axes(ha(5)),imagesc(imgG4);axis off;
axes(ha(6)),axis off;

[img1, map] = imread('4.1.08.tiff');
imgG1 = imadjust(img1, [], [], 0.2);
imgG2 = imadjust(img1, [], [], 0.5);
imgG3 = imadjust(img1, [], [], 0.8);
imgG4 = imadjust(img1, [], [], 1.3);
figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;
axes(ha(2)),imagesc(imgG1);axis off;
axes(ha(3)),imagesc(imgG2);axis off;
axes(ha(4)),imagesc(imgG3);axis off;
axes(ha(5)),imagesc(imgG4);axis off;
axes(ha(6)),axis off;

%%
[img1, map] = imread('psgamma.tif');
img1 = ind2rgb(img1, map);

img2 = imadjust(img1, [], [], [7, 7, 7]);

figure();
[ha, pos] = tight_subplot(2,1,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;set(gcf,'color',[0 0 0]);

axes(ha(2)),imagesc(img2);axis off;set(gcf,'color',[0 0 0]);



%%
[img, map] = imread('medalja_kamenita_vrata.png');
mask = [1 0 -1; 2 0 -2; 1 0 -1]/4;
imgC = conv2(double(img), double(mask));
figure; imshow(imgC);
%%
[img, map] = imread('medalja_dubrovnik.png');
mask = [1 0 -1; 1 0 -1; 1 0 -1]/3;
imgC1 = conv2(double(img), double(mask));
imgC2 = conv2(double(img), double(mask), 'same');
imgC3 = conv2(double(img), double(mask), 'valid');
figure(); imshow(imgC1);
figure(); imshow(imgC2);
figure(); imshow(imgC3);

%%
[img1, map1] = imread('6.1.07.tiff');
[img2, map2] = imread('5.3.01.tiff');
[img3, map3] = imread('5.2.08.tiff');

mask1 = [1 1 1 1; 1 1 1 1; 1 1 1 1; 1 1 1 1]./16;
mask2 = [1 0 -1; 2 0 -2; 1 0 -1]./4;
mask3 = [1 1 1; 0 0 0; -1 -1 -1];
mask4 = [-1 -1 -1; -1 8 -1; -1 -1 -1];
mask5 = [0 -1 0; -1 4 -1; 0 -1 0];

imgC1 = conv2(double(img1), double(mask2));
imgC2 = conv2(double(img1), double(mask3));
imgC3 = conv2(double(img1), double(mask4));
imgC4 = conv2(double(img1), double(mask5));

figure;
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imshow(img1,map1);axis off;
axes(ha(2)),imshow(imgC1,map1);axis off;
axes(ha(3)),imshow(imgC2,map1);axis off;
axes(ha(4)),imshow(imgC3,map1);axis off;
axes(ha(5)),imshow(imgC4,map1);axis off;
axes(ha(6)),axis off;


% figure(); 
% subplot(1,4,1),imshow(imgC1,map1)
% subplot(1,4,2),imshow(imgC2,map1)
% subplot(1,4,3),imshow(imgC3,map1)
% subplot(1,4,4),imshow(imgC4,map1)

imgC1 = conv2(double(img2), double(mask2));
imgC2 = conv2(double(img2), double(mask3));
imgC3 = conv2(double(img2), double(mask4));
imgC4 = conv2(double(img2), double(mask5));


figure;
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imshow(img2,map2);axis off;
axes(ha(2)),imshow(imgC1,map2);axis off;
axes(ha(3)),imshow(imgC2,map2);axis off;
axes(ha(4)),imshow(imgC3,map2);axis off;
axes(ha(5)),imshow(imgC4,map2);axis off;
axes(ha(6)),axis off;

% figure(); 
% subplot(1,4,1),imshow(imgC1,map2)
% subplot(1,4,2),imshow(imgC2,map2)
% subplot(1,4,3),imshow(imgC3,map2)
% subplot(1,4,4),imshow(imgC4,map2)


imgC1 = conv2(double(img3), double(mask2));
imgC2 = conv2(double(img3), double(mask3));
imgC3 = conv2(double(img3), double(mask4));
imgC4 = conv2(double(img3), double(mask5));

% figure(); 
% subplot(1,4,1),imshow(imgC1,map3)
% subplot(1,4,2),imshow(imgC2,map3)
% subplot(1,4,3),imshow(imgC3,map3)
% subplot(1,4,4),imshow(imgC4,map3)

figure;
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imshow(img3,map3);axis off;
axes(ha(2)),imshow(imgC1,map3);axis off;
axes(ha(3)),imshow(imgC2,map3);axis off;
axes(ha(4)),imshow(imgC3,map3);axis off;
axes(ha(5)),imshow(imgC4,map3);axis off;
axes(ha(6)),axis off;

imgC1 = conv2(double(img3), double(mask1));


figure;
[ha, pos] = tight_subplot(2,1,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imshow(img3,map3);axis off;
axes(ha(2)),imshow(imgC1,map3);axis off;
