 addpath('./funkcije')
 addpath('./slike')
%%
h=fspecial('gaussian',4,1);% Gaussovo zamucenje
figure;mesh(h)% prikaz odziva u vremenskoj domeni
figure;freqz2(h)% frekvencijska karakteristika u 3D
%%
h1=eye(20)/20;
h2=fspecial('gaussian',4,1); % Gaussovo zamucenje
h=conv2(double(h1),double(h2)); % ukupno zamucenje je konvolucija
% dva impulsna odziva
figure;mesh(h) % odziv u vremenskoj domeni
figure, freqz2(h) % frekvencijska karakteristika
img=imread('moon.tif'); % ucitavamo sliku
imgZ=conv2(double(img),double(h)); % primijenjujemo zamucenje
figure, imagesc(imgZ); colormap(gray)
%%
h1=eye(40)/40;
h3 = eye(5)/5;
h4 = eye(15)/15;
h5 = eye(25)/25;
h2=fspecial('gaussian',4,1); % Gaussovo zamucenje
% dva impulsna odziva
figure();
[ha, pos] = tight_subplot(5,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), mesh(h1);  % odziv u vremenskoj domeni
axes(ha(2)),freqz2(h1) ;% frekvencijska karakteristika
axes(ha(3)),mesh(h2);
axes(ha(4)), freqz2(h2) ;
axes(ha(5)),mesh(h3);
axes(ha(6)), freqz2(h3);
axes(ha(7)),mesh(h4) ;
axes(ha(8)), freqz2(h4);
axes(ha(9)),mesh(h5) ;
axes(ha(10)), freqz2(h5);


%%
figure();
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]);
h1=eye(10)/10;
h2=fspecial('gaussian',4,1); % Gaussovo zamucenje
h=conv2(double(h1),double(h2)); % ukupno zamucenje je konvolucija
% dva impulsna odziva
axes(ha(1)),mesh(h) % odziv u vremenskoj domeni
axes(ha(2)),freqz2(h) % frekvencijska karakteristika
%%
h1=eye(1)/10;
h2=fspecial('gaussian',4,1); % Gaussovo zamucenje
h=conv2(double(h1),double(h2)); % ukupno zamucenje je konvolucija
% dva impulsna odziva
figure;mesh(h) % odziv u vremenskoj domeni
figure, freqz2(h) % frekvencijska karakteristika
figure();
[ha, pos] = tight_subplot(1,2,[.01 .01],[.01 .01],[.01 .01]);
img=imread('salona.png'); % ucitavamo sliku
imgZ=conv2(double(img),double(h)); % primijenjujemo zamucenje

axes(ha(1)),imagesc(img); colormap(gray)
axes(ha(2)), imagesc(imgZ); colormap(gray)
%%
xs= [5, 15, 30, 50];
img=imread('klis1.jpg'); % ucitavamo sliku
figure();
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img);axis off; 
 i = 2;
for x = xs
    h1=eye(x)/x;
    h2=fspecial('gaussian',4,1); % Gaussovo zamucenje
    h=conv2(double(h1),double(h2)); % ukupno zamucenje je konvolucija
%     % dva impulsna odziva
%     figure;mesh(h) % odziv u vremenskoj domeni
%     figure, freqz2(h) % frekvencijska karakteristika
    


    
    imgZ = uint8(zeros(802+x, 602+x,3));
    imgZ(:,:,1)=conv2(double(img(:,:,1)),double(h)); % primijenjujemo zamucenje
    imgZ(:,:,2)=conv2(double(img(:,:,2)),double(h)); % primijenjujemo zamucenje
    imgZ(:,:,3)=conv2(double(img(:,:,3)),double(h)); % primijenjujemo zamucenje
    axes(ha(i)), imagesc(imgZ);axis off;
    i = i+1;
end
axes(ha(6)), axis off;
figure();
x=10;
[ha, pos] = tight_subplot(3,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img);axis off; 
for i = 1: 4
    h1=eye(x)/x;
    h2=fspecial('gaussian',i*4,1); % Gaussovo zamucenje
    h=conv2(double(h1),double(h2)); % ukupno zamucenje je konvolucija
%     % dva impulsna odziva
%     figure;mesh(h) % odziv u vremenskoj domeni
%     figure, freqz2(h) % frekvencijska karakteristika
    


    
    imgZ = uint8(zeros(802+x +(i-1)*4, 602+x+(i-1)*4,3));
    imgZ(:,:,1)=conv2(double(img(:,:,1)),double(h)); % primijenjujemo zamucenje
    imgZ(:,:,2)=conv2(double(img(:,:,2)),double(h)); % primijenjujemo zamucenje
    imgZ(:,:,3)=conv2(double(img(:,:,3)),double(h)); % primijenjujemo zamucenje
    axes(ha(i+1)), imagesc(imgZ);axis off;
end
axes(ha(6)), axis off;
%%
h1=eye(10)/10;
h2=fspecial('gaussian',10,1); % Gaussovo zamucenje
h=conv2(double(h1),double(h2));

[img1,map1]=imread('4.2.07.tiff');
[img2,map2]=imread('4.2.06.tiff');
[img3,map3]=imread('4.2.03.tiff');


