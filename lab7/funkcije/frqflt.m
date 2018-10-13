function filt = frqfilt(dim, x0, y0, r)
% FRQFLT - Konstrukcija idelanog filtra u frekvencijskoj domeni
%   filt = frqfilt(dim, x0, y0, r)
%   dim - dimenzija filtra
%   x0, y0 - ishodište filtra
%   r - koliko okolnih frekvencija čuvamo (radius)
%   Izlaz funkcije je slika filt koja na mjestu frekvencija koje čuvamo
%   ima 1, a na ostalima 0. Složenije filtre možemo lako konstruirati 
%   logičkim operacijama (nepr not(filt1) ili filt1&filt2 i sl.)

% DOAS - Laboratorijske vjezbe - 05. 3. 2010.

% $Revizija: 1.0 $  $Datum: 2010/03/05 16:12:31 $
% $Autor(i): Hrvoje Kalinić $

if nargin ~= 4
    error('Neispravno zadani parametri');
end
if(length(dim)~=2)
    error('Dimenzija mora biti uređeni par formata [y_dim, x_dim]');
end
if x0 > dim(2) || y0 > dim(1)
    error('Ishodište filtra neispranvo zadano');
end
if (x0-r)<1 || (x0+r) > dim(2) || (y0-r)<1 || (y0+r) > dim(1)
    error('Radijus filra neispravno zadan');
end
    
filt = zeros(dim);

for i = x0-r:x0+r
    for j = y0-r:y0+r
        filt(j,i) = ((x0-i).^2 + (y0-j).^2 < r^2);
    end
end
