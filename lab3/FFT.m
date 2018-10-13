 addpath('.\funkcije')
 addpath('.\slike')
 
 %%
 %Funkcije fft() i fft2() ra¡cunaju spektar ¡ciji centar nije u sredini dobivene
%matrice, ve´c se nalazi u gornjem lijevom kutu. To je napravljeno zbog
%konvencije da se ishodi¡ste nalazi u gornjem lijevom kutu, ¡sto je ve´c ranije
%obja¡snjeno u Poglavlju 2. i prikazano na slici 11.1.. Ukoliko rezultat ¡zelimo
%prikazati tako da je ishodi¡ste smje¡steno u sredi¡stu slike, potrebno je primijeniti
%funkciju fftshift(). Ukoliko nakon pomaka ishodi¡sta jo¡s i skaliramo dobivenu
%diskretnu Fourierovu transformaciju s brojem elemenata ulazne matrice
%(dijeljenje spektra s prod(size(imgFT))), dobit ´cemo izgled spektra kako
%ga uobi¡cajeno prikazujemo u domeni transformacije. Va¡zno je primijetiti da
%funkcije ifft() i ifft2() koje ra¡cunaju inverznu transformaciju o¡cekuju spektar
%koji nije pomaknut i skaliran!
 img = imread('klis2.png');
 imgFT = fft2(img); % primijenimo fft2 funkciju
 imgFT = imgFT/prod(size(imgFT));% da bi dobili stvarne 
% koeficijente DFT-a moramo rezultat skalirati

 imgFT=fftshift(imgFT);
 whos
 
 amplituda = 20*log10(abs(imgFT));
faza = angle(imgFT);
figure, imagesc(amplituda);
figure, imagesc(faza);

%%
img1  = imread('klis2.png');
img2 = imread('uzorak.tif');

img1FT = fft2(img1);
img1FT = img1FT/(prod(size(img1FT)));
img1FT = fftshift(img1FT);

amplituda_img1 = 20*log10(abs(img1FT));
faza_img1 = angle(img1FT);
figure;
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(amplituda_img1);axis off;
axes(ha(2)),imagesc(faza_img1);axis off;

img2FT = fft2(img2);
img2FT = img2FT/(prod(size(img2FT)));
img2FT = fftshift(img2FT);

amplituda_img2 = 20*log10(abs(img2FT));
faza_img2 = angle(img2FT);
figure;
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(amplituda_img2);axis off;
axes(ha(2)),imagesc(faza_img2);axis off;

%%
[img, map] = imread('misal_1483.png');
imgV = imresize(img,2);
imgM = imresize(img, 0.25);
imgR = imrotate(img, 66, 'crop');

imgV1 = uint8(zeros(1024));
whos
% 
 imgV1(50:50+851-1,72:72+610-1)=img;
imgV2=uint8(zeros(1024));
imgV2(460:460+851-1,830:830+610-1)=img;