img1 = im2double(img1);
restored_img1 = (zeros(size(h,1)+size(img1,1), size(h,2)+size(img1,2), size(img1,3)));
restored_img1(1:size(img1,1),1:size(img1,2), :) = (img1);
img1 = restored_img1;

hf = fft2(h,size(img1,1),size(img1,2));
img1_blur = real(ifft2(hf.*fft2(img1)));
figure; imshow(img1_blur)
img1_blur=(imnoise(img1_blur,'gaussian'));
img1_blur_GN=(imnoise(img1_blur,'gaussian'));
img1_blur_SP=(imnoise(img1_blur,'salt & pepper'));

img2 = im2double(img2);
restored_img2 = (zeros(size(h,1)+size(img2,1), size(h,2)+size(img2,2), size(img2,3)));
restored_img2(1:size(img2,1),1:size(img2,2), :) = (img2);
img2 = restored_img2;

hf = fft2(h,size(img2,1),size(img2,2));
img2_blur = real(ifft2(hf.*fft2(img2)));
figure; imshow(img2_blur)
img2_blur_GN=(imnoise(img2_blur,'gaussian'));
img2_blur_SP=(imnoise(img2_blur,'salt & pepper'));

img3 = im2double(img3);
restored_img3 = (zeros(size(h,1)+size(img3,1), size(h,2)+size(img3,2), size(img3,3)));
restored_img3(1:size(img3,1),1:size(img3,2), :) = (img3);
img3 = restored_img3;

hf = fft2(h,size(img3,1),size(img3,2));
img3_blur = real(ifft2(hf.*fft2(img3)));
figure; imshow(img3_blur)
img3_blur_GN=(imnoise(img3_blur,'gaussian'));
img3_blur_SP=(imnoise(img3_blur,'salt & pepper'));



img1_rest = restoring(img1_blur, h, false, 0);
img1_GN_rest = restoring(img1_blur_GN, h, false, 0);
img1_SP_rest = restoring(img1_blur_SP, h, false, 0);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);axis off;
axes(ha(2)), imagesc(img1_blur);axis off;
axes(ha(3)), imagesc(img1_rest);axis off;
axes(ha(4)), imagesc(img1);axis off;
axes(ha(5)), imagesc(img1_blur_GN);axis off;
axes(ha(6)), imagesc(img1_GN_rest);axis off;
axes(ha(7)), imagesc(img1);axis off;
axes(ha(8)), imagesc(img1_blur_SP);axis off;
axes(ha(9)), imagesc(img1_SP_rest);axis off;

kvadratno1 = mean2((double(img1)-double(img1_rest)).^2);
kvadratno1_SP = mean2((double(img1)-double(img1_SP_rest)).^2);
kvadratno1_GP = mean2((double(img1)-double(img1_GN_rest)).^2);




img2_rest = restoring(img2_blur, h, false, 0);
img2_GN_rest = restoring(img2_blur_GN, h, false, 0);
img2_SP_rest = restoring(img2_blur_SP, h, false, 0);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img2);axis off;
axes(ha(2)), imagesc(img2_blur);axis off;
axes(ha(3)), imagesc(img2_rest);axis off;
axes(ha(4)), imagesc(img2);axis off;
axes(ha(5)), imagesc(img2_blur_GN);axis off;
axes(ha(6)), imagesc(img2_GN_rest);axis off;
axes(ha(7)), imagesc(img2);axis off;
axes(ha(8)), imagesc(img2_blur_SP);axis off;
axes(ha(9)), imagesc(img2_SP_rest);axis off;

kvadratno2 = mean2((double(img2)-double(img2_rest)).^2);
kvadratno2_SP = mean2((double(img2)-double(img2_SP_rest)).^2);
kvadratno2_GP = mean2((double(img2)-double(img2_GN_rest)).^2);


img3_rest = restoring(img3_blur, h, false, 0);
img3_GN_rest = restoring(img3_blur_GN, h, false, 0);
img3_SP_rest = restoring(img3_blur_SP, h, false, 0);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img3);axis off;
axes(ha(2)), imagesc(img3_blur);axis off;
axes(ha(3)), imagesc(img3_rest);axis off;
axes(ha(4)), imagesc(img3);axis off;
axes(ha(5)), imagesc(img3_blur_GN);axis off;
axes(ha(6)), imagesc(img3_GN_rest);axis off;
axes(ha(7)), imagesc(img3);axis off;
axes(ha(8)), imagesc(img3_blur_SP);axis off;
axes(ha(9)), imagesc(img3_SP_rest);axis off;

kvadratno3 = mean2((double(img3)-double(img3_rest)).^2);
kvadratno3_SP = mean2((double(img3)-double(img3_SP_rest)).^2);
kvadratno3_GP = mean2((double(img3)-double(img3_GN_rest)).^2);

%%
h1=eye(10)/10;
h2=fspecial('gaussian',10,1); % Gaussovo zamucenje
h=conv2(double(h1),double(h2));
K = 0.04;
[img1,map1]=imread('4.2.07.tiff');
[img2,map2]=imread('4.2.06.tiff');
[img3,map3]=imread('4.2.03.tiff');


img1 = im2double(img1);
restored_img1 = (zeros(size(h,1)+size(img1,1), size(h,2)+size(img1,2), size(img1,3)));
restored_img1(1:size(img1,1),1:size(img1,2), :) = (img1);
img1 = restored_img1;

