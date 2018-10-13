function img_out = entropy(img, pomak)

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
log_p = log2(p);
log_p(find(log_p == -Inf)) = 0;

img_out = -sum(sum( p.*log_p ));








