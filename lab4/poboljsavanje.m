 addpath('.\funkcije')
 addpath('.\slike')

%%
[img1, map1] = imread('detalj.png');
figure, imhist(img1, map1);grid on;

[img2, map2] = imread('salona.png');
figure, imhist(img2);grid on;

figure;
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]); 
axes(ha(1)),imagesc(img1);axis off;
axes(ha(2)),imhist(img1, map1);grid on;
figure;
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]); 
axes(ha(1)),imagesc(img2);axis off;colormap(gray)
axes(ha(2)),imhist(img2);grid on;
%%
[img, map] = imread('4.1.03.tiff');
img1 = rgb2gray(img);
figure, imhist(img1);
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]); 
axes(ha(1)),imagesc(img);axis off;
axes(ha(2)),imhist(img1);grid on;


[img, map] = imread('4.1.04.tiff');
img2 = rgb2gray(img);
figure, imhist(img2);
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]); 
axes(ha(1)),imagesc(img);axis off;
axes(ha(2)),imhist(img2);grid on;

%%
img=imread('uskoci1.png');
img=rgb2gray(img);
imgEQ=histeq(img);
figure();
[ha, pos] = tight_subplot(2,2,[.02 .02],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray)
axes(ha(2)),imhist(img);grid on;
axes(ha(3)),imagesc(imgEQ);axis off;colormap(gray)
axes(ha(4)),imhist(imgEQ);grid on;
%%
img=imread('uskoci1.png');
img=rgb2gray(img);
imgEQ=histeq(img);
figure();
[ha, pos] = tight_subplot(2,2,[.02 .02],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray)
axes(ha(2)),imhist(img);grid on;
axes(ha(3)),imagesc(imgEQ);axis off;colormap(gray)
axes(ha(4)),imhist(imgEQ);grid on;

img=imread('salona.png');
imgEQ=histeq(img);
figure();
[ha, pos] = tight_subplot(2,2,[.02 .02],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray)
axes(ha(2)),imhist(img);grid on;
axes(ha(3)),imagesc(imgEQ);axis off;colormap(gray)
axes(ha(4)),imhist(imgEQ);grid on;

%%
%Ako je F neka funkcija kumulativne distribucije i F?1 njezina inverzna distirbucija
%te ako je U skup brojeva jednolike distribucije na intervalu [0,1] (u
%ovom slu¡caju skup vrijednosti to¡caka slike), onda skup brojeva F?1(U) ima
%distribuciju F.

[img,map]=imread('salona.png');
imgEQ=histeq(img);
imgMEQ1=imscale(img,[0 1]); % sada slika imgMEQ ima
% priblizno jednoliku distribuciju na [0 1]
imgMEQ10=norminv(imgMEQ1,0,10); % slika sada ima normalnu
% razdiobu s ocekivanjem 0 i devijacijom 10

figure();
[ha, pos] = tight_subplot(2,2,[.02 .02],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray)
axes(ha(2)),imagesc(imgEQ);axis off;colormap(gray)
axes(ha(3)),imagesc(imgMEQ1);axis off;colormap(gray)
axes(ha(4)),imagesc(imgMEQ10);axis off;colormap(gray)
%%
[img,map]=imread('4.1.04.tiff');
img = rgb2gray(img);
imgEQ=histeq(img);
imgMEQ1=imscale(img,[0 1]); % sada slika imgMEQ ima
% priblizno jednoliku distribuciju na [0 1]
imgMEQ5=norminv(imgMEQ1,0,5); % slika sada ima normalnu
% razdiobu s ocekivanjem 0 i devijacijom 5