hf = fft2(h,size(img1,1),size(img1,2));
img1_blur = real(ifft2(hf.*fft2(img1)));
figure; imshow(img1_blur)
img1_blur=(imnoise(img1_blur,'gaussian'));
img1_blur_GN=(imnoise(img1_blur,'gaussian'));
img1_blur_SP=(imnoise(img1_blur,'salt & pepper'));

for i = 1 : size(img1_blur,3)
img1_blur_dim =   img1_blur(:,:,i);
img1_blur_GN_dim = img1_blur_GN(:,:,i);
img1_blur_SP_dim = img1_blur_SP(:,:,i);

q = double(max(img1_blur_dim(:)) - min(img1_blur_dim(:)))/(pow2(8)-1);
img1_blur(:,:,i) = quant(img1_blur_dim, q);

q = double(max(img1_blur_GN_dim(:)) - min(img1_blur_GN_dim(:)))/(pow2(8)-1);
img1_blur_GN(:,:,i) = quant(img1_blur_GN_dim, q);

q = double(max(img1_blur_SP_dim(:)) - min(img1_blur_SP_dim(:)))/(pow2(8)-1);
img1_blur_SP(:,:,i) = quant(img1_blur_SP_dim, q);
end

img2 = im2double(img2);
restored_img2 = (zeros(size(h,1)+size(img2,1), size(h,2)+size(img2,2), size(img2,3)));
restored_img2(1:size(img2,1),1:size(img2,2), :) = (img2);
img2 = restored_img2;

hf = fft2(h,size(img2,1),size(img2,2));
img2_blur = real(ifft2(hf.*fft2(img2)));
figure; imshow(img2_blur)
img2_blur_GN=(imnoise(img2_blur,'gaussian'));
img2_blur_SP=(imnoise(img2_blur,'salt & pepper'));

for i = 1 : size(img2_blur,3)
img2_blur_dim =   img2_blur(:,:,i);
img2_blur_GN_dim = img2_blur_GN(:,:,i);
img2_blur_SP_dim = img2_blur_SP(:,:,i);

q = double(max(img2_blur_dim(:)) - min(img2_blur_dim(:)))/(pow2(8)-1);
img2_blur(:,:,i) = quant(img2_blur_dim, q);

q = double(max(img2_blur_GN_dim(:)) - min(img2_blur_GN_dim(:)))/(pow2(8)-1);
img2_blur_GN(:,:,i) = quant(img2_blur_GN_dim, q);

q = double(max(img2_blur_SP_dim(:)) - min(img2_blur_SP_dim(:)))/(pow2(8)-1);
img2_blur_SP(:,:,i) = quant(img2_blur_SP_dim, q);
end


img3 = im2double(img3);
restored_img3 = (zeros(size(h,1)+size(img3,1), size(h,2)+size(img3,2), size(img3,3)));
restored_img3(1:size(img3,1),1:size(img3,2), :) = (img3);
img3 = restored_img3;

hf = fft2(h,size(img3,1),size(img3,2));
img3_blur = real(ifft2(hf.*fft2(img3)));
figure; imshow(img3_blur)
img3_blur_GN=(imnoise(img3_blur,'gaussian'));
img3_blur_SP=(imnoise(img3_blur,'salt & pepper'));

for i = 1 : size(img3_blur,3)
img3_blur_dim =   img3_blur(:,:,i);
img3_blur_GN_dim = img3_blur_GN(:,:,i);
img3_blur_SP_dim = img3_blur_SP(:,:,i);

q = double(max(img3_blur_dim(:)) - min(img3_blur_dim(:)))/(pow2(8)-1);
img3_blur(:,:,i) = quant(img3_blur_dim, q);

q = double(max(img3_blur_GN_dim(:)) - min(img3_blur_GN_dim(:)))/(pow2(8)-1);
img3_blur_GN(:,:,i) = quant(img3_blur_GN_dim, q);

q = double(max(img3_blur_SP_dim(:)) - min(img3_blur_SP_dim(:)))/(pow2(8)-1);
img3_blur_SP(:,:,i) = quant(img3_blur_SP_dim, q);
end


img1_rest = restoring(img1_blur, h, false, K);
img1_GN_rest = restoring(img1_blur_GN, h, false, K);
img1_SP_rest = restoring(img1_blur_SP, h, false, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);axis off;
axes(ha(2)), imagesc(img1_blur);axis off;
axes(ha(3)), imagesc(img1_rest);axis off;
axes(ha(4)), imagesc(img1);axis off;
axes(ha(5)), imagesc(img1_blur_GN);axis off;
axes(ha(6)), imagesc(img1_GN_rest);axis off;
axes(ha(7)), imagesc(img1);axis off;
axes(ha(8)), imagesc(img1_blur_SP);axis off;
axes(ha(9)), imagesc(img1_SP_rest);axis off;

kvadratno1 = mean2((double(img1)-double(img1_rest)).^2);
kvadratno1_SP = mean2((double(img1)-double(img1_SP_rest)).^2);
kvadratno1_GP = mean2((double(img1)-double(img1_GN_rest)).^2);




