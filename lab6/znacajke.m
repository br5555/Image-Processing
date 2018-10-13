%%
 addpath('./funkcije')
 addpath('./slike')
 %%
 img = imread('texture.tif'); % učitajmo sliku
 fun = @(x) mean(x); % pointer funkcije (function handle)
 img2 = colfilt(double(img), [32 32], 'sliding', fun); % procesiramo sliku
 figure; imagesc(img2); colormap(gray) %prikaz slike
 
 %%
img1 = imread('5.1.12.tiff'); 
img2 = imread('5.3.01.tiff'); 
img3 = imread('6.1.01.tiff');
fun_max = @(x) max(x);
fun_min = @(x) min(x);
fun_mean = @(x) mean(x);
g = @std;
fun_std = @(x) g(x);


block_sizes = [2, 4, 8, 16, 32];

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img1_max = colfilt(double(img1), [bbl bbl], 'sliding', fun_max);
    axes(ha(i)), imagesc(img1_max);axis off; colormap(gray);
    i = i +1;
end


figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img1_min = colfilt(double(img1), [bbl bbl], 'sliding', fun_min);
    axes(ha(i)), imagesc(img1_min);axis off; colormap(gray);
    i = i +1;
end

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img1_mean = colfilt(double(img1), [bbl bbl], 'sliding', fun_mean);
    axes(ha(i)), imagesc(img1_mean);axis off; colormap(gray);
    i = i +1;
end

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img1_std = colfilt(double(img1), [bbl bbl], 'sliding', fun_std);
    axes(ha(i)), imagesc(img1_std);axis off; colormap(gray);
    i = i +1;
end



figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img2);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img2_max = colfilt(double(img2), [bbl bbl], 'sliding', fun_max);
    axes(ha(i)), imagesc(img2_max);axis off; colormap(gray);
    i = i +1;
end


figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img2);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img2_min = colfilt(double(img2), [bbl bbl], 'sliding', fun_min);
    axes(ha(i)), imagesc(img2_min);axis off; colormap(gray);
    i = i +1;
end

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img2);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img2_mean = colfilt(double(img2), [bbl bbl], 'sliding', fun_mean);
    axes(ha(i)), imagesc(img2_mean);axis off; colormap(gray);
    i = i +1;
end

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img2);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img2_std = colfilt(double(img2), [bbl bbl], 'sliding', fun_std);
    axes(ha(i)), imagesc(img2_std);axis off; colormap(gray);
    i = i +1;
end



figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img3);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img3_max = colfilt(double(img3), [bbl bbl], 'sliding', fun_max);
    axes(ha(i)), imagesc(img3_max);axis off; colormap(gray);
    i = i +1;
end


figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img3);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img3_min = colfilt(double(img3), [bbl bbl], 'sliding', fun_min);
    axes(ha(i)), imagesc(img3_min);axis off; colormap(gray);
    i = i +1;
end

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img3);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img3_mean = colfilt(double(img3), [bbl bbl], 'sliding', fun_mean);
    axes(ha(i)), imagesc(img3_mean);axis off; colormap(gray);
    i = i +1;
end

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img3);axis off; colormap(gray);
i = 2; 
for bbl = block_sizes
    img3_std = colfilt(double(img3), [bbl bbl], 'sliding', fun_std);
    axes(ha(i)), imagesc(img3_std);axis off; colormap(gray);
    i = i +1;
end

%%
img = imread('texture.tif');
figure();
hist(im2double(img(:)), 30); % računa i prikazuje histogram slike grupiranje vrijednosti histograma u  30 polja
%%
img1 = imread('5.1.12.tiff'); 
img2 = imread('5.3.01.tiff'); 
img3 = imread('6.1.01.tiff');

fun_entropy = @(x) entropija(x);
fun_energija = @(x) energija(x);
fun=@(x) entropija(x);

[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);axis off; colormap(gray);

img1_entropy = colfilt(img1, [5 5],'sliding', fun);
axes(ha(2)), imagesc((img1_entropy));axis off; colormap(gray);

img_energija = colfilt((img1), [5 5], 'sliding', fun_energija);
axes(ha(3)), imagesc((img_energija));axis off; colormap(gray);

axes(ha(4)); axis off;


figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img2);axis off; colormap(gray);

img2_entropy = colfilt((img2), [5 5], 'sliding', fun_entropy);
axes(ha(2)), imagesc((img2_entropy));axis off; colormap(gray);