figure();
[ha, pos] = tight_subplot(2,2,[.02 .02],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray)
axes(ha(2)),imagesc(imgEQ);axis off;colormap(gray)
axes(ha(3)),imagesc(imgMEQ1);axis off;colormap(gray)
axes(ha(4)),imagesc(imgMEQ5);axis off;colormap(gray)
%%
[img,map]=imread('auto.tif');
imgEQ=histeq(img);
imgMEQ1=imscale(img,[0 0.01]); % sada slika imgMEQ ima
% priblizno jednoliku distribuciju na [0 1]
imgMEQz=norminv(imgMEQ1,150,10); %
figure();
[ha, pos] = tight_subplot(1,2,[.02 .02],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray)
axes(ha(2)),imagesc(imgMEQz);axis on;colormap(gray)
%%
[img,map]=imread('medalja_dubrovnik.png');
imgGN=imnoise(img,'gaussian');
imgSP=imnoise(img,'salt & pepper');
imgMF=medfilt2(imgSP,[5 5]);
imgMF_GN=medfilt2(imgGN,[5 5]);
maska=ones(5);
maska=maska/sum(maska(:));
imgSF=conv2(double(imgSP),double(maska),'same');
imgSF_GN=conv2(double(imgGN),double(maska),'same');

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(imgGN);axis off;colormap(gray);
axes(ha(2)),imagesc(imgMF_GN);axis off;colormap(gray);
axes(ha(3)),imagesc(imgSP);axis off;colormap(gray);
axes(ha(4)),imagesc(imgMF);axis off;colormap(gray);

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(imgGN);axis off;colormap(gray);
axes(ha(2)),imagesc(imgSF_GN);axis off;colormap(gray);
axes(ha(3)),imagesc(imgSP);axis off;colormap(gray);
axes(ha(4)),imagesc(imgSF);axis off;colormap(gray);

%%
[img,map]=imread('4.2.07.tiff');
img = rgb2gray(img);
imgGN=imnoise(img,'gaussian');
imgSP=imnoise(img,'salt & pepper');
imgMF=medfilt2(imgSP,[5 5]);
imgMF_GN=medfilt2(imgGN,[5 5]);
maska=ones(5);
maska=maska/sum(maska(:));
imgSF=conv2(double(imgSP),double(maska),'same');
imgSF_GN=conv2(double(imgGN),double(maska),'same');

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(imgGN);axis off;colormap(gray);
axes(ha(2)),imagesc(imgMF_GN);axis off;colormap(gray);
axes(ha(3)),imagesc(imgSP);axis off;colormap(gray);
axes(ha(4)),imagesc(imgMF);axis off;colormap(gray);

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(imgGN);axis off;colormap(gray);
axes(ha(2)),imagesc(imgSF_GN);axis off;colormap(gray);
axes(ha(3)),imagesc(imgSP);axis off;colormap(gray);
axes(ha(4)),imagesc(imgSF);axis off;colormap(gray);


%%
[img,map]=imread('blood1.tif');
maska=ones(3);
maska=maska/sum(maska(:));
imgZ=conv2(double(img),double(maska),'same');
lap=fspecial('laplacian',0.2); % maska koja aproksimira
% Laplaceov operator
sob=fspecial('sobel'); 
imgDer=conv2(double(imgZ),double(sob),'same');
img1 = double(imgDer)+double(imgZ);

figure;imagesc(img1);colormap(gray); axis off;
%%
[img,map]=imread('5.1.12.tiff');
maska=ones(3);
maska=maska/sum(maska(:));
imgZ=conv2(double(img),double(maska),'same');
sizee = min(size(double(img)));
% filtarNP = frqflt([545  545], 545/2, 545/2, (546/2)*0.5);
% filtarNP = imresize(filtarNP,[size(img,1) size(img,2)]);
% 
% imgFT=fft2(img);
% imgNP=imgFT.*fftshift(filtarNP);
% imgNP=ifft2(imgNP);
A = 3;
imgFilt = A*double(img)-double(imgZ);
figure();
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray);
axes(ha(2)),imagesc(abs(imgFilt));axis off;colormap(gray);
%%
[img,map]=imread('medalja_dubrovnik.png');
maska=ones(3);
maska=maska/sum(maska(:));
imgZ=conv2(double(img),double(maska),'same');
sizee = min(size(double(img)));
% filtarNP = frqflt([545  545], 545/2, 545/2, (546/2)*0.5);
% filtarNP = imresize(filtarNP,[size(img,1) size(img,2)]);
% 
% imgFT=fft2(img);
% imgNP=imgFT.*fftshift(filtarNP);
% imgNP=ifft2(imgNP);
A = 3;
imgFilt = A*double(img)-double(imgZ);
figure();
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray);
axes(ha(2)),imagesc(abs(imgFilt));axis off;colormap(gray);