img2_rest = restoring(img2_blur, h,false, K);
img2_GN_rest = restoring(img2_blur_GN, h, false, K);
img2_SP_rest = restoring(img2_blur_SP, h, false, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img2);axis off;
axes(ha(2)), imagesc(img2_blur);axis off;
axes(ha(3)), imagesc(img2_rest);axis off;
axes(ha(4)), imagesc(img2);axis off;
axes(ha(5)), imagesc(img2_blur_GN);axis off;
axes(ha(6)), imagesc(img2_GN_rest);axis off;
axes(ha(7)), imagesc(img2);axis off;
axes(ha(8)), imagesc(img2_blur_SP);axis off;
axes(ha(9)), imagesc(img2_SP_rest);axis off;

kvadratno2 = mean2((double(img2)-double(img2_rest)).^2);
kvadratno2_SP = mean2((double(img2)-double(img2_SP_rest)).^2);
kvadratno2_GP = mean2((double(img2)-double(img2_GN_rest)).^2);


img3_rest = restoring(img3_blur, h, false, K);
img3_GN_rest = restoring(img3_blur_GN, h, false, K);
img3_SP_rest = restoring(img3_blur_SP, h, false, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img3);axis off;
axes(ha(2)), imagesc(img3_blur);axis off;
axes(ha(3)), imagesc(img3_rest);axis off;
axes(ha(4)), imagesc(img3);axis off;
axes(ha(5)), imagesc(img3_blur_GN);axis off;
axes(ha(6)), imagesc(img3_GN_rest);axis off;
axes(ha(7)), imagesc(img3);axis off;
axes(ha(8)), imagesc(img3_blur_SP);axis off;
axes(ha(9)), imagesc(img3_SP_rest);axis off;

kvadratno3 = mean2((double(img3)-double(img3_rest)).^2);
kvadratno3_SP = mean2((double(img3)-double(img3_SP_rest)).^2);
kvadratno3_GP = mean2((double(img3)-double(img3_GN_rest)).^2);
%%
%%
h1=eye(10)/10;
h2=fspecial('gaussian',10,1); % Gaussovo zamucenje
h=conv2(double(h1),double(h2));
K = 0.04;
[img1,map1]=imread('4.2.07.tiff');
[img2,map2]=imread('4.2.06.tiff');
[img3,map3]=imread('4.2.03.tiff');


img1 = im2double(img1);
restored_img1 = (zeros(size(h,1)+size(img1,1), size(h,2)+size(img1,2), size(img1,3)));
restored_img1(1:size(img1,1),1:size(img1,2), :) = (img1);
img1 = restored_img1;

hf = fft2(h,size(img1,1),size(img1,2));
img1_blur = real(ifft2(hf.*fft2(img1)));
figure; imshow(img1_blur)
img1_blur=(imnoise(img1_blur,'gaussian'));
img1_blur_GN=(imnoise(img1_blur,'gaussian'));
img1_blur_SP=(imnoise(img1_blur,'salt & pepper'));

img2 = im2double(img2);
restored_img2 = (zeros(size(h,1)+size(img2,1), size(h,2)+size(img2,2), size(img2,3)));
restored_img2(1:size(img2,1),1:size(img2,2), :) = (img2);
img2 = restored_img2;

hf = fft2(h,size(img2,1),size(img2,2));
img2_blur = real(ifft2(hf.*fft2(img2)));
figure; imshow(img2_blur)
img2_blur_GN=(imnoise(img2_blur,'gaussian'));
img2_blur_SP=(imnoise(img2_blur,'salt & pepper'));

img3 = im2double(img3);
restored_img3 = (zeros(size(h,1)+size(img3,1), size(h,2)+size(img3,2), size(img3,3)));
restored_img3(1:size(img3,1),1:size(img3,2), :) = (img3);
img3 = restored_img3;

hf = fft2(h,size(img3,1),size(img3,2));
img3_blur = real(ifft2(hf.*fft2(img3)));
figure; imshow(img3_blur)
img3_blur_GN=(imnoise(img3_blur,'gaussian'));
img3_blur_SP=(imnoise(img3_blur,'salt & pepper'));



img1_rest = restoring(img1_blur, h, true, K);
img1_GN_rest = restoring(img1_blur_GN, h, true, K);
img1_SP_rest = restoring(img1_blur_SP, h, true, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);axis off;
axes(ha(2)), imagesc(img1_blur);axis off;
axes(ha(3)), imagesc(img1_rest);axis off;
axes(ha(4)), imagesc(img1);axis off;
axes(ha(5)), imagesc(img1_blur_GN);axis off;
axes(ha(6)), imagesc(img1_GN_rest);axis off;
axes(ha(7)), imagesc(img1);axis off;
axes(ha(8)), imagesc(img1_blur_SP);axis off;
axes(ha(9)), imagesc(img1_SP_rest);axis off;

kvadratno1 = mean2((double(img1)-double(img1_rest)).^2);
kvadratno1_SP = mean2((double(img1)-double(img1_SP_rest)).^2);
kvadratno1_GP = mean2((double(img1)-double(img1_GN_rest)).^2);




img2_rest = restoring(img2_blur, h,true, K);
img2_GN_rest = restoring(img2_blur_GN, h, true, K);
img2_SP_rest = restoring(img2_blur_SP, h, true, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img2);axis off;
axes(ha(2)), imagesc(img2_blur);axis off;
axes(ha(3)), imagesc(img2_rest);axis off;
axes(ha(4)), imagesc(img2);axis off;
axes(ha(5)), imagesc(img2_blur_GN);axis off;
axes(ha(6)), imagesc(img2_GN_rest);axis off;
axes(ha(7)), imagesc(img2);axis off;
axes(ha(8)), imagesc(img2_blur_SP);axis off;
axes(ha(9)), imagesc(img2_SP_rest);axis off;

