function [dik_img] = dikretizacija(img, N)
   
    img_min = min(img(:));
    img_max = max(img(:));
    step = (double(img_max-img_min)/N);

    %prvi nacin
    A = (double(step)/2 + double(img_min)).*ones(size(img,1), size(img,2));
    bb2 = (double(img)-A+0.001)*0.99;%stisnuti level radi zaokruzivanja
    dik_img = quant(bb2, step)/0.99+A-0.001;
    
end