%%
[img,map]=imread('medalja_dubrovnik.png');
maska=ones(3);
maska=maska/sum(maska(:));
imgZ=conv2(double(img),double(maska),'same');

sob=fspecial('sobel'); 
imgDer=conv2(double(imgZ),double(sob),'same');
% imgDer2=conv2(double(img),double(sob),'same');

img1 = double(imgDer)+double(imgZ);
% img2 = double(imgDer2)+double(img);
figure;
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray);
axes(ha(2)),imagesc(img1);axis off;colormap(gray);


%%
[img,map]=imread('5.1.09.tiff');
maska=ones(3);
maska=maska/sum(maska(:));
imgZ=conv2(double(img),double(maska),'same');
lap=fspecial('laplacian',0.2); % maska koja aproksimira
% Laplaceov operator
sob=fspecial('sobel'); 

imgDer=conv2(double(imgZ),double(sob),'same');
img1 = double(imgDer)+double(imgZ);

imgDer=conv2(double(imgZ),double(lap),'same');
img2 = double(imgDer)+double(imgZ);

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray);
axes(ha(2)),imagesc(img1);axis off;colormap(gray);
axes(ha(3)),imagesc(img2);axis off;colormap(gray);
axes(ha(4)),axis off;
%%
[img,map]=imread('5.1.09.tiff');
maska=ones(3);
maska=maska/sum(maska(:));
imgZ=conv2(double(img),double(maska),'same');
lap=fspecial('laplacian',0.2); % maska koja aproksimira
% Laplaceov operator
sob=fspecial('sobel'); 
lap1=-fspecial('laplacian',0);
lap2=3*fspecial('laplacian',0.5);

imgDer=conv2(double(imgZ),double(sob),'same');
img1 = double(imgDer)+double(imgZ);

imgDer=conv2(double(imgZ),double(lap),'same');
img2 = double(imgDer)+double(imgZ);

imgDer=conv2(double(imgZ),double(lap1),'same');
img3 = double(imgDer)+double(imgZ);

imgDer=conv2(double(imgZ),double(lap2),'same');
img4 = double(imgDer)+double(imgZ);

figure;
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray);
axes(ha(2)),imagesc(img1);axis off;colormap(gray);
axes(ha(3)),imagesc(img2);axis off;colormap(gray);
axes(ha(4)),imagesc(img3);axis off;colormap(gray);
axes(ha(5)),imagesc(img4);axis off;colormap(gray);
axes(ha(6)),axis off;
%%
[img,map]=imread('6.1.08.tiff');
maska=ones(3);
maska=maska/sum(maska(:));
imgZ=conv2(double(img),double(maska),'same');
lap=fspecial('laplacian',0.2); % maska koja aproksimira
% Laplaceov operator
sob=fspecial('sobel'); 

imgDer=conv2(double(imgZ),double(sob),'same');
img1 = double(imgDer)+double(imgZ);

imgDer=conv2(double(imgZ),double(lap),'same');
img2 = double(imgDer)+double(imgZ);

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray);
axes(ha(2)),imagesc(img1);axis off;colormap(gray);
axes(ha(3)),imagesc(img2);axis off;colormap(gray);
axes(ha(4)),axis off;

%%
[img,map]=imread('5.3.01.tiff');
maska=ones(3);
maska=maska/sum(maska(:));
imgZ=conv2(double(img),double(maska),'same');
lap=fspecial('laplacian',0.2); % maska koja aproksimira
% Laplaceov operator
sob=fspecial('sobel'); 

imgDer=conv2(double(imgZ),double(sob),'same');
img1 = double(imgDer)+double(imgZ);

imgDer=conv2(double(imgZ),double(lap),'same');
img2 = double(imgDer)+double(imgZ);

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray);
axes(ha(2)),imagesc(img1);axis off;colormap(gray);
axes(ha(3)),imagesc(img2);axis off;colormap(gray);
axes(ha(4)),axis off;