kvadratno2 = mean2((double(img2)-double(img2_rest)).^2);
kvadratno2_SP = mean2((double(img2)-double(img2_SP_rest)).^2);
kvadratno2_GP = mean2((double(img2)-double(img2_GN_rest)).^2);


img3_rest = restoring(img3_blur, h, true, K);
img3_GN_rest = restoring(img3_blur_GN, h, true, K);
img3_SP_rest = restoring(img3_blur_SP, h, true, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img3);axis off;
axes(ha(2)), imagesc(img3_blur);axis off;
axes(ha(3)), imagesc(img3_rest);axis off;
axes(ha(4)), imagesc(img3);axis off;
axes(ha(5)), imagesc(img3_blur_GN);axis off;
axes(ha(6)), imagesc(img3_GN_rest);axis off;
axes(ha(7)), imagesc(img3);axis off;
axes(ha(8)), imagesc(img3_blur_SP);axis off;
axes(ha(9)), imagesc(img3_SP_rest);axis off;

kvadratno3 = mean2((double(img3)-double(img3_rest)).^2);
kvadratno3_SP = mean2((double(img3)-double(img3_SP_rest)).^2);
kvadratno3_GP = mean2((double(img3)-double(img3_GN_rest)).^2);



%%
%%
h1=eye(10)/10;
h2=fspecial('gaussian',10,1); % Gaussovo zamucenje
h=conv2(double(h1),double(h2));
K = 0.04;
[img1,map1]=imread('4.2.07.tiff');
[img2,map2]=imread('4.2.06.tiff');
[img3,map3]=imread('4.2.03.tiff');


img1 = im2double(img1);
restored_img1 = (zeros(size(h,1)+size(img1,1), size(h,2)+size(img1,2), size(img1,3)));
restored_img1(1:size(img1,1),1:size(img1,2), :) = (img1);
img1 = restored_img1;

hf = fft2(h,size(img1,1),size(img1,2));
img1_blur = real(ifft2(hf.*fft2(img1)));
figure; imshow(img1_blur)
img1_blur=(imnoise(img1_blur,'gaussian'));
img1_blur_GN=(imnoise(img1_blur,'gaussian'));
img1_blur_SP=(imnoise(img1_blur,'salt & pepper'));

for i = 1 : size(img1_blur,3)
img1_blur_dim =   img1_blur(:,:,i);
img1_blur_GN_dim = img1_blur_GN(:,:,i);
img1_blur_SP_dim = img1_blur_SP(:,:,i);

q = double(max(img1_blur_dim(:)) - min(img1_blur_dim(:)))/(pow2(8)-1);
img1_blur(:,:,i) = quant(img1_blur_dim, q);

q = double(max(img1_blur_GN_dim(:)) - min(img1_blur_GN_dim(:)))/(pow2(8)-1);
img1_blur_GN(:,:,i) = quant(img1_blur_GN_dim, q);

q = double(max(img1_blur_SP_dim(:)) - min(img1_blur_SP_dim(:)))/(pow2(8)-1);
img1_blur_SP(:,:,i) = quant(img1_blur_SP_dim, q);
end

img2 = im2double(img2);
restored_img2 = (zeros(size(h,1)+size(img2,1), size(h,2)+size(img2,2), size(img2,3)));
restored_img2(1:size(img2,1),1:size(img2,2), :) = (img2);
img2 = restored_img2;

hf = fft2(h,size(img2,1),size(img2,2));
img2_blur = real(ifft2(hf.*fft2(img2)));
figure; imshow(img2_blur)
img2_blur_GN=(imnoise(img2_blur,'gaussian'));
img2_blur_SP=(imnoise(img2_blur,'salt & pepper'));

for i = 1 : size(img2_blur,3)
img2_blur_dim =   img2_blur(:,:,i);
img2_blur_GN_dim = img2_blur_GN(:,:,i);
img2_blur_SP_dim = img2_blur_SP(:,:,i);

q = double(max(img2_blur_dim(:)) - min(img2_blur_dim(:)))/(pow2(8)-1);
img2_blur(:,:,i) = quant(img2_blur_dim, q);

q = double(max(img2_blur_GN_dim(:)) - min(img2_blur_GN_dim(:)))/(pow2(8)-1);
img2_blur_GN(:,:,i) = quant(img2_blur_GN_dim, q);

q = double(max(img2_blur_SP_dim(:)) - min(img2_blur_SP_dim(:)))/(pow2(8)-1);
img2_blur_SP(:,:,i) = quant(img2_blur_SP_dim, q);
end


img3 = im2double(img3);
restored_img3 = (zeros(size(h,1)+size(img3,1), size(h,2)+size(img3,2), size(img3,3)));
restored_img3(1:size(img3,1),1:size(img3,2), :) = (img3);
img3 = restored_img3;

hf = fft2(h,size(img3,1),size(img3,2));
img3_blur = real(ifft2(hf.*fft2(img3)));
figure; imshow(img3_blur)
img3_blur_GN=(imnoise(img3_blur,'gaussian'));
img3_blur_SP=(imnoise(img3_blur,'salt & pepper'));

