function rez = energija(ulaz)

for i = 1: size(ulaz,2)
     [h, ~] = imhist(ulaz(:, i));
     p_u = h / sum(h);
     rez(1, i) = (-sum(sum(p_u.*p_u)));
end