img_energija = colfilt((img2), [5 5], 'sliding', fun_energija);
axes(ha(3)), imagesc((img_energija));axis off; colormap(gray);

axes(ha(4)); axis off;

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img3);axis off; colormap(gray);

img3_entropy = colfilt((img3), [5 5], 'sliding', fun_entropy);
axes(ha(2)), imagesc((img3_entropy));axis off; colormap(gray);

img_energija = colfilt((img3), [5 5], 'sliding', fun_energija);
axes(ha(3)), imagesc((img_energija));axis off; colormap(gray);

axes(ha(4)); axis off;

%%
[img, map] = imread('testpat1.tif'); % učitavamo sliku
img = im2double(img); % pretvaramo sliku u double format
img1 = img(4:end, 3: end); % režemo slike tako da pomak između njih bude (2,3)
img2 = img(1:end-3, 1:end-2);
figure(); hist3([img1(:), img2(:)]) % računa i prikazuje histogram drugogo reda
img1 = img(2:end, 6:end); %režemo slike tako da pomak između njih bude (5,1)
img2 = img(1:end-1, 1:end-5);
figure(); hist3([img1(:), img2(:)]) % računa i prikazuje histogram drugog reda

%%
[img, map] = imread('4.2.05.tiff');
img = im2double(img);
img1 = img(2:end, 2:end);
img2 = img(1:end-1, 1:end-1);
figure(); hist3([img1(:), img2(:)]);
img1 = img(6:end, 6:end);
img2 = img(1:end-5, 1:end-5);
figure(); hist3([img1(:), img2(:)]);

%%
[img, map] = imread('saturn.tif');
img = im2double(img);
strides = [1 5 10];
k = 1;
figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);

for i = strides
    for j = strides
       img1 = img(1+i:end, 1+j:end);
       img2 = img(1:end-i, 1:end-j);
       axes(ha(k)), hist3([img1(:), img2(:)]); 
       k = k+1;
    end
end
%%
sy = fspecial('sobel');
sx = rot90(sy);
[img , map] = imread('uskoci1.png');
img = rgb2gray(im2double(img));
gx = real(conv2(img, sx, 'same'));
gy = real(conv2(img, sy, 'same'));
g = real(sqrt(gx.*gy + gy.*gy));
figure(); imagesc(g);colormap(gray);

%%
sy = fspecial('sobel');
sx = rot90(sy);
py = fspecial('prewitt');
px = rot90(py);
[img1 , map] = imread('4.2.07.tiff');
img = rgb2gray(img1);
img = (double(img));

gx = abs(conv2(img, sx, 'same'));
gy = abs(conv2(img, sy, 'same'));
g1 = sqrt(gx.*gy + gy.*gy);
figure(); imagesc(g1);colormap(gray)


gx = abs(conv2(img, px, 'same'));
gy = abs(conv2(img, py, 'same'));
g2 = sqrt(gx.*gy + gy.*gy);
figure(); imagesc(g2);colormap(gray)
figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);axis off;
axes(ha(2)), imagesc(g1);colormap(gray);axis off;
axes(ha(3)), imagesc(g2);colormap(gray);axis off;
axes(ha(4)), axis off;
%%
h0=[1 1 1; 0 0 0; -1 -1 -1];
h45=[1 1 0; 1 0 -1; 0 -1 -1];
h90=[1 0 -1; 1 0 -1; 1 0 -1];

[img1 , map] = imread('4.2.07.tiff');
img = rgb2gray(img1);
img = (double(img));
g0 = abs(conv2(img, h0, 'same'));
g45 = abs(conv2(img, h45, 'same'));
g90 = abs(conv2(img, h90, 'same'));
figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img);colormap(gray)
axes(ha(2)), imagesc(g0);colormap(gray)
axes(ha(3)), imagesc(g45);colormap(gray)
axes(ha(4)), imagesc(g90);colormap(gray)


imgFT=fft2(g0 );
imgFT=imgFT/prod(size(imgFT));
imgFT=fftshift(imgFT);
amplituda_g0=20*log10(abs(imgFT));
faza_g0=angle(imgFT);

imgFT=fft2(g45 );
imgFT=imgFT/prod(size(imgFT));
imgFT=fftshift(imgFT);
amplituda_g45=20*log10(abs(imgFT));
faza_g45=angle(imgFT);

imgFT=fft2(g90 );
imgFT=imgFT/prod(size(imgFT));
imgFT=fftshift(imgFT);
amplituda_g90=20*log10(abs(imgFT));
faza_g90=angle(imgFT);

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);