for i = 1 : size(img3_blur,3)
img3_blur_dim =   img3_blur(:,:,i);
img3_blur_GN_dim = img3_blur_GN(:,:,i);
img3_blur_SP_dim = img3_blur_SP(:,:,i);

q = double(max(img3_blur_dim(:)) - min(img3_blur_dim(:)))/(pow2(8)-1);
img3_blur(:,:,i) = quant(img3_blur_dim, q);

q = double(max(img3_blur_GN_dim(:)) - min(img3_blur_GN_dim(:)))/(pow2(8)-1);
img3_blur_GN(:,:,i) = quant(img3_blur_GN_dim, q);

q = double(max(img3_blur_SP_dim(:)) - min(img3_blur_SP_dim(:)))/(pow2(8)-1);
img3_blur_SP(:,:,i) = quant(img3_blur_SP_dim, q);
end


img1_rest = restoring(img1_blur, h, true, K);
img1_GN_rest = restoring(img1_blur_GN, h, true, K);
img1_SP_rest = restoring(img1_blur_SP, h, true, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);axis off;
axes(ha(2)), imagesc(img1_blur);axis off;
axes(ha(3)), imagesc(img1_rest);axis off;
axes(ha(4)), imagesc(img1);axis off;
axes(ha(5)), imagesc(img1_blur_GN);axis off;
axes(ha(6)), imagesc(img1_GN_rest);axis off;
axes(ha(7)), imagesc(img1);axis off;
axes(ha(8)), imagesc(img1_blur_SP);axis off;
axes(ha(9)), imagesc(img1_SP_rest);axis off;

kvadratno1 = mean2((double(img1)-double(img1_rest)).^2);
kvadratno1_SP = mean2((double(img1)-double(img1_SP_rest)).^2);
kvadratno1_GP = mean2((double(img1)-double(img1_GN_rest)).^2);




img2_rest = restoring(img2_blur, h,true, K);
img2_GN_rest = restoring(img2_blur_GN, h, true, K);
img2_SP_rest = restoring(img2_blur_SP, h, true, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img2);axis off;
axes(ha(2)), imagesc(img2_blur);axis off;
axes(ha(3)), imagesc(img2_rest);axis off;
axes(ha(4)), imagesc(img2);axis off;
axes(ha(5)), imagesc(img2_blur_GN);axis off;
axes(ha(6)), imagesc(img2_GN_rest);axis off;
axes(ha(7)), imagesc(img2);axis off;
axes(ha(8)), imagesc(img2_blur_SP);axis off;
axes(ha(9)), imagesc(img2_SP_rest);axis off;

kvadratno2 = mean2((double(img2)-double(img2_rest)).^2);
kvadratno2_SP = mean2((double(img2)-double(img2_SP_rest)).^2);
kvadratno2_GP = mean2((double(img2)-double(img2_GN_rest)).^2);


img3_rest = restoring(img3_blur, h, true, K);
img3_GN_rest = restoring(img3_blur_GN, h, true, K);
img3_SP_rest = restoring(img3_blur_SP, h, true, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img3);axis off;
axes(ha(2)), imagesc(img3_blur);axis off;
axes(ha(3)), imagesc(img3_rest);axis off;
axes(ha(4)), imagesc(img3);axis off;
axes(ha(5)), imagesc(img3_blur_GN);axis off;
axes(ha(6)), imagesc(img3_GN_rest);axis off;
axes(ha(7)), imagesc(img3);axis off;
axes(ha(8)), imagesc(img3_blur_SP);axis off;
axes(ha(9)), imagesc(img3_SP_rest);axis off;

kvadratno3 = mean2((double(img3)-double(img3_rest)).^2);
kvadratno3_SP = mean2((double(img3)-double(img3_SP_rest)).^2);
kvadratno3_GP = mean2((double(img3)-double(img3_GN_rest)).^2);

%%
%Weiner
%%
h1=eye(10)/10;
h2=fspecial('gaussian',10,1); % Gaussovo zamucenje
h=conv2(double(h1),double(h2));
K = 0.12;
[img1,map1]=imread('4.2.07.tiff');
[img2,map2]=imread('4.2.06.tiff');
[img3,map3]=imread('4.2.03.tiff');


img1 = im2double(img1);
restored_img1 = (zeros(size(h,1)+size(img1,1), size(h,2)+size(img1,2), size(img1,3)));
restored_img1(1:size(img1,1),1:size(img1,2), :) = (img1);
img1 = restored_img1;

hf = fft2(h,size(img1,1),size(img1,2));
img1_blur = real(ifft2(hf.*fft2(img1)));
figure; imshow(img1_blur)
img1_blur=(imnoise(img1_blur,'gaussian'));
img1_blur_GN=(imnoise(img1_blur,'gaussian'));
img1_blur_SP=(imnoise(img1_blur,'salt & pepper'));

img2 = im2double(img2);
restored_img2 = (zeros(size(h,1)+size(img2,1), size(h,2)+size(img2,2), size(img2,3)));
restored_img2(1:size(img2,1),1:size(img2,2), :) = (img2);
img2 = restored_img2;

