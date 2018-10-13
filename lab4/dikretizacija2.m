function [dik_img] = dikretizacija2(img, N)
   if(N<1) 
       dik_img = 0;
       return;
   end
   
    img_min = min(img(:));
    img_max = max(img(:));
    step = (double(img_max-img_min)/N);
    A = ( double(img_min)).*ones(size(img,1), size(img,2));

   levels = zeros(1,N);
    for i = 1: N-1
        levels(i+1) =levels(i)+step; 
    end
    
    levels(1) = -1;
    indexes = imquantize((double(img)-A+0.001)*0.99, levels(:));
    unique(indexes)
    dik_img = zeros( size(indexes,1), size(indexes,2));
    levels(1) = 0;


    for i = 1: size(indexes,1)
        for j = 1: size(indexes,2)
        dik_img(i,j) = levels(int16(indexes(i,j))-1)+img_min;
        end
    end
end