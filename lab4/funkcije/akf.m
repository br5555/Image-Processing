function rxx = akf(slika, dx, dy)
% AKF - Procjena autokorelacijske funkcije.
%   Rxx = AKF(I) racuna autokorelacijsku funkciju za ulaznu
%   sliku I. Zbog rubnih efekata racuna se samo do polovine
%   dimenzije slike.
%
%   Rxx = AKF(I, d) racuna autokorelacijsku funkciju samo
%   za prvih d pomaka po x i y smjeru.
%
%   Rxx = AKF(I, dx, dy) racuna autokorelacijsku funkciju
%   za prvih dx pomaka po x i prvih dy pomaka po y.

% DOAS - Laboratorijske vjezbe - 31. 3. 2010.

% $Revizija: 1.1 $  $Datum: 2010-03-31 16:49:14 $
% $Autor(i): Hrvoje Kalinić i Tomislav Petkovic $

% Slika mora biti zadana.
error(nargchk(1,3,nargin));

% Skaliraj sliku na interval [0,1]
I = im2double(slika);

% Odredi dimenzije slike i maksimalne pomake.
[n, m] = size(slika);
dx_max = fix(n/2);
dy_max = fix(m/2);
d_min = min([dx_max, dy_max]);

% Provjeri zadane pomake.
if 2 == nargin
   if dx < d_min
      dx_max = fix(dx);
      dy_max = fix(dx);
   else
      dx_max = d_min;
      dy_max = d_min;
   end
elseif 3 == nargin
   if dx < dx_max
      dx_max = fix(dx);
   end
   if dy < dy_max
      dy_max = fix(dy);
   end
end


% inicijalizacija varijabli
rxx = zeros(dx_max, dy_max);

% racunamo autokorelacijsku funkciju slike I redom
% za razlicite pozitivne pomake dx i dy
for dx = 1:dx_max
  for dy = 1:dy_max
     rxx(dx,dy) = corr2(I(1:n-dx_max, 1:m-dy_max), I(dx:n-dx_max+dx-1, dy:m-dy_max+dy-1));
  end
end

% kako je autokorelacijska funkcija simetricna samo nadopunimo
% negativne pomake
[nr mr] = size(rxx);
rxx = [fliplr(rxx(:, 2:mr)), rxx];
rxx = [flipud(rxx(2:nr, :)); rxx];


end