hf = fft2(h,size(img2,1),size(img2,2));
img2_blur = real(ifft2(hf.*fft2(img2)));
figure; imshow(img2_blur)
img2_blur_GN=(imnoise(img2_blur,'gaussian'));
img2_blur_SP=(imnoise(img2_blur,'salt & pepper'));

img3 = im2double(img3);
restored_img3 = (zeros(size(h,1)+size(img3,1), size(h,2)+size(img3,2), size(img3,3)));
restored_img3(1:size(img3,1),1:size(img3,2), :) = (img3);
img3 = restored_img3;

hf = fft2(h,size(img3,1),size(img3,2));
img3_blur = real(ifft2(hf.*fft2(img3)));
figure; imshow(img3_blur)
img3_blur_GN=(imnoise(img3_blur,'gaussian'));
img3_blur_SP=(imnoise(img3_blur,'salt & pepper'));



img1_rest = imwiener(img1_blur, h, K);
img1_GN_rest = imwiener(img1_blur_GN, h, K);
img1_SP_rest = imwiener(img1_blur_SP, h, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img1);axis off;
axes(ha(2)), imagesc(img1_blur);axis off;
axes(ha(3)), imagesc(img1_rest);axis off;
axes(ha(4)), imagesc(img1);axis off;
axes(ha(5)), imagesc(img1_blur_GN);axis off;
axes(ha(6)), imagesc(img1_GN_rest);axis off;
axes(ha(7)), imagesc(img1);axis off;
axes(ha(8)), imagesc(img1_blur_SP);axis off;
axes(ha(9)), imagesc(img1_SP_rest);axis off;

kvadratno1 = mean2((double(img1)-double(img1_rest)).^2);
kvadratno1_SP = mean2((double(img1)-double(img1_SP_rest)).^2);
kvadratno1_GP = mean2((double(img1)-double(img1_GN_rest)).^2);


SN1 = mean2(double(img1))/mean2(double(img1_rest));
SN1_SP = mean2(double(img1))/mean2(double(img1_SP_rest));
SN1_GP = mean2(double(img1))/mean2(double(img1_GN_rest));

img2_rest = imwiener(img2_blur, h, K);
img2_GN_rest = imwiener(img2_blur_GN, h,  K);
img2_SP_rest = imwiener(img2_blur_SP, h, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img2);axis off;
axes(ha(2)), imagesc(img2_blur);axis off;
axes(ha(3)), imagesc(img2_rest);axis off;
axes(ha(4)), imagesc(img2);axis off;
axes(ha(5)), imagesc(img2_blur_GN);axis off;
axes(ha(6)), imagesc(img2_GN_rest);axis off;
axes(ha(7)), imagesc(img2);axis off;
axes(ha(8)), imagesc(img2_blur_SP);axis off;
axes(ha(9)), imagesc(img2_SP_rest);axis off;

kvadratno2 = mean2((double(img2)-double(img2_rest)).^2);
kvadratno2_SP = mean2((double(img2)-double(img2_SP_rest)).^2);
kvadratno2_GP = mean2((double(img2)-double(img2_GN_rest)).^2);

SN2 = mean2(double(img2))/mean2(double(img2_rest));
SN2_SP = mean2(double(img2))/mean2(double(img2_SP_rest));
SN2_GP = mean2(double(img2))/mean2(double(img2_GN_rest));

img3_rest = imwiener(img3_blur, h, K);
img3_GN_rest = imwiener(img3_blur_GN, h,  K);
img3_SP_rest = imwiener(img3_blur_SP, h, K);

figure();
[ha, pos] = tight_subplot(3,3,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img3);axis off;
axes(ha(2)), imagesc(img3_blur);axis off;
axes(ha(3)), imagesc(img3_rest);axis off;
axes(ha(4)), imagesc(img3);axis off;
axes(ha(5)), imagesc(img3_blur_GN);axis off;
axes(ha(6)), imagesc(img3_GN_rest);axis off;
axes(ha(7)), imagesc(img3);axis off;
axes(ha(8)), imagesc(img3_blur_SP);axis off;
axes(ha(9)), imagesc(img3_SP_rest);axis off;

kvadratno3 = mean2((double(img3)-double(img3_rest)).^2);
kvadratno3_SP = mean2((double(img3)-double(img3_SP_rest)).^2);
kvadratno3_GP = mean2((double(img3)-double(img3_GN_rest)).^2);


SN3 = mean2(double(img3))/mean2(double(img3_rest));
SN3_SP = mean2(double(img3))/mean2(double(img3_SP_rest));
SN3_GP = mean2(double(img3))/mean2(double(img3_GN_rest));

%%


[img1,map1]=imread('4.2.07.tiff');
h2=fspecial('gaussian',10,.001);
img=im2double(img1);
imgZN=imnoise(img,'gaussian',0,.001);
figure(); imshow(imgZN);

rxx=akf(imgZN, 30);
figure(); imagesc(rxx);
rnn=akf(im2double(imgZN)-im2double(img), 30);
figure(); imagesc(rnn);






img1_rest =imwiener(img1_blur ,h2,  K);
ryy_iz=akf(img, 30);
figure(); imagesc(ryy_iz)




%% 

