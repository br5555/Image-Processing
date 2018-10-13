function [mask] = maskiranje(oblik, N)
    if(N<0 || N>8)
         mask = zeros(8);
         return;
    end
    mask1 = zeros(N);
    mask = zeros(8);
    for i =1:N
        for j = 1:N
            if(strcmp('tri',oblik)&& i <= j)
                mask1(i,j) = 1;
            elseif (strcmp('sqr',oblik))
                mask1(i,j) = 1;
            end
        end
    end
    mask(1:N, 1:N) = rot90(mask1);
    
end