axes(ha(1)), imagesc(amplituda_g0);colormap(hsv)
axes(ha(2)), imagesc(faza_g0);colormap(hsv)
axes(ha(3)), imagesc(amplituda_g45);colormap(hsv)
axes(ha(4)), imagesc(faza_g45);colormap(hsv)
axes(ha(5)), imagesc(amplituda_g90);colormap(hsv)
axes(ha(6)), imagesc(faza_g90);colormap(hsv)

g0 = h0;
g45 = h45;
g90 = h90;

imgFT=fft2(g0 );
imgFT=imgFT/prod(size(imgFT));
imgFT=fftshift(imgFT);
amplituda_g0=20*log10(abs(imgFT));
faza_g0=angle(imgFT);

imgFT=fft2(g45 );
imgFT=imgFT/prod(size(imgFT));
imgFT=fftshift(imgFT);
amplituda_g45=20*log10(abs(imgFT));
faza_g45=angle(imgFT);

imgFT=fft2(g90 );
imgFT=imgFT/prod(size(imgFT));
imgFT=fftshift(imgFT);
amplituda_g90=20*log10(abs(imgFT));
faza_g90=angle(imgFT);

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);

axes(ha(1)), imagesc(amplituda_g0);colormap(hsv)
axes(ha(2)), imagesc(faza_g0);colormap(hsv)
axes(ha(3)), imagesc(amplituda_g45);colormap(hsv)
axes(ha(4)), imagesc(faza_g45);colormap(hsv)
axes(ha(5)), imagesc(amplituda_g90);colormap(hsv)
axes(ha(6)), imagesc(faza_g90);colormap(hsv)
%%
[img1 , map] = imread('4.2.07.tiff');
img = rgb2gray(img1);
img = (double(img));
xs = [0 0.25 0.5 0.75 1];
figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);colormap(gray)
k = 2;
for x = xs
    l= fspecial('laplacian',x);

    img_l = abs(conv2(img, l, 'same'));
    axes(ha(k)), imagesc(img_l);colormap(gray)
    k = k+1;
end

%%
[img , map] = imread('testpat1.tif');
img = im2double(img);
p = [2,2];
okolina = [15, 15];
fun = @(x) inertia(x ,p);
img2 = nlfilter(img, okolina, fun); 
figure; imagesc(img2); colormap(gray)
%%
[img , map] = imread('texture.tif');
img = im2double(img);
p1 = [2,2];
p2 = [4, 4];
p3 = [3, 5];
okolina = [12, 12];
fun_absoulte = @(x) absolute(x,p1);
fun_inerta = @(x) inertia(x,p1);
fun_covar = @(x) covariance(x, p1);
fun_energy = @(x) energy(x, p1);
fun_entropy = @(x) entropy(x, p1);

img1 = nlfilter(img, okolina, fun_absoulte); 
img2 = nlfilter(img, okolina, fun_inerta);
img3 = nlfilter(img, okolina, fun_covar);
img4 = nlfilter(img, okolina, fun_energy);
img5 = nlfilter(img, okolina, fun_entropy);

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);

axes(ha(1)), imagesc(img);colormap(gray)
axes(ha(2)), imagesc(img1);colormap(gray)
axes(ha(3)), imagesc(img2);colormap(gray)
axes(ha(4)), imagesc(img3);colormap(gray)
axes(ha(5)), imagesc(img4);colormap(gray)
axes(ha(6)), imagesc(img5);colormap(gray)


fun_absoulte = @(x) absolute(x,p2);
fun_inerta = @(x) inertia(x,p2);
fun_covar = @(x) covariance(x, p2);
fun_energy = @(x) energy(x, p2);
fun_entropy = @(x) entropy(x, p2);

img1 = nlfilter(img, okolina, fun_absoulte); 
img2 = nlfilter(img, okolina, fun_inerta);
img3 = nlfilter(img, okolina, fun_covar);
img4 = nlfilter(img, okolina, fun_energy);
img5 = nlfilter(img, okolina, fun_entropy);

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);

axes(ha(1)), imagesc(img);colormap(gray)
axes(ha(2)), imagesc(img1);colormap(gray)
axes(ha(3)), imagesc(img2);colormap(gray)
axes(ha(4)), imagesc(img3);colormap(gray)
axes(ha(5)), imagesc(img4);colormap(gray)
axes(ha(6)), imagesc(img5);colormap(gray)