clc
clear all
noise_mean = 0;
noise_var = 0.1;
[img1,map1]=imread('4.2.07.tiff');
img = im2double(rgb2gray(img1));
h = real(imnoise(img, 'gaussian', noise_mean, noise_var));
h1= fspecial('gaussian',4,1); 
h2 = eye(10)/10;
h = conv2(fft2(h1),fft2(h2));
[img1,map1]=imread('4.2.07.tiff');
img = im2double(rgb2gray(img1));
%img = imnoise(img, 'gaussian', 0.3, 0.001);
%img = img + 0.06*randn(size(img, 1), size(img, 2));

imgZ = real(conv2(img, h));

imgZ=imgZ(1:512,1:512);
rxx_n=akf(((im2double(img)-im2double(imgZ))),30);
rxx_o=akf(img,30);
%rxx_d=akf(h,30);


F_img=fft2(double(imgZ));
F_h=fft2(double(h),size(img,1),size(img,2));
F_rxx_n=fft2(double(rxx_n),size(img,1),size(img,2));
F_rxx_o=fft2(double(rxx_o),size(img,1),size(img,2));
%F_rxx_d=fft2(double(rxx_d),size(img,1),size(img,2));

F_sl=F_img.*conj(F_h)./(conj(F_h).*F_h+F_rxx_n./F_rxx_o);
img_inv=real(ifft2((F_sl)));


figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img); colormap(gray);axis off;
axes(ha(2)), imagesc((imgZ)); colormap(gray);axis off;
axes(ha(3)), imagesc(real(img_inv)); colormap(gray);axis off;
axes(ha(4)), axis off;


%% 

clc
clear all
noise_mean = 0;
noise_var = 0.1;
[img1,map1]=imread('4.2.07.tiff');
img = im2double(rgb2gray(img1));
%h = real(imnoise(img, 'gaussian', noise_mean, noise_var));
h1= fspecial('gaussian',4,1); 
h2 = eye(10)/10;
h = conv2(fft2(h1),fft2(h2));
[img1,map1]=imread('4.2.07.tiff');
img = im2double(rgb2gray(img1));
img = imnoise(img, 'gaussian', 0.3, 0.001);


imgZ = real(conv2(img, h));

imgZ=imgZ(1:512,1:512);
rxx_n=akf(((im2double(img)-im2double(imgZ))),30);
rxx_o=akf(img,30);
rxx_d=akf(imgZ,30);

F_img=fft2(double(imgZ));
F_h=fft2(double(h),size(img,1),size(img,2));
F_rxx_n=fft2(double(rxx_n),size(img,1),size(img,2));
F_rxx_o=fft2(double(rxx_o),size(img,1),size(img,2));
%F_rxx_d=fft2(double(rxx_d),size(img,1),size(img,2));

F_sl=F_img.*conj(F_h)./(conj(F_h).*F_h+F_rxx_n./F_rxx_o);
img_inv=real(ifft2((F_sl)));


figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img); colormap(gray);axis off;
axes(ha(2)), imagesc((imgZ)); colormap(gray);axis off;
axes(ha(3)), imagesc(real(img_inv)); colormap(gray);axis off;
axes(ha(4)), axis off;

%img=im2double(imread('klis2.png'));
img_inv=im2double(img_inv);

rxx_o=akf(img,30)
rxx_d=akf(img_inv,30)

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img); colormap(gray);axis off;
axes(ha(2)), imagesc(im2double(img_inv));   colormap(gray);axis off;
axes(ha(3)), imagesc(rxx_o);colormap(gray);axis off;
axes(ha(4)), imagesc(rxx_d);colormap(gray);axis off;



%% 
%K = wiener2(J,[5 5]);
clc
clear all
h1= fspecial('gaussian',4,1); 
h2 = eye(10)/10;
h = conv2(fft2(h1),fft2(h2));
[img1,map1]=imread('4.2.07.tiff');
img = im2double(rgb2gray(img1));
img = img + 0.06*randn(size(img, 1), size(img, 2));

imgZ = real(conv2(img, h));
filt=imgZ;
imgZ = wiener2(im2double(imgZ),[6 6]);
imgZ=imgZ(1:512,1:512);
rxx_n=akf(((im2double(img)-im2double(imgZ))),30);
rxx_o=akf(img,30);

F_img=fft2(double(imgZ));
F_h=fft2(double(h),size(img,1),size(img,2));
F_rxx_n=fft2(double(rxx_n),size(img,1),size(img,2));
F_rxx_o=fft2(double(rxx_o),size(img,1),size(img,2));

F_sl=F_img.*conj(F_h)./(conj(F_h).*F_h+F_rxx_n./F_rxx_o);

img_inv=real(ifft2((F_sl)));

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img); colormap(gray);axis off;
axes(ha(2)), imagesc((filt));  colormap(gray);axis off;
axes(ha(3)), imagesc((imgZ));colormap(gray);axis off;
axes(ha(4)), imagesc(real(img_inv));colormap(gray);axis off;


img_inv=im2double(img_inv);

rxx_o=akf(img,30);
rxx_d=akf(img_inv,30);

figure();
[ha, pos] = tight_subplot(2,2,[.01 .01],[.01 .01],[.01 .01]);
axes(ha(1)), imagesc(img); colormap(gray);axis off;
axes(ha(2)), imagesc(im2double(img_inv));  colormap(gray);axis off;
axes(ha(3)), imagesc(rxx_o); colormap(gray);axis off;
axes(ha(4)), imagesc(rxx_d); colormap(gray);axis off;

