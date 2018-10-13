function img_out = covariance(img, pomak)

% DOAS - Laboratorijske vjezbe - 20. 4. 2010.

% $Revizija: 0.5 $  $Datum: 2010-04-20 16:52:11 $
% $Autor(i): Hrvoje Kalinić $

B = 16; % definiramo broj polja u koja ćemo grupirati vrijednosti histograma

img = im2double(img);     % pretvaramo sliku u double format (ako već nije)
img1 = img(pomak(2)+1:end,pomak(1)+1:end);
img2 = img(1:end-pomak(2),1:end-pomak(1));

[h,x] = hist3([img1(:), img2(:)], {(0.5:B)/B,(0.5:B)/B}); 
% [h,x] = hist3([img1(:), img2(:)], [B,B]); 

p = h / sum(h(:));
m1 = mean(img1(:));
m2 = mean(img2(:));

c = x{1};
x1 = repmat(c-m1, length(c), 1);
x2 = repmat(c-m2, length(c), 1);

pom =  x1 .* x2' .* p;
img_out = sum(pom(:));