fun_absoulte = @(x) absolute(x,p3);
fun_inerta = @(x) inertia(x,p3);
fun_covar = @(x) covariance(x, p3);
fun_energy = @(x) energy(x, p3);
fun_entropy = @(x) entropy(x, p3);

img1 = nlfilter(img, okolina, fun_absoulte); 
img2 = nlfilter(img, okolina, fun_inerta);
img3 = nlfilter(img, okolina, fun_covar);
img4 = nlfilter(img, okolina, fun_energy);
img5 = nlfilter(img, okolina, fun_entropy);

figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);

axes(ha(1)), imagesc(img);colormap(gray)
axes(ha(2)), imagesc(img1);colormap(gray)
axes(ha(3)), imagesc(img2);colormap(gray)
axes(ha(4)), imagesc(img3);colormap(gray)
axes(ha(5)), imagesc(img4);colormap(gray)
axes(ha(6)), imagesc(img5);colormap(gray)

%%
[img1 , map] = imread('tekstura_krilo.png');
img1 = rgb2gray(img1);
[img2 , map] = imread('tekstura_nebo.png');
img2 = rgb2gray(img2);
[img3 , map] = imread('tekstura_plast2.png');
img3 = rgb2gray(img3);
[img4 , map] = imread('tekstura_plast3.png');
img4 = rgb2gray(img4);
p1 = [2,2];
okolina = [12, 12];
fun_absoulte = @(x) absolute(x,p1);
fun_inerta = @(x) inertia(x,p1);
fun_covar = @(x) covariance(x, p1);
fun_energy = @(x) energy(x, p1);
fun_entropy = @(x) entropy(x, p1);

img1_ab = nlfilter(img1, okolina, fun_absoulte); 
img1_in = nlfilter(img1, okolina, fun_inerta);
img1_co = nlfilter(img1, okolina, fun_covar);
img1_en = nlfilter(img1, okolina, fun_energy);
img1_ey = nlfilter(img1, okolina, fun_entropy);

img2_ab = nlfilter(img2, okolina, fun_absoulte); 
img2_in = nlfilter(img2, okolina, fun_inerta);
img2_co = nlfilter(img2, okolina, fun_covar);
img2_en = nlfilter(img2, okolina, fun_energy);
img2_ey = nlfilter(img2, okolina, fun_entropy);

img3_ab = nlfilter(img3, okolina, fun_absoulte); 
img3_in = nlfilter(img3, okolina, fun_inerta);
img3_co = nlfilter(img3, okolina, fun_covar);
img3_en = nlfilter(img3, okolina, fun_energy);
img3_ey = nlfilter(img3, okolina, fun_entropy);

img4_ab = nlfilter(img4, okolina, fun_absoulte); 
img4_in = nlfilter(img4, okolina, fun_inerta);
img4_co = nlfilter(img4, okolina, fun_covar);
img4_en = nlfilter(img4, okolina, fun_energy);
img4_ey = nlfilter(img4, okolina, fun_entropy);


figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);

axes(ha(1)), imagesc(img1_ab);colormap(gray)
axes(ha(2)), imagesc(img2_ab);colormap(gray)
axes(ha(3)), imagesc(img3_ab);colormap(gray)
axes(ha(4)), imagesc(img4_ab);colormap(gray)

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);

axes(ha(1)), imagesc(img1_in);colormap(gray)
axes(ha(2)), imagesc(img2_in);colormap(gray)
axes(ha(3)), imagesc(img3_in);colormap(gray)
axes(ha(4)), imagesc(img4_in);colormap(gray)

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);

axes(ha(1)), imagesc(img1_co);colormap(gray)
axes(ha(2)), imagesc(img2_co);colormap(gray)
axes(ha(3)), imagesc(img3_co);colormap(gray)
axes(ha(4)), imagesc(img4_co);colormap(gray)

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);

axes(ha(1)), imagesc(img1_en);colormap(gray)
axes(ha(2)), imagesc(img2_en);colormap(gray)
axes(ha(3)), imagesc(img3_en);colormap(gray)
axes(ha(4)), imagesc(img4_en);colormap(gray)

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);

axes(ha(1)), imagesc(img1_ey);colormap(gray)
axes(ha(2)), imagesc(img2_ey);colormap(gray)
axes(ha(3)), imagesc(img3_ey);colormap(gray)
axes(ha(4)), imagesc(img4_ey);colormap(gray)