[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;
axes(ha(2)),imagesc(imgV);axis off;
axes(ha(3)),imagesc(imgM);axis off;
axes(ha(4)),imagesc(imgR);axis off;
axes(ha(5)),imagesc(imgV1);axis off;
axes(ha(6)),imagesc(imgV2);axis off;

%%
img1  = imread('klis2.png');
img2  = imread('6.1.01.tiff');
imgM = imresize(img1, 0.25);
imgR = imrotate(img1, 66, 'crop');

imgV2=uint8(zeros(1024));
imgV2(460:460+size(img2,1)-1,830:830+size(img2,2)-1)=img2;

imgV2=uint8(zeros(400));
imgV2(250:250+size(img2,1)-1,200:200+size(img2,2)-1)=img2;

figure(); imagesc(imgV2)
img1FT = fft2(img1);
img1FT = img1FT/(prod(size(img1FT)));
img1FT = fftshift(img1FT);
amplituda_img1 = 20*log10(abs(img1FT));
faza_img1 = angle(img1FT);

img2FT = fft2(imgM);
img2FT = img2FT/(prod(size(img2FT)));
img2FT = fftshift(img2FT);
amplituda_img2 = 20*log10(abs(img2FT));
faza_img2 = angle(img2FT);

img3FT = fft2(imgR);
img3FT = img3FT/(prod(size(img3FT)));
img3FT = fftshift(img3FT);
amplituda_img3 = 20*log10(abs(img3FT));
faza_img3 = angle(img3FT);


img4FT = fft2(img2);
img4FT = img4FT/(prod(size(img4FT)));
img4FT = fftshift(img4FT);
amplituda_img4 = 20*log10(abs(img4FT));
faza_img4 = angle(img4FT);

img5FT = fft2(imgV2);
img5FT = img5FT/(prod(size(img5FT)));
img5FT = fftshift(img5FT);
amplituda_img5 = 20*log10(abs(img5FT));
faza_img5 = angle(img5FT);

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imshow((abs(amplituda_img1)),[]);colormap(gca,jet(64));colorbar
axes(ha(2)),imshow((abs(faza_img1)),[]);colormap(gca,jet(64));colorbar
axes(ha(3)),imshow((abs(amplituda_img2)),[]);colormap(gca,jet(64));colorbar
axes(ha(4)),imshow((abs(faza_img2)),[]);colormap(gca,jet(64));colorbar

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imshow((abs(amplituda_img1)),[]);colormap(gca,jet(64));colorbar
axes(ha(2)),imshow((abs(faza_img1)),[]);colormap(gca,jet(64));colorbar
axes(ha(3)),imshow((abs(amplituda_img3)),[]);colormap(gca,jet(64));colorbar
axes(ha(4)),imshow((abs(faza_img3)),[]);colormap(gca,jet(64));colorbar

figure;
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imshow((abs(amplituda_img4)),[]);colormap(gca,jet(64));colorbar
axes(ha(2)),imshow((abs(faza_img4)),[]);colormap(gca,jet(64));colorbar
axes(ha(3)),imshow((abs(amplituda_img5)),[]);colormap(gca,jet(64));colorbar
axes(ha(4)),imshow((abs(faza_img5)),[]);colormap(gca,jet(64));colorbar

%%
%Filtriranje u domeni
%transformacije izvodi se mno¡zenjem Fourierove transformacije slike s Fourireovom
%transformacijom impulsnog odziva filtra.

filtar = frqflt([256  256], 256/2, 256/2, (256/2)*0.5);
% konstruiramo NP filtar s pojasom propustanja do
% 0.5, ako je 1 na polovici frekvencije otipkavanja
figure;
imagesc(filtar);
[img,map]=imread('testpat1.tif');
imgFT=fft2(img);

imgNP=imgFT.*fftshift(filtar);
figure;
imagesc(fftshift(filtar));

imgNP=ifft2(imgNP);
figure;
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;
%Primijetite da je rezultat filtracije kompleksna matrica. Stoga je potrebno
%primijeniti funkciju real() (ili abs()) na rezultat dobiven nakon inverzne
%transformacije. Ta operacija je potrebna jer su numeri¡cke pogre¡ske
%pri odredivanju odziva filtra te pri ra¡cunanju inverzne transformacije uzrokovale
%pojavljivanje kompleksnih vrijednosti u rekonstruiranoj slici.
axes(ha(2)),imagesc(abs(imgNP));axis off;
%%
filtarNP = frqflt([256  256], 256/2, 256/2, (256/2)*0.5);
filtarNP2 = frqflt([256  256], 256/2, 256/2, (320/2)*0.7);
filtarNP3 = frqflt([256  256], 256/2, 256/2, (320/2)*0.7);
filtarNP4 = frqflt([256  256], 256/2, 256/2, (300/2)*0.4);
filtarVP = not(filtarNP2);
filtarPP = not(filtarNP4)&filtarNP3;

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(filtarNP);axis off;
axes(ha(2)),imagesc(abs(filtarVP));axis off;
axes(ha(3)),imagesc(abs(filtarPP));axis off;
axes(ha(4)),axis off;

[img,map]=imread('testpat1.tif');
imgFT=fft2(img);

imgNP=imgFT.*fftshift(filtarNP);
imgNP=ifft2(imgNP);

imgVP=imgFT.*fftshift(filtarVP);
imgVP=ifft2(imgVP);

imgPP=imgFT.*fftshift(filtarPP);
imgPP=ifft2(imgPP);

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray)
axes(ha(2)),imagesc(abs(imgNP));axis off;colormap(gray)
axes(ha(3)),imagesc(abs(imgVP));axis off;colormap(gray)
axes(ha(4)),imagesc(abs(imgPP));axis off;colormap(gray)

