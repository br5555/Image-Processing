function img_out = absolute(img, pomak)

% DOAS - Laboratorijske vjezbe - 20. 4. 2010.

% $Revizija: 0.5 $  $Datum: 2010-04-20 16:52:11 $
% $Autor(i): Hrvoje Kalinić $

img = im2double(img);     % pretvaramo sliku u double format (ako već nije)
img1 = img(pomak(2)+1:end,pomak(1)+1:end);
img2 = img(1:end-pomak(2),1:end-pomak(1));

pom = abs(img1 - img2);
img_out = sum(pom(:));