%%
%Kako je DCT realna transformacija ne postoji fazni dio spektra, ve´c
%samo amplitudni dio
img=imread('klis2.png');
imgCT=dct2(img);
imgO=idct2(img);
%%
%Kao ¡sto smo primijetili u prethodnom poglavlju ve´cina energije je sadr¡zana u
%niskofrekvencijskim komponentama spektra. To uvijek vrijedi ukoliko je rije¡c o
%prirodnim slikama2. Upravo to svojstvo DCT mo¡zemo iskoristiti za kompresiju
%slike koja se sastoji od DCT transformacije, restrikcije baze i kvantizacije koeficijenata.

[img1, map] = imread('teksture.png');
[img2, map]= imread('4.2.07.tiff');
I = rgb2gray(img1);
I2 = rgb2gray(img2);

J = dct2(I);
J2 = dct2(I2);

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img1);axis off;
axes(ha(2)),imshow(log(abs(J)),[]);colormap(gca,jet(64));colorbar
axes(ha(3)),imagesc(img2);axis off;
axes(ha(4)),imshow(log(abs(J2)),[]);colormap(gca,jet(64));colorbar
%%
[img,map]=imread('4.1.05.tiff');
img = rgb2gray(img);
imgT=blkproc(img,[8 8],'dct2');

figure();
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01])
axes(ha(1)),imagesc(img);axis off;colormap(gray)

M = (maskiranje('sqr', 4));
imgR=blkproc(imgT,[8 8],'x.*P1',M);
imgO=blkproc(imgR,[8 8],'idct2');

    
 axes(ha(2)),imagesc(imgO);axis off;colormap(gray)
 kvadratno = mean2((double(img)-double(imgO)).^2)

%%
[img,map]=imread('4.2.03.tiff');
img = rgb2gray(img);
imgT=blkproc(img,[8 8],'dct2');

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01])
axes(ha(1)),imagesc(img);axis off;colormap(gray)

 kvadratno_polje = zeros(8,1);
for i = 1:8
    M = (maskiranje('tri', i));
    imgR=blkproc(imgT,[8 8],'x.*P1',M);
    imgO=blkproc(imgR,[8 8],'idct2');

    
    axes(ha(i+1)),imagesc(imgO);axis off;colormap(gray)
    kvadratno = mean2((double(img)-double(imgO)).^2)
    kvadratno_polje(i) = kvadratno;
end

%%
[img,map]=imread('4.2.03.tiff');
img = rgb2gray(img);
imgT=blkproc(img,[8 8],'dct2');

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01])
axes(ha(1)),imagesc(img);axis off;colormap(gray)

 kvadratno_polje = zeros(8,1);
for i = 1:8
    M = (maskiranje('sqr', i));
    imgR=blkproc(imgT,[8 8],'x.*P1',M);
    imgO=blkproc(imgR,[8 8],'idct2');

    
    axes(ha(i+1)),imagesc(imgO);axis off;colormap(gray)
    kvadratno = mean2((double(img)-double(imgO)).^2)
    kvadratno_polje(i) = kvadratno;
end

%%
%uz restrikciju baze
%vr¡simo i kvantizaciju koeficijenata.
[img,map]=imread('4.2.03.tiff');
img = rgb2gray(img);
imgT=blkproc(img,[8 8],'dct2');
i = 4;
M = (maskiranje('tri', i));
imgR=blkproc(imgT,[8 8],'x.*P1',M);
imgO=blkproc(imgR,[8 8],'idct2');
imgO=dikretizacija(imgO, 32);

figure();
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)),imagesc(img);axis off;colormap(gray)
axes(ha(2)),imagesc(imgO);axis off;colormap(gray)
kvadratno = mean2((double(img)-double(imgO)).^2)
